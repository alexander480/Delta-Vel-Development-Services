//
//  WebsitePortfolioView.swift
//  Delta Vel Development Services
//
//  Created by Alexander Lester on 10/8/21.
//

import SwiftUI
import VTabView

struct WebsitePortfolioView: View {
	@ObservedObject var portfolio = Portfolio()
	
	var body: some View {
		GeometryReader { proxy in
			VTabView {
				ForEach(self.portfolio.websites) { site in
					WebsiteCardView(site: site)
				}
			}
			.frame(width: proxy.size.width, height: proxy.size.height, alignment: .center)
			.tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
		}
		.onAppear(perform: self.portfolio.fetchWebsites)
		.navigationBarTitle("Websites")
		.navigationBarTitleDisplayMode(.inline)
		.accentColor(Color(red: 45, green: 187, blue: 193))
	}
}

struct WebsitePortfolioView_Previews: PreviewProvider {
	static var previews: some View {
		let portfolio = Portfolio()
		return WebsitePortfolioView(portfolio: portfolio)
	}
}
