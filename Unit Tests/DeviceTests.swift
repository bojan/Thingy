//
// DeviceTests.swift
// Device
//
// Created by Bojan Dimovski on 21.11.16.
// Copyright © 2016 Bojan Dimovski. All rights reserved.
//


import XCTest
@testable import Device

class DeviceTests: XCTestCase {

	func testDefaultDeviceIdentifier() {
		var device = Device()
		let identifier = device.identifier()
		XCTAssertFalse(identifier.isEmpty)
	}

	func testResolveMarketingNameValid() {
		let device = Device(identifier: "iPad6,3")

		XCTAssert(device.marketingName == "iPad Pro 9.7in")
	}

	func testResolveMarketingNameWithoutModel() {
		let device = Device(identifier: "iPad1,337")

		XCTAssert(device.marketingName == "Unknown iPad")
	}

	func testResolveMarketingNameUnknownDevice() {
		let device = Device(identifier: "iPack1,337")

		XCTAssert(device.marketingName == "Unknown Device")
	}
}
