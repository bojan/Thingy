//
// Parser.swift
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

/// Parses a model number into a qualified Thingy value.
internal struct Parser {


	/// Parses an identifier and returns a Thingy when successful.
	///
	/// - Parameter identifier: A device identifier, e.g. "iPhone9,2", "iPad6,11.", "AppleTV5,3".
	/// - Returns: A qualified Thingy value or nil.
	static func parse(identifier: String) -> Thingy? {
		var identifier = identifier

		let isSimulator = (identifier == "x86_64" || identifier == "i386")
		if let simulatorIdentifier = String(validatingUTF8: getenv("SIMULATOR_MODEL_IDENTIFIER")),
		   isSimulator {
			var parsedDevice = parse(identifier: simulatorIdentifier)
			parsedDevice?.model = .simulator(parsedDevice?.model)

			return parsedDevice
		}

		let regex = try! NSRegularExpression(pattern: "^(.*)(\\d+),(\\d+)$", options: [.caseInsensitive])

		let modelString = regex.stringByReplacingMatches(in: identifier,
														 options: [],
														 range: NSRange(0..<identifier.characters.count),
														 withTemplate: "$2.$3")

		let rawModel = Double(modelString) ?? 0

		let rawFamily = regex.stringByReplacingMatches(in: identifier,
													   options: [],
													   range: NSRange(0..<identifier.characters.count),
													   withTemplate: "$1")

		return resolveDevice(rawFamily: rawFamily, rawModel: rawModel)
	}


	/// Resolves the device out of the raw family and model values.
	///
	/// - Parameters:
	///   - rawFamily: A raw family string, e.g. "iphone", "ipad".
	///   - rawModel: A raw model number, e.g. 9.2, 6.11, 5.3.
	/// - Returns: A fully resolved Thingy or nil.
	private static func resolveDevice(rawFamily: String, rawModel: Double) -> Thingy? {
		guard let family = Family(rawValue: rawFamily)
		else {
			return nil
		}

		var parsedDevice = Thingy(family: family, model: nil, productLine: nil)

		let model = Model.allValues.filter { $0.numbers.contains(rawModel) }.first
		parsedDevice.model = model

		return parsedDevice
	}

}
