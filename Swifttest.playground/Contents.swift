import UIKit

var str = "Hello, playground"



var arr = [1,2,3,4,5,6]


let arr2 = arr.map {$0*3}
arr2

arr[0].hashValue
arr[0][keyPath: \.hashValue]



extension Sequence {
    func map<T>(_ keyPath: KeyPath<Element, T>) -> [T] {
        return map { $0[keyPath: keyPath] }
    }
}
