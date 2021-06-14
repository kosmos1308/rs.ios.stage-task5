import Foundation

public typealias Supply = (weight: Int, value: Int)

public final class Knapsack {
    let maxWeight: Int
    let drinks: [Supply]
    let foods: [Supply]
    var maxKilometers: Int {
        findMaxKilometres()
    }
    
    init(_ maxWeight: Int, _ foods: [Supply], _ drinks: [Supply]) {
        self.maxWeight = maxWeight
        self.drinks = drinks
        self.foods = foods
    }
    
    func findMaxKilometres() -> Int {
            let weightFood = foods.map { Supply -> Int in
                Supply.weight
            }
            let valueFood = foods.map { Supply -> Int in
                Supply.value
            }
            let foodMatrix = workWthKnap(p: maxWeight, weight_i: weightFood, value_i: valueFood)

            let weightDrinks = drinks.map { Supply -> Int in
                Supply.weight
            }
            let valueDrinks = drinks.map { Supply -> Int in
                Supply.value
            }
            let drinksMatrix = workWthKnap(p: maxWeight, weight_i: weightDrinks, value_i: valueDrinks)

            let foodArray: [Int] = foodMatrix.last!
            let drinkArray: [Int] = drinksMatrix.last!.reversed()
            
            var maxDistance: Int = 0
            for i in stride(from: 0, to: foodArray.count, by: 1) {
                let val = min(foodArray[i], drinkArray[i])
                if val > maxDistance { maxDistance = val }
            }
             
            return maxDistance
        }
    }

    func workWthKnap(p: Int, weight_i: [Int], value_i: [Int]) -> [[Int]] {
        let n = weight_i.count
        var t = Array(repeating: Array(repeating: 0, count: p + 1), count: n + 1)
        for i in 0 ..< n + 1 {
            for j in 0 ..< p + 1 {
                if i == 0 || j == 0 {
                    t[i][j] = 0
                } else if weight_i[i - 1] <= j {
                    t[i][j] = max(value_i[i - 1] + t[i - 1][j - weight_i[i - 1]],
                                  t[i - 1][j])
                } else {
                    t[i][j] = t[i - 1][j]
                }
            }
        }

        return t
    }


