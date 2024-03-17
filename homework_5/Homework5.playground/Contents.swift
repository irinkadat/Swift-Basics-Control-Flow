import UIKit
import Foundation


/* 1. დაწერეთ ფუნქცია რომელიც პარამეტრად მიიღებს String-ს და დააბრუნებს ბულიანს.
 ფუნქციამ უნდა შეამოწმოს მიღებული სტრინგი სარკისებურია თუ არა (სიტყვა ან წინადადება,
 რომელიც იკითხება ერთნაირად როგორც თავიდან, ისე ბოლოდან მაგ: “ანა”, “აირევი ივერია”, “მადამ”) */

// option 1

func mFunc(_ txt: String) -> Bool {
    
    var reversedTxt = ""
    
    for i in stride(from: txt.count - 1, through: 0, by: -1) {
        let index = txt.index(txt.startIndex, offsetBy: i)
        reversedTxt.append(txt[index])
    }
    if txt == reversedTxt {
        return true
    } else {
        return false
    }
}

print(mFunc("აირევი ივერია"))
print(mFunc("მადამ"))
print(mFunc("irinka"))


// option 2

func mFun(_ txt: String) -> Bool {
    var revercedStr = ""
    for each in txt {
        revercedStr = String(each) + revercedStr
    }
    if txt == revercedStr {
        return true
    } else {
        return false
    }
}

//mFun("irinka")
//mFun("ana")
//mFun("aba")


// option 3

func myFun(txt: String) -> Bool {
    
    if txt == String(txt.reversed()) {
        return true
    } else {
        return false
    }
    
}

//print(myFun(txt: "irinka"))
//print(myFun(txt: "ana"))


/* 2. დაწერეთ ფუნქცია რომელიც გადაცემულ რიცხვების array-ს ააკვარდატებს, დაპრინტავს და
 დააბრუნებს მნიშვნელობას. */

func arrayPow(_ arr: [Int] ) -> [Int] {
    var newArr = [Int]()
    
    for i in arr {
        var element = i * i
        newArr.append(element)
    }
    return newArr
}
var arr1 = [2,4,5,6]

print(arrayPow(arr1))


/* 3. დაწერეთ Closure რომელიც გაფილტრავს ლუწ რიცხვებს Int-ების Array-დან. */

var closure = { (arr: [Int]) -> [Int] in
    var arr = arr
    var index = 0
    for each in stride(from: arr.count - 1, through: 0, by: -1) {
        if arr[each] % 2 == 1 {
            arr.remove(at: each)
        }
    }
    return arr
}

var arr = [1,2,4,5,6]
print(closure(arr))

// 2 option with while loop

var closure_ = { (arr: [Int]) -> [Int] in
    var arr = arr
    var index = 0
    
    while index < arr.count {
        if arr[index] % 2 == 1 {
            arr.remove(at: index)
        } else {
            index += 1
        }
    }
    return arr
}

//var arr_ = [7,8,2,4,5,6]
//print(closure(arr_))


// 3 option

let filterEvenNumbers: ([Int]) -> [Int] = { nums in
    var evenNumbers = [Int]()
    for num in nums {
        if num % 2 == 0 {
            evenNumbers.append(num)
        }
    }
    return evenNumbers
}

//let nums = [1, 2, 3, 4, 5, 6, 7, 8, 9]
//let evenNumbers = filterEvenNumbers(nums)
//print(evenNumbers)


/* 4. დაწერეთ ფუნქცია, რომელიც პარამეტრად იღებს Int-ების მასივს. Escaping closure-ის მეშვეობით
 დაბეჭდეთ მიწოდებული მასივის ჯამი 5 წამის შემდეგ. დარწმუნდით რომ closure არის escaping და
 გამოიძახეთ ის მას შემდეგ რაც ფუნქცია დაბრუნდება.  */

// option 1

var sumOfNums: ([Int]) -> () = { nums in
    var sum = 0
    for num in nums {
        sum += num
    }
    print("Sum of the array: \(sum)")
}

func printSumAfterDelay(_ numbers: [Int], closure: @escaping ([Int]) -> Void) {
    DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
        closure(numbers)
    }
}

let numsArr = [1, 2, 3, 4, 5]
printSumAfterDelay(numsArr, closure: sumOfNums)


// option 2

func printArraySumAfterDelay(_ numbers: [Int], completion: @escaping () -> Void) {
    DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
        let sum = numbers.reduce(0, +)
        print("Sum of the array: \(sum)")
        completion()
    }
}
let numbers = [1, 2, 3, 4, 5]

printArraySumAfterDelay(numbers) {
    print("executed after 5 seconds")
}


// option 3

//func printArraySumAfterDelay(_ numbers: [Int], completion: @escaping ([Int]) -> Void) {
//    DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
//        completion(numbers)
//    }
//}
//
//let numbers = [1, 2, 3, 4, 5]
//
//printArraySumAfterDelay(numbers) { numbers in
//    let sum = numbers.reduce(0, +)
//    print("Sum of the array: \(sum)")
//}

