// MARK: - Structural Pattern

// MARK: - Virtual Proxy
//class User {
//let id = "123"
//}

//protocol ServerProtocol {
//    func grantAccess(user: User)
//    func denyAccess(user: User)
//}
//
//class ServerSide: ServerProtocol {
//    func grantAccess(user: User) {
//        print("access granted to user with id: \(user.id)")
//    }
//
//    func denyAccess(user: User) {
//        print("deny granted to user with id: \(user.id)")
//    }
//}

//class ServerProxy: ServerProtocol {
//
//    lazy private var server: ServerProtocol = ServerSide()
//
//    func grantAccess(user: User) {
//        server.grantAccess(user: user)
//    }
//
//    func denyAccess(user: User) {
//        server.denyAccess(user: user)
//    }
//}
//
//let user = User()
//
//let proxy = ServerProxy()
//proxy.grantAccess(user: user)
//proxy.denyAccess(user: user)


// MARK: - Protection Proxy

class User {
    let name = "John"
    let password = "123"
}

protocol ServerProtocol {
    func grantAccess(user: User)
}

class ServerSide: ServerProtocol {
    func grantAccess(user: User) {
        print("access granted to user with id: \(user.name)")
    }
}

class ServerProxy: ServerProtocol {
    
    private var server: ServerProtocol?
    
    func grantAccess(user: User) {
        guard server != nil else {
            print("access can't be granted")
            return
        }
        server?.grantAccess(user: user)
    }
    
    func authenticate(user: User) {
        guard user.password == "123" else { return }
        print("user authenticated")
        server = ServerSide()
    }
}

let user = User()
let proxy = ServerProxy()

proxy.grantAccess(user: user)
proxy.authenticate(user: user)
proxy.grantAccess(user: user)
