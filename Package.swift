// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "swift-adaptagrams",
    platforms: [
        .macOS(.v13),
    ],
    products: [
//        .executable(
//            name: "adaptagrams-testapp",
//            targets: ["adaptagrams-testapp"]),

        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "Adaptagrams",
            type: .dynamic,
            targets: ["Adaptagrams"]),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.

//        .executableTarget(
//            name: "adaptagrams-testapp",
//            dependencies: ["Adaptagrams"],
//            path: "./Sources/adaptagrams-testapp",
//            swiftSettings: [.interoperabilityMode(.Cxx)]
//        ),

        .target(
            name: "Adaptagrams",
            dependencies: ["CXXAvoid", "CXXVPSC", "CXXCola", "CXXTopology", "CXXProject", "CXXDialect"],
            path: "./Sources/Adaptagrams",
            cxxSettings: [
                .headerSearchPath("../../Includes"),
            ],
            swiftSettings: [.interoperabilityMode(.Cxx)]
        ),

        .target(
            name: "CXXAvoid",
            dependencies: [],
            path: "./Sources/CXXAvoid",
            cxxSettings: [
                .headerSearchPath("../../Includes"),
            ]
            
        ),

        .target(
            name: "CXXVPSC",
            dependencies: [],
            path: "./Sources/CXXVPSC",
            cxxSettings: [
                .headerSearchPath("../../Includes"),
            ]
            
        ),

        .target(
            name: "CXXCola",
            dependencies: ["CXXVPSC"],
            path: "./Sources/CXXCola",
            exclude: ["output_svg.cpp"],
            cxxSettings: [
                .headerSearchPath("../../Includes"),
            ]
            
        ),

        .target(
            name: "CXXTopology",
            dependencies: ["CXXAvoid", "CXXVPSC", "CXXCola"],
            path: "./Sources/CXXTopology",
            cxxSettings: [
                .headerSearchPath("../../Includes"),
            ]
            
        ),

        .target(
            name: "CXXProject",
            dependencies: [],
            path: "./Sources/CXXProject",
            cxxSettings: [
                .headerSearchPath("../../Includes"),
            ]
            
        ),

        .target(
            name: "CXXDialect",
            dependencies: ["CXXAvoid", "CXXVPSC", "CXXCola"],
            path: "./Sources/CXXDialect",
            cxxSettings: [
                .headerSearchPath("../../Includes"),
            ]
            
        ),

    ],
    cxxLanguageStandard: .gnucxx11
)
