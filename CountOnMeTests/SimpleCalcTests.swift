//
//  SimpleCalcTests.swift
//  SimpleCalcTests
//
//  Created by Vincent Saluzzo on 29/03/2019.
//  Copyright © 2019 Vincent Saluzzo. All rights reserved.
//

import XCTest
@testable import CountOnMe

class CountOnMeTests: XCTestCase {

    var calculate = Calculator()

    // MARK: ADDITION
    // 0 + 0 = 0
    func testGivenFirstNumberZero_WhenSecondNumberIsZero_ThenResultIsZero() {
        calculate.addElement("0")
        calculate.addElement("+")
        calculate.addElement("0")

        XCTAssertEqual(calculate.calcul(), "0")
    }

    // 0 + 1-9 = 1-9
    func testGivenFirstNumberZero_WhenSecondNumberIsNoZero_ThenResultIsEgalToTheSecondNumber() {
        calculate.addElement("4")
        calculate.addElement("+")
        calculate.addElement("3")

         XCTAssertEqual(calculate.calcul(), "7")
    }

    // 890 + 60 = 950
    func testGivenFirstNumberHaveTreeDecimal_WhenSecondNumberHaveTwoDecimal_ThenResultIsAdditionOfTwoNumber() {
        calculate.addElement("890")
        calculate.addElement("+")
        calculate.addElement("60")

         XCTAssertEqual(calculate.calcul(), "950")
    }

    // 1 + 2 + 0 = 3
    func testGivenFirstAndSecondNumberIsNoZero_WhenNumberTreeIsZero_ThenResultIsAdditionOfTwoFirstNumber() {
        calculate.addElement("1")
        calculate.addElement("+")
        calculate.addElement("2")
        calculate.addElement("+")
        calculate.addElement("0")

         XCTAssertEqual(calculate.calcul(), "3")
    }

    // MARK: SUBSTRACTION
    // 0 - 0 = 0
    func  testGivenFirstNumberZero_WhenSecondNumberIsZero_ThenResultSubstractionIsZero() {
        calculate.addElement("0")
        calculate.addElement("-")
        calculate.addElement("0")

         XCTAssertEqual(calculate.calcul(), "0")
    }

    // 0 - 1-9 = -1-9
    func testGivenFirstNumberZero_WhenSecondNumberIsNoZero_ThenResultIsNegactiveSecondNumber() {
        calculate.addElement("0")
        calculate.addElement("-")
        calculate.addElement("6")

         XCTAssertEqual(calculate.calcul(), "-6")
    }

    // 890 - 60 = 830
    func testGivenFirstNumberHaveTreeDecimal_WhenSecondNumberHaveTwoDecimal_ThenResultIsSubstractionOfTwoNumber() {
        XCTAssertEqual(calculate.soustraction(x: 890, y: 60), "830")
    }

    // MARK: MULTIPLICATION
    // 0 * 0 = 0
    func  testGivenFirstNumberZero_WhenSecondNumberIsZero_ThenResultMultiplicationIsZero() {
        calculate.addElement("0")
        calculate.addElement("*")
        calculate.addElement("0")

         XCTAssertEqual(calculate.calcul(), "0")
    }

    // 0 * 1-9 = 0
    func testGivenFirstNumberZero_WhenSecondNumberIsNoZero_ThenResultMultiplicationIsZero() {
        calculate.addElement("0")
        calculate.addElement("*")
        calculate.addElement("5")

         XCTAssertEqual(calculate.calcul(), "0")
    }

    // 890 * 60 = 53400
    func testGivenFirstNumberHaveTreeDecimal_WhenSecondNumberHaveTwoDecimal_ThenResultIsEgalToMultiplicationOfTwoNumber() {
        calculate.addElement("890")
        calculate.addElement("*")
        calculate.addElement("60")

         XCTAssertEqual(calculate.calcul(), "53400")
    }

    // MARK: DIVISION
    // 0 / 0 = Error
    func  testGivenFirstNumberZero_WhenSecondNumberIsZero_ThenResultDivisionIsError() {
        calculate.addElement("0")
        calculate.addElement("/")
        calculate.addElement("0")

         XCTAssertEqual(calculate.calcul(), "ERROR")
    }

    // 0 / 1-9 = 0
    func testGivenFirstNumberZero_WhenSecondNumberIsNoZero_ThenResultDivisionIsZero() {
        calculate.addElement("0")
        calculate.addElement("/")
        calculate.addElement("3")

         XCTAssertEqual(calculate.calcul(), "0")
    }

