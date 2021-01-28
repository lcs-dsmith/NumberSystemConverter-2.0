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
let startBase = readLine()!

print("What number system do you want to covert to")
print("Enter your choice (B/O/D/H) : ", terminator: "")
let endbase = readLine()!
var base = 0
switch endbase {
case "B":
    base = 16
case "O":
    base = 8
case "D":
    base =  10
case "H":
    base = 16
default:
    break
}
print("Enter you number : ", terminator: "")
var value = readLine()!

var decimalResult = 0.0


// Process
if startBase != "D" {
    func getDecimalEquvalent(of value: String, in numbersystem: String ) -> Double {
        var exponent  = 0.0
        //
        //  //current sum in decimal
        var decimalEquvalent = 0.0
        
        var startBase = 0.0
        switch numbersystem {
        case "B":
            startBase = 2.0
        case "O":
            startBase = 8.0
        case "H":
            startBase = 16.0
        default:
            break
        }
        
        for character in value.reversed() {
            
            if let digit = Double(String(character)) {
                decimalEquvalent += digit * pow(startBase,exponent)
                
            } else {
                switch character {
                case "A":
                    decimalEquvalent += 10 * pow(startBase, exponent)
                case "B":
                    decimalEquvalent += 11 * pow(startBase, exponent)
                case "C":
                    decimalEquvalent += 12 * pow(startBase, exponent)
                case "D":
                    decimalEquvalent += 13 * pow(startBase, exponent)
                case "E":
                    decimalEquvalent += 14 * pow(startBase, exponent)
                case "F":
                    decimalEquvalent += 15 * pow(startBase, exponent)
                default:
                    break
                }
            }
            
            exponent += 1
        }
        return decimalEquvalent
    }
    decimalResult = getDecimalEquvalent(of: value, in: startBase)
} else {decimalResult = Double(value)! }

func getRepresentation(of valueToConvert: Double, inBase endbase: String) -> String {
    
    
    
    //Creates a variable
    //a variabe can be changed
    var leftToCovert = Int(valueToConvert)
    //creates a string
    //a string is text
    var Representation = ""
    var base = 0
    switch endbase {
    case "B":
        base = 16
    case "O":
        base = 8
    case "D":
        base =  10
    case "H":
        base = 16
    default:
        break
    }
    //the abstration we will use is a LOOP
    //our  END CONDITION is when the leftToConver = 0
    //so long as the CONDITION is true, {CODE} will run repetedly
    while leftToCovert > 0 {
        
        let nextDigit = leftToCovert % base
        
        if base == 16 {
            
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
        
        
        //get decimal value left to convert
        leftToCovert = leftToCovert / base
    }
    return Representation
    
    
}

// Output
let result = getRepresentation(of: decimalResult, inBase: endbase)
print(result)
