//
//  Model.swift
//  Delta Vel Development Services
//
//  Created by Alexander Lester on 2/27/21.
//

import ALExt
import FirebaseDatabase
import SwiftUI

class Portfolio: ObservableObject {
	@Published var apps: [AppModel] = [ AppModel(fake: FakeAppModel()) ]
	@Published var websites: [WebsiteModel] = [ WebsiteModel(fake: FakeWebsiteModel()) ]
	
	let db = Database.database().reference()

    func fetchApps() {
		db.child("/Portfolio/Apps").observeSingleEvent(of: .value) { (snapshot) in
			DispatchQueue.main.async { self.apps = [] }

			snapshot.children.forEach { child in
				guard let childSnapshot = child as? DataSnapshot else {
                    ALPrint("Failed To Validate App Snapshot.", .error)
                    return
                }
				
				guard let app = AppModel(snapshot: childSnapshot) else {
					ALPrint("Failed To Create AppModel From Snapshot.", .error)
					return
				}
				
				ALPrint("Retrieved App Named: \(app.name).", .info)
				
				DispatchQueue.main.async { self.apps.append(app) }
            }
        }
    }
    
    func fetchWebsites() {
		db.child("/Portfolio/Websites").observeSingleEvent(of: .value) { (snapshot) in
			DispatchQueue.main.async { self.websites = [] }

			snapshot.children.forEach { child in
                guard let childSnapshot = child as? DataSnapshot else {
                    ALPrint("Failed To Validate Website Snapshot.", .error)
                    return
                }
				
				guard let website = WebsiteModel(snapshot: childSnapshot) else {
					ALPrint("Failed To Create WebsiteModel From Snapshot.", .error)
					return
				}
				
				ALPrint("Retrieved Website Named: \(website.name)", .info)
                
				DispatchQueue.main.async { self.websites.append(website) }
            }
        }
    }
}
