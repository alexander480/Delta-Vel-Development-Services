//
//  AppPortfolioView.swift
//  Delta Vel Development Services
//
//  Created by Alexander Lester on 10/8/21.
//

import SwiftUI
import VTabView

struct AppPortfolioView: View {
	@ObservedObject var portfolio = Portfolio()

	var body: some View {
		GeometryReader { proxy in
			VTabView {
				ForEach(self.portfolio.apps) { app in
					AppCardView(app: app)
				}
			}
			.frame(width: proxy.size.width, height: proxy.size.height, alignment: .center)
			.tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
		}
		.onAppear(perform: self.portfolio.fetchApps)
		.navigationBarTitle("Apps")
		.accentColor(Color(red: 45, green: 187, blue: 193))
	}
}

struct AppPortfolioView_Previews: PreviewProvider {
	static var previews: some View {
		let portfolio = Portfolio()
		return AppPortfolioView(portfolio: portfolio)
	}
}
