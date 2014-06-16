// Pattern, switch and Tuple

/************************************
Tupple

    temporary group of related values,
    unrelated type, "mini-struct"

************************************/

// refresher
let c = 6

()          // empty tuple (void)
(c) == c    // one element tuple are juste simple value
(c,c)       // "normal" tuple

// accessing elements
var tup1 = (5,6)
tup1.0
tup1.1

// named elements
var tup2: (a: Int, b: Int) = (5,6)
tup2.a
tup2.b

// idem for function params
func ft(a: (Int, Int)) -> Int {
    return a.0 + a.1
}

func ft2(a: (b1: Int, b2: Int)) -> Int {
    return a.b1 + a.b2
}



/************************************
Pattern Matching

    test the structure of values

************************************/
func multiReturn() -> (Int, Int) {
    return (5, 6)
}

let (_, a) = multiReturn()  // destructuring
a


// Switch statement
//      exaustive, no implicit fallthrough (no need for 'break')
//

// Basic
var response: Int
switch c {
    case 1: response = 1
    case 2: response = 2
    
    case 3,4,5: response = 10
    
    case 6..9: response = 11
    case 10...20: response = 20
    
    default: response = 100
}

// Enum
enum Direction {
    case North, South, East, West
}

let direction = Direction.South
switch direction {
    case .North: response = 27
    case .South: response = 28
    case .East: response = 29
    case .West: response = 30
}

// Tuple
let color = (0.0, 0.7, 0.3, 1.0)        // RGBA

switch color {
    case (0.0, 0.5...1.0, let blue, _):
        println("Some shade of blue: \(blue)")

    default:
        response = 0
}

// Optional
let dict = ["k1": "dog", "k2":"cat"]

var name: String?
switch dict["k2"] {
    case .Some(let listName):
        name = listName

    default:
        name = nil
}
name

// Where clause
let color2 = (0.7, 0.7, 0.7, 1.0)

switch color2 {
    case let (r, g, b, 1.0) where r == g && g == b:
        println("Some shade of gray \(r)")
    
    default:
        name = nil
}

// More Elaborate
switch (dict["k1"], dict["k2"]) {
    case (.Some(let a), .Some(let b))
    where a.hasPrefix("d"):
        println("a cat and a dog!")
    
    default:
        name = nil
}

