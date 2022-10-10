//
//  SignupPresenterTests.swift
//  PhotoAppTestingTests
//
//  Created by Justin Maronde on 10/10/22.
//

import XCTest
@testable import PhotoAppTesting

final class SignupPresenterTests: XCTestCase {
    
    var signupFormModel: SignupFormModel!
    var mockSignupModelValidator: MockSignupModelValidator!
    var mockSignupWebservice: MockSignupWebService!
    var sut: SignupPresenter!
    var mockSignupViewDelegate: MockSignupViewDelegate!

    override func setUpWithError() throws {
        signupFormModel = SignupFormModel(firstName: "Sergey",
                                              lastName: "Kargopolov",
                                              email: "test@test.com",
                                              password: "12345678",
                                              repeatPassword: "12345678")
        mockSignupModelValidator = MockSignupModelValidator()
        mockSignupWebservice = MockSignupWebService()
        mockSignupViewDelegate = MockSignupViewDelegate()

        sut = SignupPresenter(formModelValidator: mockSignupModelValidator,
                              webservice: mockSignupWebservice,
                              delegate: mockSignupViewDelegate)
    }

    override func tearDownWithError() throws {
        signupFormModel = nil
        mockSignupModelValidator = nil
        mockSignupWebservice = nil
        mockSignupViewDelegate = nil
        sut = nil
    }
    
    func test_SignupPresenter_WhenInformationProvided_WillValidateEachProperty() {
        // Arrange

        
        // Act
        sut.processUserSignup(signupFormModel: signupFormModel)
        
        // Assert
        XCTAssertTrue(mockSignupModelValidator.isFirstNameValidated, "FirstName was not validated.")
        XCTAssertTrue(mockSignupModelValidator.isLastNameValidated, "LastName was not validated.")
        XCTAssertTrue(mockSignupModelValidator.isEmailValidated, "Email was not validated.")
        XCTAssertTrue(mockSignupModelValidator.isPasswordValidated, "Password was not validated.")
        XCTAssertTrue(mockSignupModelValidator.isPasswordEqualityValidated, "Password Equality was not validated.")
    }
    
    func test_SignupPresenter_WhenGivenValidFormModel_ShouldCallSignupMethod() {
        // Arrange

        // Act
        sut.processUserSignup(signupFormModel: signupFormModel)
        
        // Assert
        XCTAssertTrue(mockSignupWebservice.isSignupMethodCalled, "SignupMethod was not called in the SignupWebservice")
    }
    
    func test_SignupPresenter_WhenSignupOperationSuccessfull_CallsSuccessOnViewDelegate() {
        // Arrange
        let expectation = expectation(description: "Expected the successfullSignup() method to be called")
        mockSignupViewDelegate.expectation = expectation
        
        // Act
        sut.processUserSignup(signupFormModel: signupFormModel)
        self.wait(for: [expectation], timeout: 5)
        
        // Assert
        XCTAssertEqual(mockSignupViewDelegate.successfullSignupCounter, 1, "SuccessfullSignup was called more than 1 time.")
    }
    
    func test_SignupPresenter_WhenSignupOperationFails_ReturnsError() {
        // Arrange
        let expectation = expectation(description: "Expected errorHandler() method to be called")
        mockSignupViewDelegate.expectation = expectation
        mockSignupWebservice.shouldReturnError = true
        
        // Act
        sut.processUserSignup(signupFormModel: signupFormModel)
        self.wait(for: [expectation], timeout: 5)
        
        // Assert
        XCTAssertEqual(mockSignupViewDelegate.successfullSignupCounter, 0)
        XCTAssertEqual(mockSignupViewDelegate.errorHandlerCounter, 1)
        XCTAssertNotNil(mockSignupViewDelegate.signupError)
    }

}
