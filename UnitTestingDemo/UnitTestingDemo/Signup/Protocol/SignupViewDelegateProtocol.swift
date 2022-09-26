//
//  SignupViewDelegateProtocol.swift
//  UnitTestingDemo
//
//  Created by M1092828 on 24/09/22.
//

import Foundation

protocol SignupViewDelegateProtocol{
    func signupSuccess()
    func signupFailed(error:SignupError)
}
