const fs = require("node:fs");
const crypto = require("node:crypto");
const path = require("node:path");
const gzip = require("node-gzip");

function getMd5Map(dir) {
  const content = fs.readFileSync(`${dir}/en.json`, "utf8");
  let json;
  let result = new Map();

  try {
    json = new Map(Object.entries(JSON.parse(content)));
  } catch (err) {
    console.error(`Error parsing JSON file at ${filePath}:`, err);
    console.log(`::error file=${filePath}::Error parsing JSON file::${err}`);
    throw err;
  }

  json.forEach((v, k) => {
    result.set(k, crypto.hash("md5", v));
  });

  return result;
}

function translation(filePath, md5Map) {
  console.info(`Reading ${filePath}`);
  const content = fs.readFileSync(filePath, "utf8");
  const fileName = path.parse(filePath).name;

  let json;
  let result = "";

  try {
    json = new Map(Object.entries(JSON.parse(content)));
  } catch (err) {
    console.error(`Error parsing JSON file at ${filePath}:`, err);
    console.log(`::error file=${filePath}::Error parsing JSON file::${err}`);
    throw err;
  }

  json.forEach((v, k) => {
    result += `Package: ${k}\n`;

    try {
      result += `Description-md5: ${md5Map.get(k)}\n`;
    } catch (err) {
      console.error(
        `Error Failed to get package ${k} md5suum at ${filePath}:`,
        err
      );
      console.log(
        `::error file=${filePath}::Error failed to get package md5sum::${err}`
      );
      throw err;
    }

    result += `Description-${fileName}: ${v.replace("\n", "\n .\n ")}\n`;
    result += "\n";
  });

  return result;
}

function generateTranslationData(dir, out) {
  const md5Map = getMd5Map(dir);

  if (!fs.existsSync(out)) {
    fs.mkdirSync(out, { recursive: true });
  }

  fs.readdirSync(dir).forEach((v) => {
    if (path.extname(v) == ".json") {
      const fileName = path.parse(v).name;
      const content = translation(path.join(dir, v), md5Map);
      fs.writeFileSync(path.join(out, `Translation-${fileName}`), content);
      gzip.gzip(content).then((compress) => {
        fs.writeFileSync(
          path.join(out, `Translation-${fileName}.gz`),
          compress
        );
      });
    }
  });
}

module.exports = { generateTranslationData };
