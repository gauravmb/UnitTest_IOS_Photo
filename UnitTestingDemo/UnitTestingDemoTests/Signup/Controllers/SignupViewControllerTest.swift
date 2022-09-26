//
//  SignupViewControllerTest.swift
//  UnitTestingDemoTests
//
//  Created by M1092828 on 24/09/22.
//

import XCTest
@testable import UnitTestingDemo

class SignupViewControllerTest: XCTestCase {

    var storyboard:UIStoryboard!
    var sut:SignupViewController!
    
    override func setUpWithError() throws {
        
        storyboard = UIStoryboard(name: "Main", bundle: nil)
        sut = storyboard.instantiateViewController(identifier: "SignupViewController") as! SignupViewController;
        sut.loadViewIfNeeded()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testSignupViewController_WhenCreated_HasRequiredTextFieldEmpty()throws{

        
        let firstNameTextField = try XCTUnwrap(sut.firstNameTextField)
        
        XCTAssertEqual(firstNameTextField.text, "")
        XCTAssertEqual(sut.lastNameTextField.text, "")
        XCTAssertEqual(sut.emailTextField.text, "")
        XCTAssertEqual(sut.passwordTextField.text, "")
        XCTAssertEqual(sut.repeatPasswordTextField.text, "")
    }
    
    func testSignupViewController_WhenUserTapSignupButton_HasAction() throws{
        let signupButton = try XCTUnwrap(sut.signupButton)
        let actions = signupButton.actions(forTarget: sut, forControlEvent: .touchUpInside)
        XCTAssertEqual(actions?.count, 1)
    }
    
    func testSignupViewController_WhenSignupButtonIsTapped_SignUpProcessIsInitialed() throws
    {
        let mockValidator = MockSignupFormModelValidator()
        let mocksignupwebservice = MockSignupWebService()
        let mocksignupdelegate = MockSignupViewDelegate()
        let mockSignupPresenter:MockSignupPresenter = MockSignupPresenter(formModelValidator: mockValidator, signupWebService: mocksignupwebservice, signupViewDelegate: mocksignupdelegate)
        let signupButton = try XCTUnwrap(sut.signupButton)
        sut.signupPresenter = mockSignupPresenter
        signupButton.sendActions(for: .touchUpInside)
        XCTAssertTrue(mockSignupPresenter.processUserSignupProcessCalled)

    }
}
