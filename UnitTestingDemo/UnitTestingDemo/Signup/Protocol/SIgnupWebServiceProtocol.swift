//
//  SIgnupWebServiceProtocol.swift
//  UnitTestingDemo
//
//  Created by M1092828 on 24/09/22.
//

import Foundation

protocol SignupWebServiceProtocol{
    func signup(withForm formModel:SignupRequestModel, completionHandler:@escaping (SignupResponseModel?,SignupError?)->Void);
}
