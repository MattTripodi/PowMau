//
//  SignUpScreenViewController.swift
//  PowMau
//
//  Created by Matt Tripodi on 2/6/17.
//  Copyright © 2017 Matt Tripodi. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseDatabase

class SignUpScreenViewController: UIViewController, UITextFieldDelegate, UIPickerViewDelegate, UIPickerViewDataSource {
	
	var ref: FIRDatabaseReference!
	
	// MARK: IBOutlets 
	@IBOutlet weak var saveButtonOutlet: UIButton!
	@IBOutlet weak var fullNameTextField: UITextField!
	@IBOutlet weak var emailTextField: UITextField!
	@IBOutlet weak var passwordTextField: UITextField!
	@IBOutlet weak var SegmentedControlOutlet: UISegmentedControl!
	@IBOutlet weak var sizePicker: UIPickerView!
	@IBOutlet weak var maleOrFemaleLabel: UILabel!
	@IBOutlet weak var selectedShirtLabel: UILabel!
	@IBOutlet weak var selectedPantsSizeLabel: UILabel!
	@IBOutlet weak var selectedShoeSizeLabel: UILabel!
	
	
	// MARK: IBActions ----------------------------------------------------------------
	@IBAction func saveButtonTapped(_ sender: UIButton) {
		
		// Creating a new User and storing data
		FIRAuth.auth()?.createUser(withEmail: emailTextField.text!, password: passwordTextField.text!, completion: {
			user, error in
			
			if error != nil {
				
				print("Something went wrong")
				
				// Alert Message
				let alert = UIAlertController(title: "Error!", message: "Please fill out the required information", preferredStyle: UIAlertControllerStyle.alert)
				alert.addAction(UIAlertAction(title: "Try again", style: UIAlertActionStyle.default, handler: nil))
				self.present(alert, animated: true, completion: nil)
				// ------------------------------------------------------
				
			} else {
				
				let userID: String = user!.uid
				let userFullName: String = self.fullNameTextField.text!
				let userEmail: String = self.emailTextField.text!
				let userGender: String = self.maleOrFemaleLabel.text!
				let userShirtSize: String = self.selectedShirtLabel.text!
				let userPantsSize: String = self.selectedPantsSizeLabel.text!
				let userShoeSize: String = self.selectedShoeSizeLabel.text!
				
				self.ref.child("Users").child(userID).setValue(["Full Name": userFullName ,"Email": userEmail, "Gender": userGender, "Shirt size:": userShirtSize, "Pants size:": userPantsSize, "Shoe size:": userShoeSize])
				
				print("User Created: " + user!.uid)
				
				self.performSegue(withIdentifier: "toNewAccount", sender: self)
			}
		})
	}
	
	
	@IBAction func MaleOrFemaleControl(_ sender: UISegmentedControl) {
		
		if SegmentedControlOutlet.selectedSegmentIndex == 0 {
			maleOrFemaleLabel.text = "Male"
			print(maleOrFemaleLabel)
		} else {
			maleOrFemaleLabel.text = "Female"
			print(maleOrFemaleLabel)
		}
	}
	
	// MARK: ViewDidLoad --------------------------------------------------------
	override func viewDidLoad() {
		super.viewDidLoad()
		
		// Customizing Continue Button Boarder
		saveButtonOutlet.backgroundColor = .clear
		saveButtonOutlet.layer.cornerRadius = 5
		saveButtonOutlet.layer.borderWidth = 1
		saveButtonOutlet.layer.borderColor = UIColor(red: 44 / 255, green: 152 / 255, blue: 181 / 255, alpha: 1).cgColor
		//---------------------------------------------------------
		
		// Picker View
		sizePicker.delegate = self
		sizePicker.dataSource = self
		wheelContents = [shirtSizes, pantsSizes, shoeSizes]
		updateLabel()
		//--------------------------------------------------------
		
		ref = FIRDatabase.database().reference()
	}
	
	
	// MARK: PickerView ------------------------------------------------------------
	var wheelContents: [[String]] = []
	var shirtSizes = ["XS", "S", "M", "L", "XL", "XXL"]
	var pantsSizes = ["XS", "S", "M", "L", "XL", "XXL"]
	var shoeSizes = ["4", "4.5", "5", "5.5", "6", "6.5", "7", "7.5", "8", "8.5", "9", "9.5", "10", "10.5", "11", "11.5", "12", "13", "14"]
	
	let shirtSize = 0
	let pantsSize = 1
	let shoeSize = 2
	
	func updateLabel(){
		let selectedShirtSize = wheelContents[shirtSize][sizePicker.selectedRow(inComponent: shirtSize)]
		let selectedPantsSize = wheelContents[pantsSize][sizePicker.selectedRow(inComponent: pantsSize)]
		let selectedShoeSize = wheelContents[shoeSize][sizePicker.selectedRow(inComponent: shoeSize)]
		
		selectedShirtLabel.text = selectedShirtSize
		selectedPantsSizeLabel.text = selectedPantsSize
		selectedShoeSizeLabel.text = selectedShoeSize
	}
	
	func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
		return wheelContents[component][row]
	}
	
	func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
		return wheelContents[component].count
	}
	
	func numberOfComponents(in pickerView: UIPickerView) -> Int {
		return wheelContents.count
	}
	
	func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
		updateLabel()
	}
	
	func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
		let str = wheelContents[component][row]
		return NSAttributedString(string: str, attributes: [NSForegroundColorAttributeName:UIColor(red: 44 / 255, green: 152 / 255, blue: 181 / 255, alpha: 1)])
	}
	//-------------------------------------------------------------------------------
	
	
	// MARK: To Control the Keyboard -------------------------------------------------
	// To dismiss the keyboard when the user touches outside of the keyboard
	override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
		self.view.endEditing(true)
	}
	
	// To dismiss the keyboard when return is pressed
	func textFieldShouldReturn(_ textField: UITextField) -> Bool {
		textField.resignFirstResponder()
		return true
	}
	// -------------------------------------------------------------------------------
	
	// To make the status bar text white
	override var preferredStatusBarStyle: UIStatusBarStyle {
		return .lightContent
	}
}
