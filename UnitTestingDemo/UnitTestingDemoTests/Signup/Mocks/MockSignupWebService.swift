//
//  MockSignupWebService.swift
//  UnitTestingDemoTests
//
//  Created by M1092828 on 24/09/22.
//

import Foundation
@testable import UnitTestingDemo
class MockSignupWebService:SignupWebServiceProtocol{
    
    var isSignupMethodCalled:Bool = false
    
    func signup(withForm formModel: SignupRequestModel, completionHandler: @escaping (SignupResponseModel?, SignupError?) -> Void) {
        isSignupMethodCalled = true;
        completionHandler(nil,nil);
    }
    
}
