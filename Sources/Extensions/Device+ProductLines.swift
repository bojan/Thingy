//
//  Device
//  Thingy
//
//  Created by Bojan Dimovski on 19/01/2020.
//  Copyright © 2020 Bojan Dimovski. All rights reserved.
//

import Foundation

public extension Device {

	/// Product line of the model, currently supported only for the iPad.
	var productLine: ProductLine? {
		switch self {
		case .iPad2,
		     .iPad3,
		     .iPad4,
		     .iPad5,
		     .iPad6,
		     .iPad7:
			return Lines.iPad.regular
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
			return nil
		}
	}

}
