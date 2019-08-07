//
//  SAPHomeModel.swift
//  SwiftAwesomeProject
//
//  Created by An Binh on 8/6/19.
//  Copyright © 2019 An Binh. All rights reserved.
//

import UIKit
import DDMvvm
import ObjectMapper

class SAPHomeModel: Model {
    var title = ""
    var desc = ""
    
    convenience init(withTitle title: String, desc: String) {
        self.init(JSON: ["title": title, "desc": desc])!
    }
    
    override func mapping(map: Map) {
        title <- map["title"]
        desc <- map["desc"]
    }
}
