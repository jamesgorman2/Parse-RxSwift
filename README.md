# Parse_RxSwift

[![Version](https://img.shields.io/cocoapods/v/Parse_RxSwift.svg?style=flat)](http://cocoapods.org/pods/Parse_RxSwift)
[![License](https://img.shields.io/cocoapods/l/Parse_RxSwift.svg?style=flat)](http://cocoapods.org/pods/Parse_RxSwift)
[![Platform](https://img.shields.io/cocoapods/p/Parse_RxSwift.svg?style=flat)](http://cocoapods.org/pods/Parse_RxSwift)

A collection of wrapper classes that allow you to use RxSwift Observers in place of Parse's callbacks.

It is a fork from [bluelinelabs/Parse-RxSwift](https://github.com/bluelinelabs/Parse-RxSwift) !

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Installation

Parse_RxSwift is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'Parse_RxSwift'
```

## Usage

Just call `.rx` after initialising a Parse object and you'll get the RxSwift-ified version whose methods will return Observable types, eg

```swift
// a stream of the results
let o: Observable<PFObject> = PFQuery(className: "GameScore")
  .whereKey("playerName", equalTo: "Dan Stemkoski")
  .rx
  .findObjects()

// complete if successful, otherwise and error
let c: Completable = somePFObject.rx.save()

// the object or an error
let s: Single<PFObject> = PFObject(className: "GameScore", objectId: "xWMyZ4YEGZ").rx.fetch()
```

## Author

Konshin, bodro92@yandex.ru

## License

Parse_RxSwift is available under the MIT license. See the LICENSE file for more info.

