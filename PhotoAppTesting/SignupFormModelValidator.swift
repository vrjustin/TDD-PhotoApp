//
//  SignupFormModelValidator.swift
//  PhotoAppTesting
//
//  Created by Justin Maronde on 10/5/22.
//

import Foundation

class SignupFormModelValidator {
    
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
}
