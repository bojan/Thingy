//
// RawDevice.swift
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


import Foundation

/// :nodoc:
internal struct RawDevice {

	var major: Int = 0
	var minor: Int = 0
	var family: Family?
	var isSimulator = false
	private var _identifier: String?

	var modelNumber: Double {
		let factor: Double = minor < 10 ? 10 : 100
		return Double(major) + (Double(minor) / factor)
	}

	init(family: Family, modelNumber: Double) {
		self.init(identifier: "\(family.rawValue)\(modelNumber)")
	}

	init(identifier: String? = nil) {
		var identifier = identifier ?? self.identifier()

		isSimulator = (identifier == "x86_64" || identifier == "i386")

		if let simulatorIdentifier = ProcessInfo.processInfo.environment["SIMULATOR_MODEL_IDENTIFIER"],
			isSimulator {
			identifier = simulatorIdentifier
		}

		guard let regex = try? NSRegularExpression(pattern: "^([a-zA-Z]*)(\\d+)(\\,|\\.)(\\d+)$", options: [.caseInsensitive])
		else {
			return
		}

		let range = NSRange(location: 0, length: identifier.count)
		let rawFamily = regex.stringByReplacingMatches(in: identifier,
													   options: [],
													   range: range,
													   withTemplate: "$1")
		family = Family(rawValue: rawFamily)

		let modelString = regex.stringByReplacingMatches(in: identifier,
														 options: [],
														 range: range,
														 withTemplate: "$2.$4")

		let modelComponents = modelString.components(separatedBy: ".")

		guard let majorString = modelComponents.first,
			let minorString = modelComponents.last
		else {
			return
		}

		major = Int(majorString) ?? 0
		minor = Int(minorString) ?? 0
	}

	internal mutating func identifier() -> String {
		if let _identifier = _identifier {
			return _identifier
		}

		var systemInfo = utsname()
		uname(&systemInfo)
		let machineMirror = Mirror(reflecting: systemInfo.machine)
		let identifier = machineMirror.children.reduce("") { identifier, element in
			guard let value = element.value as? Int8,
				  value != 0
			else {
				return identifier
			}
			return identifier + String(UnicodeScalar(UInt8(value)))
		}

		_identifier = identifier
		return identifier
	}

	var device: Device? {
		guard let family = family
		else {
			return nil
		}

		let foundThingy = Device.allCases.filter {
			$0.numbers.contains(modelNumber) && $0.family == family
		}.first

		guard let thingy = foundThingy
		else {
			return .unknown(family)
		}

		guard !isSimulator
		else {
			return .simulator(thingy)
		}

		return thingy
	}

}

// MARK: - Comparison

/// :nodoc:
extension RawDevice: Comparable {

	public static func <(lhs: RawDevice, rhs: RawDevice) -> Bool {
		guard lhs.family == rhs.family
		else {
			return false
		}

		guard lhs.major >= rhs.major
		else {
			return true
		}

		return lhs.major == rhs.major && lhs.minor < rhs.minor
	}

	public static func ==(lhs: RawDevice, rhs: RawDevice) -> Bool {
		return lhs.major == rhs.major &&
			   lhs.minor == rhs.minor &&
			   lhs.family == rhs.family
	}

}
