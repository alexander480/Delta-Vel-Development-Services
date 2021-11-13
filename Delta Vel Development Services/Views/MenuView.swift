//
//  MenuView.swift
//  Delta Vel Development Services
//
//  Created by Alexander Lester on 10/8/21.
//

import SwiftUI
import VTabView

struct MenuView: View {
	
	@State private var isAppCard = true
	
	@State private var scale: Double = 1
	@State private var rotation: Double = 0
	@State private var lineRotation: Double = 40
	
    var body: some View {
		
		NavigationView {
			ZStack {
				Color("Background Color")
					.ignoresSafeArea()
				
				VStack {
					GeometryReader { proxy in
						ZStack {
							RoundedRectangle(cornerRadius: 22)
								.foregroundColor(Color("Menu Card Color"))
								.shadow(color: .black, radius: 10, x: 0, y: 0).opacity(0.32)
								.overlay(RoundedRectangle(cornerRadius: 22).stroke(lineWidth: 2).foregroundColor(Color("Menu Border Color")).opacity(0.2))
								.rotationEffect(Angle.degrees(self.rotation))
								.scaleEffect(self.scale)
								.frame(width: 220, height: UIScreen.main.bounds.width - 40, alignment: .center)
							
							NavigationLink(destination: PortfolioView(isApp: self.isAppCard)) {
								ZStack {
									Circle()
										.foregroundColor(Color("Menu Circle Color"))
										.overlay(Circle().stroke(lineWidth: 1).foregroundColor(Color("Menu Border Color")).opacity(0.3))
										.padding([.all], 32)
										.frame(width: 220, height: 320, alignment: .center)
									
									
									let title = self.isAppCard ? "APPS" : "SITES"
									Text(title)
										.foregroundColor(Color("Menu Text Color"))
										.font(Font.custom("Avenir Black Oblique", size: 30))
										.offset(x: -1.5, y: 1.5)
									
									Rectangle()
										.foregroundColor(Color("Menu Line Color"))
										.opacity(0.30)
										.rotationEffect(Angle.degrees(self.lineRotation))
										.frame(width: 1, height: 200, alignment: .center)
								}
							}
							.highPriorityGesture(
								DragGesture().onChanged({ dragValue in
									withAnimation(Animation.linear) {
										if dragValue.translation.width < 0 {
											self.isAppCard = false
											self.rotation = 90
											self.lineRotation = 40
										} else if dragValue.translation.width > 0 {
											self.isAppCard = true
											self.rotation = 0
											self.lineRotation = -40
										}
									}
									
								})
							)
						}
						
						.frame(width: proxy.size.width, height: proxy.size.height, alignment: .center)
						.offset(x: 0, y: -48) /* half of navbar height */
						.tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
						.onAppear(perform: self.setDarkPageIndicator)
					}
				}
			}
		}
		.navigationBarTitle("Portfolio")
		.accentColor(Color(red: 45, green: 187, blue: 193))
//			if #available(iOS 15.0, *) { .tint(Color(red: 45, green: 187, blue: 193)) }
//			else {  }
    }
	
	func setDarkPageIndicator() {
		UIPageControl.appearance().currentPageIndicatorTintColor = .black
		UIPageControl.appearance().pageIndicatorTintColor = UIColor.black.withAlphaComponent(0.2)
	}
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
		return MenuView()
			.preferredColorScheme(.dark)
    }
}


//								NavigationLink(destination: WebsitePortfolioView()) {
//									ZStack {
//										Circle()
//											.foregroundColor(Color("Menu Circle Color"))
//										//.overlay(Circle().stroke(lineWidth: 2))
//											.padding([.all], 32)
//											.frame(width: 220, height: 320, alignment: .center)
//
//										//let title = self.isAppCard ? "APPS" : "SITES"
//										Text("SITES")
//											.foregroundColor(Color("Menu Text Color"))
//											.font(Font.custom("Avenir Black Oblique", size: 30))
//											.offset(x: -1.5, y: 1.5)
//
//										Rectangle()
//											.foregroundColor(.gray)
//											.opacity(0.30)
//											.rotationEffect(Angle.degrees(-40))
//											.frame(width: 1, height: 200, alignment: .center)
//									}
//								}


//NavigationLink(destination: WebsitePortfolioView()) {
//ZStack {
//										RoundedRectangle(cornerRadius: 22)
//											.foregroundColor(.white)
//											.frame(width: 185, height: 300, alignment: .center)
//											.shadow(color: .gray, radius: 10, x: 0, y: 0)
//Image("Sites Circle Image")
//.frame(width: 185, height: 300, alignment: .center)
//}
//}
