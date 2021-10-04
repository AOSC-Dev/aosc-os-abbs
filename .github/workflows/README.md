# Workflow Build Packages On Request (Project Revive)

## Syntax

```
/build <Package> [<Package> ...]
```
```
/build
```

## Description

The `/build` command builds packages via GitHub Actions. It starts clean, up-to-date instances of buildkit container, runs `acbs-build` to build packages.

When replying the command under an issue, packages are built from `stable` branch. When replying the command under a pull request, packages are built from the source branch of the pull request.

If packages are specified, only these packages will be built. If no packages are specified and the command is replied under a pull request, all packages which have spec file changed will be built.

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

### Example 4: Building All Changed Packages In A Pull Request

```
/build
```

## Notes

- Currently, this command only supports GitHub-hosted runners.
  - Microsoft Azure's Standard_DS2_v2 virtual machines only support x86-64 (`amd64`) architecture and may not have sufficient performance or storage to build some packages.
  - GitHub-hosted runners currently provide no TTY device[^1], any build rely on this will fail.

## Further Reading

- [ACBS](https://wiki.aosc.io/developer/packaging/acbs/)

[^1]: https://github.com/actions/runner/issues/241#issuecomment-556845290
