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
import UIKit

public class ImageUploadDetailViewControllerBase: UIViewController {

	public var image: UIImage?
	public var imageTitle: String?

	public weak var screenlet: ImageGalleryScreenlet?

	@IBOutlet public weak var imagePreview: UIImageView?
	@IBOutlet public weak var titleText: UITextField?
	@IBOutlet public weak var descripText: UITextView?

	public func startUpload() {
		image?.resizeImage(toWidth: 300) { image in

			self.startUpload(
					self.titleText?.text ?? "",
					notes: self.descripText?.text ?? "",
					thumbnail: image)
		}
	}

	public func startUpload(title: String, notes: String, thumbnail: UIImage? = nil) {

		let nonEmptyTitle = title.isEmpty ? "\(NSUUID().UUIDString)" : title

		if thumbnail == nil {
			image?.resizeImage(toWidth: 300) { resizedImage in
				let imageUpload = ImageEntryUpload(
					image: self.image!,
					thumbnail: resizedImage,
					title: nonEmptyTitle,
					notes: notes)

				self.screenlet?.performAction(
					name: ImageGalleryScreenlet.EnqueueUploadAction,
					sender: imageUpload)
			}
		}
		else {
		
			let imageUpload = ImageEntryUpload(
					image: image!,
					thumbnail: thumbnail,
					title: nonEmptyTitle,
					notes: notes)
			
			screenlet?.performAction(
					name: ImageGalleryScreenlet.EnqueueUploadAction,
					sender: imageUpload)
			}
	}
	
}
