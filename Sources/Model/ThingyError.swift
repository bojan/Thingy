//
//  ThingyError
//  Thingy
//
//  Created by Bojan Dimovski on 19/01/2020.
//  Copyright © 2020 Bojan Dimovski. All rights reserved.
//

import Foundation

/// Errors thrown by Thingy.

public enum ThingyError: Error {
	/// - An error thrown when devices of different families get compared.
	case incomparableFamilies
	/// - An error thrown when devices from different product lines get compared.
	case incomparableProductLines
	/// - An error thrown when an unknown device gets compared.
	case incomparableUnknownProduct
}
