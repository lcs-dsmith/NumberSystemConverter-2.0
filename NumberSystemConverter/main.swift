//
//  main.swift
//  NumberSystemConverter
//
//  Created by Dylan Smith on 2021-01-26.
//

import Foundation

enum NumberSystemBase: Double {
    case binary = 2.0 //2 is the raw value
    case octal = 8.0  //8 is the raw value
    case decimal = 10.0
    case hexadecimal = 16.0 //
}
// Input

// Get the "from" number system
print("What number system do you want to convert from?")
print("B: Binary")
print("O: Octal")
print("D: Decimal")
print("H: Hexadecimal")
print("Enter your choice (B/O/D/H) : ", terminator: "")
let startBase = readLine()!
var fromBase = NumberSystemBase.binary
switch startBase {
case "B":
    fromBase = .binary
case "O":
    fromBase = .octal
case "D":
    fromBase = .decimal
case "H":
    fromBase = .hexadecimal
default:
    break
}

print("What number system do you want to covert to")
print("Enter your choice (B/O/D/H) : ", terminator: "")
let endbase = readLine()!
var toBase = NumberSystemBase.binary
switch endbase {
case "B":
    toBase = .binary
case "O":
    toBase = .octal
case "D":
    toBase = .decimal
case "H":
    toBase = .hexadecimal
default:
    break
}
print("Enter you number : ", terminator: "")
var value = readLine()!

var decimalResult = 0.0


// Process
if fromBase != .decimal {
    func getDecimalEquvalent(of value: String, in numbersystem: NumberSystemBase ) -> Double {
        var exponent  = 0.0
        //
        //  //current sum in decimal
        var decimalEquvalent = 0.0

        
        for character in value.reversed() {
            
            if let digit = Double(String(character)) {
                decimalEquvalent += digit * pow(fromBase.rawValue,exponent)
                
            } else {
                switch character {
                case "A":
                    decimalEquvalent += 10 * pow(fromBase.rawValue, exponent)
                case "B":
                    decimalEquvalent += 11 * pow(fromBase.rawValue, exponent)
                case "C":
                    decimalEquvalent += 12 * pow(fromBase.rawValue, exponent)
                case "D":
                    decimalEquvalent += 13 * pow(fromBase.rawValue, exponent)
                case "E":
                    decimalEquvalent += 14 * pow(fromBase.rawValue, exponent)
                case "F":
                    decimalEquvalent += 15 * pow(fromBase.rawValue, exponent)
                default:
                    break
                }
            }
            
            exponent += 1
        }
        return decimalEquvalent
    }
    decimalResult = getDecimalEquvalent(of: value, in: fromBase)
} else {decimalResult = Double(value)! }

func getRepresentation(of valueToConvert: Double, inBase endbase: NumberSystemBase) -> String {
    
    
    
    //Creates a variable
    //a variabe can be changed
    var leftToCovert = Int(valueToConvert)
    //creates a string
    //a string is text
    var Representation = ""

    //the abstration we will use is a LOOP
    //our  END CONDITION is when the leftToConver = 0
    //so long as the CONDITION is true, {CODE} will run repetedly
    while leftToCovert > 0 {
        
        let nextDigit = leftToCovert % Int(endbase.rawValue)
        
        if endbase == .hexadecimal {
            
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
        leftToCovert = leftToCovert / Int(endbase.rawValue)
    }
    return Representation
    
    
}

// Output
let result = getRepresentation(of: decimalResult, inBase: toBase)
print("Your conversion is")
print(result)
