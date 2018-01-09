PineSwiftStarter is an iOS Swift Starter Kit. 
 
## Motivation

Very project regardless of the platform always requires a boilerplate code. Boilerplate code can act as a large time saver but at the same time it brings in a lot more convention and code standard to the project. 

## Installation

```
pod install PineSwiftStarter
```


## API Reference

The library contains a number of Class/Base Classes that can be use in the project. 

### PineBaseViewController : UIViewControler
The PineBaseViewController should be used a base class to all the view controllers in the project. Most of the methods in this class can be overridden in the implementation of the ViewController

#### func setup() -> void
``` 
override func setup() {
	super.setup()
    # code 
}
```

The **setup** function is internally and automatically called by the *viewDidLoad* function in the life cycle of the View Controller. 

All the setup code for the View Controller should be placed in this function and not viewDidLoad. 

- This function should always call its super function. super.setup()
- viewDidLoad could be used instead of using setup(), but that would defeat the purpose of the setup() function

#### func getPrefferedLeftBarImage() -> UIImage?
```
override func getPrefferedLeftBarImage() -> UIImage? {
   return UIImage(named: "image")
}
```

Determines the left button image to be rendered on the navigation controller

#### func getPrefferedRightBarImage() -> UIImage?
```
override func getPrefferedRightBarImage() -> UIImage? {
   return UIImage(named: "image")
}
```

Determines the right button image to be rendered on the navigation controller

#### func getPrefferedLeftBarAction() -> void
```
override func getPrefferedLeftBarAction() -> UIImage? {
	print("Left Button is Clicked")
}
```

Is invoked when the left bar button is tapped

#### func getPrefferedRightBarAction() -> void
```
override func getPrefferedRightBarAction() -> UIImage? {
	print("Right Button is Clicked")
}
```

Is invoked when the right bar button is tapped

#### func setupStackView()
```
self.setupStackView()
```
Initialises and sets up a PineVerticalStackView as an underlaying view. Should be called from within the setup function before any elements are inserted into the self.view. UIViews should be added by to the inserted stacked view. 
```
self.getStackView().addArrangedView(view)

# or
let v1 = UIView()
v1.backgroundColor = UIColor.red
let v2 = UIView()
v2.backgroundColor = UIColor.blue
self.getStackView()?.addArrangedSubviews([v1, v2])
v1.easy.layout(Width().like(self.view), Height(200))
v2.easy.layout(Width().like(self.view), Height(200))
```

#### func setupScrollableStackView()
```
self.setupScrollableStackView()
```
Initialises and sets up a scroll stack view. This too should be called from the **setup()** function before any elements are inserted into the self.view. Views can be added using the addArrangedView method

#### func getStackView()
Returns the reference to the stackview which has been initialized

#### func getScrollView()
Returns the reference to the scroll view which has been initialized

## Contributors

Everyone at Pine Lane maitain and contribute to PineSwiftStarter

## License

MIT
