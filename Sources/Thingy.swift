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

/// A type that describes the specific device model.
///
/// For iOS devices, only devices supporting iOS 8 are included.

public enum Thingy {

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
	/// - iPhoneSE: iPhone SE.
	case iPhoneSE
	/// - iPhone7: All iPhone 7 variants.
	case iPhone7
	/// - iPhone7Plus: All iPhone 7 Plus variants.
	case iPhone7Plus


	/// - iPad2: All iPad 2 variants.
	case iPad2
	/// - iPad3: All iPad 3 variants.
	case iPad3
	/// - iPad4: All iPad 4 variants.
	case iPad4
	/// - iPad5: All iPad 5 (2017) variants.
	case iPad5
	/// - iPadMini: The original iPad mini in all variants.
	case iPadMini
	/// - iPadMini2: All iPad mini 2 variants.
	case iPadMini2
	/// - iPadMini3: All iPad mini 3 variants.
	case iPadMini3
	/// - iPadMini4: All iPad mini 4 variants.
	case iPadMini4
	/// - iPadAir: The original iPad Air in all variants.
	case iPadAir
	/// - iPadAir2: All iPad Air 2 variants.
	case iPadAir2
	/// - iPadPro12Inch: The 1st generation 12.9 inch iPad Pro in all variants.
	case iPadPro12Inch
	/// - iPadPro9Inch: The 9.7 inch iPad Pro in all variants.
	case iPadPro9Inch
	/// - iPadPro12Inch: The 2nd generation 12.9 inch iPad Pro in all variants.
	case iPadPro12Inch2G
	/// - iPadPro12Inch: The 10.5 inch iPad Pro in all variants.
	case iPadPro10Inch

	/// - iPodTouch5G: All iPod touch 5G variants.
	case iPodTouch5G
	/// - iPodTouch6G: All iPod touch 6G variants.
	case iPodTouch6G

	/// - appleTV4: Apple TV 4.
	case appleTV4

	/// - watch: The original Apple Watch.
	case watch
	/// - watchSeries1: Apple Watch Series 1.
	case watchSeries1
	/// - watchSeries2: Apple Watch Series 2.
	case watchSeries2

	/// - simulator: A simulator for the associated device model.
	indirect case simulator(Thingy)

	/// - unknown: An unknown or a future device within the associated family.
	case unknown(Family)

	/// All real-device values.
	internal static var allValues: [Thingy] = [
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
			.iPodTouch5G,
			.iPodTouch6G,
			.appleTV4,
			.watch,
			.watchSeries1,
			.watchSeries2,
			.iPad2,
			.iPad3,
			.iPad4,
			.iPad5,
			.iPadAir,
			.iPadAir2,
			.iPadPro12Inch,
			.iPadPro9Inch,
			.iPadPro12Inch2G,
			.iPadPro10Inch,
			.iPadMini,
			.iPadMini2,
			.iPadMini3,
			.iPadMini4,
	]

}

extension Thingy {


	/// Inspects the current device.
	public init() {
		self = RawThingy(identifier: nil).thingy!
	}

	/// Creates a custom device out of a valid identifier.
	///
	/// If a device cannot be created, returns an unknown device.
	///
	/// - Parameter identifier: A device identifier, e.g. "iPhone9,2", "iPad6,11.", "AppleTV5,3".
	public init?(identifier: String? = nil) {
		guard let thingy = RawThingy(identifier: identifier).thingy
		else {
			return nil
		}

		self = thingy
	}

}

// MARK: - Errors

enum ThingyError: Error {
	case InvalidIdentifier
	case IncomparableFamilies
	case IncomparableProductLines
	case IncomparableUnknownProduct
}

// MARK: - Family

extension Thingy {

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
			 .iPhone7Plus:
			return .phone

		case .iPodTouch5G,
			 .iPodTouch6G:
			return .pod

		case .appleTV4:
			return .tv

		case .watch,
			 .watchSeries1,
			 .watchSeries2:
			return .watch

