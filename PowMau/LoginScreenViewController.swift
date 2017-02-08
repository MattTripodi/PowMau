//
//  LoginScreenViewController.swift
//  PowMau
//
//  Created by Matt Tripodi on 1/31/17.
//  Copyright © 2017 Matt Tripodi. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class LoginScreenViewController: UIViewController, UITextFieldDelegate {
	
	// MARK: IBOutlets
	@IBOutlet weak var emailTextField: UITextField!
	@IBOutlet weak var passwordTextField: UITextField!
	@IBOutlet weak var loginButtonOutlet: UIButton!
	
	// MARK: IBActions ---------------------------------------------------------------
	@IBAction func loginButton(_ sender: UIButton) {
		
		self.login()
		
	}
	// Login Function
	func login() {
		
		FIRAuth.auth()?.signIn(withEmail: emailTextField.text!, password: passwordTextField.text!, completion: {
			user, error in
			
			if error != nil {
				
				print("Incorrect")
				
				// Alert Message
				let alert = UIAlertController(title: "Alert!", message: "Your email or password was entered incorrectly.", preferredStyle: UIAlertControllerStyle.alert)
				alert.addAction(UIAlertAction(title: "Try again", style: UIAlertActionStyle.default, handler: nil))
				self.present(alert, animated: true, completion: nil)
				// ------------------------------------------------------
				
			} else {
				
				print("Success!")
			}
		})
	}
	// -----------------------------------------------------------------------------------------
	
	
	
	// MARK: ViewDidLoad --------------------------------------------------------------------
	override func viewDidLoad() {
		super.viewDidLoad()
		
		// Customizing Login Button Boarder
		loginButtonOutlet.backgroundColor = .clear
		loginButtonOutlet.layer.cornerRadius = 5
		loginButtonOutlet.layer.borderWidth = 1
		loginButtonOutlet.layer.borderColor = UIColor.white.cgColor
		//---------------------------------------------------------
		
		
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
