//
//  File.swift
//  SHOPVN
//
//  Created by Nhat on 03/05/2022.
//

import Foundation

struct Account: Decodable {
    var success: Bool?
    var token: String?
    var user: User?
}
