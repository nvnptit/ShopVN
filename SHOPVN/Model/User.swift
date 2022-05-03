//
//  User.swift
//  SHOPVN
//
//  Created by Nhat on 03/05/2022.
//

import Foundation

struct User: Decodable {
    var role: String?
    var _id: String?
    var email: String?
    var password: String?
//    var cart: [Cart]?
//    var discounts: [Discount]?
}

struct Discount: Decodable {
    
}
