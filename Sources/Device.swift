//
// Thingy
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
import UIKit

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
		.iPhone7,
		.iPhone7Plus,
		.iPhone8,
		.iPhone8Plus,
		.iPhoneX,
		.iPhoneXR,
		.iPhoneXS,
		.iPhoneXSMax,
		.iPodTouch5G,
		.iPodTouch6G,
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
		.iPad2,
		.iPad3,
		.iPad4,
		.iPad5,
		.iPad6,
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

	/// Inspects the current device.
	public init() {
		self = RawDevice(identifier: nil).device!
	}

	/// Creates a custom device out of a valid identifier.
	///
	/// If a device cannot be created, returns an unknown device.
	///
	/// - Parameter identifier: A device identifier, e.g. "iPhone9,2", "iPad6,11.", "AppleTV5,3".
	public init?(identifier: String? = nil) {
		guard let device = RawDevice(identifier: identifier).device
		else {
			return nil
		}
		self = device
	}
}

// MARK: - Errors

/// Errors thrown by Thingy.

public enum ThingyError: Error {
	/// - An error thrown when devices of different families get compared.
	case IncomparableFamilies
	/// - An error thrown when devices from different product lines get compared.
	case IncomparableProductLines
	/// - An error thrown when an unknown device gets compared.
	case IncomparableUnknownProduct
}

// MARK: - Family

public extension Device {

	/// Associated family for each device.
	public var family: Family {
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
			 .iPhoneX:
			return .phone

		case .iPodTouch5G,
			 .iPodTouch6G:
			return .pod

		case .appleTV4,
			 .appleTV4K:
			return .tv

		case .watch,
			 .watchSeries1,
			 .watchSeries2,
			 .watchSeries3:
			return .watch

		case .iPad2,
			 .iPad3,
			 .iPad4,
			 .iPad5,
			 .iPad6,
			 .iPadAir,
			 .iPadAir2,
			 .iPadPro12Inch,
			 .iPadPro9Inch,
			 .iPadPro12Inch2G,
			 .iPadPro10Inch,
			 .iPadMini,
			 .iPadMini2,
			 .iPadMini3,
			 .iPadMini4:
			return .pad

		case let .simulator(model):
			return model.family

		case let .unknown(family):
			return family
		}
	}
}

// MARK: - Model numbers

internal extension Device {

	internal var lowestNumber: Double {
		return numbers.first ?? 0
	}

	/// Associated model numbers for each device.
	internal var numbers: [Double] {
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

		case .iPodTouch5G:
			return [5.1]
		case .iPodTouch6G:
			return [7.1]

		case .appleTV4:
			return [5.3]
		case .appleTV4K:
			return [6.2]

		case .watch:
			return [1.1, 1.2]
		case .watchSeries1:
			return [2.6, 2.7]
		case .watchSeries2:
			return [2.3, 2.4]
		case .watchSeries3:
			return [3.1, 3.2, 3.3, 3.4]

		case .iPad2:
			return [2.1, 2.2, 2.3, 2.4]
		case .iPad3:
			return [3.1, 3.2, 3.3]
		case .iPad4:
			return [3.4, 3.5, 3.6]
		case .iPadAir:
			return [4.1, 4.2, 4.3]
		case .iPadAir2:
			return [5.3, 5.4]
		case .iPadPro12Inch:
			return [6.7, 6.8]
		case .iPadPro9Inch:
			return [6.3, 6.4]
		case .iPad5:
			return [6.11, 6.12]
		case .iPadPro12Inch2G:
			return [7.1, 7.2]
		case .iPadPro10Inch:
			return [7.3, 7.4]
		case .iPad6:
			return [7.5, 7.6]

		case .iPadMini:
			return [2.5, 2.6, 2.7]
		case .iPadMini2:
			return [4.4, 4.5, 4.6]
		case .iPadMini3:
			return [4.7, 4.8, 4.9]
		case .iPadMini4:
			return [5.1, 5.2]

		case let .simulator(model):
			return model.numbers

		case .unknown(_):
			return [0.0]
		}
	}
}

// MARK: - Product lines

public extension Device {

	/// Product line of the model, currently supported only for the iPad.
	public var productLine: ProductLine? {
		switch self {
		case .iPad2:
			return Lines.iPad.regular
		case .iPad3:
			return Lines.iPad.regular
		case .iPad4:
			return Lines.iPad.regular
		case .iPad5:
			return Lines.iPad.regular
		case .iPadAir:
			return Lines.iPad.air
		case .iPadAir2:
			return Lines.iPad.air
		case .iPadPro12Inch:
			return Lines.iPad.pro
		case .iPadPro9Inch:
			return Lines.iPad.pro
		case .iPadPro12Inch2G:
			return Lines.iPad.pro
		case .iPadPro10Inch:
			return Lines.iPad.pro
		case .iPadMini:
			return Lines.iPad.mini
		case .iPadMini2:
			return Lines.iPad.mini
		case .iPadMini3:
			return Lines.iPad.mini
		case .iPadMini4:
			return Lines.iPad.mini
		default:
			return nil
		}
	}

}

