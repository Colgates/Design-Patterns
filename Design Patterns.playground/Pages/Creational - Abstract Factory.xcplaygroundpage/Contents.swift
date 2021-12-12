// MARK: - Creational Pattern

protocol Car {
    func drive()
}

class LittleSizedCar: Car {
    func drive() {
        print("drive a little sized car")
    }
}

class MiddleSizedCar: Car {
    func drive() {
        print("drive a middle sized car")
    }
}

protocol Bus {
    func drive()
}

class LittleSizedBus: Bus {
    func drive() {
        print("drive a little sized bus")
    }
}

class MiddleSizedBus: Bus {
    func drive() {
        print("drive a middle sized bus")
    }
}

// MARK: - Factory

protocol Factory {
    func produceCar() -> Car
    func produceBus() -> Bus
}

class LittleSizedFactory: Factory {
    func produceBus() -> Bus {
        print("LittleSizedBus is created")
        return LittleSizedBus()
    }
    
    func produceCar() -> Car {
        print("LittleSizedCar is created")
        return LittleSizedCar()
    }
}

class MiddleSizedFactory: Factory {
    func produceBus() -> Bus {
        print("MiddleSizedBus is created")
        return MiddleSizedBus()
    }
    
    func produceCar() -> Car {
        print("MiddleSizedCar is created")
        return MiddleSizedCar()
    }
}


let littleSizeFactory = LittleSizedFactory()
let car = littleSizeFactory.produceCar()

