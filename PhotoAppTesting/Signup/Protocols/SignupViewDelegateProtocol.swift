//
//  SignupViewDelegateProtocol.swift
//  PhotoAppTesting
//
//  Created by Justin Maronde on 10/10/22.
//

import Foundation

protocol SignupViewDelegateProtocol: AnyObject {
    func successfullSignup()
    func errorHandler(error: SignupError)
}
