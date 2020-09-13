//
//  ViewController.swift
//  SimpleCalc
//
//  Created by Vincent Saluzzo on 29/03/2019.
//  Copyright © 2019 Vincent Saluzzo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var textView: UITextView!
    @IBOutlet var numberButtons: [UIButton]!

    var calculator = Calculator()

    let alertVC = UIAlertController(title: "Erreur", message: "Veuillez indiquer un nombre", preferredStyle: .alert)

    override func viewDidLoad() {
        super.viewDidLoad()
        alertVC.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))

        textView.text = ""
        calculator.elements.removeAll()
    }

    // View actions
    @IBAction func tappedNumberButton(_ sender: UIButton) {
        guard let numberText = sender.title(for: .normal) else {
            return
        }

        if calculator.expressionHaveResult {
            textView.text = ""
            calculator.elements.removeAll()
        }

        textView.text.append(numberText)

        if calculator.canAddOperator {
            guard let lastElement = calculator.elements.last else { return }

            let lastIndex = calculator.elements.count - 1
            calculator.elements[lastIndex] = lastElement + numberText
        } else {
            calculator.addElement(numberText)
        }
    }

    @IBAction func tappedACButton(_ sender: Any) {
        textView.text = ""
        calculator.elements.removeAll()
    }
    @IBAction func tappedAdditionButton(_ sender: UIButton) {
        if calculator.canAddOperator {
            textView.text.append("+")
            calculator.addElement("+")
        } else {
            self.present(alertVC, animated: true, completion: nil)
        }
    }

    @IBAction func tappedSubstractionButton(_ sender: UIButton) {
        if calculator.canAddOperator {
            textView.text.append("-")
            calculator.addElement("-")
        } else {
            self.present(alertVC, animated: true, completion: nil)
        }
    }

    @IBAction func tappedMultiplicationButton(_ sender: UIButton) {
        if calculator.canAddOperator {
            textView.text.append("*")
            calculator.addElement("*")
        } else {
            self.present(alertVC, animated: true, completion: nil)
        }
    }

    @IBAction func tappedDivisionButton(_ sender: UIButton) {
        if calculator.canAddOperator {
            textView.text.append("/")
            calculator.addElement("/")
        } else {
            self.present(alertVC, animated: true, completion: nil)
        }
    }

    @IBAction func tappedEqualButton(_ sender: UIButton) {
        guard calculator.expressionIsCorrect else {
            let alertVC = UIAlertController(title: "Erreur", message: "Entrez une expression correcte !", preferredStyle: .alert)
            alertVC.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            return self.present(alertVC, animated: true, completion: nil)
        }

        guard calculator.expressionHaveEnoughElement else {
            let alertVC = UIAlertController(title: "Erreur", message: "Démarrez un nouveau calcul !", preferredStyle: .alert)
            alertVC.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            return self.present(alertVC, animated: true, completion: nil)
        }

        let result = calculator.calcul()

        if calculator.canAddOperator {
            textView.text.append("=")
            calculator.addElement("=")
        }
        textView.text.append(result)
        calculator.addElement(result)
    }

}
