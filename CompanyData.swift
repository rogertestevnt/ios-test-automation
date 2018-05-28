//
//  CompanyData.swift
//
//  Created by Rogerio de Oliveira on 5/23/18.
//

import Foundation
import ObjectMapper

struct CompanyData:Mappable {
    var contactName:String = ""
    var contactPhone:String = ""
    var contactEmail:String = ""

    init?(map: Map) {
    }

    init() {
    }

    mutating func mapping(map: Map) {
        self.contactName <- map["contactName"]
        self.contactPhone <- map["contactPhone"]
        self.contactEmail <- map["contactEmail"]
    }
}
