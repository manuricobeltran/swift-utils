import Foundation

print(Date())
let array = Array(0...1_000_000)
print(Date())

// MARK: - Only executes the .map / .filter if you access the element

let lazyMapArray = array.lazy.map { $0 * 3 }
print("\(lazyMapArray.last ?? 0)")
print(Date())

// MARK: - Executes the full .map / .filter

let mapArray = array.map { $0 * 3 }
print("\(mapArray.last ?? 0)")
print(Date())
