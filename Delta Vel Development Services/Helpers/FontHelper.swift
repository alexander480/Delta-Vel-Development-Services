//
//  FontHelper.swift
//  Delta Vel Development Services
//
//  Created by Alexander Lester on 10/23/21.
//

import SwiftUI

enum AvenirFontType: String {
	case roman = "Avenir Roman"
	case italic = "Avenir Oblique"
	
	case book = "Avenir Book"
	case bookItalic = "Avenir Book Oblique"
	
	case light = "Avenir Light"
	case lightItalic = "Avenir Light Oblique"
	
	case medium = "Avenir Medium"
	case mediumItalic = "Avenir Medium Oblique"
	
	case heavy = "Avenir Heavy"
	case heavyItalic = "Avenir Heavy Oblique"
	
	case black = "Avenir Black"
	case blackItalic = "Avenir Black Oblique"
}

extension Font {
	static func avenir(_ fontType: AvenirFontType = .book, size: CGFloat = 12) -> Font {
		return Font.custom(fontType.rawValue, size: size)
	}
}
