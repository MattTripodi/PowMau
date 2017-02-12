//
//  ThankYouForSigningUpScreenViewController.swift
//  PowMau
//
//  Created by Matt Tripodi on 2/6/17.
//  Copyright © 2017 Matt Tripodi. All rights reserved.
//

import UIKit

class ThankYouForSigningUpScreenViewController: UIViewController {
	
	// MARK: IBOutlets 
	@IBOutlet weak var continueButtonOutlet: UIButton!
	
	// MARK: IBActions 
	@IBAction func continueButtonTapped(_ sender: UIButton) {
	}
	
	
    override func viewDidLoad() {
        super.viewDidLoad()
		
		// Customizing Continue Button Boarder
		continueButtonOutlet.backgroundColor = .clear
		continueButtonOutlet.layer.cornerRadius = 5
		continueButtonOutlet.layer.borderWidth = 1
		continueButtonOutlet.layer.borderColor = UIColor.white.cgColor
		//---------------------------------------------------------
    }
	
	// To make the status bar text white
	override var preferredStatusBarStyle: UIStatusBarStyle {
		return .lightContent
	}
}
