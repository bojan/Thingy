//
// RawThingy.swift
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

internal struct RawThingy {

	var major: Int = 0
	var minor: Int = 0
	var family = ""
	var isSimulator = false

	var modelNumber: Double {
		return Double(major) + (Double(minor) / 100)
	}

	init(identifier: String) {
		var identifier = identifier
		isSimulator = (identifier == "x86_64" || identifier == "i386")

		if let simulatorIdentifier = String(validatingUTF8: getenv("SIMULATOR_MODEL_IDENTIFIER")),
			isSimulator {
			identifier = simulatorIdentifier
		}

		let regex = try! NSRegularExpression(pattern: "^(.*)(\\d+)(\\,|\\.)(\\d+)$", options: [.caseInsensitive])

		let modelString = regex.stringByReplacingMatches(in: identifier,
		                                                     options: [],
		                                                     range: NSRange(0..<identifier.characters.count),
		                                                     withTemplate: "$2.$4")

		let modelComponents = modelString.components(separatedBy: ".")
		if let majorString = modelComponents.first,
			let minorString = modelComponents.last {
			major = Int(majorString) ?? 0
			minor = Int(minorString) ?? 0
		}

		family = regex.stringByReplacingMatches(in: identifier,
		                                        options: [],
		                                        range: NSRange(0..<identifier.characters.count),
		                                        withTemplate: "$1")
	}

	var thingy: Thingy? {
		guard let family = Family(rawValue: family)
			else {
				return nil
		}

		var thingy = Thingy(family: family, model: nil, productLine: nil)

		let foundModel = Model.allValues.filter { $0.numbers.contains(modelNumber) }.first
		if let model = foundModel {
			thingy.model = isSimulator ? .simulator(model) : model
		}

		return thingy
	}



}

