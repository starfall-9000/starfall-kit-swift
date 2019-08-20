//
//  SAPLottieModel.swift
//  SwiftAwesomeProject
//
//  Created by An Binh on 8/19/19.
//  Copyright © 2019 An Binh. All rights reserved.
//

import UIKit
import DDMvvm
import ObjectMapper

class SAPLottieModel: Model {
    var title = ""
    var desc = ""
    var animation = ""
    
    convenience init(title: String, desc: String = "", animation: String = "") {
        self.init(JSON: ["title": title, "desc": desc, "animation": animation])!
    }
    
    override func mapping(map: Map) {
        title <- map["title"]
        desc <- map["desc"]
        animation <- map["animation"]
    }
}
