//
//  Device
//  Thingy
//
//  Created by Bojan Dimovski on 19/01/2020.
//  Copyright © 2020 Bojan Dimovski. All rights reserved.
//

import Foundation

public extension Device {

	/// Product line of the model.
	var productLine: ProductLine? {
		switch family {
		case .pad:
			switch self {
			case .iPadAir,
			     .iPadAir2,
			     .iPadAir3:
				return Lines.iPad.air
			case .iPadPro12Inch,
			     .iPadPro12Inch2G,
			     .iPadPro12Inch3G,
			     .iPadPro9Inch,
			     .iPadPro10Inch,
			     .iPadPro11Inch:
				return Lines.iPad.pro
			case .iPadMini,
			     .iPadMini2,
			     .iPadMini3,
			     .iPadMini4,
			     .iPadMini5:
				return Lines.iPad.mini
			default:
				return Lines.iPad.standard
			}
		case .phone:
			switch self {
			case .iPhoneSE,
			     .iPhoneSE2G:
				return Lines.iPhone.se
			case .iPhoneX,
			     .iPhoneXS,
			     .iPhoneXSMax,
			     .iPhone11Pro,
			     .iPhone11ProMax:
				return Lines.iPhone.pro
			default:
				return Lines.iPhone.standard
			}
		default:
			return nil
		}
	}

}
