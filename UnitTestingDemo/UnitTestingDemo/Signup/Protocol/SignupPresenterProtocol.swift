//
//  SignupPresenterProtocol.swift
//  UnitTestingDemo
//
//  Created by M1092828 on 24/09/22.
//

import Foundation

protocol SignupPresenterDelegateProtocol{
    init(formModelValidator:SignupFormModelValidatorProtocol,signupWebService:SignupWebServiceProtocol,signupViewDelegate:SignupViewDelegateProtocol)
    func processUserSignup(fromModel model:SignupFormModel)
}
