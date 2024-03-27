import UIKit

/* 1. შექმენით ენამი Gender სადაც იქნება 2 გენდერი*/

enum Gender {
    case male, female;
}

/* 2. შექმენით Protocol სახელად SuperBeing. გაუწერეთ მას ფროფერთები- name: String, strength: Int, speed: Int, weakness: String, gender: Gender */
 
protocol SuperBeing {
    var name: String {get} ;
    var strength: Int {get};
    var speed: Int {get};
    var weakness: String {get}
    var gender: Gender { get }
}

/* 3. SuperBeing-ის strength-სა და speed-ს მიეცით default მნიშვნელობა */
/* 4. შექმენით კლასები Superhero და SuperVillain, დაუქონფორმეთ SuperBeing-ს. */
/* 5. გაუწერეთ Superhero კლასს დამატებითი პარამეტრები outfitColor: String, equipment: String,vehicle: String */


class Superhero: SuperBeing{
    var name: String
    var strength: Int
    var speed: Int
    var weakness: String
    var gender: Gender
    var outfitColor: String
    var equipment: String
    var vehicle: String
    
    init(name: String, weakness: String, gender: Gender, outfitColor: String, equipment: String, vehicle: String, strength: Int = 21, speed: Int = 210) {
        self.name = name
        self.strength = strength
        self.speed = speed
        self.weakness = weakness
        self.gender = gender
        self.outfitColor = outfitColor
        self.equipment = equipment
        self.vehicle = vehicle
    }
    func combat(superVillain: SuperVillain) {
        print("\(name) შეერკინა და დაამარცხა \(superVillain.name)")
    }
}

/* 8. გაუწერეთ SuperVillain კლასს დამატებითი პარამეტრები evilScheme: String, obsession: String, rivalry: String */

class SuperVillain: SuperBeing {
    var name: String
    var strength: Int
    var speed: Int
    var weakness: String
    var gender: Gender
    var evilScheme: String
    var obsession: String
    var rivalry: String
    
    init(name: String, weakness: String, gender: Gender, evilScheme: String, obsession: String, rivalry: String, strength: Int = 21, speed: Int = 210) {
        self.name = name
        self.strength = strength
        self.speed = speed
        self.weakness = weakness
        self.gender = gender
        self.evilScheme = evilScheme
        self.obsession = obsession
        self.rivalry = rivalry
    }
    
}

/* 6. გაუწერეთ Superhero კლასს მეთოდი - rescue, რომელიც პარამეტრად მიიღებს დაზარალებულის სახელს და
 დაბეჭდავს - “‘სუპერგმირის სახელი’ არ შეუშინდა სახიფათო სიტუაციას და ‘დაზარალებულის სახელი’
 გადაარჩინა სიკვდილს” (მაგ: “ბეტმენი” არ შეუშინდა სახიფათო სიტუაციას და “გელა” გადაარჩინა სიკვდილს).
 
 7. გაუწერეთ Superhero კლასს მეთოდი - combat, რომელიც პარამეტრად მიიღებს Supervillain-ს და დაბეჭდავს -“‘სუპერგმირის სახელი’ შეერკინა და დაამარცხა ‘ბოროტმოქმედის სახელი’” (მაგ: “ბეტმენი” შეერკინა და დაამარცხა “ჯოკერი”) */

extension Superhero {
    func rescue(victimName: String) {
        print("\(name) არ შეუშინდა სახიფათო სიტუაციას და \(victimName) გადაარჩინა სიკვდილს")
    }
    func combat(villain: SuperVillain) {
        print("\(name) შეერკინა და დაამარცხა \(villain.name)")
    }
    
}

/* 9. გაუწერეთ SuperVillain კლასს მეთოდი - attack - რომელიც პარამეტრად მიიღებს Superhero-ს და დაბეჭდავს - “ბოროტმ. სახელი” გეგმავს თავდასხმას და მთელი ქალაქის მიწასთან გასწორებას, საეჭვოა “სუპერგმირის სახელი” მის შეჩერებას თუ შეძლებს” (მაგ: “ჯოკერი” გეგმავს თავდასხმას და მთელი ქალაქის მიწასთან გასწორებას, საეჭვოა “ბეტმენი” მის შეჩერებას თუ შეძლებს) */

