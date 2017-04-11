//
// Thingy.swift
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

/// Thingy is the main type used to inspect and identify your current or custom device.
///
/// It exposes properties such as the device family, model or marketing name.
///
/// Besides the device properties it provides a light-weight, yet powerful device comparison.

public struct Thingy {

	/// Specific device model.
	public var model: Model?

	/// General device family.
	public var family: Family?

	/// Specific product line.
	public var productLine: ProductLine?

	fileprivate var _identifier: String?
	fileprivate var _rawValue: RawThingy?

	/// Inspects your current device if the identifier is omitted, or creates a custom device out of a valid identifier.
	///
	/// - Parameter identifier: A device identifier, e.g. "iPhone9,2", "iPad6,11.", "AppleTV5,3".
	public init(identifier: String? = nil) {
		let identifier = identifier ?? self.identifier()

		let rawThingy = RawThingy(identifier: identifier)
		if let thingy = rawThingy.thingy {
			self = thingy
			_rawValue = rawThingy
		}
	}

}

// MARK: - Device identification

internal extension Thingy {

	/// Extracts the device identifier from low-level APIs.
	///
	/// - Returns: A device identifier, e.g. "iPhone9,2", "iPad6,11", "AppleTV5,3".
	internal mutating func identifier() -> String {
		guard _identifier == nil
		else {
			return _identifier!
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

	/// Initializes a parsed device using all the properties.
	///
	/// - Parameters:
	///   - family: A device family.
	///   - model: A device model.
	///   - productLine: A product line.
	init(family: Family?, model: Model?, productLine: ProductLine?) {
		self.family = family
		self.model = model
		self.productLine = productLine
		self._identifier = identifier()
	}
}

// MARK: - Marketing protocol

extension Thingy: MarketingProtocol {

	/// The marketing name of the device.
	///
	/// In case of future or undetectable devices the device is marked as e.g. "Unknown iPhone" or "Unknown Device".
	public var marketingName: String {
		guard
				let model = model
		else {
			if let family = family?.marketingName {
				return NSLocalizedString("Unknown \(family)", comment: "Unknown \(family)")
			}

			return NSLocalizedString("Unknown Device", comment: "Unknown Device")
		}

		return model.marketingName
	}

}
