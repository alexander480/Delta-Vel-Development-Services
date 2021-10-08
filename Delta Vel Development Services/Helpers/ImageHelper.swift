//
//  ImageHelper.swift
//  Delta Vel Development Services
//
//  Created by Alexander Lester on 4/23/21.
//

import ALExt
import UIKit

//struct ImageHelper {
//    static func fetchImage(urlStr: String?) -> UIImage? {
//        guard let urlStr = urlStr else { ALPrint("No URL String Provided For Preview Image; Defaulting To Placeholder Image.", .warning); return nil }
//        guard let url = URL(string: urlStr) else { ALPrint("Failed To Validate URL For Preview Image.", .error); return nil }
//        let image = try? UIImage(url: url)
//        return image
//    }
//}

extension UIImage {
	convenience init?(urlStr: String?) {
		guard let urlStr = urlStr else { ALPrint("No URL String Provided For Preview Image; Defaulting To Placeholder Image.", .warning); return nil }
		guard let url = URL(string: urlStr) else { ALPrint("Failed To Validate URL For Preview Image.", .error); return nil }
		
		do { try self.init(url: url) }
		catch (let error) {
			ALPrint("Failed To Create UIImage From urlStr. [MESSAGE] \(error.localizedDescription).", .error)
			return nil
		}
	}
}
