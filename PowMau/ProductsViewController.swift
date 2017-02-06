//
//  ProductsViewController.swift
//  PowMau
//
//  Created by Matt Tripodi on 2/6/17.
//  Copyright © 2017 Matt Tripodi. All rights reserved.
//

import UIKit

class ProductsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
	
	// MARK: IBOutlets 
	@IBOutlet weak var tableView: UITableView!
	

	// MARK: ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
		
		
    }
	
	// MARK: TableView 
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return 10
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "ProductsCell", for: indexPath)
		
		return cell
	}
	

}
