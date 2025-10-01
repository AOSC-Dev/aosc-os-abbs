const fs = require("node:fs");

/**
 * @typedef TopicConfig
 * @type { { name: { [key: string]: string }, must_match_all: boolean, security: boolean, caution?: { [key: string]: string }, topics?: string[], packages?: { [key: string]: string | boolean | null } } }
 */

/**
 * Translates a TOML topic configuration into a structured JSON object.
 * @param {import("toml")} toml
 * @param {import("@cfworker/json-schema").Validator} schemaValidator
 * @param {string} content
 * @returns
 */
function translateTopic(toml, schemaValidator, filePath) {
  /**
   * @type { TopicConfig }
   */
  console.info(`Reading ${filePath}`);
  let content;
  let topic;

  try {
    content = fs.readFileSync(filePath, "utf8");
  } catch (error) {
    if (error.code === "ENOENT") {
      console.error(`TOML file not found at ${filePath}`);
      console.log(`::warning file=${filePath}::TOML file ${filePath} not found::`);
      return;
    }
    throw error;
  }

  try {
    topic = toml.parse(content);
  } catch (error) {
    console.error(`Error parsing TOML file at ${filePath}:`, error);
    console.log(`::error file=${filePath}::Error parsing TOML file::${error}`);
    throw error;
  }

  if (schemaValidator.validate(topic).valid) {
    console.log("TOML file parsed successfully.");
  } else {
    const errors = schemaValidator.validate(topic).errors;
    console.error("Invalid TOML:", errors);
    console.log(
      `::error file=${filePath}::${errors.map((e) => e.error).join(" ")}`
    );
    throw new Error("Invalid TOML");
  }
  // rewrite package versions
  if (topic.packages) {
    Object.keys(topic.packages).forEach((pkg) => {
      if (!topic.packages[pkg]) {
        topic.packages[pkg] = null;
      }
    });
  }
  if (topic["packages-v2"]) {
    Object.keys(topic["packages-v2"]).forEach((pkg) => {
      if (!topic["packages-v2"][pkg]) {
        topic["packages-v2"][pkg] = null;
      }
    });
  }

  topic.type = (topic.packages || topic["packages-v2"]) ? "conventional" : "cumulative";
  return topic;
}

/**
 *
 * @param {(name: string) => import(name)} require
 * @param {string | null} topic
 * @param {string} outputPath
 */
function generateTopicUpdateData(require, topic, outputPath) {
  const toml = require("toml");
  const validator = require("@cfworker/json-schema");
  const schema = require("./topics/tum.schema.json");
  const schemaValidator = new validator.Validator(schema);

  /**
   * @type { { [key: string]: { type: "conventional" | "cumulative", name: { [key: string]: string }, must_match_all: boolean, security: boolean, caution?: { [key: string]: string }, topics?: string[], packages?: { [key: string]: string | null } } } }
   */
  let result = {};
  if (!topic) {
    console.error("No topic specified. Use 'stable' or a topic name.");
    return;
  }
  console.info(`Generating updates for topic "${topic}"`);
  if (topic === "stable") {
    fs.readdirSync("topics").forEach((file) => {
      if (!file.endsWith(".toml")) {
        return;
      }
      const filePath = `topics/${file}`;
      const topicName = file.replace(/\.toml$/, "");
      result[topicName] = translateTopic(toml, schemaValidator, filePath);
    });
  } else {
    result[topic] = translateTopic(
      toml,
      schemaValidator,
      `topics/${topic}.toml`
    );
  }

  const outputDirPath = `${outputPath}/${topic}`;
  fs.mkdirSync(outputDirPath, { recursive: true });
  fs.writeFileSync(`${outputDirPath}/updates.json`, JSON.stringify(result));
}

module.exports = { generateTopicUpdateData };
