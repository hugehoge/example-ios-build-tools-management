ExampleBuildToolsManagement
===

An example project for simple management of the Swift CLI tools used in the build process. 

## Setup

```sh
$ make bootstrap
$ make open
```

## How it works

1. Cache checks.
    1. Compare between the existing executable and expected version.
    1. If the versions are equal, use existing executable.
1. Download a zip file from the GitHub release page.
1. Unarchive the zip file and place the executable.
1. You can use the build tool executable without a Package Manager (e.g. Swift Package Manager, Mint, etc.)

## Target tools

|Name|URL|Version|`lipo -archs`|Note|
|:-:|:-|:-|:-|:-|
|Mint|https://github.com/yonaskolb/Mint|0.17.0|`x86_64 arm64`|Do not use in this project|
|XcodeGen|https://github.com/yonaskolb/XcodeGen|2.24.0|`x86_64 arm64`|It won't work properly with symbolic link.|
|SwiftGen|https://github.com/SwiftGen/SwiftGen|6.5.1|`x86_64`|-|
|SwiftLint|https://github.com/realm/SwiftLint|0.46.2|`x86_64 arm64`|-|
|SwiftFormat|https://github.com/nicklockwood/SwiftFormat|0.49.4|`x86_64 arm64`|-|
|IBLinter|https://github.com/IBDecodable/IBLinter|0.5.0|`x86_64`|-|
|LicensePlist|https://github.com/mono0926/LicensePlist|3.17.0|`x86_64 arm64`|-|
