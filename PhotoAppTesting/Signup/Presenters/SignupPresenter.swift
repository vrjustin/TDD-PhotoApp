//
//  SignupPresenter.swift
//  PhotoAppTesting
//
//  Created by Justin Maronde on 10/10/22.
//

import Foundation

class SignupPresenter: SignupPresenterProtocol {
    
    private var signupFormModelValidator: SignupFormModelValidatorProtocol!
    private var signupWebservice: SignupWebserviceProtocol!
    private weak var delegate: SignupViewDelegateProtocol?
    
    required init(formModelValidator: SignupFormModelValidatorProtocol,
         webservice: SignupWebserviceProtocol,
         delegate: SignupViewDelegateProtocol) {
        self.signupFormModelValidator = formModelValidator
        self.signupWebservice = webservice
        self.delegate = delegate
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
        
        signupWebservice.signup(withForm: requestModel) { [weak self] signupResponseModel, error in
            if let error = error {
                self?.delegate?.errorHandler(error: error)
                return
            }
            
            if let _ = signupResponseModel {
                self?.delegate?.successfullSignup()
                return
            }
        }
    }
}
