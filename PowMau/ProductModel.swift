//
//  ProductModel.swift
//  PowMau
//
//  Created by Matt Tripodi on 2/11/17.
//  Copyright © 2017 Matt Tripodi. All rights reserved.
//

import Foundation

struct Product {
	let productName: String
	let productBrand: String
	let productDescription: String
	let productImage: String
	
	init(productName: String, productBrand: String, productDescription: String, productImage: String) {
		self.productName = productName
		self.productBrand = productBrand
		self.productDescription = productDescription
		self.productImage = productImage
	}
}
