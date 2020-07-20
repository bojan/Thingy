//
//  Device
//  Thingy
//
//  Created by Bojan Dimovski on 19/01/2020.
//  Copyright © 2020 Bojan Dimovski. All rights reserved.
//

import Foundation

internal extension Device {

	var lowestNumber: Double {
		numbers.first ?? 0
	}

	/// Associated model numbers for each device.
	var numbers: [Double] {
		switch self {
		case .iPhone4S:
			return [4.1]
		case .iPhone5:
			return [5.1, 5.2]
		case .iPhone5c:
			return [5.3, 5.4]
		case .iPhone5s:
			return [6.1, 6.2]
		case .iPhone6:
			return [7.2]
		case .iPhone6Plus:
			return [7.1]
		case .iPhone6s:
			return [8.1]
		case .iPhone6sPlus:
			return [8.2]
		case .iPhoneSE:
			return [8.4]
		case .iPhoneSE2G:
			return [12.8]
		case .iPhone7:
			return [9.1, 9.3]
		case .iPhone7Plus:
			return [9.2, 9.4]
		case .iPhone8:
			return [10.1, 10.4]
		case .iPhone8Plus:
			return [10.2, 10.5]
		case .iPhoneX:
			return [10.3, 10.6]
		case .iPhoneXR:
			return [11.8]
		case .iPhoneXS:
			return [11.2]
		case .iPhoneXSMax:
			return [11.4, 11.6]
		case .iPhone11:
			return [12.1]
		case .iPhone11Pro:
			return [12.3]
		case .iPhone11ProMax:
			return [12.5]

		case .iPodTouch5G:
			return [5.1]
		case .iPodTouch6G:
			return [7.1]
		case .iPodTouch7G:
			return [9.1]

		case .appleTV4:
			return [5.3]
		case .appleTV4K:
			return [6.2]

		case .watch(.screen38mm):
			return [1.1]
		case .watch(.screen42mm):
			return [1.2]
		case .watchSeries1(.screen38mm):
			return [2.6]
		case .watchSeries1(.screen42mm):
			return [2.7]
		case .watchSeries2(.screen38mm):
			return [2.3]
		case .watchSeries2(.screen42mm):
			return [2.4]
		case .watchSeries3(.screen38mm):
			return [3.1, 3.3]
		case .watchSeries3(.screen42mm):
			return [3.2, 3.4]
		case .watchSeries4(.screen40mm):
			return [4.1, 4.3]
		case .watchSeries4(.screen44mm):
			return [4.2, 4.4]
		case .watchSeries5(.screen40mm):
			return [5.1, 5.3]
		case .watchSeries5(.screen44mm):
			return [5.2, 5.4]

		case .iPad2:
			return [2.1, 2.2, 2.3, 2.4]
		case .iPad3:
			return [3.1, 3.2, 3.3]
		case .iPad4:
			return [3.4, 3.5, 3.6]
		case .iPad5:
			return [6.11, 6.12]
		case .iPad6:
			return [7.5, 7.6]
		case .iPad7:
			return [7.11, 7.12]

		case .iPadAir:
			return [4.1, 4.2, 4.3]
		case .iPadAir2:
			return [5.3, 5.4]
		case .iPadAir3:
			return [11.3, 11.4]

		case .iPadPro12Inch:
			return [6.7, 6.8]
		case .iPadPro9Inch:
			return [6.3, 6.4]
		case .iPadPro12Inch2G:
			return [7.1, 7.2]
		case .iPadPro10Inch:
			return [7.3, 7.4]
		case .iPadPro12Inch3G:
			return [8.5, 8.6, 8.7, 8.8]
		case .iPadPro11Inch:
			return [8.1, 8.2, 8.3, 8.4]

		case .iPadMini:
			return [2.5, 2.6, 2.7]
		case .iPadMini2:
			return [4.4, 4.5, 4.6]
		case .iPadMini3:
			return [4.7, 4.8, 4.9]
		case .iPadMini4:
			return [5.1, 5.2]
		case .iPadMini5:
			return [11.1, 11.2]

		case let .simulator(model):
			return model.numbers

		default:
			return [0.0]
		}
	}

}
