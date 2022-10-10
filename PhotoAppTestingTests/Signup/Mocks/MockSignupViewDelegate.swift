//
//  MockSignupViewDelegate.swift
//  PhotoAppTestingTests
//
//  Created by Justin Maronde on 10/10/22.
//

import Foundation
import XCTest
@testable import PhotoAppTesting

class MockSignupViewDelegate: SignupViewDelegateProtocol {

    var expectation: XCTestExpectation?
    var signupError: SignupError?
    var successfullSignupCounter: Int = 0
    var errorHandlerCounter: Int = 0

    func successfullSignup() {
        successfullSignupCounter += 1
        expectation?.fulfill()
    }
    
    func errorHandler(error: SignupError) {
        signupError = error
        errorHandlerCounter += 1
        expectation?.fulfill()
    }
    
    
}
