import UIKit


// Global functions
func add(num1:Int,num2:Int) -> Int {
    return num1+num2
}

// Nested functions
func performCalculation(num1:Int,num2:Int) -> Int {
    
    return add(num1: num1, num2: num2) + multipication(num1: num1, num2: num2)
    
    func add(num1:Int,num2:Int) -> Int {
        return num1+num2
    }
    
    func multipication(num1:Int,num2:Int) -> Int {
        return num1+num2
    }
}

// Closures or Closure expressions
func someFunctionThatTakesClosure(closure:() -> Void) {
   // function body goes here
}

// Here's how you call this function without using a trailing closure:

someFunctionThatTakesClosure(closure: {
    // closure's body goes here
})


// Here's how you call this function with a trailing closure instead:
someFunctionThatTakesClosure {
    // trailing closure's body goes here
}


let digitNames = [ 0: "Zero", 1 : "One", 2: "Two", 4: "Four", 
                   5:"Five", 6:"Six", 7: "Seven",8: "Eioht", 9:"Nine"]
let numbers = [16,58,510]

let strings = numbers.map { number  in
    var number = number
    var output = ""
    repeat {
        output = digitNames[number % 10]! + output
        number /= 10
    } while number > 0
                
    return output
}

// strings is inferred to be of type [String]
// its value is ["OneSix,"FiveEight","FiveOneZero"]

struct Server {
    
}

struct Picture {
    
}

func loadPicture(from server:Server, completion:(Picture) -> Void, onFailure:() -> Void) {
    
    if let picture = download("photo.jpg", from:server) {
        completion(picture)
    } else {
        onFailure()
    }
}

func download(_ photo:String,from server:Server) -> Picture? {
    return Picture()
}

let someServer = Server()

loadPicture(from: someServer) { picture in
    //someView.currentPicture = picture
} onFailure: {
    print("Couldn't download the next picture")
}


// sorting closures examples
let names = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]

// Sorting by passing normal function as an argument
func backward(_ s1: String, _ s2: String) -> Bool {
    return s1 > s2
}
var reverseNames = names.sorted(by: backward)
// reversedNames is equal to ["Ewa", "Daniella", "Chris", "Barry", "Alex"]”


// Closure Expression Syntax
/*
{ (parameters) -> return type in
   statements
}
*/
// “The example below shows a closure expression version of the backward(_:_:) function from above:”
reverseNames = names.sorted(by: { (s1:String, s2:String) -> Bool in
    return s1 > s2
})


// Inferring Type from context
// “Because the sorting closure is passed as an argument to a method, Swift can infer the types of its parameters and the type of the value it returns.”
reverseNames = names.sorted(by: { s1,s2  in
    return s1 > s2
})

// Implicit Returns from Single-Expression Closure
reverseNames = names.sorted(by: { s1, s2 in
    s1 > s2
})

// Short hand argument names
reverseNames = names.sorted(by: { $0 > $1} )

// Operator methods
reverseNames = names.sorted(by: >)


// Trailing closures
reverseNames = names.sorted(by:{
    $0 > $1
})

reverseNames = names.sorted {
    $0 > $1
}

func someFunctionThatTakesAClosure(closure:()-> Void) {
    // function body goes here
}

// Here's how you call this function without using a trailing closure:
someFunctionThatTakesClosure(closure: {
    // closure's body goes here
})

// Here's how you call this function with a trailing closure instead:
someFunctionThatTakesClosure {
    //trailing closure's body goes here
}


// Caputring values
func makeIncrementer(forIncrement amount:Int) -> () -> Int {
 
    var runningTotal = 0
    func incrementer() -> Int {
        
        runningTotal += amount
        return runningTotal
    }
    return incrementer
}


let incrementerByTen = makeIncrementer(forIncrement: 10)
incrementerByTen()
// returns a value of 10
incrementerByTen()
// returns a value of 20
incrementerByTen()
// returns a value of 30

let incrementBySeven = makeIncrementer(forIncrement: 7)
incrementBySeven()
// returns a value of 7

incrementerByTen()
// returns a value of 40


// Escaping closures
/*
“A closure is said to escape a function when the closure is passed as an argument to the function, but is called after the function returns. When you declare a function that takes a closure as one of its parameters, you can write @escaping before the parameter’s type to indicate that the closure is allowed to escape.”

*/
