//
// DeviceMap
// Device
//
// Created by Bojan Dimovski on 24.11.16.
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

internal typealias ModelMap = [Model: [Double]]
internal typealias FamilyMap = [Family: ModelMap]

internal struct DeviceMap {

	static var map: FamilyMap = [
			.phone: [
					.iPhone4S: [4.1],
					.iPhone5: [5.1, 5.2],
					.iPhone5c: [5.3, 5.4],
					.iPhone5s: [6.1, 6.2],
					.iPhone6: [7.2],
					.iPhone6Plus: [7.1],
					.iPhone6s: [8.1],
					.iPhone6sPlus: [8.2],
					.iPhoneSE: [8.4],
					.iPhone7: [9.1, 9.3],
					.iPhone7Plus: [9.2, 9.4],
			],
			.pod: [
					.iPodTouch5G: [5.1],
					.iPodTouch6G: [7.1],
			],
			.tv: [
					.appleTV4: [5.3],
			],
			.watch: [
					.watch: [1.1, 1.2],
					.watchSeries1: [2.6, 2.7],
					.watchSeries2: [2.3, 2.4],
			],
			.pad(.regular): [
					.iPad2: [2.1, 2.2, 2.3, 2.4],
					.iPad3: [3.1, 3.2, 3.3],
					.iPad4: [3.4, 3.5, 3.6]
			],
			.pad(.air): [
					.iPadAir: [4.1, 4.2, 4.3],
					.iPadAir2: [5.3, 5.4]
			],
			.pad(.air): [
					.iPadPro12Inch: [6.7, 6.8],
					.iPadPro9Inch: [6.3, 6.4]
			],
			.pad(.mini): [
					.iPadMini: [2.5, 2.6, 2.7],
					.iPadMini2: [4.4, 4.5, 4.6],
					.iPadMini3: [4.7, 4.8, 4.9],
					.iPadMini4: [5.1, 5.2],
			]
	]

}
