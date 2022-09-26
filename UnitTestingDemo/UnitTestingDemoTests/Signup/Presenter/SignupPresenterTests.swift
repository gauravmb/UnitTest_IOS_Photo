//
//  SignupPresenterTests.swift
//  UnitTestingDemoTests
//
//  Created by M1092828 on 24/09/22.
//

import XCTest
@testable import UnitTestingDemo

class SignupPresenterTests: XCTestCase {
    var signupFormModel:SignupFormModel!
    var mockSignupFormModelValidator:MockSignupFormModelValidator!
    var mockSignupWebService:MockSignupWebService!
    var signupPresenter:SignupPresenter!
    var mockSignupViewDelegate = MockSignupViewDelegate()
    
    override func setUpWithError() throws {
        signupFormModel = SignupFormModel(firstName:"Gaurav",lastName:"Bhatia",email:"gaurav@gmail.com",password:"ok",repeatPassword:"ok")
        mockSignupFormModelValidator = MockSignupFormModelValidator()
        mockSignupWebService = MockSignupWebService()
        signupPresenter = SignupPresenter(formModelValidator: mockSignupFormModelValidator,signupWebService: mockSignupWebService,signupViewDelegate: mockSignupViewDelegate)
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        signupFormModel = nil
        mockSignupFormModelValidator = nil
        mockSignupWebService = nil
        signupPresenter = nil
        
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testSignupPresenter_WhenInformationIsProvided_WillValidateEachProperty(){
        //Arrange
        //Act
        //Assert
        signupPresenter.processUserSignup(fromModel:signupFormModel)
        XCTAssertTrue(mockSignupFormModelValidator.isFirstNamevalidated)
    }
    
    func testSignupPresenter_WhenServiceIsCalled_ShouldReceiveResponse(){
        signupPresenter.processUserSignup(fromModel:signupFormModel)
        XCTAssertTrue(mockSignupWebService.isSignupMethodCalled)
    }
    
    func testSignupPresenter_WhenSignupOperationIsSuccessfull_CallSuccessOnViewDelegate(){
        mockSignupViewDelegate.expectation = expectation(description: "CallSuccessOnViewDelegate")
        signupPresenter.processUserSignup(fromModel:signupFormModel)
        self.wait(for: [mockSignupViewDelegate.expectation!], timeout: 5)
    }

}
