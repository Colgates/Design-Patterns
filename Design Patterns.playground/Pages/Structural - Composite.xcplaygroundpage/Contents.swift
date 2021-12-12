// MARK: - Structural Pattern

protocol Coworker {
    func hire(coworker: Coworker)
    func getInfo()
    var lvl: Int { get }
}

class Manager: Coworker {
    
    private var coworkers: [Coworker] = []
    
    var lvl: Int
    
    init(lvl: Int) {
        self.lvl = lvl
    }
    
    func hire(coworker: Coworker) {
        self.coworkers.append(coworker)
    }
    
    func getInfo() {
        print(self.lvl.description + "level manager")
        for coworker in coworkers {
            coworker.getInfo()
        }
    }
}

class LowLevelManager: Coworker {

    var lvl: Int
    
    init(lvl: Int) {
        self.lvl = lvl
    }
    
    func hire(coworker: Coworker) {
        print("Can't hire")
    }
    
    func getInfo() {
        print(self.lvl.description + " level manager")
    }
}

let topManager = Manager(lvl: 1)
let managerLv2 = Manager(lvl: 2)
let managerLv3_1 = Manager(lvl: 3)
let managerLv3_2 = Manager(lvl: 3)
let managerLv10 = Manager(lvl: 10)

topManager.hire(coworker: managerLv2)
managerLv2.hire(coworker: managerLv3_1)
managerLv2.hire(coworker: managerLv3_2)

managerLv3_1.hire(coworker: managerLv10)
managerLv3_1.hire(coworker: managerLv10)
managerLv3_1.hire(coworker: managerLv10)
managerLv3_1.hire(coworker: managerLv10)

managerLv3_2.hire(coworker: managerLv10)
managerLv3_2.hire(coworker: managerLv10)
managerLv3_2.hire(coworker: managerLv10)
managerLv3_2.hire(coworker: managerLv10)

topManager.getInfo()
