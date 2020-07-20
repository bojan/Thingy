//
// ProductLine
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

/// A struct containing all product lines. Currently iPad only.
public enum Lines {

	/// A type that describes the specific iPad line.

	public enum iPad: ProductLine {
		/// - regular: A standard iPad product.
		case regular
		/// - pro: An iPad Pro product.
		case pro
		/// - mini: An iPad mini product.
		case mini
		/// - air: An iPad Air product.
		case air

		/// The marketing name of the iPad product line, e.g. "Pro", "Air".
		public var marketingName: String {
			switch self {
			case .pro:
				return "Pro"
			case .mini:
				return "mini"
			case .air:
				return "Air"
			default:
				return ""
			}
		}
	}

}
