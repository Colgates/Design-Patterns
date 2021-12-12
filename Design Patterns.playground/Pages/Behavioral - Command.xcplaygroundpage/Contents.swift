// MARK: - Behavioral Pattern

class Account {

    var accountName: String
    var balance: Int
    
    init(accountName: String, balance: Int) {
        self.accountName = accountName
        self.balance = balance
    }
}

protocol Command {
    func execute()
    var isComplete: Bool { get set }
}

class Deposit: Command {
    
    private var account: Account
    private var amount: Int
    var isComplete: Bool = false
    
    init(account:Account, amount: Int) {
        self.account = account
        self.amount = amount
    }
    
    func execute() {
        account.balance += amount
        isComplete = true
    }
}

class Withdraw: Command {
    
    private var account: Account
    private var amount: Int
    var isComplete: Bool = false
    
    init(account: Account, amount: Int) {
        self.account = account
        self.amount = amount
    }
    
    func execute() {
        if account.balance >= amount {
            account.balance -= amount
            isComplete = true
        } else {
            print("not enough money")
        }
    }
}

class TransactionManager {
    
    static let shared = TransactionManager()
    private init() {}
    private var transactions: [Command] = []
    
//    var pendingTransactions: Command {
//        self.transactions.filter { $0.isComplete == false }
//    }
    
    func addTransactions(command: Command) {
        transactions.append(command)
    }
    
    func processingTransactions() {
        transactions.filter { $0.isComplete == false }.forEach { $0.execute() }
    }
}

let account = Account(accountName: "John Smith", balance: 1000)

let transactionManager = TransactionManager.shared
transactionManager.addTransactions(command: Deposit(account: account, amount: 500))

account.balance
transactionManager.processingTransactions()
account.balance
