//
//  APIService.swift
//  SHOPVN
//
//  Created by Nhat on 03/05/2022.
//

import Foundation

struct APIService {
   public static func login(with email: String, and password: String, _ completion: @escaping(String?, Account?) -> ()) {
        let params: [String: Any ] = ["email": email, "password": password]
        APIController.request(Account.self, APIManager.login, params: params) { error, data in
            if let data = data {
                completion(nil,data)
                return
            }
            completion(error,nil)
            return
        }
    }
}
