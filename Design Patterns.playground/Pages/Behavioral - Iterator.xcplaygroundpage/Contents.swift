// MARK: - Behavioral Pattern

class Driver {
    let isGoodDriver: Bool
    let name: String
    
    init(isGood: Bool, name: String) {
        self.isGoodDriver = isGood
        self.name = name
    }
}

class Car {
    var goodDriverIterator: GoodDriverIterator {
        GoodDriverIterator(drivers: drivers)
    }
    
    var badDriverIterator: BadDriverIterator {
        BadDriverIterator(drivers: drivers)
    }
    
    private let drivers = [Driver(isGood: true, name: "Mark"),
                           Driver(isGood: false, name: "Ivan"),
                           Driver(isGood: true, name: "Maria"),
                           Driver(isGood: false, name: "Morgan")]
}

class GoodDriverIterator: IteratorProtocol {
    typealias Element = Driver
    
    private let drivers: [Driver]
    private var current = 0
    
    init(drivers: [Driver]) {
        self.drivers = drivers.filter { $0.isGoodDriver }
    }
    
    func allDrivers() -> [Driver] {
        drivers
    }
    
    func next() -> Driver? {
        defer { current += 1 }
        return drivers.count > current ? drivers[current] : nil
    }
}

class BadDriverIterator: IteratorProtocol {
    typealias Element = Driver
    
    private let drivers: [Driver]
    private var current = 0
    
    init(drivers: [Driver]) {
        self.drivers = drivers.filter { $0.isGoodDriver == false }
    }
    
    func allDrivers() -> [Driver] {
        drivers
    }
    
    func next() -> Driver? {
        defer { current += 1 }
        return drivers.count > current ? drivers[current] : nil
    }
}

let car = Car()
let goodDriverIterator = car.goodDriverIterator.next()
let badDriverIterator = car.badDriverIterator.next()
car.badDriverIterator.allDrivers()
