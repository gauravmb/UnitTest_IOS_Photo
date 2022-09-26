//
//  MockSignupPresenter.swift
//  UnitTestingDemoTests
//
//  Created by M1092828 on 24/09/22.
//

import Foundation
@testable import UnitTestingDemo

class MockSignupPresenter:SignupPresenterDelegateProtocol{
    
    var processUserSignupProcessCalled:Bool = false
    
    required init(formModelValidator: SignupFormModelValidatorProtocol, signupWebService: SignupWebServiceProtocol, signupViewDelegate: SignupViewDelegateProtocol) {
        
    }
    
    func processUserSignup(fromModel model: SignupFormModel) {
        processUserSignupProcessCalled = true;
    }
}

