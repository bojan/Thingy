//
// Family
// Thingy
//
// Created by Bojan Dimovski on 21.11.16.
// Copyright © 2017 Bojan Dimovski. All rights reserved.
//
//            DO WHAT THE FUCK YOU WANT TO PUBLIC LICENSE
//                    Version 2, December 2004
//
// Copyright (C) 2004 Sam Hocevar <sam@hocevar.net>
//
// Everyone is permitted to copy and distribute verbatim or modified
// copies of this license document, and changing it is allowed as long
// as the name is changed.
//
//            DO WHAT THE FUCK YOU WANT TO PUBLIC LICENSE
//   TERMS AND CONDITIONS FOR COPYING, DISTRIBUTION AND MODIFICATION
//
//  0. You just DO WHAT THE FUCK YOU WANT TO.
//
//

import Foundation

/// A type that describes the product family.

public enum Family: String {
	/// - phone: iPhone product family.
	case phone = "iPhone"
	/// - pod: iPod touch product family.
	case pod = "iPod"
	/// - pad: iPad product family.
	case pad = "iPad"
	/// - tv: Apple TV product family.
	case tv = "AppleTV"
	/// - watch: Apple Watch product family.
	case watch = "Watch"
}

// MARK: - Marketing protocol

extension Family: MarketingProtocol {

	/// The marketing name of the product family, e.g. "iPhone", "Apple TV".
	public var marketingName: String {
		switch self {
		case .phone:
			return "iPhone"
		case .pod:
			return "iPod"
		case .pad:
			return "iPad"
		case .tv:
			return "Apple TV"
		case .watch:
			return "Watch"
		}
	}
}
