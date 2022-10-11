//
//  SignupViewControllerTests.swift
//  PhotoAppTestingTests
//
//  Created by Justin Maronde on 10/11/22.
//

import XCTest
@testable import PhotoAppTesting

final class SignupViewControllerTests: XCTestCase {
    
    let storyboardName: String = "Main"
    var storyboard: UIStoryboard!
    var sut: SignupViewController!

    override func setUpWithError() throws {
        storyboard = UIStoryboard(name: storyboardName, bundle: nil)
        sut = storyboard.instantiateViewController(withIdentifier: "SignupViewController") as? SignupViewController
        sut.loadViewIfNeeded()
    }

    override func tearDownWithError() throws {
        storyboard = nil
        sut = nil
    }

    func test_SignupViewController_WhenCreated_HasUITextFieldsEmpty() throws {
        // Assemble
        
        
        // Act
        
        // Assert
        let userFirstNameTextField = try XCTUnwrap(sut.userFirstNameTextField, "The FirstNameTextField is not connected to an IBOutlet!")
        let userLastNameTextField = try XCTUnwrap(sut.userLastNameTextField, "The LastNameTextField is not connectd to an IBOutlet!")
        let userEmailTextField = try XCTUnwrap(sut.userEmailTextField, "The EmailTextField is not connected to an IBOutlet!")
        let passwordTextField = try XCTUnwrap(sut.passwordTextField, "The PasswordTextField is not connected to an IBOutlet!")
        let repeatPasswordTextField = try XCTUnwrap(sut.repeatPasswordTextField, "The RepeatPasswordTextField is not connected to an IBOutlet!")
        
        XCTAssertEqual(userFirstNameTextField.text, "", "FirstNameTextField did not start in an empty state! Check the \(storyboardName) Storyboard")
        XCTAssertEqual(userLastNameTextField.text, "", "LastNameTextField did not start in an empty state! Check the \(storyboardName) Storyboard")
        XCTAssertEqual(userEmailTextField.text, "", "EmailTextField did not start in an empty state! Check the \(storyboardName) Storyboard")
        XCTAssertEqual(passwordTextField.text, "", "PasswordTextField did not start in an empty state! Check the \(storyboardName) Storyboard")
        XCTAssertEqual(repeatPasswordTextField.text, "", "RepeatPasswordTextField did not start in an empty state! Check the \(storyboardName) Storyboard")
    }
    
    func test_SignupViewController_WhenCreated_HasSignupButtonAndAction() throws {
        // Assemble
        let signupButton: UIButton = try XCTUnwrap(sut.signupButton, "Signup Button does not have a referencing IBOutlet connected!")
        
        // Act
        let actions = try XCTUnwrap(signupButton.actions(forTarget: sut, forControlEvent: .touchUpInside), "Signup Button does not have any actions associated to it!")

        // Assert
        XCTAssertEqual(actions.count, 1)
        XCTAssertEqual(actions.first, "signupButtonTapped:", "There is no action associated to SignupButton named signupButtonTapped")
    }
    
    func test_SignupViewController_WhenSignupButtonTapped_InvokesSignupProcess() {
        // Assemble
        let mockSignupModelValidator = MockSignupModelValidator()
        let mockSignupWebservice = MockSignupWebService()
        let mockSignupDelegate = MockSignupViewDelegate()
        let mockSignupPresenter = MockSignupPresenter(formModelValidator: mockSignupModelValidator, webservice: mockSignupWebservice, delegate: mockSignupDelegate)
        
        sut.signupPresenter = mockSignupPresenter
        
        // Act
        sut.signupButton.sendActions(for: .touchUpInside)
        
        // Assert
        XCTAssertTrue(mockSignupPresenter.processUserSignupCalled, "The processUserSignup() was not called on the presenter object when the signup button was tapped in the SignupViewController")
    }

}
