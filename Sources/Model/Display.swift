//
// Display.swift
// Thingy
//
// Created by Bojan Dimovski on 7/18/17.
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
import UIKit

/// A struct that provides an extended info on the display.
public struct Display {

	/// An enum that describes the display size.
	public enum Size: Float {

		/// - screen38mm: 38mm Apple Watch screen.
		case screen38mm = 38

		/// - screen42mm: 42mm Apple Watch screen.
		case screen42mm = 42

		/// - screen40mm: 40mm Apple Watch screen.
		case screen40mm = 40

		/// - screen44mm: 44mm Apple Watch screen.
		case screen44mm = 44

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

		/// - screen6_1Inch: 6.1in iPhone screen.
		case screen6_1Inch = 6.1

		/// - screen6_5Inch: 6.5in iPhone screen.
		case screen6_5Inch = 6.5

		/// - screen7_9Inch: 7.9in iPad screen.
		case screen7_9Inch = 7.9

		/// - screen9_7Inch: 9.7in iPad screen.
		case screen9_7Inch = 9.7

		/// - screen10_5Inch: 10.2in iPad screen.
		case screen10_2Inch = 10.2

		/// - screen10_5Inch: 10.5in iPad screen.
		case screen10_5Inch = 10.5

		/// - screen10_5Inch: 10.5in iPad screen.
		case screen11Inch = 11

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
		lhs.rawValue < rhs.rawValue
	}

	public static func ==(lhs: Display.Size, rhs: Display.Size) -> Bool {
		lhs.rawValue == rhs.rawValue
	}
}
