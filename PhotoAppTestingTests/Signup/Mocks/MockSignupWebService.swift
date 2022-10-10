//
//  MockSignupWebService.swift
//  PhotoAppTestingTests
//
//  Created by Justin Maronde on 10/10/22.
//

import Foundation
@testable import PhotoAppTesting

class MockSignupWebService: SignupWebserviceProtocol {
    
    var isSignupMethodCalled: Bool = false

    func signup(withForm formModel: PhotoAppTesting.SignupFormRequestModel, completion: @escaping (PhotoAppTesting.SignupResponseModel?, PhotoAppTesting.SignupError?) -> Void) {
        isSignupMethodCalled = true
    }

}
