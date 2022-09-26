//
//  SignupFormModelValidatorProtocol.swift
//  UnitTestingDemo
//
//  Created by M1092828 on 24/09/22.
//

import Foundation

protocol SignupFormModelValidatorProtocol{
    func isFirstNameValid(firstName:String)->Bool
    func isPasswordEqual(password:String,confirmPassword:String)->Bool
}
