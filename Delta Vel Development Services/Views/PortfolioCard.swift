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
	
	var cornerRadius: CGFloat = 22
	var borderWidth: CGFloat = 5
	
	init(_ model: CardModel, isApp: Bool) {
		self.model = model
		self.isApp = isApp
	}
	
	var body: some View {
		VStack {
			//ZStack(alignment: .top) {
				
				
				VStack {
					
					VStack(alignment: .leading, spacing: 0) {
						
						Image(uiImage: model.previewImage)
							.resizable()
							.scaledToFit()
							//.padding([.bottom], 12)
						
						// Divider
//						Rectangle()
//							.frame(width: UIScreen.main.bounds.width - 40, height: 1.5, alignment: .center)
//							.foregroundColor(.black)
						
						// MARK: Heading
						VStack(alignment: .leading, spacing: 0) {
							
							// MARK: Icon & Title
							HStack(alignment: .center, spacing: 12) {
								Image("Bubble-Raps-Icon-60")
									.resizable()
									.frame(width: 32.0, height: 32.0)
									
								
								//VStack(alignment: .leading) {
									Text(model.name)
									
										.font(Font.avenir(.heavy, size: 24))
										
										//.fontWeight(.semibold)
										.foregroundColor(Color.black)
										//.padding([.top], 8)
										.frame(width: nil, height: 32)
									
//									Text(model.promoText)
//										.font(.caption2)
//										.fontWeight(.light)
//										.foregroundColor(Color.black)
//										.lineLimit(1)
//										//.padding([.leading, .bottom], 16)
								//}
								
								Spacer()
								
								// MARK: Tag
								ZStack {
									RoundedRectangle(cornerRadius: 22)
										.frame(width: 42, height: 22, alignment: .trailing)
										.foregroundColor(.white)
										.overlay(RoundedRectangle(cornerRadius: 22).stroke(lineWidth: 1.5).foregroundColor(.black).opacity(0.3))
									
									Text("App")
										.font(.footnote)
										.foregroundColor(Color.gray)
								}
								
							}
							
							.frame(width: nil, height: 32, alignment: .leading)
							.padding([.top, .bottom], 8)
							
							Text(model.description)
								.font(Font.avenir(.light, size: 12))
								//.fontWeight(.light)
								.foregroundColor(Color.black)
								.multilineTextAlignment(.leading)
								//.lineLimit(/*@START_MENU_TOKEN@*/4/*@END_MENU_TOKEN@*/)
								//.padding([.leading, .trailing], 8)
								.padding([.top], 4)
								.padding([.bottom], 12)
						}
						.padding()
						
					}
					//.frame(width: UIScreen.main.bounds.width - 40, height: nil, alignment: .top)
					.foregroundColor(.white)
					.cornerRadius(self.cornerRadius)
				}
			//}
			
			
			.background(
				RoundedRectangle(cornerRadius: 22)
					.foregroundColor(.white)
					.shadow(color: .gray, radius: 4, x: 0, y: 0)
					.overlay(
						RoundedRectangle(cornerRadius: 22)
							//.stroke(lineWidth: 1.5)
							.foregroundColor(.white)
							.opacity(1)
					)
			)
			.padding()
							//.frame(width: UIScreen.main.bounds.width - 40, height: nil, alignment: .top))
			
		}//.padding([.top, .bottom], 60)
		
		
	}
}

struct AppCardView_Previews: PreviewProvider {
	static var previews: some View {
		let model = CardModel(mock: MockCardModel())
		return PortfolioCard(model, isApp: true)
	}
}