// MARK: - Marketing protocol

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
			return "12.9-inch iPad Pro"
		case .iPadPro9Inch:
			return "9.7-inch iPad Pro"
		case .iPadPro12Inch2G:
			return "12.9-inch iPad Pro (2nd generation)"
		case .iPadPro10Inch:
			return "10.5-inch iPad Pro"

		case .iPodTouch5G:
			return "iPod touch (5th generation)"
		case .iPodTouch6G:
			return "iPod touch (6th generation)"

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

		case let .simulator(model):
			return NSLocalizedString("Simulator (\(model.marketingName))", comment: "Simulator (\(model.marketingName))")

		case let .unknown(family):
			return NSLocalizedString("Unknown \(family.marketingName)", comment: "Unknown \(family.marketingName)")
		}

	}

}

// MARK: - Display

public extension Device {

	/// Returns the display size in inches.
	public var displaySize: Display.Size {
		return display.size
	}

	/// Returns an extended info on the display, including all resolutions, scale and density.
	public var display: Display {
		switch self {
		case .iPhone4S:
			return Display(size: .screen3_5Inch, resolution: CGSize(width: 320, height: 480), physicalResolution: CGSize(width: 640, height: 960), renderedResolution: CGSize(width: 640, height: 960), scale: 2.0, density: 326, hasTrueTone: false, colorSpace: .sRGB)

		case .iPhone5,
			 .iPhone5c,
			 .iPhone5s,
			 .iPhoneSE,
			 .iPodTouch5G,
			 .iPodTouch6G:
			return Display(size: .screen4Inch, resolution: CGSize(width: 320, height: 568), physicalResolution: CGSize(width: 640, height: 1136), renderedResolution: CGSize(width: 640, height: 1136), scale: 2.0, density: 326, hasTrueTone: false, colorSpace: .sRGB)

		case .iPhone6,
			 .iPhone6s:
			return Display(size: .screen4_7Inch, resolution: CGSize(width: 375, height: 667), physicalResolution: CGSize(width: 750, height: 1334), renderedResolution: CGSize(width: 750, height: 1334), scale: 2.0, density: 326, hasTrueTone: false, colorSpace: .sRGB)

		case .iPhone7:
			return Display(size: .screen4_7Inch, resolution: CGSize(width: 375, height: 667), physicalResolution: CGSize(width: 750, height: 1334), renderedResolution: CGSize(width: 750, height: 1334), scale: 2.0, density: 326, hasTrueTone: false, colorSpace: .p3)

		case .iPhone8:
			return Display(size: .screen4_7Inch, resolution: CGSize(width: 375, height: 667), physicalResolution: CGSize(width: 750, height: 1334), renderedResolution: CGSize(width: 750, height: 1334), scale: 2.0, density: 326, hasTrueTone: true, colorSpace: .p3)

		case .iPhone6Plus,
			 .iPhone6sPlus:
			return Display(size: .screen5_5Inch, resolution: CGSize(width: 414, height: 736), physicalResolution: CGSize(width: 1080, height: 1920), renderedResolution: CGSize(width: 1242, height: 2208), scale: 3.0, density: 401, hasTrueTone: false, colorSpace: .sRGB)

		case .iPhone7Plus:
			return Display(size: .screen5_5Inch, resolution: CGSize(width: 414, height: 736), physicalResolution: CGSize(width: 1080, height: 1920), renderedResolution: CGSize(width: 1242, height: 2208), scale: 3.0, density: 401, hasTrueTone: false, colorSpace: .p3)

		case .iPhone8Plus:
			return Display(size: .screen5_5Inch, resolution: CGSize(width: 414, height: 736), physicalResolution: CGSize(width: 1080, height: 1920), renderedResolution: CGSize(width: 1242, height: 2208), scale: 3.0, density: 401, hasTrueTone: true, colorSpace: .p3)

		case .iPhoneX:
			return Display(size: .screen5_8Inch, resolution: CGSize(width: 375, height: 812), physicalResolution: CGSize(width: 2436, height: 1125), renderedResolution: CGSize(width: 1242, height: 2208), scale: 3.0, density: 458, hasTrueTone: true, colorSpace: .p3)

		case .appleTV4:
			return Display(size: .notApplicable, resolution: CGSize(width: 1920, height: 1080), physicalResolution: CGSize(width: 1920, height: 1080), renderedResolution: CGSize(width: 1920, height: 1080), scale: 1.0, density: 0, hasTrueTone: false, colorSpace: .sRGB)

		case .appleTV4K:
			return Display(size: .notApplicable, resolution: CGSize(width: 3840, height: 2160), physicalResolution: CGSize(width: 3840, height: 2160), renderedResolution: CGSize(width: 3840, height: 2160), scale: 1.0, density: 0, hasTrueTone: false, colorSpace: .sRGB)

		case .iPad2:
			return Display(size: .screen9_7Inch, resolution: CGSize(width: 1024, height: 768), physicalResolution: CGSize(width: 1024, height: 768), renderedResolution: CGSize(width: 1024, height: 768), scale: 1.0, density: 132, hasTrueTone: false, colorSpace: .sRGB)

		case .iPad3,
			 .iPad4,
			 .iPad5,
			 .iPad6,
			 .iPadAir,
			 .iPadAir2:
			return Display(size: .screen9_7Inch, resolution: CGSize(width: 1024, height: 768), physicalResolution: CGSize(width: 2048, height: 1536), renderedResolution: CGSize(width: 2048, height: 1536), scale: 2.0, density: 264, hasTrueTone: false, colorSpace: .sRGB)

		case .iPadPro12Inch:
			return Display(size: .screen12_9Inch, resolution: CGSize(width: 1366, height: 1024), physicalResolution: CGSize(width: 2732, height: 2048), renderedResolution: CGSize(width: 2732, height: 2048), scale: 2.0, density: 264, hasTrueTone: false, colorSpace: .sRGB)

		case .iPadPro9Inch:
			return Display(size: .screen9_7Inch, resolution: CGSize(width: 1024, height: 768), physicalResolution: CGSize(width: 2048, height: 1536), renderedResolution: CGSize(width: 2048, height: 1536), scale: 2.0, density: 264, hasTrueTone: true, colorSpace: .p3)

		case .iPadPro12Inch2G:
			return Display(size: .screen12_9Inch, resolution: CGSize(width: 1366, height: 1024), physicalResolution: CGSize(width: 2732, height: 2048), renderedResolution: CGSize(width: 2732, height: 2048), scale: 2.0, density: 264, hasTrueTone: true, colorSpace: .p3)

		case .iPadPro10Inch:
			return Display(size: .screen12_9Inch, resolution: CGSize(width: 1112, height: 834), physicalResolution: CGSize(width: 2224, height: 1668), renderedResolution: CGSize(width: 2224, height: 1668), scale: 2.0, density: 264, hasTrueTone: true, colorSpace: .p3)

		case .iPadMini:
			return Display(size: .screen7_9Inch, resolution: CGSize(width: 1024, height: 768), physicalResolution: CGSize(width: 1024, height: 768), renderedResolution: CGSize(width: 1024, height: 768), scale: 1.0, density: 163, hasTrueTone: false, colorSpace: .sRGB)

		case .iPadMini2,
			 .iPadMini3,
			 .iPadMini4:
			return Display(size: .screen7_9Inch, resolution: CGSize(width: 1024, height: 768), physicalResolution: CGSize(width: 2048, height: 1536), renderedResolution: CGSize(width: 2048, height: 1536), scale: 2.0, density: 326, hasTrueTone: false, colorSpace: .sRGB)

		case let .simulator(model):
			return model.display

// FIXME: Add a way to inspect the Apple Watch displays.
		case .unknown(_),
			 .watch,
			 .watchSeries1,
			 .watchSeries2,
			 .watchSeries3:
			return Display(size: .notApplicable, resolution: CGSize.zero, physicalResolution: CGSize.zero, renderedResolution: CGSize.zero, scale: 0, density: 0, hasTrueTone: false, colorSpace: .sRGB)
		}
	}

}

