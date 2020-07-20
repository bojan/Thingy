//
//  Device
//  Thingy
//
//  Created by Bojan Dimovski on 19/01/2020.
//  Copyright © 2020 Bojan Dimovski. All rights reserved.
//

import Foundation

public extension Device {

	/// Returns the display size in inches.
	var displaySize: Display.Size {
		display.size
	}

	/// Returns an extended info on the display, including all resolutions, scale and density.
	var display: Display {
		switch self {
		case .iPhone4S:
			return Display(size: .screen3_5Inch, resolution: CGSize(width: 320, height: 480), physicalResolution: CGSize(width: 640, height: 960), renderedResolution: CGSize(width: 640, height: 960), scale: 2.0, density: 326, hasTrueTone: false, colorSpace: .sRGB)

		case .iPhone5,
		     .iPhone5c,
		     .iPhone5s,
		     .iPhoneSE,
		     .iPodTouch5G,
		     .iPodTouch6G,
		     .iPodTouch7G:
			return Display(size: .screen4Inch, resolution: CGSize(width: 320, height: 568), physicalResolution: CGSize(width: 640, height: 1136), renderedResolution: CGSize(width: 640, height: 1136), scale: 2.0, density: 326, hasTrueTone: false, colorSpace: .sRGB)

		case .iPhone6,
		     .iPhone6s:
			return Display(size: .screen4_7Inch, resolution: CGSize(width: 375, height: 667), physicalResolution: CGSize(width: 750, height: 1334), renderedResolution: CGSize(width: 750, height: 1334), scale: 2.0, density: 326, hasTrueTone: false, colorSpace: .sRGB)

		case .iPhone7:
			return Display(size: .screen4_7Inch, resolution: CGSize(width: 375, height: 667), physicalResolution: CGSize(width: 750, height: 1334), renderedResolution: CGSize(width: 750, height: 1334), scale: 2.0, density: 326, hasTrueTone: false, colorSpace: .p3)

		case .iPhone8,
		     .iPhoneSE2G:
			return Display(size: .screen4_7Inch, resolution: CGSize(width: 375, height: 667), physicalResolution: CGSize(width: 750, height: 1334), renderedResolution: CGSize(width: 750, height: 1334), scale: 2.0, density: 326, hasTrueTone: true, colorSpace: .p3)

		case .iPhone6Plus,
		     .iPhone6sPlus:
			return Display(size: .screen5_5Inch, resolution: CGSize(width: 414, height: 736), physicalResolution: CGSize(width: 1080, height: 1920), renderedResolution: CGSize(width: 1242, height: 2208), scale: 3.0, density: 401, hasTrueTone: false, colorSpace: .sRGB)

		case .iPhone7Plus:
			return Display(size: .screen5_5Inch, resolution: CGSize(width: 414, height: 736), physicalResolution: CGSize(width: 1080, height: 1920), renderedResolution: CGSize(width: 1242, height: 2208), scale: 3.0, density: 401, hasTrueTone: false, colorSpace: .p3)

		case .iPhone8Plus:
			return Display(size: .screen5_5Inch, resolution: CGSize(width: 414, height: 736), physicalResolution: CGSize(width: 1080, height: 1920), renderedResolution: CGSize(width: 1242, height: 2208), scale: 3.0, density: 401, hasTrueTone: true, colorSpace: .p3)

		case .iPhoneX, .iPhoneXS, .iPhone11Pro:
			return Display(size: .screen5_8Inch, resolution: CGSize(width: 375, height: 812), physicalResolution: CGSize(width: 1125, height: 2436), renderedResolution: CGSize(width: 1125, height: 2436), scale: 3.0, density: 458, hasTrueTone: true, colorSpace: .p3)

		case .iPhoneXR, .iPhone11:
			return Display(size: .screen6_1Inch, resolution: CGSize(width: 414, height: 896), physicalResolution: CGSize(width: 828, height: 1792), renderedResolution: CGSize(width: 828, height: 1792), scale: 2.0, density: 326, hasTrueTone: true, colorSpace: .p3)

		case .iPhoneXSMax, .iPhone11ProMax:
			return Display(size: .screen6_5Inch, resolution: CGSize(width: 414, height: 896), physicalResolution: CGSize(width: 1242, height: 2688), renderedResolution: CGSize(width: 1242, height: 2688), scale: 3.0, density: 458, hasTrueTone: true, colorSpace: .p3)

		case .appleTV4:
			return Display(size: .notApplicable, resolution: CGSize(width: 1920, height: 1080), physicalResolution: CGSize(width: 1920, height: 1080), renderedResolution: CGSize(width: 1920, height: 1080), scale: 1.0, density: 0, hasTrueTone: false, colorSpace: .sRGB)

		case .appleTV4K:
			return Display(size: .notApplicable, resolution: CGSize(width: 3840, height: 2160), physicalResolution: CGSize(width: 3840, height: 2160), renderedResolution: CGSize(width: 3840, height: 2160), scale: 1.0, density: 0, hasTrueTone: false, colorSpace: .sRGB)

		case .iPad2:
			return Display(size: .screen9_7Inch, resolution: CGSize(width: 1024, height: 768), physicalResolution: CGSize(width: 1024, height: 768), renderedResolution: CGSize(width: 1024, height: 768), scale: 1.0, density: 132, hasTrueTone: false, colorSpace: .sRGB)

		case .iPad3,
		     .iPad4,
		     .iPad5,
		     .iPad6,
		     .iPadAir,
		     .iPadAir2:
			return Display(size: .screen9_7Inch, resolution: CGSize(width: 1024, height: 768), physicalResolution: CGSize(width: 2048, height: 1536), renderedResolution: CGSize(width: 2048, height: 1536), scale: 2.0, density: 264, hasTrueTone: false, colorSpace: .sRGB)

		case .iPad7:
			return Display(size: .screen10_2Inch, resolution: CGSize(width: 1080, height: 810), physicalResolution: CGSize(width: 2160, height: 1620), renderedResolution: CGSize(width: 2160, height: 1620), scale: 2.0, density: 264, hasTrueTone: false, colorSpace: .sRGB)

		case .iPadPro12Inch:
			return Display(size: .screen12_9Inch, resolution: CGSize(width: 1366, height: 1024), physicalResolution: CGSize(width: 2732, height: 2048), renderedResolution: CGSize(width: 2732, height: 2048), scale: 2.0, density: 264, hasTrueTone: false, colorSpace: .sRGB)

		case .iPadPro9Inch:
			return Display(size: .screen9_7Inch, resolution: CGSize(width: 1024, height: 768), physicalResolution: CGSize(width: 2048, height: 1536), renderedResolution: CGSize(width: 2048, height: 1536), scale: 2.0, density: 264, hasTrueTone: true, colorSpace: .p3)

		case .iPadPro12Inch2G,
		     .iPadPro12Inch3G:
			return Display(size: .screen12_9Inch, resolution: CGSize(width: 1366, height: 1024), physicalResolution: CGSize(width: 2732, height: 2048), renderedResolution: CGSize(width: 2732, height: 2048), scale: 2.0, density: 264, hasTrueTone: true, colorSpace: .p3)

		case .iPadPro10Inch,
		     .iPadAir3:
			return Display(size: .screen10_5Inch, resolution: CGSize(width: 1112, height: 834), physicalResolution: CGSize(width: 2224, height: 1668), renderedResolution: CGSize(width: 2224, height: 1668), scale: 2.0, density: 264, hasTrueTone: true, colorSpace: .p3)

		case .iPadPro11Inch:
			return Display(size: .screen11Inch, resolution: CGSize(width: 1194, height: 834), physicalResolution: CGSize(width: 2388, height: 1668), renderedResolution: CGSize(width: 2388, height: 2668), scale: 2.0, density: 264, hasTrueTone: true, colorSpace: .p3)

		case .iPadMini:
			return Display(size: .screen7_9Inch, resolution: CGSize(width: 1024, height: 768), physicalResolution: CGSize(width: 1024, height: 768), renderedResolution: CGSize(width: 1024, height: 768), scale: 1.0, density: 163, hasTrueTone: false, colorSpace: .sRGB)

		case .iPadMini2,
		     .iPadMini3,
		     .iPadMini4:
			return Display(size: .screen7_9Inch, resolution: CGSize(width: 1024, height: 768), physicalResolution: CGSize(width: 2048, height: 1536), renderedResolution: CGSize(width: 2048, height: 1536), scale: 2.0, density: 326, hasTrueTone: false, colorSpace: .sRGB)

		case .iPadMini5:
			return Display(size: .screen7_9Inch, resolution: CGSize(width: 1024, height: 768), physicalResolution: CGSize(width: 2048, height: 1536), renderedResolution: CGSize(width: 2048, height: 1536), scale: 2.0, density: 326, hasTrueTone: false, colorSpace: .p3)

		case let .simulator(model):
			return model.display

		case .watch(.screen38mm),
		     .watchSeries1(.screen38mm),
		     .watchSeries2(.screen38mm),
		     .watchSeries3(.screen38mm):
			return Display(size: .screen38mm, resolution: CGSize(width: 170, height: 136), physicalResolution: CGSize(width: 340, height: 272), renderedResolution: CGSize(width: 340, height: 272), scale: 2.0, density: 290, hasTrueTone: false, colorSpace: .sRGB)
		case .watch(.screen42mm),
		     .watchSeries1(.screen42mm),
		     .watchSeries2(.screen42mm),
		     .watchSeries3(.screen42mm):
			return Display(size: .screen42mm, resolution: CGSize(width: 195, height: 156), physicalResolution: CGSize(width: 390, height: 312), renderedResolution: CGSize(width: 390, height: 312), scale: 2.0, density: 303, hasTrueTone: false, colorSpace: .sRGB)
		case .watchSeries4(.screen40mm),
		     .watchSeries5(.screen40mm):
			return Display(size: .screen40mm, resolution: CGSize(width: 197, height: 162), physicalResolution: CGSize(width: 394, height: 324), renderedResolution: CGSize(width: 394, height: 324), scale: 2.0, density: 326, hasTrueTone: false, colorSpace: .sRGB)
		case .watchSeries4(.screen44mm),
		     .watchSeries5(.screen44mm):
			return Display(size: .screen44mm, resolution: CGSize(width: 224, height: 184), physicalResolution: CGSize(width: 448, height: 368), renderedResolution: CGSize(width: 448, height: 368), scale: 2.0, density: 326, hasTrueTone: false, colorSpace: .sRGB)

		default:
			return Display(size: .notApplicable, resolution: CGSize.zero, physicalResolution: CGSize.zero, renderedResolution: CGSize.zero, scale: 0, density: 0, hasTrueTone: false, colorSpace: .sRGB)

		}
	}

}
