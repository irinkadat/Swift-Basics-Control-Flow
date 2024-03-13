import UIKit

/* 1. შექმენით სამი Int ტიპის ცვლადი, მიანიჭეთ მათ მნიშვნელობა და დაბეჭდეთ მათი
      ნამრავლი.*/

var number1 = 20
var number2 = -10
var number3 = 2

print(number1*number2*number3)


/* 2. შექმენით int ტიპის ცვლადი, მიანიჭეთ მას მნიშვნელობა და შეამოწმეთ ეს რიცხვი
      ლუწია თუ კენტი ტერნარი ოპერატორით. */
 
var number = 33
var isEven = number % 2 == 0 ? true : false
print("is even?: " , isEven)

 
/*  3. შექმენით optional String-ის ტიპის და მიანიჭეთ თქვენი სახელის მნიშვნელობა.
    If let-ის მეშვეობით გაუკეთეთ unwrap და მნიშვნელობა დაპრინტეთ */

let name : String? = "irinka"
if let name = name {
    print(name)
}

  
/* 4. შექმენით ცვლადი სახელად isRaining ბულეანის ტიპის და მიანიჭეთ თქვენთვის
      სასურველი მნიშვნელობა. If-else-ის მეშვეობით შეამოწმეთ თუ მნიშვნელობა
      მიიღებს true მნიშვნელობას დაბეჭდეთ “ქოლგის წაღება არ დამავიწყდეს”, სხვა შემთხვევაში
      “დღეს ქოლგა არ დამჭირდება”. */
 

var isRaining : Bool = true

if isRaining {
    print("ქოლგის წაღება არ დამავიწყდეს")
}
else {
    print("დღეს ქოლგა არ დამჭირდება")
}


/* 5. შექმენით ორი int ტიპის ცვლადი a & b და მიანიჭეთ სასურველი რიცხვები. If-else-ით
      შეამოწმეთ თუ a მეტია b-ზე დაბეჭდეთ “a მეტია”,  სხვა შემთხვევაში “b მეტია” */

var a = 5
var b = 25

if (a > b) {
    print("a მეტია")
}
else if(a < b){
    print("b მეტია")

}



/* 6. შექმენით მუდმივა Character ტიპის და მიანიჭეთ თქვენი სახელის პირველი ასოს
      მნიშვნელობა. */

let firstChar : Character = "I"



/* 7. მოცემულია ორნიშნა რიცხვი, გაიგეთ არის თუ არა ერთიდაიმავე ციფრისგან შემდგარი */

let twoDigitNum = 22

var isMirror = twoDigitNum % 10 == twoDigitNum / 10 ? true : false
print("შედგება ერთიდაიმავე ციფრისგან? ", isMirror)

                    
// მე-2 ვარიანტი, String Interpolation - ით

//let twoDigitNum = 22
//
//var isMirror = twoDigitNum % 10 == twoDigitNum / 10 ? "შედგება" : "არ შედგება"
//print("\(isMirror) ერთიდაიმავე ციფრისგან? " )

                                                                                  
/* 8. აიღეთ ცვლადი numberOfMonths მიანიჭეთ მნიშვნელობა და იმის მიხედვით თუ მერამდენე თვეა დაბეჭდეთ ის (გაზაფხული, ზაფხული, შემოდგომა, ზამთარი) შესაბამისად. */

var numberOfMonths = 1

if numberOfMonths >= 1 && numberOfMonths <= 3 {
    print("ზამთარი")
}
else if numberOfMonths >= 4 && numberOfMonths <= 6 {
    print("გაზაფხული")
}
else if numberOfMonths >= 7 && numberOfMonths <= 9 {
    print("ზაფხული")
}
else if numberOfMonths >= 10 && numberOfMonths <= 12 {
    print("შემოდგომა")
}


// მე-2 ვარიანტი

//print("შეიყვანეთ თვის შესაბამისი რიცხვი : ")
//
//if let userInput = readLine(), let num = Int(userInput) {
//    switch num {
//        case 1...3:
//            print("ზამთარი")
//        case 4...6:
//            print("გაზაფხული")
//        case 7...9:
//            print("ზაფხული")
//        case 10...12:
//            print("შემოდგომა")
//        default:
//            print("შეიყვანეთ სწორი რიცხვი! 1-12")
//    }
//}



//Optional:

/* 9. შექმენით მთელი რიცხვის მქონე ცვლადი. თუ ეს ცვლადი იყოფა 3-ზე, დაბეჭდეთ “იყოფა 3-ზე”, თუ ეს ცვლადი იყოფა 4-ზე დაბეჭდეთ “იყოფა 4-ზე”, თუ იყოფა ორივეზე დაბეჭდეთ “იყოფა 3-ზე და 4-ზე”*/

var n = 5
if (n % 3 == 0) {
    print("იყოფა 3-ზე")
}
else if (n % 4 == 0) {
    print("იყოფა 4-ზე")
}
else if (n % 3 == 0) && (n % 4 == 0){
    print("იყოფა 3-ზე და 4-ზე")
}


/* 10. შექმენით ორი რიცხვითი ცვლადი num1, num2 და რაიმე String ტიპის ცვლადი რომელსაც ტერნარული ოპერატორის საშუალებით მიანიჭებთ “თანაბრად დაშორებულია ნულიდან” / “არ არის თანაბრად დაშორებული ნულიდან” შესაბამის მნიშვნელობას რომელსაც აკმაყოფილებს მოცემული ორი ცვლადი */


var num1 = 5
var num2 = -5

var res = num1 + num2 == 0 ? "თანაბრად დაშორებულია ნულიდან" : "არ არის თანაბრად დაშორებული ნულიდან"

print(res)
