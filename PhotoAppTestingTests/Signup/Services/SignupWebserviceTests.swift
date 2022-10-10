//
//  SignupWebserviceTests.swift
//  PhotoAppTestingTests
//
//  Created by Justin Maronde on 10/5/22.
//

import XCTest
@testable import PhotoAppTesting

final class SignupWebserviceTests: XCTestCase {
    
    var sut: SignupWebservice!
    var signupFormRequestModel: SignupFormRequestModel!

    override func setUpWithError() throws {
        let config = URLSessionConfiguration.ephemeral
        config.protocolClasses = [MockURLProtocol.self]
        let urlSession = URLSession(configuration: config)
        sut = SignupWebservice(urlString: SignupConstants.signupUrlString, urlSession: urlSession)
        signupFormRequestModel = SignupFormRequestModel(firstName: "firstName", lastName: "lastName", email: "firstName.lastName@email.com", password: "password")
    }

    override func tearDownWithError() throws {
        sut = nil
        signupFormRequestModel = nil
        MockURLProtocol.stubResponseData = nil
    }

    func test_SignupWebservice_WhenGivenSuccessfulResponse_ReturnsSuccess() {
        // Assemble
        let jsonString = "{\"status\":\"ok\"}"
        MockURLProtocol.stubResponseData = jsonString.data(using: .utf8)
        let expectation = self.expectation(description: "Signup Webservice response expectation")
        
        // Act
        sut.signup(withForm: signupFormRequestModel) { (signupResponseModel, error) in
            //Assert
            XCTAssertEqual(signupResponseModel?.status, "ok")
            expectation.fulfill()
        }
        
        self.wait(for: [expectation], timeout: 5)
        
    }
    
    func test_SignupWebservice_WhenReceivedDifferentJSONResponse_ErrorTookPlace() {
        // Assemble
        let jsonString = "{\"path\":\"/users\", \"error\":\"Internal Server Error\"}"
        MockURLProtocol.stubResponseData = jsonString.data(using: .utf8)
        let expectation = self.expectation(description: "Signup method expectation for a response that contains a different JSON structure")
        
        // Act
        sut.signup(withForm: signupFormRequestModel) { (signupResponseModel, error) in
            //Assert
            XCTAssertNil(signupResponseModel, "The response model for a request containing unknown JSON response, should have been nil")
            XCTAssertEqual(error, SignupError.responseModelParsing, "The signup method did not return expected error.")
            expectation.fulfill()
        }
        
        self.wait(for: [expectation], timeout: 5)

    }
    
    func test_SignupWebservice_WhenEmptyURLStringProvided_ReturnsError() {
        // Assemble
        let expectation = self.expectation(description: "An empty url error expectation")
        sut = SignupWebservice(urlString: "")
        
        // Act
        sut.signup(withForm: signupFormRequestModel) { (signupResponseModel, error) in
            // Assert
            XCTAssertEqual(error, SignupError.invalidRequestUrlString, "The SignupWebservice.signup method did not return an expected error for an invalidRequestUrlString.")
            XCTAssertNil(signupResponseModel, "The SignupWebservice.signup method did not return a nil signupResponseModel when the urlstring is empty.")
            expectation.fulfill()
        }
        
        self.wait(for: [expectation], timeout: 5)
    }

}
