//
//  AccountViewController.swift
//  PowMau
//
//  Created by Matt Tripodi on 2/6/17.
//  Copyright © 2017 Matt Tripodi. All rights reserved.
//

import UIKit

class AccountViewController: UIViewController, UITextFieldDelegate {
	
	// MARK: IBOutlets
	@IBOutlet weak var saveButtonOutlet: UIButton!
	@IBOutlet weak var fullNameTextField: UITextField!
	@IBOutlet weak var emailTextField: UITextField!
	@IBOutlet weak var passwordTextField: UITextField!
	

	
	
	// MARK: IBActions
	@IBAction func saveButtonTapped(_ sender: UIButton) {
	}
	
	// MARK: ViewDidLoad
	override func viewDidLoad() {
		super.viewDidLoad()
		
		// Customizing Save Button Boarder
		saveButtonOutlet.backgroundColor = .clear
		saveButtonOutlet.layer.cornerRadius = 5
		saveButtonOutlet.layer.borderWidth = 1
		saveButtonOutlet.layer.borderColor = UIColor(red: 44 / 255, green: 152 / 255, blue: 181 / 255, alpha: 1).cgColor
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
