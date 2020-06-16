# TabStriper
TabStriper is a library that switches screens by selecting a tab or swiping the screen
Built with SwiftUI

<p align="center">
    <img src="https://img.shields.io/badge/platform-iOS-blue.svg?style=flat" alt="Platforms" />
    <img src="https://img.shields.io/badge/Swift-5-orange.svg" />
    <a href="https://github.com/yotsu12/TagLayoutView/blob/master/LICENSE"><img src="http://img.shields.io/badge/license-MIT-blue.svg?style=flat" alt="License: MIT" /></a>
</p>

<center>
<img src="tabStriper_demo.gif"/>
</center>

## Usage
```swift
struct ColorView: View {
    let color: Color
    var body: some View {
        self.color
    }
}

struct ContentView: View {
    
    let colorViews: [StripView] = [
        StripView(id: 1, title: "green", view: AnyView(ColorView(color: .green))),
        StripView(id: 2, title: "blue", view: AnyView(ColorView(color: .blue)))
    ]
    
    var body: some View {
        TabStriper(stripViews: self.colorViews)
            .barColor(.red)
            .titleColor(.gray)
            .selectedTitleColor(.black)
    }
}
```

## Installation

`TabStriper` is available via [Swift Package Manager](https://swift.org/package-manager).

Using Xcode 11, go to `File -> Swift Packages -> Add Package Dependency` and enter [https://github.com/giiiita/TabStriper.git](https://github.com/giiiita/TabStriper.git)
