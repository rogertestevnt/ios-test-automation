//
//  Transaction.swift
//
//  Created by Rogerio de Oliveira on 5/23/18.
//

import Foundation
import ObjectMapper

struct Transaction:Mappable {
    var type:String = ""
    var series:String = ""
    var product:String = ""
    var date:String = ""
    var expiration:String = ""
    var equipmentSerialNumber:String = ""
    var serialNumber:String = ""


    init?(map: Map) {
    }
    
    init() {}

    mutating func mapping(map: Map) {
        self.type <- map["type"]
        self.date <- map["date"]
        self.product <- map["product"]
        self.series <- map["series"]
        self.expiration <- map["expiration"]
        self.equipmentSerialNumber <- map["equipmentSerialNumber"]
        self.serialNumber <- map["serialNumber"]
    }
}
