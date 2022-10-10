//
//  SignupResponseModel.swift
//  PhotoAppTesting
//
//  Created by Justin Maronde on 10/6/22.
//

import Foundation

enum SignupError: Error {
    case responseModelParsingError
    case invalidRequestUrlStringError
}

struct SignupResponseModel: Decodable {
    let status: String
}
