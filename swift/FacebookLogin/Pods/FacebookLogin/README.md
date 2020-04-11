# Facebook SDK in Swift (Beta)

[![Swift Version](https://img.shields.io/badge/Swift-5.0.x-orange.svg)](https://swift.org)
[![Platforms](https://img.shields.io/cocoapods/p/FacebookCore.svg)](https://cocoapods.org/pods/FacebookCore)
[![Build Status](https://travis-ci.org/facebook/facebook-swift-sdk.svg?branch=master)](https://travis-ci.org/facebook/facebook-swift-sdk)

[![CocoaPods](https://img.shields.io/cocoapods/v/FacebookCore.svg)](https://cocoapods.org/pods/FacebookCore)
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)

Swift-tailored experience to integrate your app with Facebook. Including:

- [Facebook Login](https://developers.facebook.com/docs/swift/login) - Authenticate people with their Facebook
  credentials.
- [Share and Send Dialogs](https://developers.facebook.com/docs/swift/sharing) - Enable sharing content from your app to
  Facebook.
- [App Events](https://developers.facebook.com/docs/swift/appevents) - Understand your audience and the performance of
  your app.
- [Graph API](https://developers.facebook.com/docs/swift/graph) - Read and write directly to Facebook social graph.

## Important
**NOTE:** This SDK is a wrapper around the [ObjC SDK](https://github.com/facebook/facebook-objc-sdk). The project uses [Carthage](https://github.com/Carthage/Carthage) internally for managing the dependencies on the "FBSDK"-prefixed libraries. It is intended to offer an additional layer of type-safety around the original as well as offer support for modern Swift and iOS paradigms. Please see our [roadmap](./ROADMAP.md) for information about the strategy for modernizing this project.

## Installation

### CocoaPods

Make sure you are running the latest version of [CocoaPods](https://cocoapods.org) by running:

```bash
gem install cocoapods

# (or if the above fails)
sudo gem install cocoapods
```

**Note:** We support any version of CocoaPods 1.0.1 or later.

Update your local specs repo by running:

```bash
pod repo update
```

**Note:** This step is optional, if you updated the specs repo recently.

Add the following lines to your Podfile:

```ruby
pod 'FacebookCore'
pod 'FacebookLogin'
pod 'FacebookShare'
```

Run `pod install` and you're all set!

You may also exclude any of these dependencies, if you do not need the features of those parts of the SDK.

### Carthage

Make sure you are running the latest version of [Carthage](https://github.com/carthage/carthage) by running:

```bash
brew update
brew upgrade carthage
```

**Note:** We recommend using Carthage version 0.31.1 or later.

Add the following line to your Cartfile:

```bash
github "facebook/facebook-swift-sdk"

# If you run into issues, try targeting the master branch
github "facebook/facebook-swift-sdk" "master"
```

Run `carthage update`.

**Note:** This will fetch dependencies into a `Carthage/Checkouts` folder, then build each one.

On your application targets' `General` settings tab, in the `Linked Frameworks and Libraries` section.

At a minimum, you'll need to drag & drop the following frameworks from `Carthage/Build` folder on disk:

- `FacebookCore.framework`
- `FBSDKCoreKit.framework`

To use Login with Facebook:

- `FacebookLogin.framework`
- `FBSDKLoginKit.framework`

To use Share and Send Dialogs

- `FacebookShare.framework`
- `FBSDKShareKit.framework`

On your application targets' `Build Phases` tab:

- Click `+` icon and choose `New Run Script Phase`.
- Create a script with a shell of your choice (e.g. `/bin/sh`).
- Add the following to the script area below the shell:

```bash
/usr/local/bin/carthage copy-frameworks
```

- Add the paths to the frameworks you want to use under `Input Files`, for example:

```bash
$(SRCROOT)/Carthage/Build/iOS/FacebookCore.framework
$(SRCROOT)/Carthage/Build/iOS/FBSDKCoreKit.framework
```

### Using Facebook SDK as a sub-project

While not recommended, it is entirely possible for you to build the Facebook SDK for Swift outside of any dependency
management system.

**Note:** You will have to manage updating this solution (as well as the dependencies on the Facebook SDK for iOS) on
your own.

- Clone the repository.
- Run the following command in the root directory of the repository: `git submodule update --init --recursive`
- Add `FacebookSwift.xcodeproj` as a sub-project to your applications' project.
- Add the `FacebookCore.framework`, `FacebookLogin.framework`, and `FacebookShare.framework` build products from the
  sub-project to your applications `Link Frameworks and Libraries` and `Embedded Binaries` sections.

Don't forget to also embed/link `FBSDKCoreKit.framework`, `FBSDKLoginKit.framework`, and `FBSDKShareKit.framework`.

## Modules

The frameworks for the Facebook SDK in Swift are organized in the same way that the Facebook SDK for iOS is.

They also currently depend upon the Facebook SDK for iOS, although this may change at some point in the future.

### FacebookCore

[![FacebookCore on CocoaPods](https://img.shields.io/cocoapods/v/FacebookCore.svg)](https://cocoapods.org/pods/FacebookCore)

Depends on `FBSDKCoreKit.framework`.

The following types are included, with enhancements for Swift:

- `AccessToken`
- `ApplicationDelegate`
- `AppEvents`

A myriad of improvements, including type-safe built-in `AppEvent`s, an `AppEvent` struct, and more.

- `GraphRequest`

You can now implement your own type-safe `GraphRequest`s, including native-typed results.

- `SDKSettings`

Logging behaviors are now implemented as a type-safe set, based on Swift enums.

- `Permission`

Are no longer stringly-typed (string-based), but separate types for read and write permissions (also includes a built-in
permission list, which includes most common permissions by default).

### FacebookLogin

[![FacebookCore on CocoaPods](https://img.shields.io/cocoapods/v/FacebookLogin.svg)](https://cocoapods.org/pods/FacebookLogin)

Depends on `FacebookCore.framework` and `FBSDKLoginKit.framework`.

The following types are included, with enhancements for Swift:

- `LoginManager`

Now uses the type-safe permissions from `FacebookCore`, and has constructors with `LoginBehavior` and `DefaultAudience`,
instead of requiring manual setting of properties.

- `LoginButton`

Can no longer change permissions after creation, helping to enforce using a single login button for a given set of
permissions. Note that `LoginButton` is not intended to work with interface builder or storyboards at this time. We may
re-address this in the future.

### FacebookShare

[![FacebookCore on CocoaPods](https://img.shields.io/cocoapods/v/FacebookShare.svg)](https://cocoapods.org/pods/FacebookShare)

Depends on `FacebookCore.framework` and `FBSDKShareKit.framework`.

The following types are included, with enhancements for Swift:

- `LinkShareContent`

Now a struct, and has a proper initializer enforcing required properties.

- `OpenGraphShareContent`

Now a struct, uses type-safe `OpenGraphPropertyName` and `OpenGraphPropertyValue`, as well as structs for
`OpenGraphObject` and `OpenGraphAction`.

- `PhotoShareContent`

Now a struct, and better type-safety for properties on it.

- `VideoShareContent`

Now a struct, and better type-safety for properties on it.

- `GraphSharer`

Now a generic type, that can handle any type of content.

- `ShareDialog`

Now a generic type, that can handle any type of content.

- `MessageDialog`

Now a generic type, that can handle any type of content.

- `GameRequest`

Now a struct, contains proper type-safe enum for `Recipient`, `Result`.

- `GameRequest.Dialog`
- `AppGroupRequest.Dialog`
- `AppInvite`

Now a struct, use a type-safe `Promotion` property, instead of separate `promotionCode` and `promotionText`.

- `AppInvite.Dialog`

## Give Feedback

Facebook SDK in Swift is still in beta, and we would love to hear your thoughts and feedback on it.

- **Have an idea or feature request?** [Open an issue](https://github.com/facebook/facebook-swift-sdk/issues/new). Tell
  us more about the feature or an idea and why you think it's relevant.
- **Have a bug to report?** [Open an issue](https://github.com/facebook/facebook-swift-sdk/issues/new). If possible,
  include the version of the SDK you are using, and any technical details.
- **Need help with your code?** Join [Facebook Developers Group](https://www.facebook.com/groups/fbdevelopers) on
  Facebook or ask questions on [Stack Overflow](https://facebook.stackoverflow.com).

## Contribute

All of Facebook SDK for Swift development happens on GitHub. Contributions make for good karma and we welcome new
contributors with tremendous joy. We request that you read our [contributing guidelines](./CONTRIBUTING.md) before
submitting a Pull Request.

### Unit Test Terminology

For unit testing we're choosing to follow the test terms put forth by Martin Fowler. 
This is to avoid confusion as a lot of these terms are commonly misused. 

> * Dummy objects are passed around but never actually used. Usually they are just used to fill parameter lists.
> * Fake objects actually have working implementations, but usually take some shortcut which makes them not suitable for production (an in memory database is a good example).
> * Stubs provide canned answers to calls made during the test, usually not responding at all to anything outside what's programmed in for the test.
> * Spies are stubs that also record some information based on how they were called. One form of this might be an email service that records how many messages it was sent.
> * Mocks are what we are talking about here: objects pre-programmed with expectations which form a specification of the calls they are expected to receive.
Source: https://martinfowler.com/articles/mocksArentStubs.html

## License

Facebook SDK in Swift is MIT licensed, as found in the
[`LICENSE`](https://github.com/facebook/facebook-swift-sdk/blob/master/LICENSE) file.