/*5.  შექმენით  კონტაქტების Dict სადაც key არის სახელი და value ტელეფონის ნომერი, დაამატეთ,
 დაბეჭდეთ/მოძებნეთ და წაშალეთ კონტაქტი */

var dict = [String : String]()

func addContact(name: String, contact: String) {
    dict[name] = contact
}

func printContacts(){
    
    print("Contacts 📞 :")
    for (name, phoneNumber) in dict {
        print("\(name): \(phoneNumber)")
    }
}
func searchContact(name: String) {
    if let contact = dict[name] {
        print("Searched contact - \(name): \(contact)")
    } else {
        print("Contact not found.")
    }
}
func deleteContact(name: String){
    if let phoneNumber = dict[name] {
        dict.removeValue(forKey: name)
    }
}

addContact(name: "irinka", contact: "555555555")
addContact(name: "swift ioseliani", contact: "599727204")

printContacts()
searchContact(name: "irinka")
deleteContact(name: "irinka")
printContacts()



/* 6. დაწერეთ ფუნქცია რომელიც პარამეტრად იღებს [String: Int] ტიპის Dictionary-ს და დააბრუნებს
 ანბანურად დალაგებულ dictionary-ს key ელემენტების მასივს. */

func sortedDict(dict: [String : Int]) -> [String] {
    var arr = [String]()
    for (key, value) in dict {
        arr.append(key)
    }
    return arr.sorted()
    
}

let d = [
    "irinka": 21,
    "emma" : 23,
    "nikk" : 27
]
print(sortedDict(dict: d))

/* 7. შექმენით Double-ების მასივი, შეავსეთ ის თქვენთვის სასურველი რიცხვებით.
 loop-ის გამოყენებით იპოვეთ ყველაზე დიდი რიცხვი ამ მასივში და დაბეჭდეთ. */

var numbers2: [Double] = [11.7, 21.0, 10.1, 43.43, 16.0]

var maxNum = numbers2[0]

for number in numbers2 {
    if number > maxNum {
        maxNum = number
    }
}

print("max value is: \(maxNum)")


// MARK: -- Optional

/* მოცემულია Dictionary სადაც წარმოდგენილია ლელა წურწუმიას სიმღერებისა და მათი ხანგრძლივობა(წმ) მონაცემები: */

let lelaWhatMovementIsThis: [String: Int] = [
    "ღამის სიჩუმე გაფანტე": 235,
    "ვიხსენებ ყველაფერს თავიდან" : 219,
    "სულელი წვიმა": 231,
    "ალალ მე": 231,
    "იდუმალი ღამე": 221,
    "ჩუმად ნათქვამი": 199,
    "თეთრი ქარავანი": 221,
    "ძველი ვერხვები": 193
]

// 1. დაწერეთ ფუნქცია რომელიც გამოითვლის და დაბეჭდავს სიღერების ჯამურ ხანგრძლივობას წუთებში და წამებში

func totalDuration(dict: [String : Int]){
    var duration = [Int]()
    
    for (key, value) in dict {
        duration.append(value)
    }
    var total = duration.reduce(0, +)
    let mins = total / 60
    let seconds = total % 60
    
    print("the total duration of lela tsurtsumia's songs is \(mins) min \(seconds) sec")
}

totalDuration(dict: lelaWhatMovementIsThis)


// 2. დაწერეთ ფუნქცია რომელიც იპოვის და დაბეჭდავს ყველაზე ხანგრძლივი და ხანმოკლე სიმღერის სახელს.


func largestAndShortest(dict:  [String : Int]) {
    var longestSong = ""
    var shortestSong = ""
    
    var min = Int.max
    var max = Int.min
    
    for (song, duration) in dict {
        if duration < min {
            min = duration
            shortestSong = song
        } else if duration > max {
            max = duration
            longestSong = song
        }
    }
    print("shortest song: \(shortestSong), largest song: \(longestSong)")
    
}
largestAndShortest(dict: lelaWhatMovementIsThis)

// 3. დაწერეთ ფუნქცია რომელიც გამოითვლის სიმღერების საშუალო ხანგრძლივობას


func averageSongLength(dict: [String: Int]) -> Double {
    
    let totalDuration = dict.values.reduce(0, +)
    let averageLength = Double(totalDuration) / Double(dict.count)
    return averageLength
}

let averageLength = averageSongLength(dict: lelaWhatMovementIsThis)
print("The average length of songs is \(averageLength) sec.")


// 4. დაწერეთ ფუნქცია რომელიც შემთხვევითად ამოარჩევს სიმღერას და დაბეჭდავს მის სახელს


func printRandSong(dict: [String: Int]) {
    
    let songs = Array(dict.keys)
    let randomIndex = Int.random(in: 0..<songs.count)
    let randomSong = songs[randomIndex]
    
    print("Lela's random song: \(randomSong)")
}

printRandSong(dict: lelaWhatMovementIsThis)

