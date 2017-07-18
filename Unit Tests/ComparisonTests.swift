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
		let device = Thingy(identifier: "iPad4,9")
		let comparisonModel = Thingy.iPadMini3

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
		let device = Thingy.iPadMini4
		let comparisonModel = Thingy.iPadMini3

		do {
			let result = try device.isNewerOrEqual(than: comparisonModel)
			XCTAssert(result)
		}
		catch {
			XCTFail("The devices are incompatible.")
		}
	}

	func testCompareDeviceIsOlder() {
		let device = Thingy.iPadPro12Inch
		let comparisonModel = Thingy.iPadPro10Inch

		do {
			let result = try device.isOlder(than: comparisonModel)
			XCTAssert(result)
		}
		catch {
			XCTFail("The devices are incompatible.")
		}
	}

	func testCompareIncompatibleDevices() {
		var lhs = Thingy.unknown(.pad)
		var rhs = Thingy.iPadPro10Inch

		XCTAssertThrows(expression: try lhs.isEqual(to: rhs))

		lhs = Thingy.iPadPro12Inch2G
		rhs = Thingy.unknown(.pad)

		XCTAssertThrows(expression: try lhs.isEqual(to: rhs))

		lhs = Thingy.iPadPro12Inch2G
		rhs = Thingy.iPad5

		XCTAssertThrows(expression: try lhs.isEqual(to: rhs))

		lhs = Thingy.iPhone7
		rhs = Thingy.appleTV4

		XCTAssertThrows(expression: try lhs.isEqual(to: rhs))
	}

}
