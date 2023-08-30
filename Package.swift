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
                "./libavoid/actioninfo.cpp",
                "./libavoid/connectionpin.cpp",
                "./libavoid/connector.cpp",
                "./libavoid/connend.cpp",
                "./libavoid/geometry.cpp",
                "./libavoid/geomtypes.cpp",
                "./libavoid/graph.cpp",
                "./libavoid/hyperedge.cpp",
                "./libavoid/hyperedgeimprover.cpp",
                "./libavoid/hyperedgetree.cpp",
                "./libavoid/junction.cpp",
                "./libavoid/makepath.cpp",
                "./libavoid/mtst.cpp",
                "./libavoid/obstacle.cpp",
                "./libavoid/orthogonal.cpp",
                "./libavoid/router.cpp",
                "./libavoid/scanline.cpp",
                "./libavoid/shape.cpp",
                "./libavoid/timer.cpp",
                "./libavoid/vertices.cpp",
                "./libavoid/viscluster.cpp",
                "./libavoid/visibility.cpp",
                "./libavoid/vpsc.cpp"
            ],
            publicHeadersPath: ".",
            cxxSettings: [
                .headerSearchPath("../../adaptagrams/cola")
            ]
        )
    ]
)
