import Foundation

struct MyApp {
    let name: String
    let monthlyPrice: Double
    let users: Int
}

let appPortfolio = [
    MyApp(name: "Colkie Fan", monthlyPrice: 0.0, users: 55845),
    MyApp(name: "TravelKit", monthlyPrice: 3.99, users: 3450),
    MyApp(name: "MyBudgets", monthlyPrice: 1.99, users: 1244),
    MyApp(name: "Connect Four", monthlyPrice: 11.99, users: 3271)
]

// Filter

let freeApps = appPortfolio.filter { $0.monthlyPrice == .zero }
print(freeApps)

// Map

let appNames = appPortfolio.map(\.name)
print(appNames)

let increasedPrices = appPortfolio.map { $0.monthlyPrice * 1.5 }.sorted()
print(increasedPrices)

// Reduce

let numbers = [3, 5, 12, 15, 18]
let sum = numbers.reduce(0, +)
print(sum)

let totalUsers = appPortfolio.reduce(0) { $0 + $1.users }
print(totalUsers)

// Chaining

let totalRevenue = appPortfolio
    .map { Double($0.users) * $0.monthlyPrice }
    .reduce(0, +)
print(totalRevenue)

// CompactMap

let nilNumbers: [Int?] = [1, nil, 17, nil, 3, 7, nil, 99]
let nonNilNumbers = nilNumbers.compactMap { $0 }
print(nonNilNumbers)

// FlapMap

let arrayOfArrays = [[1, 2, 3],
                     [4, 5, 6],
                     [7, 8, 9]]
let singleArray = arrayOfArrays.flatMap { $0 }
let doubledSingleArray = arrayOfArrays.flatMap { $0.map { $0 * 2 } }
print(doubledSingleArray)
