import UIKit

var a: Int = 10
// const int a = 10
let b: Int = 20


var d: Int
var c = 20

Int64.max
Int.max
Int16.max
Int32.max

UInt32.max

var f: Float
var g: Double

var str: String = "Hello world!"
var boolVar: Bool = false

var char: String = "a"


var myOptionalVar: Int?
myOptionalVar = 11






if myOptionalVar != nil {
    print(myOptionalVar!)
}


if let myNonOpetionalVar = myOptionalVar {
    print(myNonOpetionalVar)
}

//==
//!=
//<=
// NULL = nil

// a++  ++a

a += 1 // a = a + 1
// условие ? команда1 : команда2


if a > 10 {
    print("а больше 10")
} else {
    print("а меньше 10")
}

a > 10 ? print("а больше 10") : print("а меньше 10")

// ??

var a1: Int?
var b1: Int = 5
var c1: Int = 0

c = (a1 ?? b1)



for i in 1..<10 {
    print(i)
}

// || &&

var str2 = """
Hello,
world,
!!!!
"""

print("\u{1F40E}")

var arr: [Int] = [1,2,3,4,5,6]

for element in arr {
    print(element)
}


arr.append(22)
arr

//int myFunc(int a, int b) {
//
//}
func myFunc(a: Int, b: Int) -> Int {
    return a + b
}

myFunc(a: 10, b: 20)

func myFunc2(_ a: Int, _ b: Int) -> Int {
    return a + b
}

myFunc2(10, 20)

func myFunc3(firstArg a: Int, secondArg b: Int) -> Int {
    return a + b
}

myFunc3(firstArg: 10, secondArg: 20)

// C++
//class myClass {
//   int a = 10
//}
//
//struct myClass {
//   int a = 10
//}


struct myClass {
    var a: Int?
    var b: Int?
    
//    init(a: Int, b: Int) {
//        self.a = a
//        self.b = b
//    }

    func method1() -> Int? {
        if let a1 = a, let b1 = b {
            return a1 + b1
        } else {
            return nil
        }
    }
}



var instance: myClass = myClass()

instance.a = 10
instance.b = 20
instance.method1()

var instance2: myClass = instance

instance2.a! += 100

instance.a
instance2.a

var a3: Int
var b3: Array<Int>
var c3: [String: Int]


var arr3: [Int] = [1,2,3,4,5,6,7,8,9,10]


var myDict: [String: Int] = [:]

myDict["Igor"] = 23
myDict["Irina"] = 17
myDict["Ivan"] = 22

print(myDict.values)
print(myDict.keys)

var myTuple = (1,2)
print(myTuple.0)
print(myTuple.1)
