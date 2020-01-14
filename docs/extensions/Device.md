**EXTENSION**

# `Device`

## Properties
### `family`

```swift
var family: Family
```

> Associated family for each device.

### `productLine`

```swift
var productLine: ProductLine?
```

> Product line of the model, currently supported only for the iPad.

### `marketingName`

```swift
public var marketingName: String
```

> The full marketing name of the model, e.g. "iPhone 7 Plus", "Apple TV 4".

### `displaySize`

```swift
var displaySize: Display.Size
```

> Returns the display size in inches.

### `display`

```swift
var display: Display
```

> Returns an extended info on the display, including all resolutions, scale and density.

## Methods
### `init(identifier:)`

```swift
init?(identifier: String? = nil)
```

> Creates a custom device out of a valid identifier.
>
> If a device cannot be created, returns an unknown device.
>
> - Parameter identifier: A device identifier, e.g. "iPhone9,2", "iPad6,11.", "AppleTV5,3".

#### Parameters

| Name | Description |
| ---- | ----------- |
| identifier | A device identifier, e.g. “iPhone9,2”, “iPad6,11.”, “AppleTV5,3”. |

### `isEqual(to:)`

```swift
func isEqual(to compared: Device) throws -> Bool
```

> Checks if the current device is the same as the compared model.
>
> - Parameter to: A model to compare the current device against.
> - Returns: True if the device is the same, and false otherwise.
> - Throws: An error when comparing incompatible families, product lines or unknown products.

#### Parameters

| Name | Description |
| ---- | ----------- |
| to | A model to compare the current device against. |

### `isNewerOrEqual(than:)`

```swift
func isNewerOrEqual(than compared: Device) throws -> Bool
```

> Checks if the current device is newer (or same) than the compared model.
>
> - Parameter than: A model to compare the current device against.
> - Returns: True if the device is newer or the same, and false if it's older.
> - Throws: An error when comparing incompatible families, product lines or unknown products.

#### Parameters

| Name | Description |
| ---- | ----------- |
| than | A model to compare the current device against. |

### `isOlder(than:)`

```swift
func isOlder(than compared: Device) throws -> Bool
```

> Checks if the current device is older than the compared model.
>
> - Parameter than: A model to compare the current device against.
> - Returns: True if the device is older, and false if it's newer or the same.
> - Throws: An error when comparing incompatible families, product lines or unknown products.

#### Parameters

| Name | Description |
| ---- | ----------- |
| than | A model to compare the current device against. |