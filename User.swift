//
//  User.swift
//
//  Created by Rogerio de Oliveira on 5/23/18.
//

import Foundation
import ObjectMapper

struct User:Mappable {
    var documentType:String = ""
    var document:String = ""
    var password:String = ""
    var country:String = ""
    var name:String = ""
    var email:String = ""
    var phone:String = ""
    var secondaryEmail:String = ""
    var secondaryPhone:String = ""
    var stateRegistry:String = ""
    var cityRegistry:String = ""

    var companyData:CompanyData = CompanyData()
    var address:Address = Address()
    var equipment:[Equipment] = []
    var transaction:[Transaction] = []
    

    init?(map: Map) {
    }

    mutating func mapping(map: Map) {
        self.documentType <- map["documentType"]
        self.document <- map["document"]
        self.password <- map["password"]
        self.country <- map["country"]
        self.name <- map["name"]
        self.email <- map["email"]
        self.phone <- map["phone"]
        self.secondaryEmail <- map["secondaryEmail"]
        self.secondaryPhone <- map["secondaryPhone"]
        self.stateRegistry <- map["stateRegistry"]
        self.cityRegistry <- map["cityRegistry"]
        self.companyData <- map["companyData"]
        self.address <- map["address"]
        self.equipment <- map["equipments"]
        self.transaction <- map["transactions"]
    }
}
