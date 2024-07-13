/*The example below defines a structure called FixedLengthRange, which describes a range of integers whose range length can’t be changed after it’s created:*/

struct FixedLengthRange {
    var firstValue:Int
    let length:Int
}

var rangeOfThreeItems = FixedLengthRange(firstValue:0, length:3)
// the range represents integer values 0, 1, and 2”
print(rangeOfThreeItems)
rangeOfThreeItems.firstValue = 6
print(rangeOfThreeItems)


// Struct computed properties example
struct Point {
    var x = 0.0,y = 0.0
}
struct Size {
    
    var width = 0.0
    var height = 0.0
}

struct Rect {
    
    var origin = Point()
    var size = Size()
    var center: Point {
        
        get {
            let centerX = origin.x + (size.width/2)
            let centerY = origin.y + (size.height/2)
            return Point(x: centerX,y: centerY)
        }
        
        set(newCenter) {
            
            origin.x = newCenter.x - (size.width/2)
            origin.y = newCenter.y - (size.height/2)
        }
    }
    
}

var square = Rect(origin: Point(x: 0.0,y: 0.0),size: Size(width: 10.0,height: 10.0))
let initialSquareCenter = square.center
print("square.origin is old value at (\(square.origin.x),\(square.origin.y)")
// initialSquareCenter is at (5.0,5.0)

square.center = Point(x: 15.0,y: 15.0)
print("square.origin is now at (\(square.origin.x),\(square.origin.y)")


// Short hand setter declaration

struct AlternativeRect {
 
    var origin = Point()
    var size = Size()
    
    var center: Point {
     
        get {
            let centerX = origin.x + (size.width/2)
            let centerY = origin.y + (size.height/2)
            return Point(x: centerX,y: centerY)
        }
        
        set {
            
            origin.x = newValue.x - (size.width/2)
            origin.y = newValue.y - (size.height/2)
        }
    }
        
}

struct CompactRect {
 
    var origin = Point()
    var size = Size()
    
    var center: Point {
     
        get {
            return Point(x:(origin.x + (size.width/2)),y:(origin.y + (size.height/2)))
        }
        
        set {
            
            origin.x = newValue.x - (size.width/2)
            origin.y = newValue.y - (size.height/2)
        }
    }
        
}

// Read-only computed properties

struct Cuboid {
    var width = 0.0, height = 0.0, depth = 0.0
    var volume:Double {
        return width * height * depth
    }
}

let fourByFiveByTwo = Cuboid(width: 4.0,height: 5.0,depth: 2.0)
print("The volume of fourByFiveByTwo is \(fourByFiveByTwo)")


class StepCounter {
    
    var totalSteps:Int = 0 {
 
        willSet(newTotalSteps) {
            print("About to set totalSteps to \(newTotalSteps)")
        }
        
        didSet {
            if totalSteps > oldValue {
              print("Added \(totalSteps - oldValue) steps")
            }
        }
    }
}
    
let stepCounter = StepCounter()
stepCounter.totalSteps = 200
stepCounter.totalSteps = 360
stepCounter.totalSteps = 896


// property wrappers
@propertyWrapper
struct TwelveOrLess {
 
    private var number = 0
    var wrappedValue: Int {
        get { return number}
        set { number = min(newValue, 12) }
    }
}

struct SmallRectangle {
 
    @TwelveOrLess var height:Int
    @TwelveOrLess var widht:Int
}

var rectangle = SmallRectangle()
print(rectangle.height)
// Prints "0"

rectangle.height = 10
print(rectangle.height)
// Prints 10

rectangle.height = 24
print(rectangle.height)
// Prints "12"


@propertyWrapper
struct SmallNumber {
    private var maximum: Int
    private var number: Int
    
    var wrappedValue:Int {
        get { return number }
        set { number = min(newValue, maximum)}
    }
    
    init() {
        maximum = 12
        number = 0
    }
    
    init(wrappedValue: Int) {
        maximum = 12
        number = min(wrappedValue, maximum)
    }
    
    init(wrappedValue:Int,maximum:Int) {
        self.maximum = maximum
        number = min(wrappedValue, maximum)
    }
    
}

// Type properties

struct SomeStructure {
    
    static var storedTypeProperty = "Some Value."
    static var computedTypeProperty : Int {
        return 1
    }
}

enum SomeEnumeration {
 
    static var storedTypeProperty = "Some value."
    static var computedTypeProperty: Int {
        return 6
    }
}

class SomeClass {
 
    static var storedTypeProperty = "Some value."
    static var computedTypeProperty: Int {
        return 27
    }
    class var overrideableComputedTypeProperty: Int {
        return 107
    }
    
}

// Querying and Setting Type Properties
print(SomeStructure.storedTypeProperty)
// Prints "Some Value"
SomeStructure.storedTypeProperty = "Another value."
print(SomeStructure.storedTypeProperty)
// Prints "Another Value"
print(SomeEnumeration.computedTypeProperty)
// Prints "6"
print(SomeClass.computedTypeProperty)
// Prints "27"



struct AudioChannel {
    
    static var thresholdLevel = 10
    static var maxInputLevelForAllChannels = 0
    
    var currentLevel:Int = 0 {
        didSet {
            if currentLevel == AudioChannel.thresholdLevel {
                // cap the new audio leel to the threshold level
                currentLevel = AudioChannel.thresholdLevel
            }
            if currentLevel > AudioChannel.maxInputLevelForAllChannels {
                // store this as the new overall maximum input level
                AudioChannel.maxInputLevelForAllChannels = currentLevel
            }
        }
    }
}


var leftChannel = AudioChannel()
var rightChannel = AudioChannel()

leftChannel.currentLevel = 7
print(leftChannel.currentLevel)
// Prints "7"
print(AudioChannel.maxInputLevelForAllChannels)
// Prints "7"


rightChannel.currentLevel = 11
print(rightChannel.currentLevel)
// Prints "10"
print(AudioChannel.maxInputLevelForAllChannels)
// Prints "10"
