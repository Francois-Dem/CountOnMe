//
//  Calculator.swift
//  CountOnMe
//
//  Created by françois demichelis on 17/08/2020.
//  Copyright © 2020 Vincent Saluzzo. All rights reserved.
//

import Foundation

class Calculator {
    var elements: [String] = []

    // Error check computed variables
    var expressionIsCorrect: Bool {
        return elements.last != "+" && elements.last != "-" && elements.last != "*" && elements.last != "/"
    }

    var expressionHaveEnoughElement: Bool {
        return elements.count >= 3
    }

    var canAddOperator: Bool {
        return elements.last != nil && elements.last != "+" && elements.last != "-" && elements.last != "*" && elements.last != "/"
    }

    var expressionHaveResult: Bool {
        return elements.contains("=")
    }

    func calcul() -> String {

        // Iterate over operations while an operand still here
        while elements.count > 1 {
            let index = elements.firstIndex(of: "*") ?? elements.firstIndex(of: "/") ??
                elements.firstIndex(of: "+") ?? elements.firstIndex(of: "-") ?? 1
            let left = Double(elements[index - 1]) ?? 0
            let operand = elements[index]
            let right = Double(elements[index + 1]) ?? 0
            let result: String
            switch operand {
            case "+": result = addition(x: left, y: right)
            case "-": result = soustraction(x: left, y: right)
            case "*": result = multiplication(x: left, y: right)
            case "/": result = division(x: left, y: right)
            default: return "ERROR"
            }

            elements.removeSubrange((index-1)...(index+1))
            elements.insert("\(result)", at: index - 1)
        }
        return elements[0]
    }

    func addElement (_ text: String) {
        elements.append(text)
    }

    //swiftlint:disable:next variable_name
    func multiplication (x: Double, y: Double) -> String {
        return String(x * y).replacingOccurrences(of: ".0", with: "")
    }

    //swiftlint:disable:next variable_name
    func addition (x: Double, y: Double) -> String {
        return String(x + y).replacingOccurrences(of: ".0", with: "")
    }

    //swiftlint:disable:next variable_name
    func soustraction (x: Double, y: Double) -> String {
        return String(x - y).replacingOccurrences(of: ".0", with: "")
    }

    //swiftlint:disable:next variable_name
    func division (x: Double, y: Double) -> String {
        return String(format: "%.2f", x / y).replacingOccurrences(of: ".00", with: "").replacingOccurrences(of: "nan", with: "ERROR")
    }
}
