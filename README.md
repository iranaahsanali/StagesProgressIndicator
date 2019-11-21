## StagesProgressIndicator
[![Platform](http://img.shields.io/badge/platform-iOS-blue.svg?style=flat)](https://cocoapods.org/?q=segmentio) [![License](http://img.shields.io/badge/license-MIT-green.svg?style=flat)](https://github.com/Yalantis/Segmentio/blob/master/LICENSE) ![Swift 5](https://img.shields.io/badge/Swift-5-orange.svg) 

Stages Progress Indicator, highly customizable, written in Swift.

![Preview](https://raw.github.com/iranaahsanali/StagesProgressIndicator/master/Assets/animation.gif)

![alt tag](https://raw.github.com/iranaahsanali/StagesProgressIndicator/master/Assets/ProgressHeaderBar.png)

![alt tag](https://raw.github.com/iranaahsanali/StagesProgressIndicator/master/Assets/ProgressBar.png)



Check this <a href="https://youtu.be/8qKxXh88ZR4">project preview on Youtube</a>.

## Requirements

- Xcode 10
- iOS 8.x+
- Swift 5.0

## Installation

#### [CocoaPods](http://cocoapods.org)
```ruby
use_frameworks! 

pod 'StagesProgressIndicator'
```

*CocoaPods v1.1.0 or later required*


## Usage
#### Import `StagesProgressIndicator` module
```swift
import StagesProgressIndicator
```

#### Init
You can initialize a `ReportProgressHeaderBar`/`PeportProgressBar`  instance from code:

```swift
var reportHeaderBar: ReportProgressHeaderBar!
var reportBar : PeportProgressBar!

reportHeaderBar = ReportProgressHeaderBar(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 50))
reportBar = ReportProgressHeaderBar(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 50))

view.addSubview(reportHeaderBar)
view.addSubview(reportBar)

```

or

add a `UIView` instance in your .storyboard or .xib, set `ReportProgressHeaderBar`/`PeportProgressBar` class and connect `IBOutlet`:

```swift
@IBOutlet weak var reportProgressHeader: ReportProgressHeaderBar!
@IBOutlet weak var reportProgressBar: PeportProgressBar!
```

#### Setting ReportProgressHeaderBar Attributes
```swift
  // Background color of view
  barColor = UIColor.lightGray
    
  // Arrow Width
  arrowWidth = 10.0
    
  // Background Bar Height
  bgBarHeight = 0.0
    
  // Bar Total Stages
  totalStages = 1
    
  // Bar Current Stage
  currentStage = 1
    
  // Bar Thumb Radius
  thumbRadius = 0.0
    
  // Bar Thumb Color
  thumbColor = UIColor.green
    
  // Bar Thumb Border Width
  thumbBorderWidth = 0.0
    
  // InComplete Progress Color
  inCompleteColor = UIColor.lightGray
    
  // Selected Thumb With Image to place in thumb
  imageView.image = UIImage(named: "ProfilePic")
    
  // Selected Thumb Radius
  selectedthumbRadius = 0.0
    
  // Selected Thumb Border Width
  selectedthumbBorderWidth = 0.0
    
  //Selected Thumb Border Color
  selectedthumbBorderColor = UIColor.lightGray
    
```

#### Setting PeportProgressBar Attributes
```swift
   // Background color of view
   barColor = UIColor.lightGray
    
   // Arrow Width
   arrowWidth = 10.0
    
   // Background Bar Height
   bgBarHeight = 0.0
    
   // Bar Total Stages
   totalStages = 1
    
   // Bar Current Stage
   currentStage = 1
    
   // Bar Thumb Radius
   thumbRadius = 0.0
    
   // Bar Thumb Color
   thumbColor = UIColor.green
    
   // InComplete Progress Color
   inCompleteColor = UIColor.lightGray
    
```

#### Let me know!
I’d be really happy if you sent me links to your projects where you use our component. Just send an email to iranaahsanali And do let me know if you have any idea or suggestion to improve it.

P.S. All Contributors are welcome. Stay tuned!

## License

The MIT License (MIT)

Copyright © 2019 Ahsan Ali

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.

