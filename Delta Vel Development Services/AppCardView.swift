//
//  AppCardView.swift
//  Delta Vel Development Services
//
//  Created by Alexander Lester on 10/8/21.
//

import SwiftUI

struct AppCardView: View {
	var app: AppModel
	var cornerRadius: CGFloat = 20
	var borderWidth: CGFloat = 5
	
	var body: some View {
		VStack(alignment: .center, spacing: 0) {
			VStack(alignment: .leading, spacing: 0) {
				Image(uiImage: app.previewImage)
					.resizable()
					.scaledToFit()
				
				VStack(alignment: .leading, spacing: 10) {
					Text(app.name)
						.font(.title)
						.fontWeight(.semibold)
						.foregroundColor(Color.black)
					Text(app.promoText)
						.font(.caption)
						.fontWeight(.regular)
						.foregroundColor(Color.black)
						.lineLimit(/*@START_MENU_TOKEN@*/4/*@END_MENU_TOKEN@*/)
						.padding([.leading], 2)
						.padding([.bottom], 10)
				}
				.padding([.leading, .trailing, .top, .bottom], 20)
			}
			.background(Color.white)
			.cornerRadius(self.cornerRadius)
			
		}
		.overlay(RoundedRectangle(cornerRadius: self.cornerRadius).stroke(Color.black, lineWidth: self.borderWidth))
		.shadow(radius: 25)
		.padding([.all], 30)
	}
}

struct AppCardView_Previews: PreviewProvider {
	static var previews: some View {
		let app = AppModel(fake: FakeAppModel())
		return AppCardView(app: app)
	}
}
