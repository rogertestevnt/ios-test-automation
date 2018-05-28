//
//  JsonModel.swift
//
//  Created by Rogerio de Oliveira on 5/23/18.
//  Copyright © 2018 Venturus. All rights reserved.
//

import Foundation
import ObjectMapper

struct JsonModel:Mappable {
    var data:[User] = []

    init?(map: Map) {
    }

    mutating func mapping(map: Map) {
        self.data <- map["data"]
    }
}
