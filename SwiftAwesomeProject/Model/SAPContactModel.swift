//
//  SAPContactModel.swift
//  SwiftAwesomeProject
//
//  Created by An Binh on 8/8/19.
//  Copyright © 2019 An Binh. All rights reserved.
//

import UIKit
import DDMvvm
import ObjectMapper

class SAPContactModel: Model {
    var name = ""
    var phone = ""
    
    convenience init() {
        self.init(JSON: [String: Any]())!
    }
    
    override func mapping(map: Map) {
        name <- map["name"]
        phone <- map["phone"]
    }
}
