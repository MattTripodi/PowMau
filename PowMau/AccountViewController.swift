//
//  AccountViewController.swift
//  PowMau
//
//  Created by Matt Tripodi on 2/6/17.
//  Copyright © 2017 Matt Tripodi. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseDatabase

class AccountViewController: UIViewController, UITextFieldDelegate, UIPickerViewDataSource, UIPickerViewDelegate {
	
	var ref: FIRDatabaseReference!
	var refHandle: UInt!
	
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
	
	
	// MARK: IBActions ---------------------------------------------------
	@IBAction func logOutButtonTapped(_ sender: UIButton) {
		print("User logged out...")
		try! FIRAuth.auth()?.signOut()
		
		performSegue(withIdentifier: "toLogin", sender: self)
	}
	
	
	@IBAction func saveButtonTapped(_ sender: UIButton) {
		//FIRAuth.auth()?.currentUser
		
		self.updateAlert()
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
	
	func updateAlert() {
		// Alert Message
		let alert = UIAlertController(title: "Alert!", message: "Your account information has been updated!", preferredStyle: UIAlertControllerStyle.alert)
		alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
		self.present(alert, animated: true, completion: nil)
		// ------------------------------------------------------
	}
	
	// MARK: ViewDidLoad ------------------------------------------------------------------------
	override func viewDidLoad() {
		super.viewDidLoad()
		
		// Customizing Save Button Boarder
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
		
	}
	
	
	// MARK: PickerView ----------------------------------------------------
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
	
	
	// MARK: To Control the Keyboard ------------------------------------------------
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
