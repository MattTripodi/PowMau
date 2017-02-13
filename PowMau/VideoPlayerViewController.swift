//
//  VideoPlayerViewController.swift
//  PowMau
//
//  Created by Matt Tripodi on 2/13/17.
//  Copyright © 2017 Matt Tripodi. All rights reserved.
//

import UIKit

class VideoPlayerViewController: UIViewController {
	
	// MARK: IBOutlets
	@IBOutlet weak var webView: UIWebView!
	
	private var _video: Video!
	
	var video: Video {
		get {
			return _video
		} set {
			_video = newValue
		}
	}
	
	// MARK: IBActions
	@IBAction func backButtonTapped(_ sender: UIButton) {
		performSegue(withIdentifier: "backToLifestyle", sender: self)
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		webView.loadHTMLString(video.videoURL, baseURL: nil)
		
		self.navigationItem.title = "Video Player"
		
		webView.scrollView.isScrollEnabled = false
		webView.scrollView.bounces = false
	}
}
