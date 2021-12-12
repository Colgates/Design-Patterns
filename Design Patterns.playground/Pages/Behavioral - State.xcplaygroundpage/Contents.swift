// MARK: - Behavioral Pattern

protocol State {
    func turnOn(printer: Printer)
    func turnOff(printer: Printer)
    func printDocument(printer: Printer)
}

class On: State {
    func turnOn(printer: Printer) {
        print("it's turned on already")
    }
    
    func turnOff(printer: Printer) {
        print("turning off")
        printer.set(state: Off())
    }
    
    func printDocument(printer: Printer) {
        print("printing")
        printer.set(state: PrintDocument())
    }
}

class Off: State {
    func turnOn(printer: Printer) {
        print("turning on")
        printer.set(state: On())
    }
    
    func turnOff(printer: Printer) {
        print("it's turned off already")
    }
    
    func printDocument(printer: Printer) {
        print("it's turned off, can't print")
    }
}

class PrintDocument: State {
    func turnOn(printer: Printer) {
        print("printint the document")
        printer.set(state: PrintDocument())
    }
    
    func turnOff(printer: Printer) {
        print("turning off")
        printer.set(state: Off())
    }
    
    func printDocument(printer: Printer) {
        print("it's busy printing already")
    }
}


class Printer {
    
    var state: State
    
    init() {
        self.state = On()
    }
    
    func turnOn() {
        state.turnOn(printer: self)
    }
    
    func turnOff() {
        state.turnOff(printer: self)
    }
    
    func printDocument() {
        state.printDocument(printer: self)
    }
    
    func set(state: State) {
        self.state = state
    }
}

let printer = Printer()
printer.turnOn()
printer.turnOff()
printer.printDocument()
printer.turnOn()
printer.turnOn()
