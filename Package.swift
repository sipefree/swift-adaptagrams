// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "swift-adaptagrams",
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "Adaptagrams",
            type: .dynamic,
            targets: ["Adaptagrams"]),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.

        .target(
            name: "Adaptagrams",
            dependencies: [],
            path: "./Sources/Adaptagrams",
            sources: [
                "./libavoid/obstacle.cpp",
                "./libavoid/actioninfo.cpp",
                "./libavoid/mtst.cpp",
                "./libavoid/geometry.cpp",
                "./libavoid/hyperedgeimprover.cpp",
                "./libavoid/makepath.cpp",
                "./libavoid/junction.cpp",
                "./libavoid/geomtypes.cpp",
                "./libavoid/orthogonal.cpp",
                "./libavoid/hyperedge.cpp",
                "./libavoid/graph.cpp",
                "./libavoid/timer.cpp",
                "./libavoid/router.cpp",
                "./libavoid/scanline.cpp",
                "./libavoid/vpsc.cpp",
                "./libavoid/viscluster.cpp",
                "./libavoid/visibility.cpp",
                "./libavoid/connend.cpp",
                "./libavoid/shape.cpp",
                "./libavoid/connector.cpp",
                "./libavoid/vertices.cpp",
                "./libavoid/connectionpin.cpp",
                "./libavoid/hyperedgetree.cpp",
                "./libtopology/compute_forces.cpp",
                "./libtopology/resize.cpp",
                "./libtopology/orthogonal_topology.cpp",
                "./libtopology/cola_topology_addon.cpp",
                "./libtopology/topology_graph.cpp",
                "./libtopology/topology_constraints.cpp",
                "./libtopology/topology_constraints_constructor.cpp",
                "./libdialect/nexes.cpp",
                "./libdialect/nodes.cpp",
                "./libdialect/logging.cpp",
                "./libdialect/peeling.cpp",
                "./libdialect/trees.cpp",
                "./libdialect/faces.cpp",
                "./libdialect/planarise.cpp",
                "./libdialect/routing.cpp",
                "./libdialect/nearalign.cpp",
                "./libdialect/sides.cpp",
                "./libdialect/chains.cpp",
                "./libdialect/nodeconfig.cpp",
                "./libdialect/quadaction.cpp",
                "./libdialect/expansion.cpp",
                "./libdialect/graphs.cpp",
                "./libdialect/aca.cpp",
                "./libdialect/qalookup.cpp",
                "./libdialect/constraints.cpp",
                "./libdialect/io.cpp",
                "./libdialect/ortho.cpp",
                "./libdialect/bendseqlookup.cpp",
                "./libdialect/treeplacement.cpp",
                "./libdialect/hola.cpp",
                "./libdialect/edges.cpp",
                "./libproject/util.cpp",
                "./libproject/project.cpp",
                "./libvpsc/cbuffer.cpp",
                "./libvpsc/constraint.cpp",
                "./libvpsc/block.cpp",
                "./libvpsc/solve_VPSC.cpp",
                "./libvpsc/rectangle.cpp",
                "./libvpsc/variable.cpp",
                "./libvpsc/blocks.cpp",
                "./libcola/colafd.cpp",
                "./libcola/pseudorandom.cpp",
                "./libcola/box.cpp",
                "./libcola/compound_constraints.cpp",
                "./libcola/shapepair.cpp",
                "./libcola/cola.cpp",
                "./libcola/gradient_projection.cpp",
                "./libcola/straightener.cpp",
                "./libcola/cc_nonoverlapconstraints.cpp",
                "./libcola/conjugate_gradient.cpp",
                "./libcola/cluster.cpp",
                "./libcola/cc_clustercontainmentconstraints.cpp",
                "./libcola/connected_components.cpp",
                "./libcola/convex_hull.cpp"
            ],
            publicHeadersPath: ".",
            cxxSettings: [
                .headerSearchPath("."),
                
            ]
        ),
//        .testTarget(
//            name: "AdaptagramsTests",
//            dependencies: ["Adaptagrams"],
//            path: "Tests/AdaptagramsTests",
//            swiftSettings: [.interoperabilityMode(.Cxx)]
//        )
    ],
    cxxLanguageStandard: .cxx11
)
