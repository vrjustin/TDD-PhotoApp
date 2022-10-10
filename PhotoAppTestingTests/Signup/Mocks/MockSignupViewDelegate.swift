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

    func successfullSignup() {
        expectation?.fulfill()
    }
    
    func errorHandler(error: PhotoAppTesting.SignupError) {
        //
    }
    
    
}
