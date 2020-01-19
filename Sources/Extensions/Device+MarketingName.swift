//
//  Device
//  Thingy
//
//  Created by Bojan Dimovski on 19/01/2020.
//  Copyright © 2020 Bojan Dimovski. All rights reserved.
//

import Foundation

extension Device: MarketingProtocol {

	/// The full marketing name of the model, e.g. "iPhone 7 Plus", "Apple TV 4".
	public var marketingName: String {
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
		case .iPhone8:
			return "iPhone 8"
		case .iPhone8Plus:
			return "iPhone 8 Plus"
		case .iPhoneX:
			return "iPhone X"
		case .iPhoneXR:
			return "iPhone XR"
		case .iPhoneXS:
			return "iPhone XS"
		case .iPhoneXSMax:
			return "iPhone XS Max"
		case .iPhone11:
			return "iPhone 11"
		case .iPhone11Pro:
			return "iPhone 11 Pro"
		case .iPhone11ProMax:
			return "iPhone 11 Pro Max"

		case .iPad2:
			return "iPad 2"
		case .iPad3:
			return "iPad 3"
		case .iPad4:
			return "iPad 4"
		case .iPad5:
			return "iPad (2017)"
		case .iPad6:
			return "iPad (2018)"
		case .iPad7:
			return "iPad (2019)"
		case .iPadMini:
			return "iPad mini"
		case .iPadMini2:
			return "iPad mini 2"
		case .iPadMini3:
			return "iPad mini 3"
		case .iPadMini4:
			return "iPad mini 4"
		case .iPadMini5:
			return "iPad mini 5"
		case .iPadAir:
			return "iPad Air"
		case .iPadAir2:
			return "iPad Air 2"
		case .iPadAir3:
			return "iPad Air 3"
		case .iPadPro12Inch:
			return "12.9-inch iPad Pro"
		case .iPadPro9Inch:
			return "9.7-inch iPad Pro"
		case .iPadPro12Inch2G:
			return "12.9-inch iPad Pro (2nd generation)"
		case .iPadPro12Inch3G:
			return "12.9-inch iPad Pro (3rd generation)"
		case .iPadPro10Inch:
			return "10.5-inch iPad Pro"
		case .iPadPro11Inch:
			return "11-inch iPad Pro"

		case .iPodTouch5G:
			return "iPod touch (5th generation)"
		case .iPodTouch6G:
			return "iPod touch (6th generation)"
		case .iPodTouch7G:
			return "iPod touch (7th generation)"

		case .appleTV4:
			return "Apple TV"
		case .appleTV4K:
			return "Apple TV 4K"

		case .watch:
			return "Apple Watch"
		case .watchSeries1:
			return "Apple Watch Series 1"
		case .watchSeries2:
			return "Apple Watch Series 2"
		case .watchSeries3:
			return "Apple Watch Series 3"
		case .watchSeries4:
			return "Apple Watch Series 4"
		case .watchSeries5:
			return "Apple Watch Series 5"

		case let .simulator(model):
			return NSLocalizedString("Simulator (\(model.marketingName))", comment: "Simulator (\(model.marketingName))")

		case let .unknown(family):
			return NSLocalizedString("Unknown \(family.marketingName)", comment: "Unknown \(family.marketingName)")
		}

	}

}
