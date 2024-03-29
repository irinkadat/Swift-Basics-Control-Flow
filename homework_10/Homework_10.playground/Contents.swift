import UIKit

/* თქვენი დავალებაა კარგათ გაერკვეთ როგორ მუშაობს ARC სხვადასხვა იმპლემენტაციების გამოყენებით.
 შექმენით ციკლური რეფერენცები და გაწყვიტეთ
 აუცილებელია ქლოჟერების გამოყენება
 აუცილებელია value და რეფერენს ტიების გამოყენება (კლასები, სტრუქტურები, ენამები და პროტოკოლები)
 აუცილებელია გამოიყენოთ strong, weak & unowned რეფერენსები ერთხელ მაინც
 დაიჭირეთ self ქლოჟერებში
 გატესტეთ მიღებული შედეგები ინსტანსების შექმნით და დაპრინტვით */


// Retain cycle strong reference-ების გამოყენებით (ენამის,პროტოკოლისა და კლასების გამოყენება).

enum Weather {
    case Sunny(Int);
    case Cloudy(Int);
    case Rainy(Int);
    case Snowy(Int)
}

protocol SeasonsProtocol {
    var weather: Weather { get }
    
    func AppropriateCloth() -> Void
}

class Cloth: SeasonsProtocol {
    var weather: Weather
    var owner: Owner?
    
    init(weather: Weather, owner: Owner? = nil) {
        self.weather = weather
        self.owner = owner
    }
    
    func AppropriateCloth() {
        guard let owner = owner else {
            print("Wear appropriate clothes for \(weather) weather.")
            return
        }
        let ownerName = owner.name
        
        switch weather {
        case .Sunny(let temp):
            temp >= 25 ? print("\(ownerName) wear shorts and a t-shirt") : print("\(ownerName) wear jeans and a shirt")
        case .Cloudy(let temp):
            print("\(ownerName) wear a sleeve shirt, it's \(temp)°C outside")
        case .Rainy(let temp):
            print("\(ownerName) don't forget to take a coat and an umbrella, it's \(temp)°C outside")
        case .Snowy(let temp):
            print("\(ownerName) it's \(temp)°C outside! Bundle up with warm clothes like a jacket")
        }
    }
    deinit {
        print("Cloth instance deallocated")
    }
}

class Owner {
    var name: String
    var cloth : Cloth?
    
    init(name: String, cloth: Cloth? = nil) {
        self.name = name
        self.cloth = cloth
    }
    deinit {
        print("Owner instance deallocated")
    }
}

var cloth: Cloth? = Cloth(weather: .Sunny(30))
var owner: Owner? = Owner(name: "irinka")
cloth?.owner = owner
owner?.cloth = cloth
cloth?.AppropriateCloth()

cloth = nil
owner = nil


// ციკლური რეფერენციის გაწყვეტა, weak-რეფერენსით (ქლოჟერისა და self  გამოყენება)

class University {
    var name : String
    weak var student : Student?
    
    
    init(name: String, student: Student? = nil) {
        self.name = name
        self.student = student
    }
    
    func printName() {
        student?.printUniName { [weak self] in
            if let self = self {
                print("University name: \(self.name)")
            }
        }
    }
}

class Student {
    var studentId : Int
    var studentName : String
    var university : University?
    
    init(studentId: Int, studentName: String, university: University? = nil) {
        self.studentId = studentId
        self.studentName = studentName
        self.university = university
    }
    
    func printUniName(closure: () -> Void) {
        closure()
    }
    
    deinit {
        print("\(studentName) is deallocated")
    }
}

var university: University? = University(name: "BTU")
var student: Student? = Student(studentId: 1, studentName: "irinka")

university?.student = student
student?.university = university
university?.printName()

student = nil


// ციკლური რეფერენციის გაწყვეტა, unown-რეფერენსით (ქლოჟერისა და self  გამოყენება)

protocol Property {
    var price: Int { get set }
}

class Person {
    var name: String
    var house: House?
    
    init(name: String, house: House? = nil) {
        self.name = name
        self.house = house
    }
    deinit {
        print("Person instance deallocated")
    }
}

class House: Property {
    var price: Int
    unowned var owner: Person?
    
    init(price: Int, owner: Person? = nil) {
        self.price = price
        self.owner = owner
    }
    
    deinit {
        print("House instance deallocated")
    }
    
    lazy var printHouseInfo: () -> Void = { [unowned self] in
        guard let owner = self.owner else {
            print("House is unowned")
            return
        }
        print("House owned by \(owner.name) with price \(self.price)")
    }
}

var person: Person? = Person(name: "irinka")
var house: House? = House(price: 100000)
person?.house = house
person = nil
house = nil



// ბოლო,value და რეფერენს ტიპების გამოყენება (კლასები, სტრუქტურები, ენამები და პროტოკოლები)

enum Gender {
    case male, female
}

protocol Animal {
    func makeSound()
}

struct Pet: Animal {
    var name: String
    var gender : Gender
    func makeSound() {
        print("Pet makes sound!")
    }
}

class Dog {
    var action: Pet
    
    init(action: Pet) {
        self.action = action
    }
    
    deinit {
        print("Dog instance deallocated")
    }
}

var animal: Pet = Pet(name: "tommy", gender: .male)
var dog: Dog? = Dog(action: animal)
dog?.action.makeSound()
dog = nil


