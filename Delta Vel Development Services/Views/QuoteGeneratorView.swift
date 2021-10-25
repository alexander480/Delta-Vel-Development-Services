//
//  QuoteGeneratorView.swift
//  Delta Vel Development Services
//
//  Created by Alexander Lester on 10/13/21.
//

import SwiftUI

struct QuoteGeneratorView: View {
	
	@State var fullName = ""
	@State var emailAddress = ""
	@State var phoneNumber = ""
	
	@State var projectTitle = ""
	@State var projectDescription = ""
	
    var body: some View {
		Form {
			Section {
				TextField("Full Name", text: self.$fullName)
				TextField("Email Address", text: self.$emailAddress)
				TextField("Phone Number", text: self.$phoneNumber)
			}
			
			Section {
				TextField("Project Title", text: self.$projectTitle)
				TextField("Project Description", text: self.$projectDescription)
				
			}
		}
    }
}

struct QuoteGeneratorView_Previews: PreviewProvider {
    static var previews: some View {
        QuoteGeneratorView()
    }
}
