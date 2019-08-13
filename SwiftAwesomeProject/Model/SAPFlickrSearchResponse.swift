//
//  SAPFlickrSearchResponse.swift
//  SwiftAwesomeProject
//
//  Created by An Binh on 8/13/19.
//  Copyright © 2019 An Binh. All rights reserved.
//

import UIKit
import DDMvvm
import ObjectMapper

enum SAPFlickrStatus: String {
    case ok = "ok", fail = "fail"
}

class SAPFlickrSearchResponse: Model {
    var stat: SAPFlickrStatus = .ok
    var page = 1
    var pages = 1
    var photos = [SAPFlickrPhotoModel]()
    var message = ""
    
    convenience init() {
        self.init(JSON: [String: Any]())!
    }
    
    override func mapping(map: Map) {
        stat <- (map["stat"], SAPFlickrSearchTransformType())
        page <- map["photos.page"]
        pages <- map["photos.pages"]
        photos <- map["photos.photo"]
        message <- map["message"]
    }
}
