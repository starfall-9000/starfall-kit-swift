//
//  SAPJSONService.swift
//  SwiftAwesomeProject
//
//  Created by An Binh on 8/13/19.
//  Copyright © 2019 An Binh. All rights reserved.
//

import UIKit
import DDMvvm
import ObjectMapper
import Alamofire
import RxSwift

class SAPJSONService: NetworkService, SAPJSONServiceProtocol {
    func request<T: Mappable>(_ path: String,
                    method: HTTPMethod,
                    params: [String : Any]? = nil,
                    parameterEncoding encoding: ParameterEncoding = URLEncoding.default,
                    additionalHeaders: HTTPHeaders? = nil) -> Single<T> {
        return callRequest(path,
                           method: method,
                           params: params,
                           parameterEncoding: encoding,
                           additionalHeaders: additionalHeaders)
            .map({ (responseString) in
                if let model = Mapper<T>().map(JSONString: responseString) {
                    return model
                }
                throw NSError(domain: "com.swift.awesome.starfall", code: 2100, userInfo: [NSLocalizedDescriptionKey: "Cannot map JSON to Model"])
            })
    }
    
    func request<T: Mappable>(_ path: String,
                              method: HTTPMethod,
                              params: [String : Any]? = nil,
                              parameterEncoding encoding: ParameterEncoding = URLEncoding.default,
                              additionalHeaders: HTTPHeaders? = nil) -> Single<[T]> {
        return callRequest(path,
                           method: method,
                           params: params,
                           parameterEncoding: encoding,
                           additionalHeaders: additionalHeaders)
            .map({ (responseString) in
                if let model = Mapper<T>().mapArray(JSONString: responseString) {
                    return model
                }
                throw NSError(domain: "com.swift.awesome.starfall", code: 2100, userInfo: [NSLocalizedDescriptionKey: "Cannot map JSON to Model"])
            })
    }
}
