//
// ThingyTests.swift
// Thingy
//
// Created by Bojan Dimovski on 21.11.16.
// Copyright © 2016 Bojan Dimovski. All rights reserved.
//


import XCTest
@testable import Thingy

class ThingyTests: XCTestCase {

	func testDefaultDeviceIdentifier() {
		var device = Thingy()
		let identifier = device.identifier()
		XCTAssertFalse(identifier.isEmpty)
	}

	func testResolveMarketingNameValid() {
		let device = Thingy(identifier: "iPad6,3")

		XCTAssert(device.marketingName == "iPad Pro 9.7in")
	}

	func testResolveMarketingNameWithoutModel() {
		let device = Thingy(identifier: "iPad1,337")

		XCTAssert(device.marketingName == "Unknown iPad")
	}

	func testResolveMarketingNameUnknownDevice() {
		let device = Thingy(identifier: "iPack1,337")

		XCTAssert(device.marketingName == "Unknown Device")
	}

	func testSimulator() {
		let device = Thingy(identifier: "x86_64")

		XCTAssertNotNil(device.model)

		if let model = device.model {
			expectSimulator(actual: model) { model in
				 XCTAssertNotNil(model)
			}
		}

	}

	func expectSimulator(actual: Model, file: StaticString = #file, line: UInt = #line, test: (Model?) -> Void) {
		guard case let .simulator(model) = actual
			else {
				XCTFail("Expected a simulator, got <\(actual)>", file: file, line: line)
				return
		}

		test(model)
	}

}
