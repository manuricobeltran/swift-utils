import Foundation

protocol Car {
    associatedtype Identifier
    /// We are hidding the type from the compiler. Must use an opaque type
    var id: Identifier { get }
}

struct BMW: Car {
    let id: String
    let bmwId: String = "bmwID"
}

struct Audi: Car {
    let id: Int
    let audiId: String = "audiID"
}

let toggle = Int.random(in: 0..<10) < 5
let bmw = BMW(id: "myBMW")
let audi = Audi(id: 0)

///
/// ✅ The following 3 function signatures are identical.
///
func wash1<T: Car>(_ car: T) { }
func wash2<T>(_ car: T) where T: Car { }
func wash3(_ car: some Car) {
    if let bmw = car as? BMW {
        print("It is a BMW - \(car.id) - \(bmw.bmwId)")
    }
    if let audi = car as? Audi {
        print("It is an Audi - \(car.id) - \(audi.audiId)")
    }
}
toggle ? wash3(bmw) : wash3(audi)

/// 🔴 Compile error: Protocol 'Car' has a hidden type. Must use 'some' or 'any'
//var car1: Car
/// 🔴 Compile error: Use of 'some Car' must init the variable for the compiler to infer the type
//var car2: some Car
/// ✅ No compile error
var car3: some Car = BMW(id: "bmw")
var car4: any Car
car4 = Audi(id: 0)


/// ✅ No compile error: Cannot infer the type at compilation time. We must use 'any
func getFavouriteCar() -> any Car {
    if Int.random(in: 0..<2) < 1 {
        return BMW(id: "bmw")
    } else {
        return Audi(id: 0)
    }
}
