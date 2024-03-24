import UIKit

/* 1. შევქმნათ Class Book.
 Properties: bookID(უნიკალური იდენტიფიკატორი Int), String title, String author, Bool isBorrowed.
 Designated Init.
 Method რომელიც ნიშნავს წიგნს როგორც borrowed-ს.
 Method რომელიც ნიშნავს წიგნს როგორც დაბრუნებულს.
 */

class Book {
    let bookID = UUID()
    var title: String
    var author: String
    var isBorrowed: Bool
    
    init(title: String, author: String, isBorrowed: Bool = false) {
        self.title = title
        self.author = author
        self.isBorrowed = isBorrowed
    }
    func markAsBorrowed() {
        if !isBorrowed {
            isBorrowed = true
            
        } else {
            print("\(self.title) is already borrowed")
        }
    }
    func markAsReturned() {
        if isBorrowed {
            isBorrowed = false
            
        } else {
            print("\(self.title) isn't borrowed for now")
        }
    }
}

/* 2. შევქმნათ Class Owner
 
 Properties: ownerId(უნიკალური იდენტიფიკატორი Int), String name, Books Array სახელით borrowedBooks.
 Designated Init.
 Method რომელიც აძლევს უფლებას რომ აიღოს წიგნი ბიბლიოთეკიდან.
 Method რომელიც აძლევს უფლებას რომ დააბრუნოს წაღებული წიგნი. */

class Owner {
    var ownerId: Int
    var name: String
    var borrowedBooks = [Book]()
    
    init(ownerId: Int, name: String, borrowedBooks: [Book] = []) {
        self.ownerId = ownerId
        self.name = name
        self.borrowedBooks = borrowedBooks
    }
    
    func borrowBook(book: Book) {
        book.markAsBorrowed()
        borrowedBooks.append(book)
        print("\(name) borrowed \(book.title)")
    }
    func returnBook(book: Book) {
        if let index = borrowedBooks.firstIndex(where: { $0.bookID == book.bookID }) {
            book.markAsReturned()
            borrowedBooks.remove(at: index)
            print("\(name) returned '\(book.title)'")
        } else {
            print("\(name) haven't borrowed '\(book.title)'")
        }
    }
}
/* 3. შევქმნათ Class Library
 
 Properties: Books Array, Owners Array.
 Designated Init.
 Method წიგნის დამატება, რათა ჩვენი ბიბლიოთეკა შევავსოთ წიგნებით.
 Method რომელიც ბიბლიოთეკაში ამატებს Owner-ს.
 Method რომელიც პოულობს და აბრუნებს ყველა ხელმისაწვდომ წიგნს.
 Method რომელიც პოულობს და აბრუნებს ყველა წაღებულ წიგნს.
 Method რომელიც ეძებს Owner-ს თავისი აიდით თუ ეგეთი არსებობს.
 Method რომელიც ეძებს წაღებულ წიგნებს კონკრეტული Owner-ის მიერ.
 Method რომელიც აძლევს უფლებას Owner-ს წააღებინოს წიგნი თუ ის თავისუფალია.
 */

class Library{
    var books = [Book]()
    var owners = [Owner]()
    
    init(books: [Book] = [Book](), owners: [Owner] = [Owner]()) {
        self.books = books
        self.owners = owners
    }
    
    func addBook(book: Book) {
        books.append(book)
        print("'\(book.title)' added to the library 🌸")
    }
    
    func addOwner(owner: Owner) {
        owners.append(owner)
        print("Owner: \(owner.name) added 🌸")
    }
    
    func availableBooks() -> [Book] {
        return books.filter { !$0.isBorrowed }
    }
    
    func retrievedBooks() -> [Book] {
        var retrievedBooks = [Book]()
        for owner in owners {
            retrievedBooks.append(contentsOf: owner.borrowedBooks)
        }
        return retrievedBooks
    }
    
    func findOwner(ownerId: Int) -> String {
        if owners.contains(where: { $0.ownerId == ownerId }) {
            return "owner with id \(ownerId) exists 💡"
        } else {
            return "owner with id \(ownerId) doesn't exists ☝️"
            
        }
    }
    
    func borrowedBooks(by owner: Owner) -> [Book] {
        return owner.borrowedBooks
    }
    
    func borrowBookToOwner(book: Book, owner: Owner) -> String {
        if !book.isBorrowed && !owner.borrowedBooks.contains(where: { $0 === book }) {
            owner.borrowedBooks.append(book)
            book.isBorrowed = true
            if let index = books.firstIndex(where: { $0 === book }) {
                books.remove(at: index)
                return "'\(book.title)' has been successfully borrowed by \(owner.name)."
            }
            
            return "Failed to borrow book '\(book.title)' by \(owner.name)."
        }
        return "Book '\(book.title)' is already borrowed or is not available."
    }
    
}


