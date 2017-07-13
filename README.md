# TileShiftView

[![CI Status](http://img.shields.io/travis/Tomoya%20Hirano/TileShiftView.svg?style=flat)](https://travis-ci.org/Tomoya%20Hirano/TileShiftView)
[![Version](https://img.shields.io/cocoapods/v/TileShiftView.svg?style=flat)](http://cocoapods.org/pods/TileShiftView)
[![License](https://img.shields.io/cocoapods/l/TileShiftView.svg?style=flat)](http://cocoapods.org/pods/TileShiftView)
[![Platform](https://img.shields.io/cocoapods/p/TileShiftView.svg?style=flat)](http://cocoapods.org/pods/TileShiftView)

## ScreensShot

![](https://raw.githubusercontent.com/noppefoxwolf/TileShiftView/master/sample.gif)

## Usage

```swift
@IBOutlet private weak var tileShiftView: TileShiftView!
```
or init(with frame)

```swift
tileShiftView.prepare(with: [#imageLiteral(resourceName: "artwork_sample_00000"),
                            #imageLiteral(resourceName: "artwork_sample_00001"),
                            #imageLiteral(resourceName: "artwork_sample_00002"),
                            #imageLiteral(resourceName: "artwork_sample_00003"),
                            #imageLiteral(resourceName: "artwork_sample_00004"),
                            #imageLiteral(resourceName: "artwork_sample_00005"),
                            #imageLiteral(resourceName: "artwork_sample_00006"),
                            #imageLiteral(resourceName: "artwork_sample_00007"),
                            #imageLiteral(resourceName: "artwork_sample_00008")])
tileShiftView.ignoreIndecies = [4]
```

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

## Installation

TileShiftView is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "TileShiftView"
```

## Author

Tomoya Hirano, cromteria@gmail.com

## License

TileShiftView is available under the MIT license. See the LICENSE file for more info.
