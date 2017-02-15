//
//  NewsViewController.swift
//  PowMau
//
//  Created by Matt Tripodi on 2/6/17.
//  Copyright © 2017 Matt Tripodi. All rights reserved.
//

import UIKit
import SafariServices

class NewsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
	
	var articleJSON = [Article]()
	var key = "a368d3c0637848d0a275cf2a83cfcbfe"
	// Google news TopHeadlines
	//var originalURLString = "https://newsapi.org/v1/articles?source=google-news&sortBy=top&apiKey=a368d3c0637848d0a275cf2a83cfcbfe"
	
	// MARK: IBOutlets
	@IBOutlet weak var tableView: UITableView!
	
	// MARK: ViewDidLoad
	override func viewDidLoad() {
		super.viewDidLoad()
		tableView.dataSource = self
		tableView.delegate = self
		
		self.navigationItem.title = "News"
		
		fetchData(closure: {arrayArticles in
			self.articleJSON = arrayArticles!
			self.tableView.reloadData()
		})
	}
	
	// MARK: TableView
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return articleJSON.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "NewsCell", for: indexPath) as! NewsTableViewCell
		cell.titleLabel.text = articleJSON[indexPath.row].title
		cell.descriptionLabel.text = articleJSON[indexPath.row].description
		let thisArticle = articleJSON[indexPath.row]
		cell.updateCell(cellData: thisArticle)
		
		return cell
	}
	
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		let safariVC = SFSafariViewController(url: URL(string: articleJSON[indexPath.row].url!)!)
		present(safariVC, animated:  true, completion: nil)
		tableView.deselectRow(at: indexPath, animated: true)
	}
	
	
	// MARK: Parsing JSON
	func parseJson(data: Data, completionHandler: @escaping ([Article]?) -> ()) {
		var newArticles : [Article] = []
		if let jsonObject = (try? JSONSerialization.jsonObject(with: data, options: .allowFragments)) as? [String : Any] {
			let realArticlesJson = jsonObject["articles"] as? [[String : Any]]
			for newArticle in realArticlesJson! {
				let articles = Article(data: newArticle)
				newArticles.append(articles)
			}
			DispatchQueue.main.async {
				completionHandler(newArticles)
			}
		}
	}
	
	// MARK: Fetching Data
	func fetchData(closure: @escaping ([Article]?) -> ()) {
	
		// Snowboarding Surfing News
		//let SSNews = "Snowboardingandsurfing"
		let urlString = "https://newsapi.org/v1/articles?source=google-news&sortBy=top&apiKey=a368d3c0637848d0a275cf2a83cfcbfe"
		let urlRequest = URL(string: urlString)!
		let task = URLSession.shared.dataTask(with: urlRequest) { rawData, response, error in
			guard let responseData = rawData else {
				closure(nil)
				return
			}
			self.parseJson(data: responseData, completionHandler: closure)
			print(self.articleJSON)
		}
		task.resume()
	}
}
