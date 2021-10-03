# Workflow Build Packages On Request (Project Revive)

## Syntax

```
/build <Package> [<Package> ...]
```

## Description

The `/build` command builds packages via GitHub Actions. It starts clean, up-to-date instances of buildkit container, runs `acbs-build` to build packages.

When replying the command under an issue, packages are built from `stable` branch. When replying the command under a pull request, packages are built from the source branch of the pull request.

## Examples

### Example 1: Building One Package

```
/build aosc-aaa
```

### Example 2: Building Multiple Packages

```
/build openssl openssl+32
```

### Example 3: Building A Group Of Packages

```
/build groups/dotnet
```

## Notes

- Currently, this command only supports GitHub-hosted runners.
  - Microsoft Azure's Standard_DS2_v2 virtual machines only support x86-64 (`amd64`) architecture and may not have sufficient performance or storage to build some packages.

## Further Reading

- [ACBS](https://wiki.aosc.io/developer/packaging/acbs/)
