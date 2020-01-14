// swift-tools-version:5.0
//
// Package.swift
// Thingy
//
// Created by Bojan Dimovski on 03.4.17.
// Copyright (c) 2017 Bojan Dimovski.
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

import PackageDescription

let package = Package(
    name: "Thingy",
    platforms: [
        .iOS(.v8),
        .tvOS(.v9),
        .watchOS(.v2)
    ],
    products: [
        .library(name: "Thingy", targets: ["Thingy"])
    ],
    dependencies: [],
    targets: [
        .target(
            name: "Thingy",
            path: "Sources"),
		.testTarget(
				name: "ThingyTests",
				dependencies: ["Thingy"],
				path: "Tests"),
    ]
)
