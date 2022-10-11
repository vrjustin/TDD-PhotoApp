//
//  SignupPresenterProtocol.swift
//  PhotoAppTesting
//
//  Created by Justin Maronde on 10/11/22.
//

import Foundation

protocol SignupPresenterProtocol {
    init(formModelValidator: SignupFormModelValidatorProtocol,
         webservice: SignupWebserviceProtocol,
         delegate: SignupViewDelegateProtocol)
    func processUserSignup(signupFormModel: SignupFormModel)
}
