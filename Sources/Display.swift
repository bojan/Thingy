//
// Display.swift
// Thingy
//
// Created by Bojan Dimovski on 7/18/17.
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
import UIKit

/// A struct that provides an extended info on the display.

public struct Display {

	/// An enum that describes the display size in inches.
	public enum Size: Float {
		/// - screen1_32Inch: Small Apple Watch screen.
		case screen1_32Inch = 1.32

		/// - screen1_5Inch: Big Apple Watch screen.
		case screen1_5Inch = 1.5

		/// - screen3_5Inch: 3.5in iPhone screen.
		case screen3_5Inch = 3.5

		/// - screen4Inch: 4in iPhone/iPod touch screen.
		case screen4Inch = 4

		/// - screen4_7Inch: 4.7in iPhone screen.
		case screen4_7Inch = 4.7

		/// - screen5_5Inch: 5.5in iPhone screen.
		case screen5_5Inch = 5.5

		/// - screen5_8Inch: 5.8in iPhone screen.
		case screen5_8Inch = 5.8

		/// - screen7_9Inch: 7.9in iPad screen.
		case screen7_9Inch = 7.9

		/// - screen9_7Inch: 9.7in iPad screen.
		case screen9_7Inch = 9.7

		/// - screen10_5Inch: 10.5in iPad screen.
		case screen10_5Inch = 10.5

		/// - screen12_9Inch: 12.9in iPad screen.
		case screen12_9Inch = 12.9

		/// - notApplicable: Not applicable, in case of the Apple TV.
		case notApplicable = -1
	}

	/// An enum that describes all color spaces.
	public enum ColorSpace {
		/// - Wide color display (P3)
		case p3

		/// - Full sRGB standard
		case sRGB
	}

	/// Screen size in inches.
	public var size: Size

	/// Resolution of the device.
	public var resolution: CGSize

	/// Full physical resolution of the device, without any down-/up-sampling.
	public var physicalResolution: CGSize

	/// Rendered resolution of the device, with down-/up-sampling.
	public var renderedResolution: CGSize

	/// Screen scale, 1.0 for non-Retina devices.
	public var scale: Float

	/// Density of the display in PPI (pixels-per-inch).
	public var density: Int

	/// True Tone display.
	public var hasTrueTone: Bool

	/// Color space.
	public var colorSpace: ColorSpace
}

// MARK: - Screen size comparison

extension Display.Size: Comparable {
	public static func <(lhs: Display.Size, rhs: Display.Size) -> Bool {
		return lhs.rawValue < rhs.rawValue
	}

	public static func ==(lhs: Display.Size, rhs: Display.Size) -> Bool {
		return lhs.rawValue == rhs.rawValue
	}
}
