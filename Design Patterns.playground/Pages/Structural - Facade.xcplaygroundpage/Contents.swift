// MARK: - Structural Pattern

import Foundation

class FruitShop {
    func buyFruits() -> String {
        return "Fruits"
    }
}

class MeatShop {
    func buyMeat() -> String {
        return "Meat"
    }
}

class MilkShop {
    func buyMilk() -> String {
        return "Milk"
    }
}

class CandyShop {
    func buyCandies() -> String {
        return "Candies"
    }
}

class BreadShop {
    func buyBread() -> String {
        return "Bread"
    }
}

// Facade
class Supermarket {
    
    private let fruitShop = FruitShop()
    private let meatShop = MeatShop()
    private let milkShop = MilkShop()
    private let candyShop = CandyShop()
    private let breadShop = BreadShop()
    
    func buyProducts() -> String {
        var products = ""
        products += fruitShop.buyFruits() + ", "
        products += meatShop.buyMeat() + ", "
        products += milkShop.buyMilk() + ", "
        products += candyShop.buyCandies() + ", "
        products += breadShop.buyBread()
        return "I bought: " + products
    }
}

let sm = Supermarket()
sm.buyProducts()
