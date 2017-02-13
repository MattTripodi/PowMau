//
//  ProductsViewController.swift
//  PowMau
//
//  Created by Matt Tripodi on 2/6/17.
//  Copyright © 2017 Matt Tripodi. All rights reserved.
//

import UIKit

class ProductsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
	
	var products = [Product]()
	
	// MARK: IBOutlets 
	@IBOutlet weak var tableView: UITableView!
	
	// MARK: ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
		
		self.products = [Product(productName: "Black Burton Hoodie", productBrand: "Burton", productDescription: "Badass black hoodie", productImage: "BlackBurtonHoodie"),
		                 Product(productName: "Born to Board Tshirt", productBrand: "Basic", productDescription: "Show people you were born to board with this Tshirt", productImage: "BornToBoardTshirt"),
		                 Product(productName: "Burton Socks", productBrand: "Burton", productDescription: "Keep your feet warm while you are shredding", productImage: "BurtonSocks"),
		                 Product(productName: "Carmex Lip Balm", productBrand: "Carmex", productDescription: "Keeps your lips from getting dry on the cold mountains or in the salty ocean water", productImage: "CarmexLipBalm"),
		                 Product(productName: "Dakine Snowboard Leash", productBrand: "Dakine", productDescription: "Keep your board from sliding down the mountain without you", productImage: "DakineSnowBoardLeash"),
		                 Product(productName: "Grey Burton Hoodie", productBrand: "Burton", productDescription: "Fresh Gray Hoodie", productImage: "GreyBurtonHoodie"),
		                 Product(productName: "Live to ride Tshirt", productBrand: "Basic", productDescription: "Live to ride", productImage: "LiveToRideTshirt"),
		                 Product(productName: "Quick Silver Flip Flops", productBrand: "Quick Silver", productDescription: "Comftorable flip flops", productImage: "QuickSilverFlipFlops"),
		                 Product(productName: "Red Surf Tshirt", productBrand: "Basic", productDescription: "Surfs up", productImage: "RedSurfTshirt"),
		                 Product(productName: "Blue Surfing Evolution Tshirt", productBrand: "Basic", productDescription: "Show people you were born to surf", productImage: "SurfingEvolutionTshirt"),
		                 Product(productName: "Surfing Hoodie", productBrand: "Basic", productDescription: "Keep warm", productImage: "SurfingHoodie"), ]
		
    }
	
	// MARK: TableView 
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return products.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "ProductsCell", for: indexPath) as! ProductsTableViewCell
		
		var product : Product
		
		product = products[indexPath.row]
		cell.productImage.image = UIImage(named: product.productImage)
		cell.productName.text = product.productName
		cell.productBrand.text = product.productBrand
		cell.productDescription.text = product.productDescription
		
		return cell
	}
}
