//
// Model
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

/// A type that describes the specific device model.
/// For iOS devices, only devices supporting iOS 8 are included.
///
/// - iPhone4S: iPhone 4S.
/// - iPhone5: All iPhone 5 variants.
/// - iPhone5s: All iPhone 5s variants.
/// - iPhone5c: All iPhone 5c variants.
/// - iPhone6: All iPhone 6 variants.
/// - iPhone6Plus: All iPhone 6 Plus variants.
/// - iPhone6s: All iPhone 6s variants.
/// - iPhone6sPlus: All iPhone 6s Plus variants.
/// - iPhoneSE: iPhone SE.
/// - iPhone7: All iPhone 7 variants.
/// - iPhone7Plus: All iPhone 7 Plus variants.
/// - iPad2: All iPad 2 variants.
/// - iPad3: All iPad 3 variants.
/// - iPad4: All iPad 4 variants.
/// - iPadMini: The original iPad mini in all variants.
/// - iPadMini2: All iPad mini 2 variants.
/// - iPadMini3: All iPad mini 3 variants.
/// - iPadMini4: All iPad mini 4 variants.
/// - iPadAir: The original iPad Air in all variants.
/// - iPadAir2: All iPad Air 2 variants.
/// - iPadPro12Inch: The 12.9 inch iPad Pro in all variants.
/// - iPadPro9Inch: The 9.7 inch iPad Pro in all variants.
/// - iPodTouch5G: All iPod touch 5G variants.
/// - iPodTouch6G: All iPod touch 6G variants.
/// - appleTV4: Apple TV 4.
/// - watch: The original Apple Watch.
/// - watchSeries1: Apple Watch Series 1.
/// - watchSeries2: Apple Watch Series 2.
/// - unknown: An unknown device of a specific family.

enum Model {
	case iPhone4S
	case iPhone5
	case iPhone5s
	case iPhone5c
	case iPhone6
	case iPhone6Plus
	case iPhone6s
	case iPhone6sPlus
	case iPhoneSE
	case iPhone7
	case iPhone7Plus

	case iPad2
	case iPad3
	case iPad4
	case iPadMini
	case iPadMini2
	case iPadMini3
	case iPadMini4
	case iPadAir
	case iPadAir2
	case iPadPro12Inch
	case iPadPro9Inch

	case iPodTouch5G
	case iPodTouch6G

	case appleTV4

	case watch
	case watchSeries1
	case watchSeries2
}

	case unknown(Family)
extension Model: MarketingProtocol {

	var marketingName: String {
		switch self {
		case .iPhone4S:
			return "iPhone 4S"
		case .iPhone5:
			return "iPhone 5"
		case .iPhone5s:
			return "iPhone 5s"
		case .iPhone5c:
			return "iPhone 5c"
		case .iPhone6:
			return "iPhone 6"
		case .iPhone6Plus:
			return "iPhone 6 Plus"
		case .iPhone6s:
			return "iPhone 6s"
		case .iPhone6sPlus:
			return "iPhone 6s Plus"
		case .iPhoneSE:
			return "iPhone SE"
		case .iPhone7:
			return "iPhone 7"
		case .iPhone7Plus:
			return "iPhone 7 Plus"

		case .iPad2:
			return "iPad 2"
		case .iPad3:
			return "iPad 3"
		case .iPad4:
			return "iPad 4"
		case .iPadMini:
			return "iPad mini"
		case .iPadMini2:
			return "iPad mini 2"
		case .iPadMini3:
			return "iPad mini 3"
		case .iPadMini4:
			return "iPad mini 4"
		case .iPadAir:
			return "iPad Air"
		case .iPadAir2:
			return "iPad Air 2"
		case .iPadPro12Inch:
			return "iPad Pro 12.9in"
		case .iPadPro9Inch:
			return "iPad Pro 9.7in"

		case .iPodTouch5G:
			return "iPod touch 5G"
		case .iPodTouch6G:
			return "iPod touch 6G"

		case .appleTV4:
			return "Apple TV 4"

		case .watch:
			return "Apple Watch"
		case .watchSeries1:
			return "Apple Watch Series 1"
		case .watchSeries2:
			return "Apple Watch Series 2"

		case let .unknown(family):
			var name = "Unknown"
			if family.marketingName.characters.count > 0 {
				name += " \(family.marketingName)"
			}
			return name
		}
	}
}

func ==(lhs: Model, rhs: Model) -> Bool {
	return lhs.marketingName == rhs.marketingName
}

extension Model: Hashable {
	var hashValue: Int {
		return marketingName.hashValue
	}

}

