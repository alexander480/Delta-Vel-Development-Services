//
//  AppModel.swift
//  Delta Vel Development Services
//
//  Created by Alexander Lester on 4/22/21.
//

import ALExt
import SwiftUI
import FirebaseDatabase

struct AppModel: Identifiable {
    let id: String?
    let previewImage: UIImage
    let name: String
    let promoText: String
    let description: String
    let keywords: [String]?
    let links: [String: String]?
    
//	init(id: String?, name: String, previewURL: String?, promoText: String, description: String, keywords: [String]? = ["App"], links: [String: String]?) {
//        self.id = id
//		self.previewImage = ImageHelper.fetchImage(urlStr: previewURL) ?? #imageLiteral(resourceName: "placeholder.png")
//        self.name = name
//        self.promoText = promoText
//        self.description = description
//        self.keywords = keywords
//        self.links = links
//    }
	
	init(fake: FakeAppModel) {
		self.id = fake.id
		self.previewImage = fake.previewImage
		self.name = fake.name
		self.promoText = fake.promoText
		self.description = fake.description
		self.keywords = fake.keywords
		self.links = fake.links
	}
    
    init?(snapshot: DataSnapshot) {
        guard let object = snapshot.value as? [String: AnyObject] else { ALPrint("Failed To Validate App Snapshot Value.", .error); return nil }
        
        guard let name = object["Name"] as? String,
              let promoText = object["Promotional Text"] as? String,
              let description = object["Description"] as? String,
              let keywordsStr = object["Keywords"] as? String,
              let links = object["Links"] as? [String: String],
			  let previewURL = object["Preview Image"] as? String
        else { ALPrint("Failed To Validate One Or More Object Properties From App Snapshot.", .error); return nil }
        
        self.id = snapshot.key
		self.previewImage = UIImage(urlStr: previewURL) ?? #imageLiteral(resourceName: "appPlaceholder")
        self.name = name
        self.promoText = promoText
        self.description = description
        self.keywords = keywordsStr.components(separatedBy: ", ") // Split String Into Array
        self.links = links
    }
}

// MARK: -- Fake

struct FakeAppModel {
	let id: String = "000000000000" /* [OR] nil*/
	let previewURL: String = "https://firebasestorage.googleapis.com/v0/b/delta-vel-development.appspot.com/o/Portfolio%2FApps%2FBubble%20Raps%2FBubble%20Raps%20Preview%20Image.png?alt=media&token=4323dffa-0484-4f92-a18f-17d7e55206da" /* [OR] nil */
	let previewImage: UIImage = #imageLiteral(resourceName: "appPlaceholder")
	let name: String = "Bubble Raps" /* [OR] "App Name" */
	let promoText: String = "Promotional Text Coming Soon." /* [OR] "Promotional Text" */
	let description: String = "Description Coming Soon" /* "[OR] Description" */
	let keywords: [String] = ["App", "Test"]
	let links: [String: String] = ["App Store": "https://apps.apple.com/us/app/bubble-raps/id1495742891"] /* [OR] "https://deltavel.com" */
}
