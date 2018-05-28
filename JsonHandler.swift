//
//  JsonHandler.swift
//
//  Created by Rogerio de Oliveira on 5/23/18.
//

import Foundation
import ObjectMapper
import XCTest

extension XCTestCase {
    func getFullObject(fileName:String)->[User]{
        let jsonString = openJsonFile(fileName)

        if let jsonContent = Mapper<JsonModel>().map(JSONString: jsonString) {
            return jsonContent.data
        }
        return []
    }

    func openJsonFile(fileName:String) -> String{
        let bundle = Bundle(for: type(of: self))
        guard let path = bundle.path(forResource: fileName, ofType: "json") else { return "" }
        guard let json = NSData(contentsOfFile: path) else { return "" }
        let jsonData = Data(referencing: json)
        let jsonString = String(data: jsonData, encoding: String.Encoding(rawValue: String.Encoding.utf8.rawValue))

        if let jsonReturn = jsonString{
            return jsonReturn
        }
        return ""
    }

    func getEquipmentObject(email:String)->[Equipment] {
        let users = getFullObject()
        let user = users.first { (user) -> Bool in
            return user.email==email
        }

        if let equipments = user.map({ (user) -> [Equipment] in
            return user.equipment
        })
        {
            return equipments
        }
        return []
    }

    func getTransactionObject(email:String)->[Transaction]{
        let users = getFullObject()
        let user = users.first { (user) -> Bool in
            return user.email==email
        }

        if let transactions = user.map({ (user) -> [Transaction] in
            return user.transaction
        })
        {
            return transactions
        }
        return []
    }

    func getAddressObject(email:String)->[Address]{
        let users = getFullObject()
        let user = users.first { (user) -> Bool in
            return user.email==email
        }

        if let address = user.map({ (user) -> [Address] in
            return [user.address]
        })
        {
            return address
        }
        return []
    }

    func getCompanyData(email:String)->[CompanyData]{
        let users = getFullObject()
        let user = users.first { (user) -> Bool in
            return user.email==email
        }

        if let companyData = user.map({ (user) -> [CompanyData] in
            return [user.companyData]
        })
        {
            return companyData
        }
        return []
    }
}
