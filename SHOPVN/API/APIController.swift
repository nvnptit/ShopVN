//
//  APIController.swift
//  SHOPVN
//
//  Created by Nhat on 03/05/2022.
//

import Foundation
import Alamofire

typealias ResponseClosure<T: Decodable> = (_ error: String?, _ data: T?) -> Void

struct APIController {
    static func request<T: Decodable>(_ responseType: T.Type,_ manager: APIManager, params: Parameters? = nil, completion: @escaping ResponseClosure<T>) {
        
        print("URL REQUEST: \(manager.url)")
        
        AF.request(manager.url, method: manager.method, parameters: params).responseData { reponseData in
            switch reponseData.result {
                
            case .success(let data):
                let jsonDecoder = JSONDecoder()
                do {
                    let result = try jsonDecoder.decode(responseType, from: data)
                    completion(nil, result)
                    print(result)
                } catch(let error) {
                    completion(error.localizedDescription,nil)
                }
                return
                
            case .failure(let error):
                completion(error.localizedDescription, nil)
                return
            }
        }
    }
}