// MARK: - Comparable protocols

public extension Device {

	/// Checks if the current device is the same as the compared model.
	///
	/// - Parameter to: A model to compare the current device against.
	/// - Returns: True if the device is the same, and false otherwise.
	/// - Throws: An error when comparing incompatible families, product lines or unknown products.
	public func isEqual(to compared: Device) throws -> Bool {
		return try Device.compare(lhs: self, rhs: compared, sign: ==)
	}

	/// Checks if the current device is newer (or same) than the compared model.
	///
	/// - Parameter than: A model to compare the current device against.
	/// - Returns: True if the device is newer or the same, and false if it's older.
	/// - Throws: An error when comparing incompatible families, product lines or unknown products.
	public func isNewerOrEqual(than compared: Device) throws -> Bool {
		return try Device.compare(lhs: self, rhs: compared, sign: >=)
	}

	/// Checks if the current device is older than the compared model.
	///
	/// - Parameter than: A model to compare the current device against.
	/// - Returns: True if the device is older, and false if it's newer or the same.
	/// - Throws: An error when comparing incompatible families, product lines or unknown products.
	public func isOlder(than compared: Device) throws -> Bool {
		return try Device.compare(lhs: self, rhs: compared, sign: <)
	}

	private static func compare(lhs: Device, rhs: Device, sign: ((RawDevice, RawDevice) -> Bool)) throws -> Bool {
		if case .unknown(_) = lhs {
			throw ThingyError.IncomparableUnknownProduct
		}

		if case .unknown(_) = rhs {
			throw ThingyError.IncomparableUnknownProduct
		}

		guard lhs.family == rhs.family
		else {
			throw ThingyError.IncomparableFamilies
		}

		if let lhsProductLine = lhs.productLine,
		   let rhsProductLine = rhs.productLine,
		   lhsProductLine != rhsProductLine {
			throw ThingyError.IncomparableProductLines
		}

		let lhsRaw = RawDevice(family: lhs.family, modelNumber: lhs.lowestNumber)
		let rhsRaw = RawDevice(family: rhs.family, modelNumber: rhs.lowestNumber)

		return sign(lhsRaw, rhsRaw)
	}

}
