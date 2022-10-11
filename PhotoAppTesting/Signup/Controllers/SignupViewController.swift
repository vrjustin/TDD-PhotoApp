//
//  SignupViewController.swift
//  PhotoAppTesting
//
//  Created by Justin Maronde on 10/11/22.
//

import Foundation
import UIKit

class SignupViewController: UIViewController {
    
    @IBOutlet weak var userFirstNameTextField: UITextField!
    @IBOutlet weak var userLastNameTextField: UITextField!
    @IBOutlet weak var userEmailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var repeatPasswordTextField: UITextField!
    @IBOutlet weak var signupButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func signupButtonTapped(_ sender: UIButton) {
        
    }
}
