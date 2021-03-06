/**
* Copyright (c) 2000-present Liferay, Inc. All rights reserved.
*
* This library is free software; you can redistribute it and/or modify it under
* the terms of the GNU Lesser General Public License as published by the Free
* Software Foundation; either version 2.1 of the License, or (at your option)
* any later version.
*
* This library is distributed in the hope that it will be useful, but WITHOUT
* ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
* FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more
* details.
*/
import Foundation

@objc public class ImageEntryUpload: NSObject, NSCoding {

	public let image: UIImage
	public let thumbnail: UIImage?

	public let title: String
	public let notes: String

	public init(image: UIImage, thumbnail: UIImage? = nil, title: String, notes: String = "") {
		self.image = image
		self.thumbnail = thumbnail
		self.title = title
		self.notes = notes
	}


	// MARK: NSCoding
	
	public required init?(coder aDecoder: NSCoder) {
		image = (aDecoder.decodeObjectForKey("image") as? UIImage)!
		thumbnail = aDecoder.decodeObjectForKey("thumbnail") as? UIImage
		title = aDecoder.decodeObjectForKey("title") as! String
		notes = aDecoder.decodeObjectForKey("notes") as! String
		super.init()
	}

	public func encodeWithCoder(aCoder: NSCoder) {
		aCoder.encodeObject(image, forKey: "image")

		if let thumbnail = thumbnail {
			aCoder.encodeObject(thumbnail, forKey: "thumbnail")
		}

		aCoder.encodeObject(title, forKey: "title")
		aCoder.encodeObject(notes, forKey: "notes")
	}
	
}