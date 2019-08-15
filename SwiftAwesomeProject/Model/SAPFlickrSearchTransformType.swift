//
//  SAPFlickrSearchTransformType.swift
//  SwiftAwesomeProject
//
//  Created by An Binh on 8/13/19.
//  Copyright © 2019 An Binh. All rights reserved.
//

import UIKit
import ObjectMapper

class SAPFlickrSearchTransformType: TransformType {
    typealias Object = SAPFlickrStatus
    typealias JSON = String
    
    func transformFromJSON(_ value: Any?) -> Object? {
        if let type = value as? String {
            return SAPFlickrStatus(rawValue: type)
        }
        return nil
    }
    
    func transformToJSON(_ value: Object?) -> String? {
        return value?.rawValue
    }
}
