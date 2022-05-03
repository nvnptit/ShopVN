//
//  APIManager.swift
//  SHOPVN
//
//  Created by Nhat on 03/05/2022.
//

import Foundation
import Alamofire

enum APIManager {
    case login
    case register
}

extension APIManager {
    var baseURL: String { return "https://deskita-ecommerce.herokuapp.com/api/v1"}

    var url: String {
        var path = ""
        switch self {
        case .login: path = "/user/login"
        case .register: path = "/user/create"
        }
        return baseURL + path
    }
    
    var method: HTTPMethod {
        switch self {
        case .login, .register:
            return .post
        }
    }

    
    var encoding: ParameterEncoding {
        switch self.method {
        case .get:
            return URLEncoding.default
        default:
            return JSONEncoding.default
        }
    }
    
    var header: HTTPHeader? {
        switch self {
        default:
            return nil
        }
    }
    
}

struct Header {
    static let authorization            = "Authorization"
    static let contentType              = "Content-Type"
    static let contentTypeValue         = "application/json"
}
