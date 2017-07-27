//
// ProductLine
// Thingy
//
// Created by Bojan Dimovski on 21.11.16.
// Copyright © 2017 Bojan Dimovski. All rights reserved.
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.


import Foundation

/// A struct containing all product lines. Currently iPad only.

public struct Lines {

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
