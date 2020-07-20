//
// Thingy
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

/// A type that describes the specific device model.
///
/// For iOS devices, only devices supporting iOS 8 are included.
public enum Device: CaseIterable {

	/// - iPhone4S: iPhone 4S.
	case iPhone4S
	/// - iPhone5: All iPhone 5 variants.
	case iPhone5
	/// - iPhone5s: All iPhone 5s variants.
	case iPhone5s
	/// - iPhone5c: All iPhone 5c variants.
	case iPhone5c
	/// - iPhone6: All iPhone 6 variants.
	case iPhone6
	/// - iPhone6Plus: All iPhone 6 Plus variants.
	case iPhone6Plus
	/// - iPhone6s: All iPhone 6s variants.
	case iPhone6s
	/// - iPhone6sPlus: All iPhone 6s Plus variants.
	case iPhone6sPlus
	/// - iPhoneSE: All iPhone SE variants.
	case iPhoneSE
	/// - iPhoneSE2: All iPhone SE (2020) variants.
	case iPhoneSE2G
	/// - iPhone7: All iPhone 7 variants.
	case iPhone7
	/// - iPhone7Plus: All iPhone 7 Plus variants.
	case iPhone7Plus
	/// - iPhone8: All iPhone 8 variants.
	case iPhone8
	/// - iPhone8Plus: All iPhone 8 Plus variants.
	case iPhone8Plus
	/// - iPhoneX: All iPhone X variants.
	case iPhoneX
	/// - iPhoneXR: All iPhone XR variants.
	case iPhoneXR
	/// - iPhoneXS: All iPhone XS variants.
	case iPhoneXS
	/// - iPhoneXSMax: All iPhone XS Max variants.
	case iPhoneXSMax
	/// - iPhone11: All iPhone 11 variants.
	case iPhone11
	/// - iPhone11Pro: All iPhone 11 Pro variants.
	case iPhone11Pro
	/// - iPhone11ProMax: All iPhone 11 Pro Max variants.
	case iPhone11ProMax

	/// - iPad2: All iPad 2 variants.
	case iPad2
	/// - iPad3: All iPad 3 variants.
	case iPad3
	/// - iPad4: All iPad 4 variants.
	case iPad4
	/// - iPad5: All iPad (2017) variants.
	case iPad5
	/// - iPad6: All iPad (2018) variants.
	case iPad6
	/// - iPad7: All iPad (2019) variants.
	case iPad7
	/// - iPadMini: The original iPad mini in all variants.
	case iPadMini
	/// - iPadMini2: All iPad mini 2 variants.
	case iPadMini2
	/// - iPadMini3: All iPad mini 3 variants.
	case iPadMini3
	/// - iPadMini4: All iPad mini 4 variants.
	case iPadMini4
	/// - iPadMini5: All iPad mini 5 variants.
	case iPadMini5
	/// - iPadAir: The original iPad Air in all variants.
	case iPadAir
	/// - iPadAir2: All iPad Air 2 variants.
	case iPadAir2
	/// - iPadAir3: All iPad Air 3 variants.
	case iPadAir3
	/// - iPadPro12Inch: The 1st generation 12.9 inch iPad Pro in all variants.
	case iPadPro12Inch
	/// - iPadPro9Inch: The 9.7 inch iPad Pro in all variants.
	case iPadPro9Inch
	/// - iPadPro12Inch2G: The 2nd generation 12 inch iPad Pro in all variants.
	case iPadPro12Inch2G
	/// - iPadPro10Inch: The 10.5 inch iPad Pro in all variants.
	case iPadPro10Inch
	/// - iPadPro12Inch3G: The 3rd generation 12.9 inch iPad Pro in all variants.
	case iPadPro12Inch3G
	/// - iPadPro11Inch: The 11 inch iPad Pro in all variants.
	case iPadPro11Inch

	/// - iPodTouch5G: All iPod touch 5G variants.
	case iPodTouch5G
	/// - iPodTouch6G: All iPod touch 6G variants.
	case iPodTouch6G
	/// - iPodTouch7G: All iPod touch 7G variants.
	case iPodTouch7G

	/// - appleTV4: Apple TV 4.
	case appleTV4

	/// - appleTV4K: Apple TV 4K.
	case appleTV4K

	/// - watch: The original Apple Watch.
	case watch(Display.Size)
	/// - watchSeries1: Apple Watch Series 1.
	case watchSeries1(Display.Size)
	/// - watchSeries2: Apple Watch Series 2.
	case watchSeries2(Display.Size)
	/// - watchSeries3: Apple Watch Series 3.
	case watchSeries3(Display.Size)
	/// - watchSeries4: Apple Watch Series 4.
	case watchSeries4(Display.Size)
	/// - watchSeries5: Apple Watch Series 5.
	case watchSeries5(Display.Size)

	/// - simulator: A simulator for the associated device model.
	indirect case simulator(Device)

	/// - unknown: An unknown or a future device within the associated family.
	case unknown(Family)

	/// All real-device values.
	public static let allCases: [Device] = [
		.iPhone4S,
		.iPhone5,
		.iPhone5c,
		.iPhone5s,
		.iPhone6,
		.iPhone6Plus,
		.iPhone6s,
		.iPhone6sPlus,
		.iPhoneSE,
		.iPhoneSE2G,
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
		.iPhone11ProMax,
		.iPodTouch5G,
		.iPodTouch6G,
		.iPodTouch7G,
		.appleTV4,
		.appleTV4K,
		.watch(.screen38mm),
		.watch(.screen42mm),
		.watchSeries1(.screen38mm),
		.watchSeries1(.screen42mm),
		.watchSeries2(.screen38mm),
		.watchSeries2(.screen42mm),
		.watchSeries3(.screen38mm),
		.watchSeries3(.screen42mm),
		.watchSeries4(.screen40mm),
		.watchSeries4(.screen44mm),
		.watchSeries5(.screen40mm),
		.watchSeries5(.screen44mm),
		.iPad2,
		.iPad3,
		.iPad4,
		.iPad5,
		.iPad6,
		.iPad7,
		.iPadAir,
		.iPadAir2,
		.iPadAir3,
		.iPadPro12Inch,
		.iPadPro9Inch,
		.iPadPro12Inch2G,
		.iPadPro10Inch,
		.iPadPro12Inch3G,
		.iPadPro11Inch,
		.iPadMini,
		.iPadMini2,
		.iPadMini3,
		.iPadMini4,
		.iPadMini5,
	]

}

public extension Device {
	/// Creates a custom device out of a valid identifier.
	///
	/// If a device cannot be created, returns an unknown device.
	///
	/// - Parameter identifier: A device identifier, e.g. "iPhone9,2", "iPad6,11.", "AppleTV5,3".
	init?(identifier: String? = nil) {
		guard let device = RawDevice(identifier: identifier).device
		else {
			return nil
		}

		self = device
	}
}
