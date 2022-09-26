//
//  SignupReponseModel.swift
//  UnitTestingDemo
//
//  Created by M1092828 on 23/09/22.
//

import Foundation

struct SignupResponseModel:Decodable{
    let status:String;
    enum CodingKeys: String, CodingKey {
        case status
    }
    
}
