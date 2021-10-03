# Workflow Build Packages On Request (Project Revive)

## Syntax

```
/build <Package> [<Package> ...]
```

## Description

The `/build` command builds packages on GitHub Actions. It starts clean, up-to-date instances of buildkit container, runs `acbs-build` to build packages.

When replying the command under an issue, packages are built from `stable` branch. When replying the command under a pull request, packages are built from the pull request.

## Examples

### Example 1: Build one package

```
/build aosc-aaa
```

### Example 2: Build multiple packages

```
/build openssl openssl+32
```

### Example 3: Build a group of packages

```
/build groups/dotnet
```

## Notes

- Currently only GitHub-hosted runners are supported.
  - Standard_DS2_v2 virtual machines in Microsoft Azure isn't big enough to build every package in AOSC OS, nor does it provide architectures other than Intel 64.

## Related Links

- [ACBS](https://wiki.aosc.io/developer/packaging/acbs/)
