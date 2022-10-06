//
//  SignupResponseModel.swift
//  PhotoAppTesting
//
//  Created by Justin Maronde on 10/6/22.
//

import Foundation

enum SignupError: Error {
    case responseModelParsingError
}

struct SignupResponseModel: Decodable {
    let status: String
}
