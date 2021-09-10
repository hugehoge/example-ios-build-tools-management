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
    1. Compare between the existing build tool version and expected version.
    1. If the versions are equal, use existing build tool binary.
1. Download a zip file via curl command from the GitHub release page.
1. Unarchive the zip file and place the build tool binary.
1. Can use the build tool binaries without a Package Manager (e.g. Swift Package Manager, Mint, etc.)

## Target tools

|Name|URL|Version|`lipo -archs`|Note|
|:-:|:-|:-|:-|:-|
|Mint|https://github.com/yonaskolb/Mint|0.16.0|`x86_64`|Do not use in this project|
|XcodeGen|https://github.com/yonaskolb/XcodeGen|2.24.0|`x86_64 arm64`|It won't work properly with symbolic link.|
|SwiftGen|https://github.com/SwiftGen/SwiftGen|6.4.0|`x86_64`|-|
|SwiftLint|https://github.com/realm/SwiftLint|0.43.1|`x86_64 arm64`|-|
|SwiftFormat|https://github.com/nicklockwood/SwiftFormat|0.48.11|`x86_64 arm64`|-|
|IBLinter|https://github.com/IBDecodable/IBLinter|0.4.27|`x86_64`|-|
|LicensePlist|https://github.com/mono0926/LicensePlist|3.13.0|`x86_64`|Command has no version option.|
