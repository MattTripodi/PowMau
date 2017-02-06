//
//  ProductsTableViewCell.swift
//  PowMau
//
//  Created by Matt Tripodi on 2/6/17.
//  Copyright © 2017 Matt Tripodi. All rights reserved.
//

import UIKit

class ProductsTableViewCell: UITableViewCell {
	
	// MARK: IBOutlets
	@IBOutlet weak var productImage: UIImageView!
	@IBOutlet weak var productName: UILabel!
	@IBOutlet weak var productBrand: UILabel!
	@IBOutlet weak var productDescription: UILabel!
	

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
