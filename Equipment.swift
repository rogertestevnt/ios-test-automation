//
//  Equipment.swift
//
//  Created by Rogerio de Oliveira on 5/23/18.
//

import Foundation
import ObjectMapper

struct Equipment:Mappable {
    var type:String = ""
    var serialNumber:String = ""
    var purchaseDate:String = ""

    init?(map: Map) {
    }

    init() {}

    mutating func mapping(map: Map) {
        self.type <- map["type"]
        self.purchaseDate <- map["purchaseDate"]
        self.serialNumber <- map["serialNumber"]
    }
}
