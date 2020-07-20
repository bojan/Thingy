//
//  Device
//  Thingy
//
//  Created by Bojan Dimovski on 19/01/2020.
//  Copyright © 2020 Bojan Dimovski. All rights reserved.
//

import Foundation

public extension Device {

	/// Checks if the current device is the same as the compared model.
	///
	/// - Parameter to: A model to compare the current device against.
	/// - Returns: True if the device is the same, and false otherwise.
	/// - Throws: An error when comparing incompatible families, product lines or unknown products.
	func isEqual(to compared: Device) throws -> Bool {
		try Device.compare(lhs: self, rhs: compared, sign: ==)
	}

	/// Checks if the current device is newer (or same) than the compared model.
	///
	/// - Parameter than: A model to compare the current device against.
	/// - Returns: True if the device is newer or the same, and false if it's older.
	/// - Throws: An error when comparing incompatible families, product lines or unknown products.
	func isNewerOrEqual(than compared: Device) throws -> Bool {
		try Device.compare(lhs: self, rhs: compared, sign: >=)
	}

	/// Checks if the current device is older than the compared model.
	///
	/// - Parameter than: A model to compare the current device against.
	/// - Returns: True if the device is older, and false if it's newer or the same.
	/// - Throws: An error when comparing incompatible families, product lines or unknown products.
	func isOlder(than compared: Device) throws -> Bool {
		try Device.compare(lhs: self, rhs: compared, sign: <)
	}

	internal static func compare(lhs: Device, rhs: Device, sign: (RawDevice, RawDevice) -> Bool) throws -> Bool {
		if case .unknown = lhs {
			throw ThingyError.incomparableUnknownProduct
		}

		if case .unknown = rhs {
			throw ThingyError.incomparableUnknownProduct
		}

		guard lhs.family == rhs.family
		else {
			throw ThingyError.incomparableFamilies
		}

		if let lhsProductLine = lhs.productLine,
		   let rhsProductLine = rhs.productLine,
		   lhsProductLine != rhsProductLine {
			throw ThingyError.incomparableProductLines
		}

		let lhsRaw = RawDevice(family: lhs.family, modelNumber: lhs.lowestNumber)
		let rhsRaw = RawDevice(family: rhs.family, modelNumber: rhs.lowestNumber)

		return sign(lhsRaw, rhsRaw)
	}

}
