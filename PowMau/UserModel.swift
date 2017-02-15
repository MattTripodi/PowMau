//
//  UserModel.swift
//  PowMau
//
//  Created by Matt Tripodi on 2/13/17.
//  Copyright © 2017 Matt Tripodi. All rights reserved.
//

import Foundation

class UserModel {
	let userID: String
	let userFullName: String
	let userEmail: String
	let userGender: String
	let userShirtSize: String
	let userPantsSize: String
	let userShoeSize: String
	
	init(userID: String, userFullName: String, userEmail: String, userGender: String, userShirtSize: String, userPantsSize: String, userShoeSize: String) {
		self.userID = userID
		self.userFullName = userFullName
		self.userEmail = userEmail
		self.userGender = userGender
		self.userShirtSize = userShirtSize
		self.userPantsSize = userPantsSize
		self.userShoeSize = userShoeSize
	}
}
