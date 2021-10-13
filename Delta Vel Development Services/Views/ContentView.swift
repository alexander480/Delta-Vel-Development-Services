//
//  ContentView.swift
//  Delta Vel Development Services
//
//  Created by Alexander Lester on 2/27/21.
//

import SwiftUI
import CoreAudio
import VTabView

enum SwipeDirection {
	case none
	case up
	case down
}

struct ContentView: View {
    
    // Portfolio Data
    @ObservedObject var portfolio = Portfolio()
	@State var color = Color.white
	
//	@State var dragOffset = CGSize.zero
//	@State var currentAppIndex = 0
//	@State var swipeDirection: SwipeDirection = .none
	
    
    var body: some View {
		ZStack {
			// self.color.edgesIgnoringSafeArea(.all)
			
			MenuView()
		}
	}
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let portfolio = Portfolio()
		return ContentView(portfolio: portfolio)
			//.padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
    }
}
//
//
//VStack(alignment: .center) {
//	ForEach(self.portfolio.websites) { website in
//		VStack(alignment: .center, spacing: 0) {
//			Image(uiImage: website.previewImage)
//				.resizable()
//				.scaledToFit()
//				.cornerRadius(20)
//
//			VStack(alignment: .leading, spacing: 12) {
//				Text(website.name)
//					.font(.largeTitle)
//
//				Text(website.promoText)
//					.font(.caption)
//			}
//			.padding([.top, .leading, .bottom], 20)
//		}
//		//.padding()
//		.cornerRadius(10)
//		.overlay(RoundedRectangle(cornerRadius: 20)
//					.stroke(Color.black, lineWidth: 3))
//		.shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
//
//		.frame(width: UIScreen.main.bounds.width - 42, height: UIScreen.main.bounds.height - 140, alignment: .center)
//	}
//}
//.padding()


//        VStack {
//ScrollView {

//				ScrollViewReader { scroll in
//
//					// Swiped Up
//					if (self.swipeDirection == .up) {
//						//ScrollViewReader { value in
//						if (self.portfolio.apps.count - 1 < self.currentAppIndex + 1) {
//							let nextAppId = self.portfolio.apps[self.currentAppIndex + 1].id!
//							self.currentAppIndex += 1
//							scroll.scrollTo(nextAppId, anchor: nil)
//
//						}
//						//}
//					}
//
//					// Swiped Down
//					else if (self.swipeDirection == .down) {
//						//ScrollViewReader { value in
//						if (self.portfolio.apps.count - 1 > self.currentAppIndex - 1) {
//							let newAppID = self.portfolio.apps[self.currentAppIndex - 1].id!
//							self.currentAppIndex -= 1
//							scroll.scrollTo(newAppID, anchor: nil)
//						}
//						//}
//					}
//				}
