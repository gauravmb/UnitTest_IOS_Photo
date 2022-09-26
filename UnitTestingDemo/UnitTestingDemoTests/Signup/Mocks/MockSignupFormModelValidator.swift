//
//  MockSignupFormModelValidator.swift
//  UnitTestingDemoTests
//
//  Created by M1092828 on 24/09/22.
//

import Foundation
@testable import UnitTestingDemo
class MockSignupFormModelValidator:SignupFormModelValidatorProtocol
{
    
    var isFirstNamevalidated = false
    
    func isFirstNameValid(firstName: String) -> Bool {
        isFirstNamevalidated = true
        return isFirstNamevalidated
    }
    
    func isPasswordEqual(password: String, confirmPassword: String) -> Bool {
        return true
    }
    
}
