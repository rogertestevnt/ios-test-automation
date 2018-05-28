//
//  testUtils.swift
//  XCodeUITests
//
//  Created by Rogerio de Oliveira on 12/21/17.
//

import XCTest

extension XCTestCase {

    //Waits for an element to be displayed on View    
    func waitUntilAppears(element:XCUIElement, timeout:Int) {
        
        let predicate = NSPredicate(format: "exists == 1")
        
        expectation(for: predicate, evaluatedWith: element, handler: nil)
        
        waitForExpectations(timeout: TimeInterval(timeout), handler: nil)
    }
    
    //Searches for a text on a View by scrolling it
    func isTextFoundOnView(textToSearch:String) ->Bool{
        
        let app = XCUIApplication()
        var numbersOfScrolls = 0
        var isTextFound = false
        
        while (numbersOfScrolls < 15){
            if (app.staticTexts[textToSearch].exists){
                isTextFound = true
                break
            }
            app.swipeUp()
            numbersOfScrolls += 1
        }
        return isTextFound
    }

    //Add a suffix to a email address to use it more than once. e.g. "email+1@gmail.com"
    func addSuffixToEmailAddress(email:String)->String {
        var pos = 0
        let needle: Character = "@"
        if let idx = email.index(of: needle) {
            pos = email.distance(from: email.startIndex, to: idx)
        }
        else {
            return("@ Not found")
        }

        let end = email.index(email.startIndex, offsetBy: pos)
        var range = email.startIndex..<end
        let emailFirstBlock = String(email[range])

        let start = email.index(email.startIndex, offsetBy: pos)
        range = start..<email.endIndex

        let emailSecondBlock = String(email[range])

        let suffix = String(Int32.mathRandom())

        let emailWithSuffix = emailFirstBlock + "+" + suffix + emailSecondBlock
        return emailWithSuffix
    }

    func provideValidCPF() -> String {

        var cpf = [0,0,0,0,0,0,0,0,0,0,0]
        var aux1 = 0
        var aux2 = 0

        for i in 0...8 {
            cpf[i] = (Int)(arc4random_uniform(9))
            aux1 += cpf[i] * (10 - i)
            aux2 += cpf[i] * (11 - i)
        }

        aux1 %= 11
        cpf[9] = aux1 < 2 ? 0 : 11-aux1

        aux2 += cpf[9] * 2
        aux2 %= 11
        cpf[10] = aux2 < 2 ? 0 : 11-aux2

        return "\(cpf[0])\(cpf[1])\(cpf[2])\(cpf[3])\(cpf[4])\(cpf[5])\(cpf[6])\(cpf[7])\(cpf[8])\(cpf[9])\(cpf[10])"

    }

    func provideValidCNPJ() -> String {

        var cnpj: [Int] = [0,0,0,0,0,0,0,0,0,0,0,0,0,0]
        var dig1 = 0
        var dig2 = 0

        for i in 0...7 {
            cnpj[i] = (Int)(arc4random_uniform(9))
        }
        cnpj[8] = 0
        cnpj[9] = 0
        cnpj[10] = 0
        cnpj[11] = 1

        dig1 = cnpj[11] * 2 + cnpj[10] * 3 + cnpj[9] * 4 + cnpj[8] * 5 + cnpj[7] * 6 + cnpj[6] * 7 + cnpj[5] * 8 + cnpj[4] * 9 + cnpj[3] * 2 + cnpj[2] * 3 + cnpj[1] *  4 + cnpj[0] * 5
        dig1 = 11 - (dig1 % 11)

        dig2 = dig1 * 2 + cnpj[11] * 3 + cnpj[10] * 4 + cnpj[9] * 5 + cnpj[8] * 6 + cnpj[7] * 7 + cnpj[6] * 8 + cnpj[5] * 9 + cnpj[4] * 2 + cnpj[3] * 3 + cnpj[2] * 4 + cnpj[1] * 5 + cnpj[0] * 6
        dig2 = 11 - (dig2 % 11)

        if (dig1 >= 10){
            dig1 = 0
        }
        if (dig2 >= 10) {
            dig2 = 0
        }
        cnpj[12] = dig1
        cnpj[13] = dig2

        return "\(cnpj[0])\(cnpj[1])\(cnpj[2])\(cnpj[3])\(cnpj[4])\(cnpj[5])\(cnpj[6])\(cnpj[7])\(cnpj[8])\(cnpj[9])\(cnpj[10])\(cnpj[11])\(cnpj[12])\(cnpj[13])"
    }
}

public extension ExpressibleByIntegerLiteral {

    public static func mathRandom() -> Self {
        var r: Self = 0
        arc4random_buf(&r, MemoryLayout<Self>.size)
        return r
    }
}