		case .iPad2,
			 .iPad3,
			 .iPad4,
			 .iPad5,
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

extension Thingy {

	internal var lowestNumber: Double {
		return numbers.first ?? 0
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
		case .iPhone7:
			return [9.1, 9.3]
		case .iPhone7Plus:
			return [9.2, 9.4]

		case .iPodTouch5G:
			return [5.1]
		case .iPodTouch6G:
			return [7.1]

		case .appleTV4:
			return [5.3]

		case .watch:
			return [1.1, 1.2]
		case .watchSeries1:
			return [2.6, 2.7]
		case .watchSeries2:
			return [2.3, 2.4]

		case .iPad2:
			return [2.1, 2.2, 2.3, 2.4]
		case .iPad3:
			return [3.1, 3.2, 3.3]
		case .iPad4:
			return [3.4, 3.5, 3.6]
		case .iPad5:
			return [6.11, 6.12]
		case .iPadAir:
			return [4.1, 4.2, 4.3]
		case .iPadAir2:
			return [5.3, 5.4]
		case .iPadPro12Inch:
			return [6.7, 6.8]
		case .iPadPro9Inch:
			return [6.3, 6.4]
		case .iPadPro12Inch2G:
			return [7.1, 7.2]
		case .iPadPro10Inch:
			return [7.3, 7.4]

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

extension Thingy {

	/// Product line of the model, currently supported only for the iPad.
	var productLine: ProductLine? {
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

extension Thingy: MarketingProtocol {

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

		case .iPad2:
			return "iPad 2"
		case .iPad3:
			return "iPad 3"
		case .iPad4:
			return "iPad 4"
		case .iPad5:
			return "iPad 5"
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
			return "iPad Pro (12.9 inch)"
		case .iPadPro9Inch:
			return "iPad Pro (9.7 inch)"
		case .iPadPro12Inch2G:
			return "iPad Pro (12.9 inch) (2nd generation)"
		case .iPadPro10Inch:
			return "iPad Pro (10.5 inch)"

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

		case let .simulator(model):
			return NSLocalizedString("Simulator (\(model.marketingName))", comment: "Simulator (\(model.marketingName))")

		case let .unknown(family):
			return NSLocalizedString("Unknown \(family.marketingName)", comment: "Unknown \(family.marketingName)")
		}

	}

}

// MARK: - Comparable protocols

extension Thingy {


	/// Checks if the current device is the same as the compared model.
	///
	/// - Parameter to: A model to compare the current device against.
	/// - Returns: True if the device is the same, and false otherwise.
	/// - Throws: An error when comparing incompatible families, product lines or unknown products.
	public func isEqual(to compared: Thingy) throws -> Bool {
		return try Thingy.compare(lhs: self, rhs: compared, sign: ==)
	}

	/// Checks if the current device is newer (or same) than the compared model.
	///
	/// - Parameter than: A model to compare the current device against.
	/// - Returns: True if the device is newer or the same, and false if it's older.
	/// - Throws: An error when comparing incompatible families, product lines or unknown products.
	public func isNewerOrEqual(than compared: Thingy) throws -> Bool {
		return try Thingy.compare(lhs: self, rhs: compared, sign: >=)
	}

	/// Checks if the current device is older than the compared model.
	///
	/// - Parameter than: A model to compare the current device against.
	/// - Returns: True if the device is older, and false if it's newer or the same.
	/// - Throws: An error when comparing incompatible families, product lines or unknown products.
	public func isOlder(than compared: Thingy) throws -> Bool {
		return try Thingy.compare(lhs: self, rhs: compared, sign: <)
	}

	private static func compare(lhs: Thingy, rhs: Thingy, sign: ((RawThingy, RawThingy) -> Bool)) throws -> Bool {
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

		let lhsRaw = RawThingy(family: lhs.family, modelNumber: lhs.lowestNumber)
		let rhsRaw = RawThingy(family: rhs.family, modelNumber: rhs.lowestNumber)

		return sign(lhsRaw, rhsRaw)
	}

}