/* 10. გაუწერეთ SuperVillain კლასს მეთოდი experimentation - რომელიც პარამეტრად მიიღებს სტრინგს (subject) და
 დაბეჭდავს - “‘ბოროტმოქმედის სახელი’ ექსპერიმენტებს ატარებს დაუცველ მოქალაქებზე,მისი მსხვერპლი ამჟამად
 ‘მსხვერპლის სახელი’ აღმოჩნდა” (მაგ: “ჯოკერი” ექსპერიმენტებს ატარებს დაუცველ მოქალაქებზე, მისი მსხვერპლი
 ამჟამად “გელა” აღმოჩნდა) */

extension SuperVillain {
    
    func attack(superhero: Superhero){
        print("ბოროტმ. \(name) გეგმავს თავდასხმას და მთელი ქალაქის მიწასთან გასწორებას, საეჭვოა \(superhero.name) მის შეჩერებას თუ შეძლებს")
    }
    
    func experimentation(subject: String) {
        print("\(name) ექსპერიმენტებს ატარებს დაუცველ მოქალაქებზე,მისი მსხვერპლი ამჟამად \(subject) აღმოჩნდა ")
    }
}


/* 11. შექმენით მინიმუმ 5-5 ობიექტი თითოეული SuperBeing-ის დაქონფირმებული კლასებიდან */

let spiderMan = Superhero(name: "spider man", weakness: "spider", gender: .male, outfitColor: "red & blue", equipment: "spider web", vehicle:" web-slinging abilities" )
let batman = Superhero(name: "Batman", weakness: "zero", gender: .male, outfitColor: "black", equipment: "none", vehicle:"911 turbo s")
let superman = Superhero(name: "Superman", weakness: "Himself", gender: .male, outfitColor: "blue", equipment: "none", vehicle:"911 turbo s")
let superGirl = Superhero(name: "Super girl", weakness: "nil", gender: .female, outfitColor: "blue", equipment: "none", vehicle:"none", strength: 30, speed: 120)
let wonderWoman = Superhero(name: "Wonder Woman", weakness: "fearless", gender: .female, outfitColor: "red", equipment: "none", vehicle:"911 turbo s")
let ironMan = Superhero(name: "IronMan", weakness: "Iron", gender: .male, outfitColor: "grey", equipment: "iron", vehicle:"911 turbo s")


let joker = SuperVillain(name: "Joker", weakness: "Harley Quinn", gender: .male, evilScheme: "anarchy", obsession: "Batman", rivalry: "Batman" )
let doctorDoom = SuperVillain(name: "Doctor Doom", weakness: "Arrogance and Pride", gender: .male, evilScheme: "Take over the world", obsession: "Fantastic Four", rivalry: "Fantastic Four" )
let harleyQuinn = SuperVillain(name: "Harley Quinn", weakness: "Emotionally vulnerable", gender: .female, evilScheme: "Chaos", obsession: "Joker", rivalry: "Batman")
let killerFrost = SuperVillain(name: "Killer Frost", weakness: "Heat", gender: .female, evilScheme: "Freeze the world", obsession: "Cold", rivalry: "The Flash")
let catWoman = SuperVillain(name: "Cat Woman", weakness: "Love", gender: .female, evilScheme: "Stealing", obsession: "Jewels", rivalry: "Batman")


batman.rescue(victimName: "Gela")
superGirl.combat(superVillain: harleyQuinn)
joker.attack(superhero: batman)
harleyQuinn.experimentation(subject: "cinderella")


/* დაწერეთ ჯენერიკ ფუნქცია compareSwiftness რომელიც იღებს მხოლოდ ორ პარამეტრს პირველ და მეორე სუპერგმირებს
 რომლებიც დაქვემდებარებულები იქნებიან SuperBeing პროტოკოლზე, ფუნქცია უნდა აბრუნებდეს სტრინგს ფუნქციის
 ბადიში შეამოწმეთ speed მნიშვნელობები ორივე სუპერგმირის დააბრუნეთ სტრინგი აღწერით თუ რომელი სუპერგმირია
 უფრო სწრაფი (გაითვალისწინეთ ისიც თუ სიჩქარეები ერთმანეთის ტოლია) */

func compareSwiftness<T: SuperBeing>(superhero1: T, superhero2: T) -> String {
    if superhero1.speed > superhero2.speed {
        return "\(superhero1.name) უფრო სრაფია ვიდრე \(superhero2.name)."
    } else if superhero2.speed > superhero1.speed {
        return "\(superhero2.name) უფრო სრაფია ვიდრე \(superhero1.name)."
    } else {
        return "\(superhero1.name)-სა და \(superhero2.name)-ის სიჩქარეები ტოლია."
    }
}

print(compareSwiftness(superhero1: batman, superhero2: ironMan))
print(compareSwiftness(superhero1: batman, superhero2: superGirl))
