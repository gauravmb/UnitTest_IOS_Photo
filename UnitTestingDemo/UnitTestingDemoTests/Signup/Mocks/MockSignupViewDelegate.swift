//
//  MockSignupViewDelegate.swift
//  UnitTestingDemoTests
//
//  Created by M1092828 on 24/09/22.
//

import Foundation
import XCTest
@testable import UnitTestingDemo

class MockSignupViewDelegate:SignupViewDelegateProtocol{
    var expectation:XCTestExpectation?
    func signupSuccess() {
        expectation?.fulfill()
    }
    func signupFailed(error: SignupError) {
    }
}
