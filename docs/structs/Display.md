**STRUCT**

# `Display`

```swift
public struct Display
```

> A struct that provides an extended info on the display.

## Properties
### `size`

```swift
public var size: Size
```

> Screen size in inches.

### `resolution`

```swift
public var resolution: CGSize
```

> Resolution of the device.

### `physicalResolution`

```swift
public var physicalResolution: CGSize
```

> Full physical resolution of the device, without any down-/up-sampling.

### `renderedResolution`

```swift
public var renderedResolution: CGSize
```

> Rendered resolution of the device, with down-/up-sampling.

### `scale`

```swift
public var scale: Float
```

> Screen scale, 1.0 for non-Retina devices.

### `density`

```swift
public var density: Int
```

> Density of the display in PPI (pixels-per-inch).

### `hasTrueTone`

```swift
public var hasTrueTone: Bool
```

> True Tone display.

### `colorSpace`

```swift
public var colorSpace: ColorSpace
```

> Color space.
