//
//  SignupWebserviceProtocol.swift
//  PhotoAppTesting
//
//  Created by Justin Maronde on 10/10/22.
//

import Foundation

protocol SignupWebserviceProtocol {
    func signup(withForm formModel: SignupFormRequestModel, completion: @escaping(SignupResponseModel?, SignupError?) -> Void)
}
