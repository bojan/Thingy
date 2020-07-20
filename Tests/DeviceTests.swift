//
// DeviceTests.swift
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

import XCTest
@testable import Thingy

class DeviceTests: XCTestCase {

	func testResolveValidDevice() {
		let device1: Device? = Device(identifier: "iPad4,1")

		XCTAssertNotNil(device1)
		if let device: Device = device1 {
			XCTAssert(device.marketingName == "iPad Air")
			XCTAssert(device.family == .pad)
			XCTAssertNotNil(device.productLine)
			if let productLine = device.productLine {
				XCTAssert(productLine == Lines.iPad.air)
			}
		}

		let device2 = Device(identifier: "AppleTV5,3")

		XCTAssertNotNil(device2)
		if let device = device2 {
			XCTAssert(device.marketingName == "Apple TV")
			XCTAssert(device.family == .tv)
			XCTAssertNil(device.productLine)
		}

		let device3 = Device(identifier: "iPhone4,1")

		XCTAssertNotNil(device1)
		if let device = device3 {
			XCTAssert(device.marketingName == "iPhone 4S")
			XCTAssert(device.family == .phone)
			XCTAssertNil(device.productLine)
		}

		let device4 = Device(identifier: "iPod7,1")
		if let device = device4 {
			XCTAssert(device.marketingName == "iPod touch (6th generation)")
			XCTAssert(device.family == .pod)
			XCTAssertNil(device.productLine)
		}

		let device5 = Device(identifier: "Watch4,2")
		if let device = device5 {
			XCTAssert(device.marketingName == "Apple Watch Series 4")
			XCTAssert(device.family == .watch)
			XCTAssertNil(device.productLine)
		}
	}

	func testResolveFutureDevice() {
		let device = Device(identifier: "iPad133,7")

		XCTAssertNotNil(device)
		if let device = device {
			XCTAssert(device.family == .pad)
			XCTAssert(device.marketingName == "Unknown iPad")
		}
	}

	func testResolveInvalidDevice() {
		var device = Device(identifier: "iPack1,337")

		XCTAssertNil(device)

		device = Device(identifier: "iPhone1337")
		XCTAssertNil(device)
	}

	func testValidSimulator() {
		let device = Device(identifier: "x86_64")

		XCTAssertNotNil(device)

		if let device = device {
			expectSimulator(actual: device) { device in
				XCTAssertNotNil(device)
			}

			XCTAssert(!device.marketingName.isEmpty)
		}
	}

	func expectSimulator(actual: Device, file: StaticString = #file, line: UInt = #line, test: (Device?) -> Void) {
		guard case let .simulator(model) = actual
		else {
			XCTFail("Expected a simulator, got <\(actual)>", file: file, line: line)
			return
		}

		test(model)
	}

	func testAllDevices() throws {
		Device.allCases.forEach { device in
			XCTAssertNotEqual(device.display, Display(size: .notApplicable, resolution: CGSize.zero, physicalResolution: CGSize.zero, renderedResolution: CGSize.zero, scale: 0, density: 0, hasTrueTone: false, colorSpace: .sRGB))
			XCTAssertNotEqual(device.numbers, [0.0])
		}
	}

}
