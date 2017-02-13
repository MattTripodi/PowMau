//
//  LifestyleTableViewCell.swift
//  PowMau
//
//  Created by Matt Tripodi on 2/6/17.
//  Copyright © 2017 Matt Tripodi. All rights reserved.
//

import UIKit

class LifestyleTableViewCell: UITableViewCell {
	
	// MARK: IBOutlets 
	@IBOutlet weak var videoPreviewImage: UIImageView!
	@IBOutlet weak var videoTitle: UILabel!
	
	

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

	func updateUI(video: Video) {
		videoTitle.text = video.videoTitle
		
		let url = URL(string: video.imageURL)
		
		DispatchQueue.global().async {
			do {
				let data = try Data(contentsOf: url!)
				DispatchQueue.global().sync {
					self.videoPreviewImage.image = UIImage(data: data)
				}
			} catch {
				// handle the error
			}
		}
		
	}


}
