//
//  Adress.swift
//
//  Created by Rogerio de Oliveira on 5/23/18.
//

import Foundation
import ObjectMapper

struct Address:Mappable {
    var state:String = ""
    var city:String = ""
    var district:String = ""
    var address:String = ""
    var number:String = ""
    var complement:String = ""
    var zip:String = ""

    init?(map: Map) {
    }

    init() {}

    mutating func mapping(map: Map) {
        self.state <- map["state"]
        self.city <- map["city"]
        self.district <- map["district"]
        self.address <- map["address"]
        self.number <- map["number"]
        self.complement <- map["complement"]
        self.zip <- map["zip"]
    }
}
