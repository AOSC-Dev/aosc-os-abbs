from kconfig.annotations import Annotation


def print_differences(fname: str):
    annotations = Annotation(fname)
    for config_name, config_line in annotations.config.items():
        config_opts = config_line["policy"]
        merged_opts: dict[str, list[str]] = {}
        for arch, arch_opt in config_opts.items():
            merged_opts.setdefault(arch_opt, []).append(arch)
        # Find most common option
        most_common_opt = max(merged_opts.items(), key=lambda item: len(item[1]))[0]
        print_out = ""
        for opt, arches in merged_opts.items():
            if opt != most_common_opt:
                    print_out += f"\t{' '.join(arches)}: {opt}\n"
        if print_out:
            # Print only if there are non-common options for this config line
            print(f"{config_name}\n{print_out}", end="")
            print(f"\t{' '.join(merged_opts[most_common_opt])}: {most_common_opt}\n")


if __name__ == '__main__':
    import argparse
    parser = argparse.ArgumentParser()
    parser.add_argument("fname", help="Annotation file name")
    args = parser.parse_args()
    print_differences(args.fname)
