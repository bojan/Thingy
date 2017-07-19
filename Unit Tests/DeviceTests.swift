//
// DeviceTests.swift
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
			XCTAssert(device.marketingName == "Apple TV 4")
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

}
