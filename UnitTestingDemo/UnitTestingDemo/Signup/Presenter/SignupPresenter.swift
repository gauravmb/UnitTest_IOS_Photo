//
//  SignupPresenter.swift
//  UnitTestingDemo
//
//  Created by M1092828 on 24/09/22.
//

import Foundation

class SignupPresenter:SignupPresenterDelegateProtocol
{
    private var formModelValidator:SignupFormModelValidatorProtocol
    private var signupWebService:SignupWebServiceProtocol
    private var signupViewDelegate:SignupViewDelegateProtocol
    
    required init(formModelValidator:SignupFormModelValidatorProtocol,signupWebService:SignupWebServiceProtocol,signupViewDelegate:SignupViewDelegateProtocol){
        self.formModelValidator = formModelValidator
        self.signupWebService = signupWebService
        self.signupViewDelegate = signupViewDelegate
    }
    func processUserSignup(fromModel model:SignupFormModel){
        if (!formModelValidator.isFirstNameValid(firstName: model.firstName))
        {
            return
        }
        let signupRequestModel = SignupRequestModel(firstName: model.firstName, lastName: model.lastName, email: model.email, password: model.password)
        signupWebService.signup(withForm:signupRequestModel) {signupResponseModel, error in
            self.signupViewDelegate.signupSuccess()
        }
    }
}
