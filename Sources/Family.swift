//
// Family
// Device
//
// Created by Bojan Dimovski on 21.11.16.
// Copyright (c) 2016 Bojan Dimovski.
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

/// A type that describes the product family.
///
/// - phone: iPhone product family.
/// - pod: iPod touch product family.
/// - pad: iPad product family.
/// - tv: Apple TV product family.
/// - watch: Apple Watch product family.
/// - unknown: An unknown product family.

enum Family: ProductEntity {
	case phone
	case pod
	case pad(ProductLine.iPad)
	case tv
	case watch

	case unknown

	var marketingName: String {
		switch self {
		case .phone:
			return "iPhone"
		case .pod:
			return "iPod"
		case let .pad(line):
			var name = "iPad"
			if line.marketingName.characters.count > 0 {
				name += " \(line)"
			}
			return name
		case .tv:
			return "Apple TV"
		case .watch:
			return "Watch"
		default:
			return ""
		}
	}

	var systemPrefix: String {
		switch self {
		case .phone:
			return "iPhone"
		case .pod:
			return "iPod"
		case .pad(_):
			return "iPad"
		case .tv:
			return "AppleTV"
		case .watch:
			return "Watch"
		default:
			return ""
		}
	}
}

func ==(lhs: Family, rhs: Family) -> Bool {
	switch (lhs, rhs) {
	case (.phone, .phone), (.pod, .pod), (.tv, .tv), (.watch, .watch):
		return true
	case (let .pad(leftLine), let .pad(rightLine)):
		return leftLine == rightLine
	default:
		return false
	}
}

extension Family: Hashable {
	var hashValue: Int {
		return marketingName.hashValue
	}

}
