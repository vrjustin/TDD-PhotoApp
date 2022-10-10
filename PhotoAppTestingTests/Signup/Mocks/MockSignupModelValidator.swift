//
//  MockSignupModelValidator.swift
//  PhotoAppTestingTests
//
//  Created by Justin Maronde on 10/10/22.
//

import Foundation
@testable import PhotoAppTesting

class MockSignupModelValidator: SignupFormModelValidatorProtocol {
    
    var isFirstNameValidated: Bool = false
    var isLastNameValidated: Bool = false
    var isEmailValidated: Bool = false
    var isPasswordValidated: Bool = false
    var isPasswordEqualityValidated: Bool = false

    func isFirstNameValid(firstName: String) -> Bool {
        isFirstNameValidated = true
        return isFirstNameValidated
    }
    
    func isLastNameValid(lastName: String) -> Bool {
        isLastNameValidated = true
        return isLastNameValidated
    }
    
    func isEmailValid(email: String) -> Bool {
        isEmailValidated = true
        return isEmailValidated
    }
    
    func doPasswordsMatch(password: String, matchPassword: String) -> Bool {
        isPasswordEqualityValidated = true
        return isPasswordEqualityValidated
    }
    
    func isPasswordLengthValid(password: String) -> Bool {
        isPasswordValidated = true
        return isPasswordValidated
    }
    
}
