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

	func testResolveValidIPad() throws {
		let sut = try XCTUnwrap(Device(identifier: "iPad8,8"))

		XCTAssertEqual(sut.marketingName, "12.9-inch iPad Pro (3rd generation)")
		XCTAssertEqual(sut.family, .pad)

		let productLine = try XCTUnwrap(sut.productLine)
		XCTAssertEqual(productLine.marketingName, Lines.iPad.pro.marketingName)
	}

	func testResolveValidAppleTV() throws {
		let sut = try XCTUnwrap(Device(identifier: "AppleTV6,2"))

		XCTAssertEqual(sut.marketingName, "Apple TV 4K")
		XCTAssertEqual(sut.family, .tv)
		XCTAssertNil(sut.productLine)
	}

	func testResolveValidIPhone() throws {
		let sut = try XCTUnwrap(Device(identifier: "iPhone12,8"))

		XCTAssertEqual(sut.marketingName, "iPhone SE (2020)")
		XCTAssertEqual(sut.family, .phone)

		let productLine = try XCTUnwrap(sut.productLine)
		XCTAssertEqual(productLine.marketingName, Lines.iPhone.se.marketingName)
	}

	func testResolveValidIPod() throws {
		let sut = try XCTUnwrap(Device(identifier: "iPod9,1"))

		XCTAssertEqual(sut.marketingName, "iPod touch (7th generation)")
		XCTAssertEqual(sut.family, .pod)
		XCTAssertNil(sut.productLine)
	}

	func testResolveValidWatch() throws {
		let sut = try XCTUnwrap(Device(identifier: "Watch5,1"))

		XCTAssertEqual(sut.marketingName, "Apple Watch Series 5")
		XCTAssertEqual(sut.family, .watch)
		XCTAssertNil(sut.productLine)
	}


	func testResolveFutureDevice() throws {
		let sut = try XCTUnwrap(Device(identifier: "iPad133,7"))

		XCTAssertEqual(sut.family, .pad)
		XCTAssertEqual(sut.marketingName, "Unknown iPad")
	}

	func testResolveInvalidDevice() {
		var sut = Device(identifier: "iPack133,7")

		XCTAssertNil(sut)

		sut = Device(identifier: "iPhone1337")
		XCTAssertNil(sut)
	}

	func testValidSimulator() throws {
		let sut = try XCTUnwrap(Device(identifier: "x86_64"))

		expectSimulator(actual: sut) {
			XCTAssertNotNil($0)
		}

		XCTAssertFalse(sut.marketingName.isEmpty)
	}

	func testAllDevices() throws {
		Device.allCases.forEach { device in
			XCTAssertNotEqual(device.display, Display(size: .notApplicable, resolution: CGSize.zero, physicalResolution: CGSize.zero, renderedResolution: CGSize.zero, scale: 0, density: 0, hasTrueTone: false, colorSpace: .sRGB))
			XCTAssertNotEqual(device.numbers, [0.0])
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
}
