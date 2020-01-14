//
// Protocols.swift
// Thingy
//
// Created by Bojan Dimovski on 28.11.16.
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

/// :nodoc:
/// A protocol that describes products (lines and models).
public protocol MarketingProtocol {

	/// The full marketing name of the entity.
	var marketingName: String { get }
}

// MARK: - Hashable and equatable protocols

/// :nodoc:
func ==(lhs: MarketingProtocol, rhs: MarketingProtocol) -> Bool {
	return lhs.marketingName == rhs.marketingName
}

/// :nodoc:
func !=(lhs: MarketingProtocol, rhs: MarketingProtocol) -> Bool {
	return lhs.marketingName != rhs.marketingName
}

/// :nodoc:
/// A dummy protocol used to encompass all product line enums.
public typealias ProductLine = MarketingProtocol
