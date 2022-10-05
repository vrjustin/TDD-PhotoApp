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
    
    func test_SignupFormModelValidator_WhenValidEmailProvided_ShouldReturnTrue() {
        // Act
        let isValid = sut.isEmailValid(email: "email@email.com")
        
        // Assert
        XCTAssertTrue(isValid, "SignupFormModelValidator failed to return true for a valid email provided.")
    }
    
    func test_SignupFormModelValidator_WhenInvalidEmail_ShouldReturnFalse() {
        // Act
        let isNotValidNoPeriod = sut.isEmailValid(email: "email@emailcom")
        let isNotValidNoAtSymbol = sut.isEmailValid(email: "emailemail.com")
        
        // Assert
        XCTAssertFalse(isNotValidNoPeriod, "SignupFormModelValidator failed to return false for an email missing a period.")
        XCTAssertFalse(isNotValidNoAtSymbol, "SignupFormModelValidator failed to return false for an email missing an @ symbole.")
    }
    
    func test_SignupFormModelValidator_WhenPasswordsDoNotMatch_ShouldReturnFalse() {
        // Act
        let doesPasswordMatch = sut.doPasswordsMatch(password: "password", matchPassword: "passswooord")
        
        // Assert
        XCTAssertFalse(doesPasswordMatch, "SignupFormModelValidator failed to validate false against passwords that do not match.")
    }
    
    func test_SignupFormModelValidator_WhenPasswordsMatch_ShouldReturnTrue() {
        // Act
        let doesPasswordMatch = sut.doPasswordsMatch(password: "password", matchPassword: "password")
        
        // Assert
        XCTAssertTrue(doesPasswordMatch, "SignupFormModelValidator failed to validate true against passwords that DO MATCH!")
    }
    

}