/* 4. გავაკეთოთ ბიბლიოთეკის სიმულაცია.
 
 შევქმნათ რამოდენიმე წიგნი და რამოდენიმე Owner-ი, შევქმნათ ბიბლიოთეკა.
 დავამატოთ წიგნები და Owner-ები ბიბლიოთეკაში
 წავაღებინოთ Owner-ებს წიგნები და დავაბრუნებინოთ რაღაც ნაწილი.
 დავბეჭდოთ ინფორმაცია ბიბლიოთეკიდან წაღებულ წიგნებზე, ხელმისაწვდომ წიგნებზე და გამოვიტანოთ წაღებული წიგნები კონკრეტულად ერთი Owner-ის მიერ.
 */

var artOfHappiness = Book(title: "The art of Happiness", author: "Ramaz Gigauri")
var grosmaister = Book(title: "Grosmaister", author: "Sofo Ardia")
var gmirtaVarami = Book(title: "გმირთა ვარამი", author: "Levan Gotua")
var didostati = Book(title: "დიდოსტატის მარჯვენა", author: "კონსტანტინე გამსახურდია")

let irinka = Owner(ownerId: 1, name: "irinka")
let beqa = Owner(ownerId: 2, name: "Beqa")
let davit = Owner(ownerId: 3, name: "Daviti")

let library = Library()
library.addBook(book: gmirtaVarami)
library.addBook(book: artOfHappiness)
library.addBook(book: grosmaister)
library.addBook(book: didostati)

library.addOwner(owner: irinka)
library.addOwner(owner: beqa)
library.addOwner(owner: davit)

irinka.borrowBook(book: artOfHappiness)
irinka.borrowBook(book: grosmaister)

beqa.borrowBook(book: gmirtaVarami)
davit.borrowBook(book: didostati)
davit.returnBook(book: didostati)


print("List of borrowed books by irinka:")
for book in irinka.borrowedBooks {
    print("- '\(book.title)'")
}

irinka.returnBook(book: grosmaister)

print("List of borrowed books by irinka:")
for book in irinka.borrowedBooks {
    print("- '\(book.title)'")
}

print("retrieved books from library: 👀")
for book in library.retrievedBooks() {
    print("- \(book.title)")
}

//print(library.findOwner(ownerId: 1))
//print(library.findOwner(ownerId: 7))
//print(library.borrowBookToOwner(book: gmirtaVarami, owner: irinka))

print("available books in library: 📚")
for book in library.availableBooks() {
    print("- \(book.title)")
}

var selectedOwner = beqa
print("borrowed books by specific owner \(selectedOwner.name):")
for book in library.borrowedBooks(by: selectedOwner){
    print("- \(book.title)")
}


// Optional as always
print("\n💁‍♀️ Optional as always\n")

/*  შექმენით კლასი გამონათქვამების გენერატორი, სადაც განმარტავთ გამონათქვამს-ს რომელიც იქნება სტრინგებისგან შემდგარი კოლექცია. შექმენით მეთოდი სადაც დააბრუნებთ შერჩევითად სხვადასხვა ჯოუქს და დაბეჭდავთ მას, ასევე ჩაამატეთ მეთოდი, რომელიც ჩასვამს ან ამოაკლებს გამონათქვამს სიიდან. მოცემული გაქვთ “ქილერ” გამონათქვამების სია: */

class JokesGenerator {
    var jokes = [String]()
    
    init(jokes: [String] = []) {
        self.jokes = jokes
    }
    
    func returnUniqueJokes() -> Set<String> {
        var jokesSet = Set(jokes)
        for joke in jokesSet {
            print(joke)
            
        }
        return jokesSet
    }
    
    func RandomJoke() -> String {
        var randomJoke = jokes.randomElement() ?? jokes[0]
        print(randomJoke)
        return randomJoke
    }
    
    func modifyJokes(joke: String, action: String) {
        switch action.lowercased() {
        case "add" :
            jokes.append(joke)
        case "remove":
            guard var index = jokes.firstIndex(of: joke) else { return }
            jokes.remove(at: index)
        default:
            print("Choose correct action add/remove")
        }
    }
    
}
let killerJokes = [
    "დავინახე თუ არა მივხვდი, რომ – ” დევიღუპე. ”",
    "ისეთი აფერისტია, რომ ბანკომატებიც კი აძლევენ ფულს ვალად",
    "სულის ტკივილამდე ვტკივილობ….",
    "იმედის შუქი ჩამიქრა ვინმემ ასანთი მათხოვეთ",
    "არავინაა უნიკალური…მე არავინ ვარ…ე.ი უნიკალური ვარ",
    "ფულის წვიმა რომ მოდიოდეს ნისიების რვეული დამეცემა თავზე",
    "თქვენ მოჰკალით ძერა?",
    "ბებიააა... ბებია... ოლია მათხოვარი მევიდა...",
    "მზე აღარ ამოდის ჩაგვიჭრეს"
]

var joke = JokesGenerator(jokes: killerJokes)
print("---------- random joke -----------")
joke.RandomJoke()

print("---------- all unique jokes -----------")
joke.returnUniqueJokes()

joke.modifyJokes(joke: "მზე აღარ ამოდის ჩაგვიჭრეს", action: "remove")

print("---------- modified jokes -----------")
joke.returnUniqueJokes()
