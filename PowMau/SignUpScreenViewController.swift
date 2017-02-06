//
//  SignUpScreenViewController.swift
//  PowMau
//
//  Created by Matt Tripodi on 2/6/17.
//  Copyright © 2017 Matt Tripodi. All rights reserved.
//

import UIKit

class SignUpScreenViewController: UIViewController, UITextFieldDelegate {
	
	// MARK: IBOutlets
	@IBOutlet weak var continueButtonOutlet: UIButton!
	@IBOutlet weak var genderSwitch: UISwitch!
	@IBOutlet weak var fullNameTextField: UITextField!
	@IBOutlet weak var emailTextField: UITextField!
	@IBOutlet weak var passwordTextField: UITextField!
	
	// MARK: IBActions
	
		
	override func viewDidLoad() {
		super.viewDidLoad()
		
		// Customizing Continue Button Boarder
		continueButtonOutlet.backgroundColor = .clear
		continueButtonOutlet.layer.cornerRadius = 5
		continueButtonOutlet.layer.borderWidth = 1
		continueButtonOutlet.layer.borderColor = UIColor(red: 44, green: 152, blue: 181, alpha: 1).cgColor
		//---------------------------------------------------------
		// To fit switch off background color to pink
		genderSwitch.layer.cornerRadius = 16.0
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
