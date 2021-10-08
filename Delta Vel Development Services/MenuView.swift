//
//  MenuView.swift
//  Delta Vel Development Services
//
//  Created by Alexander Lester on 10/8/21.
//

import SwiftUI
import VTabView

struct MenuView: View {
	
	fileprivate let navHeight: CGFloat = 44 + 52
	
    var body: some View {
		
			NavigationView {
				VStack {
					GeometryReader { proxy in
						TabView {
							NavigationLink(destination: AppPortfolioView()) {
								Image("Apps Menu")
									.frame(width: 185, height: 300, alignment: .center)
							}
							
							NavigationLink(destination: WebsitePortfolioView()) {
								Image("Sites Menu")
									.frame(width: 300, height: 185, alignment: .center)
							}.onTapGesture {
								
							}
						}
						
						.frame(width: proxy.size.width, height: proxy.size.height - navHeight, alignment: .center)
						.tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
						.onAppear(perform: self.setDarkPageIndicator)
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
        MenuView()
    }
}
