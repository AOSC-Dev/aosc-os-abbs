#!/bin/python3

import sys
import subprocess
import os

def main():
    args = sys.argv[1:]
    if len(args) != 2:
        print("Usage: ./ciel-wrap before after")
        exit(1)
    before = args[0]
    after = args[1]
    s = subprocess.run([f"git log {before}..{after} --oneline --reverse --format='%s'"], shell=True, stdout=subprocess.PIPE)
    stdout = s.stdout.decode().strip()

    pkgs = []
    for i in stdout.split("\n"):
        pkg = i.split(":")[0]
        if pkg not in pkgs:
            pkgs.append(pkg)

    res = []
    with open("../data/tracked-packages", "r") as f:
        for pkg in pkgs:
            if pkg in f.readlines():
                res.append(pkg)

    print(res.join(" "))

if __name__ == "__main__":
    main()
