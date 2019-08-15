//
//  SAPFlickrPhotoModel.swift
//  SwiftAwesomeProject
//
//  Created by An Binh on 8/13/19.
//  Copyright © 2019 An Binh. All rights reserved.
//

import UIKit
import DDMvvm
import ObjectMapper

class SAPFlickrPhotoModel: Model {
    var imageUrl: URL {
        let url = "https://farm\(farm).staticflickr.com/\(server)/\(id)_\(secret)_q.jpg"
        return URL(string: url)!
    }
    
    var id = ""
    var owner = ""
    var secret = ""
    var server = ""
    var farm = 0
    var title = ""
    
    override func mapping(map: Map) {
        id <- map["id"]
        owner <- map["owner"]
        secret <- map["secret"]
        server <- map["server"]
        farm <- map["farm"]
        title <- map["title"]
    }
}
