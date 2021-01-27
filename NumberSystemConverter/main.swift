//
//  main.swift
//  NumberSystemConverter
//
//  Created by Dylan Smith on 2021-01-26.
//

import Foundation

// Input

// Get the "from" number system
print("What number system do you want to convert from?")
print("B: Binary")
print("O: Octal")
print("D: Decimal")
print("H: Hexadecimal")
print("Enter your choice (B/O/D/H) : ", terminator: "")
let from = readLine()!

print("What number system do you want to covert to")
print("Enter your choice (B/O/D/H) : ", terminator: "")
let to = readLine()!

print("Enter you number : ", terminator: "")
let value = readLine()!
let needToConvert = Int(value)!
// Process
func getDecimalEquvalent(of value: Int , from numbersystem: String , to: String) -> String {
    var exponent  = 0.0
    //
    //  //current sum in decimal
    var decimalEquvalent = 0.0
    
    var Base = 10
    //Creates a variable
    //a variabe can be changed
    var leftToCovert = String(value)
    //creates a string
    //a string is text
    var Representation = ""
    
    while value > 0 {
        //Get next binary digit
        let nextDigit = value % Base
        
        if Base == 16 {
            
            switch nextDigit {
            case 0...9:
                Representation = String(nextDigit) + Representation
            case 10:
                Representation = "A" + Representation
            case 11:
                Representation = "B" + Representation
            case 12:
                Representation = "C" + Representation
            case 13:
                Representation = "D" + Representation
            case 14:
                Representation = "E" + Representation
            case 15:
                Representation = "F" + Representation
            default:
                break
            }
        } else {
            //The base is octal or binary (condition is FALSE)
            Representation = String(nextDigit) + Representation
        }
        
        print(Representation)
   
        for character in Representation.reversed() {
            
            if let digit = Double(String(character)) {
                decimalEquvalent += digit * pow(Double(Base),exponent)
                
            } else {
                switch character {
                case "A":
                    decimalEquvalent += 10 * pow(Double(Base), exponent)
                case "B":
                    decimalEquvalent += 11 * pow(Double(Base), exponent)
                case "C":
                    decimalEquvalent += 12 * pow(Double(Base), exponent)
                case "D":
                    decimalEquvalent += 13 * pow(Double(Base), exponent)
                case "E":
                    decimalEquvalent += 14 * pow(Double(Base), exponent)
                case "F":
                    decimalEquvalent += 15 * pow(Double(Base), exponent)
                default:
                    break
                }
            }
            
            exponent += 1
        }
        switch to {
        case "2":
            Base = 2
        case "8":
            Base = 8
        case "16":
            Base = 16
        default:
            break
        }
        
  
        
        
        
        
        
        //get decimal value left to convert
        //var leftToCovert =  Double(value) / Double(Base)
    }
    return Representation
    
    
}




// Output
let answer = getDecimalEquvalent(of: needToConvert, from: from, to: to)
print(answer)
