import UIKit

/* 1. შექმენით Enum-ი სახელით WeekDay შესაბამისი ქეისებით. დაწერეთ ფუნქცია რომელიც იღებს ამ ენამის ტიპს და ბეჭდავს გადაწოდებული დღე სამუშაოა თუ დასვენების. */

enum Weekay : String {
    case Monday, Tuesday, Wednesday, Thursday, Friday, Saturday, Sunday;
}

func isWorking(_ weekday: Weekay) {
    switch weekday {
    case .Monday, .Tuesday, .Wednesday, .Thursday, .Friday  :
        print("Working day")
    case .Saturday, .Sunday  :
        print("Weekend")
    }
}
var day = Weekay.Monday
var day2 = Weekay.Saturday
isWorking(day)
isWorking(day2)



/* 2. შექმენით Enum-ი სახელად GialaSquad, რომელიც აღწერს გია სურამელაშვილის ფანკლუბის წევრების დონეებს ქეისებით :
 “TsigroviManto”, “MoshishvlebuliMkerdi”, “TuGapatio”. შექმენით ფროფერთი GialaSquad-ში, რომელსაც ექნება
 ინფორმაცია თუ რა ღირს თითოეული დონე თვეში (დონეები დალაგებულია ძვირიდან იაფისაკენ). დაუმატეთ მეთოდი რომელიც
 დაბეჭდავს თითოეული დონის ფასს */

enum GialaSquad: Int {
    case TsigroviManto, MoshishvlebuliMkerdi, TuGapatio;
    
    var price: Int {
        switch self {
        case .TsigroviManto :
            return 5000
        case .MoshishvlebuliMkerdi:
            return 4300
        case .TuGapatio:
            return 3700
        }
    }
    func printLevelPrice(){
        print("price of TsigroviManto is $\(GialaSquad.TsigroviManto.price)")
        print("price of MoshishvlebuliMkerdi is $\(GialaSquad.MoshishvlebuliMkerdi.price)")
        print("price of TuGapatio is $\(GialaSquad.TuGapatio.price)")
    }
}

var giasLevel = GialaSquad.TuGapatio
//print("Price of \(giasLevel): $\(giasLevel.price)")
giasLevel.printLevelPrice()


/*3. შექმენით enum-ი Weather შემდეგი ქეისებით, Sunny, Cloudy, Rainy და Snowy. ამ ქეისებს უნდა ჰქონდეს associated value Celsius-ის სახით. დაწერეთ function რომელიც მიიღებს ამ enum-ს, და მოგვცემს რეკომენდაციას რა უნდა ჩავიცვათ შესაბამისი ამინდის მიხედვით. */

enum Weather {
    case Sunny(Int);
    case Cloudy(Int);
    case Rainy(Int);
    case Snowy(Int)
}

func recommendCloth(weather: Weather) {
    switch weather {
    case .Sunny(let temp) :
        temp >= 25 ? print("Wear shorts and a t-shirt") : print("Wear jeans and a shirt")
    case .Cloudy(let temp):
        print("Wear a sleeve shirt it's \(temp)°C outside")
    case .Rainy(let temp):
        print("Don't forgot to take some coat and umbrella it's \(temp)°C outside")
    case .Snowy(let temp):
        print("It's \(temp)°C outside! Bundle up with warm clothes like a jacket ")
        
    }
}
let weather = Weather.Sunny(30)
recommendCloth(weather: weather)
recommendCloth(weather: .Sunny(17))
recommendCloth(weather: .Cloudy(15))


/* 4. შექმენით struct-ი Kanye, ფროფერთებით: album, releaseYear. ამის შემდეგ შექმენით array-ი Kanye-ს ტიპის,
 ჩაამატეთ რამოდენიმე Kanye-ს ობიექტი, და შეავსეთ მასივი კანიეებით. დაწერეთ ფუნქცია, რომელიც მიიღებს ამ
 კანიეების მასივს და წელს. ფუნქციამ უნდა დაგვიბრუნოს ყველა ალბომი რომელიც გამოშვებულია გადაწოდებული
 წლის შემდეგ და დაბეჭდოს ისინი. */

struct Kanye {
    var album: String;
    var releaseYear: String;
}

func printProperAlbum(albumsArr: [Kanye], year: Int) {
    for album in albumsArr {
        if let relaseYear = Int(album.releaseYear) {
            if relaseYear > year {
                print(album.album)
            }
        }
    }
}
var kannyeAlbums = [Kanye]()
let album1 = Kanye(album: "Vultures 1", releaseYear: "2024")
let album2 = Kanye(album: "Ye", releaseYear: "2018")
let album3 = Kanye(album: "Graduation", releaseYear: "2007")

kannyeAlbums.append(album1)
kannyeAlbums.append(album2)

printProperAlbum(albumsArr: kannyeAlbums, year: 2007)


/* 5. შექმენით String-ის ტიპის lazy property wrapper სახელად, cachedData. ინიციალიზება გაუკეთეთ ქლოჟერით რომელიც
 აბრუნებს სტრინგს მნიშვნელობით “lazy ინიციალიზებულია”. მიწვდით ამ ფროფერთის და დაბეჭდეთ მისი მნიშვნელობა */

