//
//  PortfolioCard.swift
//  Delta Vel Development Services
//
//  Created by Alexander Lester on 10/8/21.
//

import SwiftUI

struct PortfolioCard: View {
	var model: CardModel
	var isApp: Bool
	
	var cornerRadius: CGFloat = 20
	var borderWidth: CGFloat = 5
	
	init(_ model: CardModel, isApp: Bool) {
		self.model = model
		self.isApp = isApp
	}
	
	var body: some View {
		VStack {
			ZStack(alignment: .top) {
				RoundedRectangle(cornerRadius: 22)
					.foregroundColor(.white)
					.shadow(color: .gray, radius: 8, x: 0, y: 0)
					//.overlay(RoundedRectangle(cornerRadius: 22).stroke(lineWidth: 2).foregroundColor(.gray).opacity(0.3))
					.frame(width: UIScreen.main.bounds.width - 40, height: nil, alignment: .top)
				
				
				VStack(alignment: .center, spacing: 0) {
					
					Image(uiImage: model.previewImage)
						.resizable()
						.scaledToFit()
					
					VStack(alignment: .center, spacing: 12) {
						Text(model.name)
							.font(.title)
							.fontWeight(.semibold)
							.foregroundColor(Color.black)
						
						Text(model.promoText)
							.font(.caption)
							.fontWeight(.regular)
							.foregroundColor(Color.black)
							.multilineTextAlignment(.center)
							.lineLimit(/*@START_MENU_TOKEN@*/4/*@END_MENU_TOKEN@*/)
							.padding([.bottom], 12)
							
//
//						Divider()
//							.padding([.bottom], 12)
//
//						Text(model.description)
//							.font(.caption2)
//							//.fontWeight(.thin)
//							.foregroundColor(Color.black)
//							.multilineTextAlignment(.center)
//							.lineLimit(/*@START_MENU_TOKEN@*/4/*@END_MENU_TOKEN@*/)
					}
					.padding([.top], 20)
					.padding([.leading, .trailing], 40)
					
				}
				.frame(width: UIScreen.main.bounds.width - 40, height: nil, alignment: .top)
				.foregroundColor(.white)
				.cornerRadius(self.cornerRadius)
			}
			
			.padding()
			
		}
		//.frame(width: UIScreen.main.bounds.width - 40, height: 435, alignment: .top)
		
		
	}
}

struct AppCardView_Previews: PreviewProvider {
	static var previews: some View {
		let model = CardModel(mock: MockCardModel())
		return PortfolioCard(model, isApp: true)
	}
}
