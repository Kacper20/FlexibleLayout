# FlexibleLayout
FlexibleLayout is a helper library for building flexible spaces between views of your layout in a declarative way.
Uses auto-layout underneath and you can use it along with your favorite constraint helper libraries, or pure constraint APIs.

It's currently available in version `0.1.0` which requires Swift 3.

If you have any feedback or questions about the library - I would love to hear that and help you! Please [open an issue](https://github.com/Kacper20/FlexibleLayout/issues/new) on GitHub.

## Samples
In Example folder you can find application an sample app with three layout samples created using FlexibleLayout. 

## Installation

### CocoaPods
To integrate FlexibleLayout into your Xcode project using CocoaPods specify this in your `Podfile`:
```ruby
pod 'FlexibleLayout'
```
Then, run following command:
`$ pod install`

### Carthage

To integrate FlexibleLayout into your Xcode project using Carthage  specify this in your `Cartfile`:
```swift
github "Kacper20/FlexibleLayout"
```
Then, run `carthage update` to build framework and drag `FlexibleLayout.framework` into your Xcode project.

## How you could use it
Library provides two ways of distributing spaces:
- vertically
- horizontally

All of the layout attributes and anchors are supported through the extensions on `UIView` instance.

### Centering set of views horizontally
Imagine you have two views next to each other, aligned horizontally and you want to center this group horizontally in their superview. To achieve this, you could do the following:

```swift
Flexible.horizontalLayout([
    self.flx.leading.to(first.flx.leading).with(1),
    second.flx.trailing.to(self.flx.trailing).with(1)
    ],
    in: self
)
```
This tells layout that it has to create two spacer views, that have coefficients equal to 1, on the left and right sides of labels. Giving them equal coefficient values means that they will be equal in width.

To center like that more views - just call `Flexible.horizontalLayout` as many times you want. Coefficients you give in one `layout` call are always relative only to other coefficients within this call.

With this setup, you still have to constraint your views like you would do normally and give them size(if there is no intrinsic size for them), and y positions.

*Important*: Every space you create should always have left(or top) target anchor specified first, followed by right(or bottom) target anchor. It's how this library works. If you're thinking about your layout in reversed sides, you could always use `reversedWith` method, so it would look like:

```swift
Flexible.horizontalLayout([
    first.flx.leading.to(self.flx.leading).reversedWith(1),
    self.flx.trailing.to(second.flx.trailing).reversedWith(1)
    ],
    in: self
)
```

### Aligning vertically

Vertical aligning is very similar to horizontal - you should only use different anchor targets.
Spacing two views vertically, with sizes around the group them doubled the size between them looks like:
```swift
Flexible.verticalLayout([
    self.flx.topMargin.to(first.flx.top).with(2),
    first.flx.bottom.to(second.flx.top).with(1),
    second.flx.bottom.to(self.flx.bottom).with(2),
    ],
    in: self
)
```

### Minimal spacing size

Sometimes you want the sizes to be flexible and grow on bigger phones, but at the same time do not shrink to zero on small phones like iPhone 4S. Library solves it for you. You need to specify what is minimal value for your coefficient to be.

Like in last example, you have two vertical views and you want the space between views to be at least 32 points. To achieve this, write:
```swift
Flexible.verticalLayout([
    self.flx.topMargin.to(first.flx.top).with(2),
    first.flx.bottom.to(second.flx.top).with(1),
    second.flx.bottom.to(self.flx.bottom).with(2),
    ],
    in: self,
    coefficientSize: MinimalCoefficientSize(coefficient: 1, value: 32)
)
```
Then, your spacer views with coefficient 1 will resolve to at least 32 in height. Those with coefficient 2 will be then at least 64 in height.

## Why

Building layout that looks equally good on different screen sizes is hard. Sometimes, when you specify your constraints using constants it looks good on small device, but not natural on big iPhone 6/7 Plus sizes. 

In couple of my projects there was a need to do this in a more flexible way, using spaces that are resizable along with the screen size. Doing this was really cumbersome - you need to remember about creating spacing objects, constraining them and it's really too much code for that simple idea. That's why I created this set of helper methods for creating flexible spacings.

I've chosen to work with constraints because it's more and more used among Apple developers and this approach doesn't force developers using frames with constraints, which could be really painful.

### What happens underneath

Because library supports iOS 8 it has two ways of creating empty spaces:
- `UILayoutGuide` instances and layout anchors on iOS 9+
- empty, non rendering views and `NSLayoutConstraint` API on iOS 8

For every space you specify in layout call there is exactly one spacing object created along with constraints pinning your spacing objects to other views in layout.

## Requirements
- iOS 8.0+

## Author

- Kacper Harasim, kacper.harasim@gmail.com

## Contributing
If you would like to contribute code you can do so through GitHub by forking the repository and sending a pull request.
To keep code in order, we advice you to use SwiftLint. In repository, we provide configured `.swiftlint.yml`.

## License

FlexibleLayout is available under the MIT license. See the LICENSE file for more info.