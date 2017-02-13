//
//  ArticleWebViewController.swift
//  PowMau
//
//  Created by Matt Tripodi on 2/13/17.
//  Copyright © 2017 Matt Tripodi. All rights reserved.
//

import UIKit

class ArticleWebViewController: UIViewController {
	
	// MARK: IBOutlets
	@IBOutlet weak var webView: UIWebView!
	
	var urlGoogleNews: String!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		webView.loadRequest(URLRequest(url: URL(string: urlGoogleNews)!))
	}
}
