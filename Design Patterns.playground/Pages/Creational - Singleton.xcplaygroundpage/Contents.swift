// MARK: - Creational Pattern

class Safe {
    static let shared = Safe()
    var money = 0
    private init() {}
}


Safe.shared.money = 10000

let safe = Safe.shared
print(safe.money)
