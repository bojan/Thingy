# Device
Device detection and querying library.

[![GitHub license](https://img.shields.io/badge/license-MIT-lightgrey.svg)](https://raw.githubusercontent.com/bojan/Device/master/LICENSE)
[![SPM](https://img.shields.io/badge/SPM-compatible-brightgreen.svg)](https://github.com/apple/swift-package-manager)
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg)](https://github.com/Carthage/Carthage)
[![Build Status](https://travis-ci.org/bojan/Device.svg?branch=develop)](https://travis-ci.org/bojan/Device)

## Features

- [x] Device detection
- [x] Device family detection
- [x] Simulator detection
- [ ] Simple querying

## Requirements

## Installation

### Swift Packager Manager (SPM)

Create a `Package.swift` file, and add this snippet:

``` swift
import PackageDescription

let package = Package(
    name: "HelloWorld",
    dependencies: [
        .Package(url: "https://github.com/bojan/Device.git", majorVersion: 1)
    ]
)
```

### Carthage

Add this to your `Cartfile`:

```
github "bojan/Device"
```

### CocoaPods

Add this to your `Podfile`

```
pod 'Device'
```

### Manually

## Usage

## Contributions

All contributions and suggestions are welcome and very much appreciated.

Should you have a feature request or a problem that you may experience, feel free to [open an issue](https://github.com/bojan/Device/issues/new).

If you are willing to contribute by adding a feature or squashing a bug or two, please submit a pull request.

## Author

Bojan Dimovski
- [@bojand](https://twitter.com/bojand)
- [LinkedIn](http://linkedin.com/in/bdimovski)

## License

Device is available under the MIT license. Check the [LICENSE](https://raw.githubusercontent.com/bojan/Device/master/LICENSE) file for more info.
