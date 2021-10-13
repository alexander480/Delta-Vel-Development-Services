//
//  AppPortfolioView.swift
//  Delta Vel Development Services
//
//  Created by Alexander Lester on 10/8/21.
//

import SwiftUI
import VTabView

struct PortfolioView: View {
	var isApp: Bool
	@ObservedObject var portfolio = Portfolio()
	
	var body: some View {
		GeometryReader { proxy in
			VTabView {
				let items = self.isApp ? self.portfolio.apps : self.portfolio.websites
				ForEach(items) { item in
					PortfolioCard(item, isApp: self.isApp)
				}
			}
			.frame(width: proxy.size.width, height: proxy.size.height, alignment: .center)
			.tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
		}
		.onAppear(perform: self.isApp ? self.portfolio.fetchApps : self.portfolio.fetchWebsites)
		.accentColor(Color(red: 45, green: 187, blue: 193))
		//.navigationBarTitle(self.isApp ? "Apps" : "Sites")
		.navigationBarHidden(true)
	}
}

struct AppPortfolioView_Previews: PreviewProvider {
	static var previews: some View {
		let portfolio = Portfolio()
		return PortfolioView(isApp: true, portfolio: portfolio)
	}
}
