**ENUM**

# `Device`

```swift
public enum Device: CaseIterable
```

> A type that describes the specific device model.
>
> For iOS devices, only devices supporting iOS 8 are included.

## Cases
### `iPhone4S`

```swift
case iPhone4S
```

> - iPhone4S: iPhone 4S.

### `iPhone5`

```swift
case iPhone5
```

> - iPhone5: All iPhone 5 variants.

### `iPhone5s`

```swift
case iPhone5s
```

> - iPhone5s: All iPhone 5s variants.

### `iPhone5c`

```swift
case iPhone5c
```

> - iPhone5c: All iPhone 5c variants.

### `iPhone6`

```swift
case iPhone6
```

> - iPhone6: All iPhone 6 variants.

### `iPhone6Plus`

```swift
case iPhone6Plus
```

> - iPhone6Plus: All iPhone 6 Plus variants.

### `iPhone6s`

```swift
case iPhone6s
```

> - iPhone6s: All iPhone 6s variants.

### `iPhone6sPlus`

```swift
case iPhone6sPlus
```

> - iPhone6sPlus: All iPhone 6s Plus variants.

### `iPhoneSE`

```swift
case iPhoneSE
```

> - iPhoneSE: All iPhone SE variants.

### `iPhone7`

```swift
case iPhone7
```

> - iPhone7: All iPhone 7 variants.

### `iPhone7Plus`

```swift
case iPhone7Plus
```

> - iPhone7Plus: All iPhone 7 Plus variants.

### `iPhone8`

```swift
case iPhone8
```

> - iPhone8: All iPhone 8 variants.

### `iPhone8Plus`

```swift
case iPhone8Plus
```

> - iPhone8Plus: All iPhone 8 Plus variants.

### `iPhoneX`

```swift
case iPhoneX
```

> - iPhoneX: All iPhone X variants.

### `iPhoneXR`

```swift
case iPhoneXR
```

> - iPhoneXR: All iPhone XR variants.

### `iPhoneXS`

```swift
case iPhoneXS
```

> - iPhoneXS: All iPhone XS variants.

### `iPhoneXSMax`

```swift
case iPhoneXSMax
```

> - iPhoneXSMax: All iPhone XS Max variants.

### `iPhone11`

```swift
case iPhone11
```

> - iPhone11: All iPhone 11 variants.

### `iPhone11Pro`

```swift
case iPhone11Pro
```

> - iPhone11Pro: All iPhone 11 Pro variants.

### `iPhone11ProMax`

```swift
case iPhone11ProMax
```

> - iPhone11ProMax: All iPhone 11 Pro Max variants.

### `iPad2`

```swift
case iPad2
```

> - iPad2: All iPad 2 variants.

### `iPad3`

```swift
case iPad3
```

> - iPad3: All iPad 3 variants.

### `iPad4`

```swift
case iPad4
```

> - iPad4: All iPad 4 variants.

### `iPad5`

```swift
case iPad5
```

> - iPad5: All iPad (2017) variants.

### `iPad6`

```swift
case iPad6
```

> - iPad6: All iPad (2018) variants.

### `iPad7`

```swift
case iPad7
```

> - iPad7: All iPad (2019) variants.

### `iPadMini`

```swift
case iPadMini
```

> - iPadMini: The original iPad mini in all variants.

### `iPadMini2`

```swift
case iPadMini2
```

> - iPadMini2: All iPad mini 2 variants.

### `iPadMini3`

```swift
case iPadMini3
```

> - iPadMini3: All iPad mini 3 variants.

### `iPadMini4`

```swift
case iPadMini4
```

> - iPadMini4: All iPad mini 4 variants.

### `iPadMini5`

```swift
case iPadMini5
```

> - iPadMini5: All iPad mini 5 variants.

### `iPadAir`

```swift
case iPadAir
```

> - iPadAir: The original iPad Air in all variants.

### `iPadAir2`

```swift
case iPadAir2
```

> - iPadAir2: All iPad Air 2 variants.

### `iPadAir3`

```swift
case iPadAir3
```

> - iPadAir3: All iPad Air 3 variants.

### `iPadPro12Inch`

```swift
case iPadPro12Inch
```

> - iPadPro12Inch: The 1st generation 12.9 inch iPad Pro in all variants.

### `iPadPro9Inch`

```swift
case iPadPro9Inch
```

> - iPadPro9Inch: The 9.7 inch iPad Pro in all variants.

### `iPadPro12Inch2G`

```swift
case iPadPro12Inch2G
```

> - iPadPro12Inch2G: The 2nd generation 12 inch iPad Pro in all variants.

### `iPadPro10Inch`

```swift
case iPadPro10Inch
```

> - iPadPro10Inch: The 10.5 inch iPad Pro in all variants.

### `iPadPro12Inch3G`

```swift
case iPadPro12Inch3G
```

> - iPadPro12Inch3G: The 3rd generation 12.9 inch iPad Pro in all variants.

### `iPadPro11Inch`

```swift
case iPadPro11Inch
```

> - iPadPro11Inch: The 11 inch iPad Pro in all variants.

### `iPodTouch5G`

```swift
case iPodTouch5G
```

> - iPodTouch5G: All iPod touch 5G variants.

### `iPodTouch6G`

```swift
case iPodTouch6G
```

> - iPodTouch6G: All iPod touch 6G variants.

### `iPodTouch7G`

```swift
case iPodTouch7G
```

> - iPodTouch7G: All iPod touch 7G variants.

### `appleTV4`

```swift
case appleTV4
```

> - appleTV4: Apple TV 4.

### `appleTV4K`

```swift
case appleTV4K
```

> - appleTV4K: Apple TV 4K.

### `watch(_:)`

```swift
case watch(Display.Size)
```

> - watch: The original Apple Watch.

### `watchSeries1(_:)`

```swift
case watchSeries1(Display.Size)
```

> - watchSeries1: Apple Watch Series 1.

### `watchSeries2(_:)`

```swift
case watchSeries2(Display.Size)
```

> - watchSeries2: Apple Watch Series 2.

### `watchSeries3(_:)`

```swift
case watchSeries3(Display.Size)
```

> - watchSeries3: Apple Watch Series 3.

### `watchSeries4(_:)`

```swift
case watchSeries4(Display.Size)
```

> - watchSeries4: Apple Watch Series 4.

### `watchSeries5(_:)`

```swift
case watchSeries5(Display.Size)
```

> - watchSeries5: Apple Watch Series 5.

### `simulator(_:)`

```swift
indirect case simulator(Device)
```

> - simulator: A simulator for the associated device model.

### `unknown(_:)`

```swift
case unknown(Family)
```

> - unknown: An unknown or a future device within the associated family.
