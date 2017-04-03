//
// ThingyTests.swift
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
