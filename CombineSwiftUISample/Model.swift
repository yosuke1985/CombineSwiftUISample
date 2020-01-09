//
//  Model.swift
//  CombineSwiftUISample
//
//  Created by 中山 陽介 on 2020/01/09.
//  Copyright © 2020 Yosuke Nakayama. All rights reserved.
//

import Foundation
 
struct APIError: Error {
    var description: String
}
 
struct Employee: Codable {
    var arguments: Args
 
    enum CodingKeys: String, CodingKey {
        case arguments = "args"
    }
 
    struct Args: Codable {
        var name: String
    }
}