@propertyWrapper
struct CachedData {
    
    lazy var value: String = self.initializer()
    let initializer: () -> String
    
    init(wrappedValue initializer: @escaping @autoclosure () -> String) {
        self.initializer = initializer
    }
    var wrappedValue: String {
        mutating get {
            return value
        }
    }
}
struct someStruct {
    @CachedData var cachedData: String = "lazy ინიციალიზებულია";
}
var data = someStruct()
print(data.cachedData)




// optional

enum TarotCard {
    case Star, Empress, Tower, HangedMan, Chariot, Moon,
         Hierophant, Devil, Lovers, WheelOfFortune, Fool, Magician;
    
    
    static func selectedCard() -> TarotCard {
        
        let cards: [TarotCard] = [.Star, .Empress, .Tower, .HangedMan, .Chariot, .Moon,
                                  .Hierophant, .Devil, .Lovers, .WheelOfFortune, .Fool, .Magician]
        
        return cards.randomElement() ?? .Empress
        
    }
    
    func cardDescription() -> String {
        switch self {
        case .Star :
            return "წარმოადგენს იმედს, შთაგონებას და სულიერ ხელმძღვანელობას. ეს ნიშნავს განახლებას, ოპტიმიზმს და მომავლის რწმენას."
        case .Empress :
            return "განასახიერებს აღზრდას, სიუხვეს და დედობრივ ინსტინქტებს. ის წარმოადგენს ნაყოფიერებას, კრეატიულობას და ჰარმონიას ურთიერთობებში."
        case .Tower :
            return "ნიშნავს უეცარ ცვლილებას, ქაოსს და განადგურებას. ის წარმოადგენს აჯანყებას, გამოცხადებას და ძველი სტრუქტურების ნგრევას ახალი წამოწყებისთვის."
        case .HangedMan :
            return "წარმოადგენს მსხვერპლს, დანებებას და გაშვებას. ეს ნიშნავს შეჩერების, ახალი პერსპექტივების მოპოვებისა და თვითრეფლექსიის პერიოდს."
        case .Chariot :
            return "განასახიერებს ნებისყოფას, მონდომებას და გამარჯვებას. ის წარმოადგენს საკუთარ ცხოვრებაზე კონტროლის აღებას, მიზნების მიღწევას და დაბრკოლებების გადალახვას ფოკუსირებისა და სწრაფვის გზით."
        case .Moon :
            return "აღნიშნავს ინტუიციას, ილუზიას და ქვეცნობიერ აზრებს. ის წარმოადგენს გაურკვევლობას, დაბნეულობას და აუცილებლობას, ენდოთ საკუთარ ინსტინქტებს უცნობისკენ ნავიგაციის დროს."
        case .Hierophant :
            return "წარმოადგენს ტრადიციას, შესაბამისობას და სულიერ ხელმძღვანელობას. ეს ნიშნავს სიბრძნის ძიებას დამკვიდრებული რწმენებისგან, ინსტიტუტებისა და მენტორებისგან."
        case .Devil :
            return "განასახიერებს ცდუნებას, მონობასა და მატერიალიზმს. ის წარმოადგენს ადამიანის ბუნების ბნელ ასპექტებს, დამოკიდებულებას და შემზღუდველი რწმენებისა და ჩვევებისგან თავის დაღწევის აუცილებლობას."
        case .Lovers :
            return "აღნიშნავს პარტნიორობას, არჩევანს და ჰარმონიას. ის წარმოადგენს სიყვარულს, მიზიდულობას და გადაწყვეტილების მიღების აუცილებლობას ღირებულებებზე და სხვებთან კავშირებზე დაყრდნობით."
        case .WheelOfFortune :
            return "წარმოადგენს ბედს, ციკლებს და მოულოდნელ ცვლილებებს. ეს ნიშნავს იღბალს, შესაძლებლობებს და ცხოვრებისეული მოგზაურობის აღმავლობასა და ვარდნას, გვახსენებს, რომ ცვლილება გარდაუვალია."
        case .Fool :
            return "განასახიერებს უდანაშაულობას, სპონტანურობას და ახალ წამოწყებებს. ეს წარმოადგენს რწმენის ნახტომს, თავგადასავლების მიღებას და სამყაროს ხელმძღვანელობისადმი ნდობას."
        case .Magician :
            return "აღნიშნავს გამოვლინებას, ძალას და პოტენციალს. ის წარმოადგენს კრეატიულობას, უნარს და უნარს,იდეები რეალობად გარდაქმნას ორიენტირებული განზრახვისა და მოქმედების გზით."
        }
    }
}

struct TarotReading {
    var past: TarotCard
    var present: TarotCard
    var future: TarotCard
    
    init(past: TarotCard, present: TarotCard, future: TarotCard) {
        self.past = past
        self.present = present
        self.future = future
    }
    
    func printSelectedCard() {
        print(past.cardDescription())
        print(present.cardDescription())
        print(future.cardDescription())
    }
}

var past = TarotCard.selectedCard()
var present = TarotCard.selectedCard()
var future = TarotCard.selectedCard()
var gashla = TarotReading(past: past, present: present, future: future)

gashla.printSelectedCard()
