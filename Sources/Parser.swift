//
// Parser.swift
// Device
//
// Created by Bojan Dimovski on 21.11.16.
// Copyright (c) 2016 Bojan Dimovski.
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

//
// Parser.swift
// Device
//
// Created by Bojan Dimovski on 21.11.16.
// Copyright (c) 2016 Bojan Dimovski.
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

internal struct Parser {

	static func parse(identifier: String) -> Device? {
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
		                                                 range: NSRange(0 ..< identifier.characters.count),
		                                                 withTemplate: "$2.$3")

		let modelNumber = Double(modelString) ?? 0

		let familyString = regex.stringByReplacingMatches(in: identifier,
		                                                  options: [],
		                                                  range: NSRange(0 ..< identifier.characters.count),
		                                                  withTemplate: "$1")

		return resolveDevice(familyString: familyString, modelNumber: modelNumber)
	}

	private static func resolveDevice(familyString: String, modelNumber: Double) -> Device? {
		guard let family = Family(rawValue: familyString),
			let familyMap = DeviceMap.families[family]
			else {
				return nil
		}

		var parsedDevice = Device(family: family, model: nil, productLine: nil)

		let model = familyMap.map(resolveModel(modelNumber: modelNumber)).flatMap { $0 }.first

		parsedDevice.model = model

		if let model = model {
			parsedDevice.productLine = DeviceMap.productLines[model]
		}

		return parsedDevice
	}

	private static func resolveModel(modelNumber: Double) -> (_ key: Model, _ value: [Double]) -> Model? {
		return { key, value in
			let filteredModel = value.filter {
				$0 == modelNumber
				}.first
			
			guard let _ = filteredModel
				else {
					return nil
			}
			
			return key
		}
	}
	
}