    // 1-9 / 0 = Error
    func testGivenFirstNumberIsNoZero_WhenSecondNumberIsZero_ThenResultDivisionIsError() {
        calculate.addElement("3")
        calculate.addElement("/")
        calculate.addElement("0")

         XCTAssertEqual(calculate.calcul(), "inf")
    }

    // 890 / 60 = 830
    func testGivenFirstNumberHaveTreeDecimal_WhenSecondNumberHaveTwoDecimal_henResultIsEgalToTheDivisionOfTwoNumber() {
        calculate.addElement("890")
        calculate.addElement("/")
        calculate.addElement("60")

         XCTAssertEqual(calculate.calcul(), "14.83")
    }

    // MARK: PRIORITIES
    // 3 + 16 : 8 = 5
    func testGivenWeHaveInFirstAddition_WhenWeHaveInSecondDivision_ThenDivisionHavePrioritieAndIsCalculateFirst() {
        calculate.addElement("3")
        calculate.addElement("+")
        calculate.addElement("16")
        calculate.addElement("/")
        calculate.addElement("8")

         XCTAssertEqual(calculate.calcul(), "5")
    }

    // 2 - 4 * 5 = -13
    func testGivenWeHaveInFirstSubstraction_WhenWeHaveInSecondMultiplication_ThenMultiplicationHavePrioritieAndIsCalculateFirst() {
        calculate.addElement("2")
        calculate.addElement("-")
        calculate.addElement("4")
        calculate.addElement("*")
        calculate.addElement("5")

         XCTAssertEqual(calculate.calcul(), "-18")
    }

    // MARK: ADD ELEMENT
    func testGivenAddNewElement_WhenAddElementHaveIsFive_ThenTheLastElementIsFive() {
        calculate.addElement("5")
        XCTAssertEqual(calculate.elements.last, "5")
    }

    func testGivenCalculHaveEnoughElement_WhenAddElementHaveTreeElement_ThenExpressionHaveEnoughElementIsTrue() {
        calculate.addElement("5")
        calculate.addElement("+")
        calculate.addElement("26")

        XCTAssertTrue(calculate.expressionHaveEnoughElement)
    }

    func testGivenCalculHaveEnoughElement_WhenAddElementHaveTwoElement_ThenExpressionHaveEnoughElementIsTrue() {
        calculate.addElement("5")
        calculate.addElement("+")

        XCTAssertFalse(calculate.expressionHaveEnoughElement)
    }
    // MARK: EXPRESSION HAVE RESULT
    func testGivenExpressionHaveResult_WhenElementContainEqual_ThenEpressionHaveResultTrue() {
        calculate.addElement("=")
        XCTAssertTrue(calculate.expressionHaveResult)

    }

    // MARK: CALCUL
    func testGivenCalculHaveResult_WhenExpressionIsCorrect_ThenCaculHaveResult() {
        calculate.addElement("5")
        calculate.addElement("+")
        calculate.addElement("26")
        calculate.addElement("/")
        calculate.addElement("2")

        XCTAssertEqual(calculate.calcul(), "18")
    }

    func testGivenCalculNotHaveResult_WhenOperandIsIncorrect_ThenCaculHaveErrorResult() {
        calculate.addElement("5")
        calculate.addElement("@")
        calculate.addElement("26")
        calculate.addElement("/")
        calculate.addElement("2")

        XCTAssertEqual(calculate.calcul(), "ERROR")
    }

    // MARK: CAN ADD OPERATOR
    func testGivenAddOperator_WhenLastElementIsNotNullAndIsNotAOperator_ThenICanAddOperator() {
    calculate.addElement("5")
    calculate.addElement("+")
    calculate.addElement("2")

        XCTAssertTrue(calculate.canAddOperator)
    }

    // MARK: EXPRESSION IS CORRECT
     func testGivenexpressionIsCorrect_WhenLastElementIsNotNullAndIsNotAOperator_ThenExpressionIsCorrect() {
     calculate.addElement("5")
     calculate.addElement("+")
     calculate.addElement("2")

         XCTAssertTrue(calculate.expressionIsCorrect)
     }

    func testGivenLeftIsCorrect_WhenLeftIsString_ThenLeftEqualZero() {
    calculate.addElement("test")
    calculate.addElement("+")
    calculate.addElement("0")

    XCTAssertEqual(calculate.calcul(), "0")
    }
    
    func testGivenRightIsCorrect_WhenRightIsString_ThenRightEqualZero() {
    calculate.addElement("0")
    calculate.addElement("+")
    calculate.addElement("test")

    XCTAssertEqual(calculate.calcul(), "0")
    }

}
