// MARK: - Behavioral Pattern

protocol Observable {
    func add(observer: PropertyObserver)
    func remove(observer: PropertyObserver)
    func notify(with string: String)
}

class Teacher: Observable {
    
    var observerCollection: [PropertyObserver] = []
    
    var homeTask = "" {
        didSet {
            notify(with: homeTask)
        }
    }
    
    func add(observer: PropertyObserver) {
        observerCollection.append(observer)
    }
    
    func remove(observer: PropertyObserver) {
        
    }
    
    func notify(with string: String) {
        observerCollection.forEach { $0.didGet(newTask: string) }
    }
}


protocol PropertyObserver {
    func didGet(newTask task: String)
}

class Student: PropertyObserver {
    
    var homeTask = ""
    
    func didGet(newTask task: String) {
        homeTask = task
        print("New homework")
    }
}


let teacher = Teacher()
let student = Student()
let student2 = Student()

teacher.add(observer: student)
teacher.add(observer: student2)
teacher.homeTask = "Task 4"
print(student.homeTask)
print(student2.homeTask)
