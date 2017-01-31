//
//  LoginScreenViewController.swift
//  PowMau
//
//  Created by Matt Tripodi on 1/31/17.
//  Copyright © 2017 Matt Tripodi. All rights reserved.
//

import UIKit

class LoginScreenViewController: UIViewController, UITextFieldDelegate {
	
	// MARK: IBOutlets 
	@IBOutlet weak var userNameTextField: UITextField!
	@IBOutlet weak var passwordTextField: UITextField!
	@IBOutlet weak var loginButtonOutlet: UIButton!
	
	// MARK: IBActions 
	@IBAction func loginButton(_ sender: UIButton) {
	
	}
	
	@IBAction func signUpButton(_ sender: UIButton) {
	}
	
	
    override func viewDidLoad() {
        super.viewDidLoad()
		
		// Customizing Login Button Boarder
		loginButtonOutlet.backgroundColor = .clear
		loginButtonOutlet.layer.cornerRadius = 5
		loginButtonOutlet.layer.borderWidth = 1
		loginButtonOutlet.layer.borderColor = UIColor.white.cgColor
		//---------------------------------------------------------
		
		
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
	
	// MARK: To Control the Keyboard
	// To dismiss the keyboard when the user touches outside of the keyboard
	override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
		self.view.endEditing(true)
	}
	
	// To dismiss the keyboard when return is pressed
	func textFieldShouldReturn(_ textField: UITextField) -> Bool {
		textField.resignFirstResponder()
		return true
	}
	// --------------------------------------------------------------------------
	
}
