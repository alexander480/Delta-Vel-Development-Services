//
//  Website.swift
//  Delta Vel Development Services
//
//  Created by Alexander Lester on 4/22/21.
//

import ALExt
import FirebaseDatabase
import Foundation
import SwiftUI

struct WebsiteModel: Identifiable {
    var id: String?
    let previewImage: UIImage
    let name: String
    let promoText: String
    let description: String
    let keywords: [String]
	let links: [String: String]?
    
//	init(id: String?, name: String, previewURL: String?, promoText: String?, description: String?, keywords: [String]?, links: [String: String]?) {
//        self.id = id ?? String.random(ofLength: 12)
//        self.name = name
//		self.previewImage = ImageHelper.fetchImage(urlStr: previewURL) ?? #imageLiteral(resourceName: "MAFJ Preview Image-3.png")
//        self.promoText = promoText ?? "Coming Soon."
//        self.description = description ?? "Coming Soon."
//        self.keywords = keywords ?? ["Website"]
//        self.links = links
//    }
	
	init(fake: FakeWebsiteModel) {
		self.id = fake.id
		self.name = fake.name
		self.previewImage = fake.previewImage
		self.promoText = fake.promoText
		self.description = fake.description
		self.keywords = fake.keywords
		self.links = fake.links
	}
    
    init?(snapshot: DataSnapshot) {
        guard let object = snapshot.value as? [String: AnyObject] else { ALPrint("Failed To Validate Website Snapshot Value.", .error); return nil }
        
        guard let name = object["Name"] as? String,
              let promoText = object["Promotional Text"] as? String,
              let description = object["Description"] as? String,
              let keywordsStr = object["Keywords"] as? String,
			  let links = object["Links"] as? [String: String],
			  let previewURL = object["Preview Image"] as? String
        else { ALPrint("Failed To Validate One Or More Object Properties From Website Snapshot.", .error); return nil }
        
        self.id = snapshot.key
        self.previewImage = UIImage(urlStr: previewURL) ?? #imageLiteral(resourceName: "websitePlaceholder")
        self.name = name
        self.promoText = promoText
        self.description = description
        self.keywords = keywordsStr.components(separatedBy: ", ") // Split String Into Array
        self.links = links
    }
}

// MARK: -- Fake

struct FakeWebsiteModel {
	let id: String = "111111111111"
	let previewURL: String = "https://firebasestorage.googleapis.com/v0/b/delta-vel-development.appspot.com/o/Portfolio%2FWebsites%2FMary%20Ann's%20Fine%20Jewelry%2FMAFJ%20Preview%20Image.png?alt=media&token=62dfd397-b905-4f45-879b-4ddc3fa777f4"
	let previewImage: UIImage = #imageLiteral(resourceName: "websitePlaceholder")
	let name: String = "Mary Ann's Fine Jewelry"
	let promoText: String = "Promotional Text"
	let description: String = "Description"
	let keywords: [String] = ["Website"]
	let links: [String: String] = ["Website": "https://mifinejewelry.com" ]
}
