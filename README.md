# GCNotificationView

[![Version](https://img.shields.io/cocoapods/v/GCNotificationView.svg?style=flat)](http://cocoapods.org/pods/GCNotificationView)
[![License](https://img.shields.io/cocoapods/l/GCNotificationView.svg?style=flat)](http://cocoapods.org/pods/GCNotificationView)
[![Platform](https://img.shields.io/cocoapods/p/GCNotificationView.svg?style=flat)](http://cocoapods.org/pods/GCNotificationView)

`GCNotificationView` is simple but very useful toast message view for iOS. You can easily set message and show it to user with a single method call. You can change it's location wherever you want.

![demo](Images/DemoDefault.gif)
![demo2](Images/DemoTabbar.gif)
![demo3](Images/DemoCustom.gif)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements
`GCNotificationView` is written in Swift 3. Compatible with iOS 9.0+

## Installation

`GCNotificationView` is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "GCNotificationView"
```

## Usage

First you need to import `GCNotificationView`

```swift
import GCNotificationView
```

Then all you need to do to use `GCNotificationView` is simply call the method with your message!


```swift
GCNotificationView(yPoint: CGFloat).show(message: "Hello, World!")
```

## Author

Junho, dangercloz@gmail.com

## License

GCNotificationView is available under the MIT license. See the LICENSE file for more info.
