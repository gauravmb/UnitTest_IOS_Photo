//
//  SignupFormModelValidator.swift
//  UnitTestingDemo
//
//  Created by M1092828 on 23/09/22.
//

import Foundation

class SignupFormModelValidator:SignupFormModelValidatorProtocol{
    
    func isFirstNameValid(firstName:String)->Bool{
        var returnValue = true
        if(firstName.isEmpty || firstName.count<SignupConstants.firstNameMinLength || firstName.count>SignupConstants.firstNameMaxLength)
        {
            returnValue = false
        }
        return returnValue;
    }
    
    func isPasswordEqual(password:String,confirmPassword:String)->Bool
    {
        if (password == confirmPassword)
        {
            return true
        }
        
        return false
    }
}
