// MARK: - Behavioral Pattern

protocol DriveVehicle {
    func haveASeat()
    func useProtection()
    func lookAtTheMirror()
    func turnSignalOn()
    func driveForward()
}

extension DriveVehicle {
    
    func startVehicle() {
        haveASeat()
        useProtection()
        lookAtTheMirror()
        turnSignalOn()
        driveForward()
    }
    
    func haveASeat() {
        preconditionFailure("this method should be overriden")
    }
    
    func useProtection() {
        preconditionFailure("this method should be overriden")
    }
    
    func lookAtTheMirror() {
        preconditionFailure("this method should be overriden")
    }
    
    func turnSignalOn() {
        preconditionFailure("this method should be overriden")
    }
    
    func driveForward() {
        preconditionFailure("this method should be overriden")
    }
}

class Bicycle: DriveVehicle {
    
    func haveASeat() {
        print("sit down on a bicycle")
    }
    
    func useProtection() {
        print("wear a helmet")
    }
    
    func lookAtTheMirror() {
        print("look at the little mirror")
    }
    
    func turnSignalOn() {
        print("show left hand")
    }
    
    func driveForward() {
        print("pedal")
    }
}

class Car: DriveVehicle {
    
    func haveASeat() {
        print("sit in the car")
    }
    
    func useProtection() {
        print("fasten seat belt")
    }
    
    func lookAtTheMirror() {
        print("look at the rearview mirror")
    }
    
    func turnSignalOn() {
        print("turn on left turn light")
    }
    
    func driveForward() {
        print("push pedal")
    }
}

let car = Car()
let bicycle = Bicycle()

car.startVehicle()
bicycle.startVehicle()
