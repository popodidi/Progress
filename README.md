# Progress

<!--
[![CI Status](http://img.shields.io/travis/popodidi/Progress.svg?style=flat)](https://travis-ci.org/popodidi/Progress)
-->
[![Version](https://img.shields.io/cocoapods/v/Progress.svg?style=flat)](http://cocoapods.org/pods/Progress)
[![License](https://img.shields.io/cocoapods/l/Progress.svg?style=flat)](http://cocoapods.org/pods/Progress)
[![Platform](https://img.shields.io/cocoapods/p/Progress.svg?style=flat)](http://cocoapods.org/pods/Progress)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Installation

Progress is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "Progress"
```

## Screenshot
![](Progress_demo.gif)

## Basic usage

```swift

// start progress
Progress.start(in: imageView, .blur(.dark), .activityIndicator)

// start progress with call back after animation
Progress.start(in: imageView, .blur(.dark), .activityIndicator) {
	// do something....
}

// update completion ratio
Progress.update(0.87, in: imageView)

// end progress
Progress.end(in: imageView)

// end progress with call back after animation
Progress.end(in: imageView) {
	// do something....
}

```

### Built-in progressor types

- `.color(ColorProgressorParameter?)`
- `.blur(BlurProgressorParameter?)`
- `.activityIndicator`
- `.ring(RingProgressorParameter?)`

As you see, progress can start with multiple progressors in one parent. The progressors will be added and start animation one by one. When ending the progress, the progressors will end animation and be removed reversely.

> - Since `Progress` holds strong reference to all the `ProgressParent` and `ProgressView`, **Always call `Progress.end(in:)` at the end of progress**.
> - Make sure to `update`/`end` progress after all the animation is done.
> 
> ```swift
> Progress.start(in: view, .blur(nil)) {
>   // do something
>   // ...
>   Progess.end(in: self.view)
> }
> ```

## Advanced usage

### `ProgressParent`

Classes that implement `ProgressParent` protocol are able to add/remove `ProgressView`. `UIView` and `UIViewController` conform `ProgressParent` by default.

The default implementation of `UIView` is to add `progressView` as subview with 0.2 second fade-in animation. `UIViewController` simply calls `self.view` implementations.

### Custom progressor

#### create custom progressor view

```swift
import Progress

class CustomProgressorView: ProgressorView {
    var label: UILabel = UILabel()
    override func layoutSubviews() {
        super.layoutSubviews()
        label.sizeToFit()
        label.center = center
    }
    
    // prepareForProgress is executed before being added to ProgressParent
    override func prepareForProgress(parameter: Any?) {
        addSubview(label)
        label.text = "loading..."
    }
    
    override func startProgress(parameter: Any?, completion: @escaping (() -> Void)) {
    	 // some starting animation ...
    	 // always call completion at the end of starting progress
        completion()
    }
    
    override func update(progress: Float) {
        // update progress view
        let percent = Int(floor(progress*100))
        label.text = "loading \(percent)% ..."
        setNeedsLayout()
    }
    
    override func endProgress(completion: @escaping (() -> Void)) {
        UIView.animate(withDuration: 1, animations: {
            self.label.text = "DONE!"
            self.label.transform = self.label.transform.scaledBy(x: 3, y: 3)
        }) { _ in
            // always call completion at the end of ending progress
            completion()
        }
    }
}
```

#### register custom progressor view

``` swift
Progress.register(progressorView: CustomProgressorView.self, withIdentifier: "custom_example")
```

#### use as built-in ones

``` swift
Progress.start(in: imageView, .customer(identifier: "custom_example", parameter: nil))
```
The `parameter: Any?` here will be passed in to 

- `progressorView.prepareForProgress(parameter: Any?)`
- `progressorView.startProgress(parameter: Any?, completion: @escaping (() -> Void))`


## Author

[popodidi](changhao@haostudio.cc)

## License

Progress is available under the MIT license. See the LICENSE file for more info.
