//
//  SignupFormModelValidator.swift
//  PhotoAppTesting
//
//  Created by Justin Maronde on 10/5/22.
//

import Foundation

class SignupFormModelValidator {
    
    private let minFirstNameLength = 2
    
    func isFirstNameValid(firstName: String) -> Bool {
        var retValue = true
        
        if firstName.isEmpty || firstName.count < minFirstNameLength {
            retValue = false
        }
        
        return retValue
    }
}
