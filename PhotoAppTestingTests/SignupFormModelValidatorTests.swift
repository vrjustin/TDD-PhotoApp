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
    
    func test_SignupFormModelValidator_WhenFirstNameProvidedTooLong_ShouldReturnFalse() {
        //Arrange
        
        //Act
        let isFirstNameValid = sut.isFirstNameValid(firstName: "justinfirstnameistoolong")
        
        //Assert
        XCTAssertFalse(isFirstNameValid, "SignupFormModelValidator failed to validate false on a too long first name.")
    }
    
    func test_SignupFormModelValidator_WhenLastNameProvidedTooShort_ShouldReturnFalse() {
        // Act
        let isValid = sut.isLastNameValid(lastName: "L")
        
        // Assert
        XCTAssertFalse(isValid, "SignupFormModelValidator failed to validate against too short of a last name.")
    }
    
    func test_SignupFormModelValidator_WhenLastNameProvidedTooLong_ShouldReturnFalse() {
        // Act
        let isValid = sut.isLastNameValid(lastName: "Lastnamethatistoolongbeyond10")
        
        // Assert
        XCTAssertFalse(isValid, "SignupFormModelValidator failed to validate against too long of a first name.")
    }
    
    func test_SignupFormModelValidator_WhenValidLastNameProvided_ShouldReturnTrue() {
        // Act
        let isValid = sut.isLastNameValid(lastName: "Lastname")
        
        // Assert
        XCTAssertTrue(isValid, "SignupFormModelValidator failed to validate valid last name should return true")
    }

}
