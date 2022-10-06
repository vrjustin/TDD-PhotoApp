//
//  SignupWebserviceTests.swift
//  PhotoAppTestingTests
//
//  Created by Justin Maronde on 10/5/22.
//

import XCTest
@testable import PhotoAppTesting

final class SignupWebserviceTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_SignupWebservice_WhenGivenSuccessfulResponse_ReturnsSuccess() {
        // Assemble
        
        let config = URLSessionConfiguration.ephemeral
        config.protocolClasses = [MockURLProtocol.self]
        let urlSession = URLSession(configuration: config)
        let jsonString = "{\"status\":\"ok\"}"
        MockURLProtocol.stubResponseData = jsonString.data(using: .utf8)
        
        let sut = SignupWebservice(urlString: SignupConstants.signupUrlString, urlSession: urlSession)
        let signupFormRequestModel = SignupFormRequestModel(firstName: "firstName", lastName: "lastName", email: "firstName.lastName@email.com", password: "password")
        let expectation = self.expectation(description: "Signup Webservice response expectation")
        
        // Act
        sut.signup(withForm: signupFormRequestModel) { (signupResponseModel, error) in
            //Assert
            //Agreed response: "{\"status\":\"ok\"}"
            XCTAssertEqual(signupResponseModel?.status, "ok")
            expectation.fulfill()
        }
        
        self.wait(for: [expectation], timeout: 5)
        
    }

}
