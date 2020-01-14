//
// RawDeviceTests
// Thingy
//
// Created by Bojan Dimovski on 28.11.16.
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

import XCTest
@testable import Thingy

class RawDeviceTests: XCTestCase {
	func testParsingValidDevice() {
		var device = RawDevice(identifier: "iPad6,3")

		XCTAssertNotNil(device.family)
		if let family = device.family {
			XCTAssert(family == .pad)
		}

		XCTAssert(device.major == 6)
		XCTAssert(device.minor == 3)
		XCTAssertEqual(device.modelNumber, 6.3)

		device = RawDevice(identifier: "iPad10,10")
		XCTAssert(device.major == 10)
		XCTAssert(device.minor == 10)
		XCTAssertEqual(device.modelNumber, 10.10)
	}

	func testSimulatorDevice() {
		let device = RawDevice(identifier: nil)
		XCTAssertNotNil(device)
		XCTAssertTrue(device.isSimulator)
	}

	func testParsingInvalidDevice() {
		var device = RawDevice(identifier: "6,3")

		XCTAssertNil(device.family)
		XCTAssert(device.major == 6)
		XCTAssert(device.minor == 3)
		XCTAssertEqual(device.modelNumber, 6.3)

		device = RawDevice(identifier: "foo")

		XCTAssertNil(device.family)
		XCTAssert(device.major == 0)
		XCTAssert(device.minor == 0)
		XCTAssertEqual(device.modelNumber, 0)
	}

	func testParsingFutureDevice() {
		let identifier = "iPhone133,7"

		let rawDevice = RawDevice(identifier: identifier)

		XCTAssertNotNil(rawDevice.family)
		if let family = rawDevice.family {
			XCTAssert(family == .phone)
		}

		XCTAssert(rawDevice.major == 133)
		XCTAssert(rawDevice.minor == 7)
	}

	func testRawDeviceComparison() {
		XCTAssertFalse(RawDevice(family: .pad, modelNumber: 0.0) < RawDevice(family: .phone, modelNumber: 0.0))
		XCTAssertTrue(RawDevice(family: .pad, modelNumber: 1.2) < RawDevice(family: .pad, modelNumber: 1.3))
	}

}
