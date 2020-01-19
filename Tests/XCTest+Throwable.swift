//
//  XCTest+Throwable.swift
//  Thingy
//
//  Created by Bojan Dimovski on 7/18/17.
//  Copyright © 2017 Bojan Dimovski. All rights reserved.
//

import Foundation
import XCTest

func XCTAssertThrows<T>(expression: @autoclosure () throws -> T, _ message: String = "", file: StaticString = #file, line: UInt = #line) {
	do {
		_ = try expression()
		XCTFail("No error to catch! - \(message)", file: file, line: line)
	}
	catch {
	}
}

func XCTAssertNoThrow<T>(expression: @autoclosure () throws -> T, _ message: String = "", file: StaticString = #file, line: UInt = #line) {
	do {
		_ = try expression()
	}
	catch let error {
		XCTFail("Caught error: \(error) - \(message)", file: file, line: line)
	}
}
