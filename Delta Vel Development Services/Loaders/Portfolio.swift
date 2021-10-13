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
	@Published var apps: [CardModel] = [ CardModel(mock: MockCardModel()) ]
	@Published var websites: [CardModel] = [ CardModel(mock: MockCardModel()) ]
	
	let db = Database.database().reference()

    func fetchApps() {
		db.child("/Portfolio/Apps").observeSingleEvent(of: .value) { (snapshot) in
			DispatchQueue.main.async { self.apps = [] }

			snapshot.children.forEach { child in
				guard let childSnapshot = child as? DataSnapshot else {
                    ALPrint("Failed To Validate App Snapshot.", .error)
                    return
                }
				
				guard let appModel = CardModel(snapshot: childSnapshot) else {
					ALPrint("Failed To Create CardModel From Snapshot.", .error)
					return
				}
				
				ALPrint("Retrieved App Named: \(appModel.name).", .info)
				
				DispatchQueue.main.async { self.apps.append(appModel) }
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
				
				guard let websiteModel = CardModel(snapshot: childSnapshot) else {
					ALPrint("Failed To Create CardModel From Snapshot.", .error)
					return
				}
				
				ALPrint("Retrieved Website Named: \(websiteModel.name)", .info)
                
				DispatchQueue.main.async { self.websites.append(websiteModel) }
            }
        }
    }
}
