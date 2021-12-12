// MARK: - Behavioral Pattern

import Darwin
protocol SwimBehavior {
    func swim()
}

class ProfessionalSwimmer: SwimBehavior {
    func swim() {
        print("Professional Swimmer")
    }
}

class NonSwimmer: SwimBehavior {
    func swim() {
        print("Non Swimmer")
    }
}

protocol DiveBehavior {
    func dive()
}

class ProfessionalDiver: DiveBehavior {
    func dive() {
        print("Professional Diver")
    }
}

class NonDiver: DiveBehavior {
    func dive() {
        print("Non Diver")
    }
}

class Human {
    
    var swimBehavior: SwimBehavior
    var diveBehavior: DiveBehavior
    
    init(swimBehavior: SwimBehavior, diveBehavior: DiveBehavior) {
        self.swimBehavior = swimBehavior
        self.diveBehavior = diveBehavior
    }
    
    func setSwimBehavior(_ swimBehavior: SwimBehavior) {
        self.swimBehavior = swimBehavior
    }
    
    func setDiveBehavior(_ diveBehavior: DiveBehavior) {
        self.diveBehavior = diveBehavior
    }
    
    func performSwim() {
        swimBehavior.swim()
    }
    
    func performDive() {
        diveBehavior.dive()
    }
    
    func run() {
        print("running")
    }
}

let human = Human(swimBehavior: ProfessionalSwimmer(), diveBehavior: NonDiver())
human.setDiveBehavior(ProfessionalDiver())
human.performDive()
human.performSwim()
