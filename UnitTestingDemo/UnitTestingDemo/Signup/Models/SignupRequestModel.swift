//
//  SignupRequestModel.swift
//  UnitTestingDemo
//
//  Created by M1092828 on 23/09/22.
//

import Foundation

struct SignupRequestModel:Encodable{
    let firstName:String;
    let lastName:String;
    let email:String;
    let password:String;
    
    enum CodingKeys: String, CodingKey {
        case firstName = "name"
        case lastName = "type"
        case email = "email"
        case password = "size"
    }
}
