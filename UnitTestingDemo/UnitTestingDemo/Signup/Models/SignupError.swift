//
//  SignupError.swift
//  UnitTestingDemo
//
//  Created by M1092828 on 23/09/22.
//

import Foundation

enum SignupError:LocalizedError,Equatable{
    case responseModelParsingError;
    case requestInvalidURLString
    case failedRequest(description:String)
    
    var errorDescription:String?{
        switch self{
        case .failedRequest(let description):
            return description
        case .requestInvalidURLString,.responseModelParsingError:
            return ""
        }
    }
}
