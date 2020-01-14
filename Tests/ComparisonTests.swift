//
//  ComparisonTests.swift
//  Thingy
//
//  Created by Bojan Dimovski on 07.4.17.
//  Copyright (c) 2017 Bojan Dimovski. All rights reserved.
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

import XCTest
@testable import Thingy

class ComparisonTests: XCTestCase {

	func testCompareDeviceIsEqual() {
		let device = Device(identifier: "iPad4,9")
		let comparisonModel = Device.iPadMini3

		XCTAssertNotNil(device)
		if let device = device {
			do {
				let result = try device.isEqual(to: comparisonModel)
				XCTAssert(result)
			}
			catch {
				XCTFail("The devices are incompatible.")
			}
		}
	}

	func testCompareDeviceIsNewer() {
		let device = Device.iPadMini4
		let comparisonModel = Device.iPadMini3

		do {
			let result = try device.isNewerOrEqual(than: comparisonModel)
			XCTAssert(result)
		}
		catch {
			XCTFail("The devices are incompatible.")
		}
	}

	func testCompareDeviceIsOlder() {
		let device = Device.iPadPro12Inch
		let comparisonModel = Device.iPadPro10Inch

		do {
			let result = try device.isOlder(than: comparisonModel)
			XCTAssert(result)
		}
		catch {
			XCTFail("The devices are incompatible.")
		}
	}

	func testCompareIncompatibleDevices() {
		var lhs = Device.unknown(.pad)
		var rhs = Device.iPadPro10Inch

		XCTAssertThrows(expression: try lhs.isEqual(to: rhs))

		lhs = Device.iPadPro12Inch2G
		rhs = Device.unknown(.pad)

		XCTAssertThrows(expression: try lhs.isEqual(to: rhs))

		lhs = Device.iPadPro12Inch2G
		rhs = Device.iPad5

		XCTAssertThrows(expression: try lhs.isEqual(to: rhs))

		lhs = Device.iPhone7
		rhs = Device.appleTV4

		XCTAssertThrows(expression: try lhs.isEqual(to: rhs))
	}

	func testCompareScreenSize() {
		var device1 = Device.iPadMini2
		var device2 = Device.iPadPro12Inch2G

		XCTAssertTrue(device1.displaySize < device2.displaySize)

		device1 = Device.iPadMini2
		device2 = Device.iPadMini4

		XCTAssertTrue(device1.displaySize <= device2.displaySize)

		device1 = Device.iPadPro10Inch
		device2 = Device.iPadPro9Inch

		XCTAssertFalse(device1.displaySize < device2.displaySize)

		device1 = Device.iPad3
		device2 = Device.iPad5

		XCTAssertTrue(device1.displaySize == device2.displaySize)

		device1 = Device.iPhoneX
		device2 = Device.iPhone4S

		XCTAssertTrue(device1.displaySize > device2.displaySize)

		device1 = Device.iPhone8Plus
		device2 = Device.iPhone8

		XCTAssertTrue(device1.displaySize >= device2.displaySize)

		device1 = Device.iPhone7
		device2 = Device.iPhone7Plus

		XCTAssertFalse(device1.displaySize > device2.displaySize)
	}
}
