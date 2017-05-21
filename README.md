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


## built-in progressors

```swift

// start progress
Progress.start(in: imageView, .blur(style: .dark), .activityIndicator)

// start progress with call back after animation
Progress.start(in: imageView, .blur(style: .dark), .activityIndicator) {
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

### built-in progressor types

- `.color(parameter: ColorProgressorParameter)`
- `.blur(style: UIBlurEffectStyle)`
- `.activityIndicator`
- `.ring`


## custom progressor

### create custom progressor view

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
            // always call completion at the end of starting progress
            completion()
        }
    }
}
```

### register custom progressor view

``` swift
Progress.register(progressorView: CustomProgressorView.self, withIdentifier: "custom_example")
```

### use as built-in ones

``` swift
Progress.start(in: imageView, .customer(identifier: "custom_example", parameter: nil))
```


## Author

[Hao](changhao@haostudio.cc)

## License

Progress is available under the MIT license. See the LICENSE file for more info.
