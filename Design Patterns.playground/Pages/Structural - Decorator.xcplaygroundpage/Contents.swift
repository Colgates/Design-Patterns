// MARK: - Structural Pattern

import Foundation

protocol Porsche {
    func getPrice() -> Double
    func getDescription() -> String
}

class Boxster: Porsche {
    func getPrice() -> Double {
        return 120
    }
    
    func getDescription() -> String {
        return "Porsche Boxster"
    }
}

class PorscheDecorator: Porsche {
    private let decoratedPorsche: Porsche
    
    required init(decoratedPorsche: Porsche) {
        self.decoratedPorsche = decoratedPorsche
    }
    
    func getPrice() -> Double {
        return decoratedPorsche.getPrice()
    }
    
    func getDescription() -> String {
        return decoratedPorsche.getDescription()
    }
}

class PremiumAudioSystem: PorscheDecorator {
    required init(decoratedPorsche: Porsche) {
        super.init(decoratedPorsche: decoratedPorsche)
    }
    
    override func getPrice() -> Double {
        return super.getPrice() + 30
    }
    
    override func getDescription() -> String {
        return super.getDescription() + "with premium audio system"
    }
}

class PanoramicSunroof: PorscheDecorator {
    required init(decoratedPorsche: Porsche) {
        super.init(decoratedPorsche: decoratedPorsche)
    }
    
    override func getPrice() -> Double {
        return super.getPrice() + 20
    }
    
    override func getDescription() -> String {
        return super.getDescription() + "with panoramic sunroof"
    }
}

var porscheBoxster: Porsche = Boxster()
porscheBoxster.getDescription()
porscheBoxster.getPrice()
porscheBoxster.getDescription()

porscheBoxster = PremiumAudioSystem(decoratedPorsche: porscheBoxster)
porscheBoxster.getPrice()
porscheBoxster.getDescription()

porscheBoxster = PanoramicSunroof(decoratedPorsche: porscheBoxster)
porscheBoxster.getPrice()
porscheBoxster.getDescription()


class Porsche911: Porsche {
    func getPrice() -> Double {
        return 200
    }
    
    func getDescription() -> String {
        return "Porsche 911"
    }
}

var porsche911: Porsche = Porsche911()
porsche911.getPrice()
porsche911.getDescription()

porsche911 = PremiumAudioSystem(decoratedPorsche: porsche911)
porsche911.getPrice()
porsche911.getDescription()
