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
