//
//  VideosModel.swift
//  PowMau
//
//  Created by Matt Tripodi on 2/13/17.
//  Copyright © 2017 Matt Tripodi. All rights reserved.
//

import Foundation


class Video {
	var _imageURL: String!
	var _videoURL: String!
	var _videoTitle: String!
	
	var imageURL: String {
		return _imageURL
	}
	
	var videoURL: String {
		return _videoURL
	}
	
	var videoTitle: String {
		return _videoTitle
	}
	
	init(imageURL: String, videoURL: String, videoTitle: String) {
		
		_imageURL = imageURL
		_videoURL = videoURL
		_videoTitle = videoTitle
	}
}
