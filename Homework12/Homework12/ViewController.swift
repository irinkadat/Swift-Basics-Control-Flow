//
//  ViewController.swift
//  Homework12
//
//  Created by Irinka Datoshvili on 03.04.24.
//

// iphone 15 Pro - თი გატესტეთ <3

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var optionLabel: UILabel!
    @IBOutlet weak var mySwitch: UISwitch!
    @IBOutlet weak var firstNumberField: UITextField!
    @IBOutlet weak var secondNumberField: UITextField!
    @IBOutlet weak var calculateButton: UIButton!
    @IBOutlet weak var result: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        optionLabel.text = "უმცირესი საერთო ჯერადი"
        firstNumberField.placeholder = "შეიყვანეთ მნიშვნელობა"
           
        secondNumberField.placeholder = "შეიყვანეთ მნიშვნელობა"
        result.text = ""
        
        calculateButton.layer.cornerRadius = 10
        calculateButton.clipsToBounds = true
    }

    
    func calculateLCM(_ a: Int, _ b: Int) -> Int {
        let gcd = calculateGCD(a, b)
        guard gcd != 0 else {
            return 0
        }
        return (a * b) / gcd
    }
        
        func calculateGCD(_ a: Int, _ b: Int) -> Int {
            var x = a
            var y = b
            while y != 0 {
                let temp = y
                y = x % y
                x = temp
            }
            return x
        }
        
        @IBAction func switchStateChanged(_ mySwitch: UISwitch) {
            if mySwitch.isOn {
                optionLabel.text = "უდიდესი საერთო გამყოფი"
                calculateButton.backgroundColor = .orange
            } else {
                optionLabel.text = "უმცირესი საერთო ჯერადი"
                calculateButton.backgroundColor = .black
            }
            
            firstNumberField.text = ""
            secondNumberField.text = ""
            result.text = ""
            
            firstNumberField.textColor = UIColor.black
            secondNumberField.textColor = UIColor.black
        }
        
        @IBAction func calculateResult(_ sender: Any) {
            calculate()
        }
        
    func calculate() {
        guard let textA = firstNumberField.text, let textB = secondNumberField.text else {
            return
        }
        if let _ = Int(textA) {
            firstNumberField.backgroundColor = .white
        } else {
            firstNumberField.backgroundColor = .red
        }
        
        if let _ = Int(textB) {
            secondNumberField.backgroundColor = .white
        } else {
            secondNumberField.backgroundColor = .red
        }

        if let a = Int(textA), let b = Int(textB) {
            if mySwitch.isOn {
                let gcd = calculateGCD(a, b)
                if gcd != 0 {
                    result.text = "პასუხი: \(gcd)"
                }
            } else {
                let lcm = calculateLCM(a, b)
                if lcm != 0 {
                    result.text = "პასუხი: \(lcm)"
                } 
            }
        }
    }

    }
