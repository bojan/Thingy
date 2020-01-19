//
//  Device
//  Thingy
//
//  Created by Bojan Dimovski on 19/01/2020.
//  Copyright © 2020 Bojan Dimovski. All rights reserved.
//

import Foundation

public extension Device {

	/// Associated family for each device.
	var family: Family {
		switch self {
		case .iPhone4S,
		     .iPhone5,
		     .iPhone5c,
		     .iPhone5s,
		     .iPhone6,
		     .iPhone6Plus,
		     .iPhone6s,
		     .iPhone6sPlus,
		     .iPhoneSE,
		     .iPhone7,
		     .iPhone7Plus,
		     .iPhone8,
		     .iPhone8Plus,
		     .iPhoneX,
		     .iPhoneXR,
		     .iPhoneXS,
		     .iPhoneXSMax,
		     .iPhone11,
		     .iPhone11Pro,
		     .iPhone11ProMax:
			return .phone

		case .iPodTouch5G,
		     .iPodTouch6G,
		     .iPodTouch7G:
			return .pod

		case .appleTV4,
		     .appleTV4K:
			return .tv

		case .watch,
		     .watchSeries1,
		     .watchSeries2,
		     .watchSeries3,
		     .watchSeries4,
		     .watchSeries5:
			return .watch

		case .iPad2,
		     .iPad3,
		     .iPad4,
		     .iPad5,
		     .iPad6,
		     .iPad7,
		     .iPadAir,
		     .iPadAir2,
		     .iPadAir3,
		     .iPadPro12Inch,
		     .iPadPro12Inch2G,
		     .iPadPro12Inch3G,
		     .iPadPro9Inch,
		     .iPadPro10Inch,
		     .iPadPro11Inch,
		     .iPadMini,
		     .iPadMini2,
		     .iPadMini3,
		     .iPadMini4,
		     .iPadMini5:
			return .pad

		case let .simulator(model):
			return model.family

		case let .unknown(family):
			return family
		}
	}

}
