//
//  SignupFormModelValidator.swift
//  PhotoAppTestingTests
//
//  Created by Justin Maronde on 10/5/22.
//

import XCTest
@testable import PhotoAppTesting

final class SignupFormModelValidatorTests: XCTestCase {
    
    var sut: SignupFormModelValidator!

    override func setUpWithError() throws {
        sut = SignupFormModelValidator()
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    func test_SignupFormModelValidator_WhenValidFirstNameProvided_ShouldReturnTrue() {
        // Arrange
        
        // Act
        let isFirstNameValid = sut.isFirstNameValid(firstName: "Justin")
        
        // Assert
        XCTAssertTrue(isFirstNameValid, "SignupFormModelValidator failed to validate firstName as True")
    }

    func test_SignupFormModelValidator_WhenFirstNameProvidedTooShort_ShouldReturnFalse() {
        // Arrange
        
        // Act
        let isFirstNameValid = sut.isFirstNameValid(firstName: "J")
        
        // Assert
        XCTAssertFalse(isFirstNameValid, "SignupFormModelValidator failed to validate false on a short name.")
    }

}
