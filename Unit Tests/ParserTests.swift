//
// ParserTests
// Thingy
//
// Created by Bojan Dimovski on 28.11.16.
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

class ParserTests: XCTestCase {

	func testParsingValidDevice() {
		let identifier = "iPad6,3"

		guard let parsedDevice = Parser.parse(identifier: identifier)
		else {
			XCTFail("Expected a non-nil device.")
			return
		}

		XCTAssertNotNil(parsedDevice.family)
		XCTAssertNotNil(parsedDevice.model)
		XCTAssertNotNil(parsedDevice.productLine)

		if let family = parsedDevice.family {
			XCTAssert(family == .pad)
		}
		else {
			XCTFail("Expected a non-nil family.")
		}

		if let model = parsedDevice.model {
			XCTAssert(model == .iPadPro9Inch)
		}
		else {
			XCTFail("Expected a non-nil model.")
		}

		if let productLine = parsedDevice.productLine as? ProductLine.iPad {
			XCTAssert(productLine == .pro)
		}
	}

	func testParsingInvalidDevice() {
		let identifier = "6,3"

		let parsedDevice = Parser.parse(identifier: identifier)

		XCTAssertNil(parsedDevice)
	}

	func testResolveUnknownDevice() {
		let identifier = "iPad1,337"

		guard let parsedDevice = Parser.parse(identifier: identifier)
			else {
				XCTFail("Expected a non-nil device.")
				return
		}

		XCTAssertNotNil(parsedDevice.family)
		XCTAssertNil(parsedDevice.model)
		XCTAssertNil(parsedDevice.productLine)
	}

}
