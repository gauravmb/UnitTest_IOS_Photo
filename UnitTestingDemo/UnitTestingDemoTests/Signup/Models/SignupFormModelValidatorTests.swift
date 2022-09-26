//
//  SignupFormModelValidator.swift
//  UnitTestingDemoTests
//
//  Created by M1092828 on 23/09/22.
//

import XCTest
@testable import UnitTestingDemo

class SignupFormModelValidatorTests: XCTestCase {

    var sut:SignupFormModelValidator!

    override func setUpWithError() throws {
        sut = SignupFormModelValidator()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        sut = nil
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testSignupFormValidator_WhenValidFirstNameisProvided_ShouldReturnTrue(){
        //Arrange
        //Act
        let isFirstNameValid = sut.isFirstNameValid(firstName:"Gaurav")
        //Assert
        XCTAssertTrue(isFirstNameValid,"Should return true but retured false")
    }
    
    func testSignupFormValidator_WhenTooShortFirstNameProvided_ShouldReturnFalse(){
        //Arrange
        //Act
        let isFirstNameTooShort = sut.isFirstNameValid(firstName: "G")
        //
        XCTAssertFalse(isFirstNameTooShort,"First name is shorter then \(SignupConstants.firstNameMinLength) Charactor")
        
    }
    
    func testSignupFormValidator_WhenTooLongFirstNameProvided_ShouldReturnFalse(){
        //Arrange
        //Act
        let isFirstNameTooLong = sut.isFirstNameValid(firstName: "Gsasasasasasa")
        //Assert
        XCTAssertFalse(isFirstNameTooLong,"First name is longer then \(SignupConstants.firstNameMaxLength) Charactor")
        
    }
    
    func testSignupFormValidator_WhenEqualPasswordProvided_ShouldReturnTrue(){
        //Arrange
        //Act
        let isPasswordsSame = sut.isPasswordEqual(password:":",confirmPassword:":")
        //Assert
        XCTAssertTrue(isPasswordsSame,"Password should be same")
    }
    
    func testSignupFormValidator_WhenNotEqualPasswordProvided_ShouldReturnFalse(){
        //Arrange
        //Act
        let isPasswordsSame = sut.isPasswordEqual(password:"",confirmPassword:":")
        //Assert
        XCTAssertFalse(isPasswordsSame,"Password should be same")
    }
}
