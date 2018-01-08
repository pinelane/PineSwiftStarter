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


## Contributors

Everyone at Pine Lane maitain and contribute to PineSwiftStarter

## License

MIT
