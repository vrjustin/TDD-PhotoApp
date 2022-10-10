//
//  SignupPresenter.swift
//  PhotoAppTesting
//
//  Created by Justin Maronde on 10/10/22.
//

import Foundation

class SignupPresenter {
    
    private var signupFormModelValidator: SignupFormModelValidatorProtocol!
    private var signupWebservice: SignupWebserviceProtocol!
    
    init(formModelValidator: SignupFormModelValidatorProtocol, webservice: SignupWebserviceProtocol) {
        self.signupFormModelValidator = formModelValidator
        self.signupWebservice = webservice
    }
    
    func processUserSignup(signupFormModel: SignupFormModel) {
        
        if !signupFormModelValidator.isFirstNameValid(firstName: signupFormModel.firstName) {
            return
        }
        
        if !signupFormModelValidator.isLastNameValid(lastName: signupFormModel.lastName) {
            return
        }
        
        if !signupFormModelValidator.isEmailValid(email: signupFormModel.email) {
            return
        }
        
        if !signupFormModelValidator.isPasswordLengthValid(password: signupFormModel.password) {
            return
        }
        
        if !signupFormModelValidator.doPasswordsMatch(password: signupFormModel.password, matchPassword: signupFormModel.repeatPassword) {
            return
        }
        
        let requestModel = SignupFormRequestModel(firstName: signupFormModel.firstName, lastName: signupFormModel.lastName, email: signupFormModel.email, password: signupFormModel.password)
        
        signupWebservice.signup(withForm: requestModel) { signupResponseModel, error in
            //TODO
        }
    }
}
