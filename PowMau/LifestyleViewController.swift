//
//  LifestyleViewController.swift
//  PowMau
//
//  Created by Matt Tripodi on 2/6/17.
//  Copyright © 2017 Matt Tripodi. All rights reserved.
//

import UIKit

class LifestyleViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
	
	// MARK: IBOutlets 
	@IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
	
	// MARK: TableView 
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return 10
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "VideoCell", for: indexPath)
		
		return cell 
	}
	
	
	// To make the status bar text white
	override var preferredStatusBarStyle: UIStatusBarStyle {
		return .lightContent
	}
	
}
