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
        
        if firstName.count < SignupConstants.minFirstNameLength || firstName.count > SignupConstants.maxFirstNameLength {
            retValue = false
        }
        
        return retValue
    }
}
