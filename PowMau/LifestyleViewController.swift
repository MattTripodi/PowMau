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
	
	var videos:[Video] = [Video]()
	
	// MARK: ViewDidLoad -------------------------------------------------------------
	override func viewDidLoad() {
		super.viewDidLoad()
		
		tableView.delegate = self
		tableView.dataSource = self
		
		self.navigationItem.title = "Lifestyle"
		
		let video1 = Video(imageURL: "https://www.snowskool.com/uploads/images/Intermediate_to_Advanced_Boarding.jpg", videoURL: "<iframe width=\"398\" height=\"600\" src=\"https://www.youtube.com/embed/iR9Ax4EcqTI\" frameborder=\"0\" allowfullscreen></iframe>", videoTitle: "Snowboarding An Empty Water Park Snowmusement")
		
		let video2 = Video(imageURL: "https://i.ytimg.com/vi/UtZofZjccBs/hqdefault.jpg", videoURL: "<iframe width=\"398\" height=\"600\" src=\"https://www.youtube.com/embed/UtZofZjccBs\" frameborder=\"0\" allowfullscreen></iframe>", videoTitle: "Park Sessions Woodward at Tahoe TransWorld SNOWboarding")
		
		let video3 = Video(imageURL: "https://s-media-cache-ak0.pinimg.com/originals/85/8b/50/858b5097ff6e051be097495d653a9904.jpg", videoURL: "<iframe width=\"398\" height=\"600\" src=\"https://www.youtube.com/embed/5XpU5M0ZCKM\" frameborder=\"0\" allowfullscreen></iframe>", videoTitle: "WORLDS BIGGEST WAVES EVER SURFED!")
		
		let video4 = Video(imageURL: "https://i.ytimg.com/vi/fNr8kqSLpxQ/hqdefault.jpg", videoURL: "<iframe width=\"398\" height=\"600\" src=\"https://www.youtube.com/embed/fNr8kqSLpxQ\" frameborder=\"0\" allowfullscreen></iframe>", videoTitle: "World's best surfing")
		
		let video5 = Video(imageURL: "https://i.ytimg.com/vi/Q5691RGDUJ4/maxresdefault.jpg", videoURL: "<iframe width=\"398\" height=\"600\" src=\"https://www.youtube.com/embed/Q5691RGDUJ4\" frameborder=\"0\" allowfullscreen></iframe>", videoTitle: "The Art of Ride Snowboarding Off Piste Backcountry - DJI Phantom 2 GoPro Hero 3+")
		
		videos.append(video1)
		videos.append(video2)
		videos.append(video3)
		videos.append(video4)
		videos.append(video5)
	}
	
	// MARK: TableView ----------------------------------------------------------------
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return videos.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		
		if let cell = tableView.dequeueReusableCell(withIdentifier: "VideoCell", for: indexPath) as? LifestyleTableViewCell {
			
			let video = videos[indexPath.row]
			
			cell.updateUI(video: video)
			
			return cell
		} else {
			return UITableViewCell()
		}
	}
	
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		
		let video = videos[indexPath.row]
		
		tableView.deselectRow(at: indexPath, animated: true)
		
		performSegue(withIdentifier: "toVideo", sender: video)
	}
	
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		if let destination = segue.destination as? VideoPlayerViewController {
			
			if let lifestyle = sender as? Video {
				destination.video = lifestyle
			}
		}
	}
}
