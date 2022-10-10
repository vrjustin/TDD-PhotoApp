//
//  SignupFormModelValidator.swift
//  PhotoAppTesting
//
//  Created by Justin Maronde on 10/5/22.
//

import Foundation

class SignupFormModelValidator: SignupFormModelValidatorProtocol {
    
    func isFirstNameValid(firstName: String) -> Bool {
        var retValue = true
        
        if firstName.count < SignupConstants.minNameLength || firstName.count > SignupConstants.maxNameLength {
            retValue = false
        }
        
        return retValue
    }
    
    func isLastNameValid(lastName: String) -> Bool {
        var retValue = true
        
        if lastName.count < SignupConstants.minNameLength || lastName.count > SignupConstants.maxNameLength {
            retValue = false
        }
        
        return retValue
    }
    
    func isEmailValid(email: String) -> Bool {
        var retValue = false
        
        if email.contains(".") &&
            email.contains("@") &&
            email.count >= SignupConstants.minEmailLength {
            retValue = true
        }
        
        return retValue
    }
    
    func doPasswordsMatch(password: String, matchPassword: String) -> Bool {
        return password == matchPassword
    }
    
    func isPasswordLengthValid(password: String) -> Bool {
        return password.count >= SignupConstants.minPasswordLength
    }
}
