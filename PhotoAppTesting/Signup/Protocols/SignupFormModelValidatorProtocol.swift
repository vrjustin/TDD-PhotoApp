//
//  SignupFormModelValidatorProtocol.swift
//  PhotoAppTesting
//
//  Created by Justin Maronde on 10/10/22.
//

import Foundation

protocol SignupFormModelValidatorProtocol {
    func isFirstNameValid(firstName: String) -> Bool
    
    func isLastNameValid(lastName: String) -> Bool
    
    func isEmailValid(email: String) -> Bool
    
    func doPasswordsMatch(password: String, matchPassword: String) -> Bool
    
    func isPasswordLengthValid(password: String) -> Bool
}
