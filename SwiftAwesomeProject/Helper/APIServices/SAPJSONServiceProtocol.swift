//
//  SAPJSONServiceProtocol.swift
//  SwiftAwesomeProject
//
//  Created by An Binh on 8/13/19.
//  Copyright © 2019 An Binh. All rights reserved.
//

import Foundation
import ObjectMapper
import Alamofire
import RxSwift

protocol SAPJSONServiceProtocol {
    func request<T:Mappable>(_ path: String,
                             method: HTTPMethod,
                             params: [String: Any]?,
                             parameterEncoding encoding: ParameterEncoding,
                             additionalHeaders: HTTPHeaders?) -> Single<T>
    
    func request<T:Mappable>(_ path: String,
                             method: HTTPMethod,
                             params: [String: Any]?,
                             parameterEncoding encoding: ParameterEncoding,
                             additionalHeaders: HTTPHeaders?) -> Single<[T]>
}

extension SAPJSONServiceProtocol {
    func request<T: Mappable>(_ path: String,
                              method: HTTPMethod,
                              params: [String: Any]? = nil,
                              parameterEncoding encoding: ParameterEncoding = URLEncoding.default,
                              additionalHeaders: HTTPHeaders? = nil) -> Single<T> {
        return request(path, method: method, params: params, parameterEncoding: encoding, additionalHeaders: additionalHeaders)
    }
    
    func request<T: Mappable>(_ path: String,
                              method: HTTPMethod,
                              params: [String: Any]? = nil,
                              parameterEncoding encoding: ParameterEncoding = URLEncoding.default,
                              additionalHeaders: HTTPHeaders? = nil) -> Single<[T]> {
        return request(path, method: method, params: params, parameterEncoding: encoding, additionalHeaders: additionalHeaders)
    }
}

extension SAPJSONServiceProtocol {
    func get<T: Mappable>(_ path: String,
                          params: [String: Any]? = nil,
                          parameterEncoding encoding: ParameterEncoding = URLEncoding.default,
                          additionalHeaders: HTTPHeaders? = nil) -> Single<T> {
        return request(path, method: .get, params: params, additionalHeaders: additionalHeaders)
    }
    
    func get<T: Mappable>(_ path: String,
                          params: [String: Any]? = nil,
                          parameterEncoding encoding: ParameterEncoding = URLEncoding.default,
                          additionalHeaders: HTTPHeaders? = nil) -> Single<[T]> {
        return request(path, method: .get, params: params, additionalHeaders: additionalHeaders)
    }
    
    func post<T: Mappable>(_ path: String,
                           params: [String: Any]? = nil,
                           parameterEncoding encoding: ParameterEncoding = URLEncoding.default,
                           additionalHeaders: HTTPHeaders? = nil) -> Single<T> {
        return request(path, method: .post, params: params, additionalHeaders: additionalHeaders)
    }
    
    func post<T: Mappable>(_ path: String,
                           params: [String: Any]? = nil,
                           parameterEncoding encoding: ParameterEncoding = URLEncoding.default,
                           additionalHeaders: HTTPHeaders? = nil) -> Single<[T]> {
        return request(path, method: .post, params: params, additionalHeaders: additionalHeaders)
    }
}
