//
// RawDevice.swift
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
