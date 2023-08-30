// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "swift-adaptagrams",
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "libavoid",
            type: .dynamic,
            targets: ["libavoid"]),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "libavoid",
            dependencies: [],
            path: "./Sources/libavoid",
            sources: [
                "./src/actioninfo.cpp",
                "./src/connectionpin.cpp",
                "./src/connector.cpp",
                "./src/connend.cpp",
                "./src/geometry.cpp",
                "./src/geomtypes.cpp",
                "./src/graph.cpp",
                "./src/hyperedge.cpp",
                "./src/hyperedgeimprover.cpp",
                "./src/hyperedgetree.cpp",
                "./src/junction.cpp",
                "./src/makepath.cpp",
                "./src/mtst.cpp",
                "./src/obstacle.cpp",
                "./src/orthogonal.cpp",
                "./src/router.cpp",
                "./src/scanline.cpp",
                "./src/shape.cpp",
                "./src/timer.cpp",
                "./src/vertices.cpp",
                "./src/viscluster.cpp",
                "./src/visibility.cpp",
                "./src/vpsc.cpp"
            ],
            publicHeadersPath: ".",
            cxxSettings: [
                .headerSearchPath("../../adaptagrams/cola")
            ]
        )
    ]
)
