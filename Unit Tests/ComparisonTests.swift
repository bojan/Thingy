//
//  ComparisonTests.swift
//  Thingy
//
//  Created by Bojan Dimovski on 07.4.17.
//  Copyright (c) 2017 Bojan Dimovski. All rights reserved.
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

}
