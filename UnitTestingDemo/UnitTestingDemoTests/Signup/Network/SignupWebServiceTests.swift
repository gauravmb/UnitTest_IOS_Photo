//
//  SignupWebServiceTests.swift
//  UnitTestingDemoTests
//
//  Created by M1092828 on 23/09/22.
//

import XCTest
@testable import UnitTestingDemo

class SignupWebServiceTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testSignupWebService_WhenGivenSuccessfullResponse_ReturnsSuccess(){
        
        let config  = URLSessionConfiguration.ephemeral
        config.protocolClasses = [MockURLProtocol.self];
        let urlSession = URLSession(configuration: config)
        let jsonString = "{\"status\":\"ok\"}"
        MockURLProtocol.stubResponseData = jsonString.data(using: .utf8)
        
        //Arrange
        let sut = SignupWebService(urlString:"https://Guarded-retreat-82533.herokuapp.com/orders",urlSession: urlSession)
        let signupFormRequestModel  = SignupRequestModel(firstName:"Gaurav",lastName:"Bhatia",email:"gaurav@gmail.com",password:"ok");
        let expectation = self.expectation(description: "Signuo web service response expectation");
        expectation.assertForOverFulfill = false

        //Act
        sut.signup(withForm:signupFormRequestModel){(signupRequestModel,error) in 
            //Assert
            let value = signupRequestModel?.status
            XCTAssertEqual(value?.lowercased(), "ok".lowercased())
            expectation.fulfill()
        }
        
        self.wait(for: [expectation], timeout: 20)
    }
    
    func testSignupWebService_WhenReceivedDifferentJSONResponse_ErrorTookPlace(){
        
        let config  = URLSessionConfiguration.ephemeral
        config.protocolClasses = [MockURLProtocol.self];
        let urlSession = URLSession(configuration: config)
        let jsonString = "{\"value\":\"dummy\"}"
        MockURLProtocol.stubResponseData = jsonString.data(using: .utf8)
        
        //Arrange
        let sut = SignupWebService(urlString:"https://Guarded-retreat-82533.herokuapp.com/orders",urlSession: urlSession)
        let signupFormRequestModel  = SignupRequestModel(firstName:"Gaurav",lastName:"Bhatia",email:"gaurav@gmail.com",password:"ok");
        let expectation = self.expectation(description: "Signuo web service response expectation");
        expectation.assertForOverFulfill = false

        //Act
        sut.signup(withForm:signupFormRequestModel){(signupRequestModel,error) in
            //Assert
            XCTAssertNil(signupRequestModel)
            XCTAssertEqual(error, SignupError.responseModelParsingError)
            expectation.fulfill()
        }
        
        self.wait(for: [expectation], timeout: 20)
        
    }

    func testSignupWebService_WhenEmptyURLStringIsProvided_ReturnsError(){
        

        
        //Arrange
        let sut = SignupWebService(urlString:"")
        let signupFormRequestModel  = SignupRequestModel(firstName:"Gaurav",lastName:"Bhatia",email:"gaurav@gmail.com",password:"ok");
        let expectation = self.expectation(description: "Signuo web service response expectation");
        expectation.assertForOverFulfill = false
        //Act
        sut.signup(withForm:signupFormRequestModel){(signupRequestModel,error) in
            //Assert
            XCTAssertEqual(error, SignupError.requestInvalidURLString)
            XCTAssertNil(signupRequestModel)
            expectation.fulfill()
        }
        
        self.wait(for: [expectation], timeout: 20)

        //Assert
    }
    
    func testSignupWebService_WhenURLRequestFailed_ReturnError(){
        
        let config  = URLSessionConfiguration.ephemeral
        config.protocolClasses = [MockURLProtocol.self];
        let urlSession = URLSession(configuration: config)
        let jsonString = "{\"value\":\"dummy\"}"
        MockURLProtocol.stubResponseData = jsonString.data(using: .utf8)
        MockURLProtocol.error = SignupError.failedRequest(description:"URL Request Failed")
        //Arrange
        let sut = SignupWebService(urlString:"https://Gussssarded-retreat-82533.herokuapp.com/orders",urlSession: urlSession)
        let signupFormRequestModel  = SignupRequestModel(firstName:"Gaurav",lastName:"Bhatia",email:"gaurav@gmail.com",password:"ok");
        let expectation = self.expectation(description: "Failed URL Request");
        expectation.assertForOverFulfill = false
        //Act
        sut.signup(withForm:signupFormRequestModel){(signupRequestModel,error) in
            //Assert
            XCTAssertNotNil(error)
//            XCTAssertEqual(error, SignupError.failedRequest(description:"URL Request Failed"))
            XCTAssertNil(signupRequestModel)
            expectation.fulfill()
        }
        
        self.wait(for: [expectation], timeout: 20)
        
    }
    
}
