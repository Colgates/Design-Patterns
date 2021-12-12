// MARK: - Creational Pattern

protocol Vehicle {
    func drive()
}

class Car: Vehicle {
    func drive() {
        print("drive a car")
    }
}

class Truck: Vehicle {
    func drive() {
        print("drive a truck")
    }
}

class Bus: Vehicle {
    func drive() {
        print("drive a bus")
    }
}

protocol VehicleFactory {
    static func produce() -> Vehicle
}

class CarFactory: VehicleFactory {
    static func produce() -> Vehicle {
        print("Car is created")
        return Car()
    }
}

//class TruckFactory: VehicleFactory {
//    func produce() -> Vehicle {
//        print("Truck is created")
//        return Truck()
//    }
//}
//
//class BusFactory: VehicleFactory {
//    func produce() -> Vehicle {
//        print("Bus is created")
//        return Car()
//    }
//}

//let carFactory = CarFactory()
let car = CarFactory.produce()
