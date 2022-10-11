//
//  MockSignupPresenter.swift
//  PhotoAppTestingTests
//
//  Created by Justin Maronde on 10/11/22.
//

import Foundation
@testable import PhotoAppTesting

class MockSignupPresenter: SignupPresenterProtocol {
    
    var processUserSignupCalled: Bool = false

    required init(formModelValidator: PhotoAppTesting.SignupFormModelValidatorProtocol, webservice: PhotoAppTesting.SignupWebserviceProtocol, delegate: PhotoAppTesting.SignupViewDelegateProtocol) {
        //TODO:
    }
    
    func processUserSignup(signupFormModel: PhotoAppTesting.SignupFormModel) {
        processUserSignupCalled = true
    }
    
    
    
}
