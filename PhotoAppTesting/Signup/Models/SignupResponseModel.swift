//
//  SignupResponseModel.swift
//  PhotoAppTesting
//
//  Created by Justin Maronde on 10/6/22.
//

import Foundation

enum SignupError: LocalizedError, Equatable {
    case responseModelParsing
    case invalidRequestUrlString
    case failedRequest(description: String)
    
    var localizedDescription: String? {
        switch self {
        case .failedRequest(let description):
            return description
        case .invalidRequestUrlString, .responseModelParsing:
            return ""
        }
        
    }
}

struct SignupResponseModel: Decodable {
    let status: String
}
