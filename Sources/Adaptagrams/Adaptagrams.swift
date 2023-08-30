import CXXAvoid
import CXXVPSC
import CXXCola
import CXXTopology
import CXXProject
import CXXDialect

extension Avoid.RouterFlag {
    
    /// This option specifies that the router should maintain the
    /// structures necessary to allow poly-line connector routing.
    public static var polylineRouting: Avoid.RouterFlag { .init(rawValue: 1) }
    
    /// This option specifies that the router should maintain the
    /// structures necessary to allow orthogonal connector routing.
    public static var orthogonalRouting: Avoid.RouterFlag { .init(rawValue: 2) }
}

extension Avoid.RoutingParameter {

    /// This penalty is applied for each segment in the connector 
    /// path beyond the first.  This should always normally be set
    /// when doing orthogonal routing to prevent step-like connector
    /// paths.
    /// - note: This penalty must be set (i.e., be greater than zero) in 
    ///         order for orthogonal connector nudging to be performed, since
    ///         this requires reasonable initial routes. 
    public static var segmentPenalty: Avoid.RoutingParameter { .init(rawValue: 0) }
    
    /// This penalty is applied in its full amount to tight acute 
    /// bends in the connector path.  A smaller portion of the penalty
    /// is applied for slight bends, i.e., where the bend is close to
    /// 180 degrees.  This is useful for polyline routing where there
    /// is some evidence that tighter corners are worse for 
    /// readability, but that slight bends might not be so bad, 
    /// especially when smoothed by curves.
    public static var anglePenalty: Avoid.RoutingParameter { .init(rawValue: 1) }
    
    /// This penalty is applied whenever a connector path crosses 
    /// another connector path.  It takes shared paths into 
    /// consideration and the penalty is only applied if there
    /// is an actual crossing.
    /// - note: This penalty is still experimental!  It is not recommended
    ///         for normal use.
    public static var crossingPenalty: Avoid.RoutingParameter { .init(rawValue: 2) }
    
    /// This penalty is applied whenever a connector path crosses 
    /// a cluster boundary.
    /// - note: This penalty is still experimental!  It is not recommended
    ///         for normal use.
    /// - note: This penalty is very slow.  You can override the method
    ///         Router::shouldContinueTransactionWithProgress() to check
    ///         progress and possibly cancel overly slow transactions.
    public static var clusterCrossingPenalty: Avoid.RoutingParameter { .init(rawValue: 3) }
    
    /// This penalty is applied whenever a connector path shares 
    /// some segments with an immovable portion of an existing 
    /// connector route (such as the first or last segment of a
    /// connector).
    /// - note: This penalty is still experimental!  It is not recommended
    ///         for normal use.
    public static var fixedSharedPathPenalty: Avoid.RoutingParameter { .init(rawValue: 4) }
    
    /// This penalty is applied to port selection choice when the 
    /// other end of the connector being routed does not appear in 
    /// any of the 90 degree visibility cones centered on the
    /// visibility directions for the port.
    /// - note: This penalty is still experimental!  It is not recommended
    ///         for normal use.
    /// - note: This penalty is very slow.  You can override the method
    ///         Router::shouldContinueTransactionWithProgress() to check
    ///         progress and possibly cancel overly slow transactions.
    public static var portDirectionPenalty: Avoid.RoutingParameter { .init(rawValue: 5) }
    
    /// This parameter defines the spacing distance that will be added
    /// to the sides of each shape when determining obstacle sizes for
    /// routing.  This controls how closely connectors pass shapes, and
    /// can be used to prevent connectors overlapping with shape 
    /// boundaries. By default, this distance is set to a value of 0.
    public static var shapeBufferDistance: Avoid.RoutingParameter { .init(rawValue: 6) }
    
    /// This parameter defines the spacing distance that will be used
    /// for nudging apart overlapping corners and line segments of 
    /// connectors.  By default, this distance is set to a value of 4.
    public static var idealNudgingDistance: Avoid.RoutingParameter { .init(rawValue: 7) }

    /// This penalty is applied whenever a connector path travels
    /// in the direction opposite of the destination from the source
    /// endpoint.  By default this penalty is set to zero.  This 
    /// shouldn't be needed in most cases but can be useful if you
    /// use penalties such as ::crossingPenalty which cause connectors
    /// to loop around obstacles.
    public static var reverseDirectionPenalty: Avoid.RoutingParameter { .init(rawValue: 8) }

    /// Used for determining the size of the routing parameter array.
    /// This should always we the last value in the enum.
    public static var lastRoutingParameterMarker: Avoid.RoutingParameter { .init(rawValue: 9) }

}

extension Avoid.RoutingOption {

    /// This option causes the final segments of connectors, which are 
    /// attached to shapes, to be nudged apart.  Usually these segments 
    /// are fixed, since they are considered to be attached to ports.
    ///
    /// Defaults to false.
    ///
    /// This option also causes routes running through the same checkpoint 
    /// to be nudged apart.
    ///
    /// This option has no effect if ::nudgeSharedPathsWithCommonEndPoint is
    /// set to false,
    ///
    /// - note:   This will allow routes to be nudged up to the bounds of shapes.
    ///
    public static var nudgeOrthogonalSegmentsConnectedToShapes: Avoid.RoutingOption { .init(rawValue: 0) }
    
    /// This option causes hyperedge routes to be locally improved fixing
    /// obviously bad paths.  As part of this process libavoid will
    /// effectively move junctions, setting new ideal positions which can be
    /// accessed via JunctionRef::recommendedPosition() for each junction.
    ///
    /// Defaults to true.
    ///
    /// This will not add or remove junctions, so will keep the hyperedge
    /// topology the same.  Better routes can be achieved by enabling the
    /// ::improveHyperedgeRoutesMovingAddingAndDeletingJunctions option.
    ///
    /// If initial sensible positions for junctions in hyperedges are not
    /// known you can register those hyperedges with the HyperedgeRerouter
    /// class for complete rerouting.
    ///
    /// - seealso:   improveHyperedgeRoutesMovingAddingAndDeletingJunctions
    /// - seealso:   Router::hyperedgeRerouter()
    ///
    public static var improveHyperedgeRoutesMovingJunctions: Avoid.RoutingOption { .init(rawValue: 1) }
    
    /// This option penalises and attempts to reroute orthogonal shared 
    /// connector paths terminating at a common junction or shape 
    /// connection pin.  When multiple connector paths enter or leave 
    /// the same side of a junction (or shape pin), the router will 
    /// attempt to reroute these to different sides of the junction or 
    /// different shape pins. 
    ///
    /// Defaults to false.
    ///
    /// This option depends on the ::fixedSharedPathPenalty penalty having 
    /// been set.
    ///
    /// - seealso:     fixedSharedPathPenalty
    /// - note:   This option is still experimental!  It is not recommended
    ///         for normal use.
    ///
    public static var penaliseOrthogonalSharedPathsAtConnEnds: Avoid.RoutingOption { .init(rawValue: 2) }
    
    /// This option can be used to control whether collinear line 
    /// segments that touch just at their ends will be nudged apart.
    /// The overlap will usually be resolved in the other dimension,
    /// so this is not usually required.
    ///
    /// Defaults to false.
    ///
    public static var nudgeOrthogonalTouchingColinearSegments: Avoid.RoutingOption { .init(rawValue: 3) }
    
    /// This option can be used to control whether the router performs
    /// a preprocessing step before orthogonal nudging where is tries
    /// to unify segments and centre them in free space.  This 
    /// generally results in better quality ordering and nudging.
    ///         
    /// Defaults to true.
    ///
    /// You may wish to turn this off for large examples where it
    /// can be very slow and will make little difference.
    ///
    public static var performUnifyingNudgingPreprocessingStep: Avoid.RoutingOption { .init(rawValue: 4) }
    
    /// This option causes hyperedge routes to be locally improved fixing
    /// obviously bad paths.
    /// 
    /// It can cause junctions and connectors to be added or removed from
    /// hyperedges.  To get details of these changes for each connector you can
    /// call Router::newAndDeletedObjectListsFromHyperedgeImprovement().
    ///
    /// As part of this process libavoid will effectively move junctions by
    /// setting new ideal positions for each remaining or added junction, 
    /// which can be read from JunctionRef::recommendedPosition() for each 
    /// junction.
    ///
    /// Defaults to false.
    ///
    /// If set, this option overrides the ::improveHyperedgeRoutesMovingJunctions
    /// option.
    ///
    /// If initial sensible positions for junctions in hyperedges are not
    /// known you can register those hyperedges with the HyperedgeRerouter
    /// class for complete rerouting.
    ///
    /// - seealso:   improveHyperedgeRoutesMovingJunctions
    /// - seealso:   Router::hyperedgeRerouter()
    ///
    public static var improveHyperedgeRoutesMovingAddingAndDeletingJunctions: Avoid.RoutingOption { .init(rawValue: 5) }

    /// This option determines whether intermediate segments of connectors that
    /// are attached to common endpoints will be nudged apart.  Usually these
    /// segments get nudged apart, but you may want to turn this off if you would
    /// prefer that entire shared paths terminating at a common end point should
    /// overlap.
    ///
    /// Defaults to true.
    ///
    public static var nudgeSharedPathsWithCommonEndPoint: Avoid.RoutingOption { .init(rawValue: 6) }


    /// Used for determining the size of the routing options array.
    /// This should always we the last value in the enum.
    public static var lastRoutingOptionMarker: Avoid.RoutingOption { .init(rawValue: 7) }

}

extension Avoid.TransactionPhases {

    /// The orthogonal visibility graph is built by conducting a 
    /// scan in each dimension.  This is the x-dimension.
    public static var orthogonalVisibilityGraphScan: Avoid.TransactionPhases { .init(rawValue: 1) }
    
    /// The orthogonal visibility graph is built by conducting a
    /// scan in each dimension.  This is the y-dimension.
    public static var orthogonalVisibilityGraphScanY: Avoid.TransactionPhases { .init(rawValue: 2) }
    
    /// Initial routes are searched for in the visibility graph.
    public static var routeSearch: Avoid.TransactionPhases { .init(rawValue: 3) }
    
    /// With crossing penalties enabled, crossing detection is
    /// performed to find all crossings.
    public static var crossingDetection: Avoid.TransactionPhases { .init(rawValue: 4) }
    
    /// Crossing connectors are rerouted to search for better routes.
    public static var rerouteSearch: Avoid.TransactionPhases { .init(rawValue: 5) }
    
    /// Orthogonal edge segments are nudged apart in the x-dimension.
    public static var orthogonalNudgingX: Avoid.TransactionPhases { .init(rawValue: 6) }
    
    /// Orthogonal edge segments are nudged apart in the y-dimension.
    public static var orthogonalNudgingY: Avoid.TransactionPhases { .init(rawValue: 7) }
    
    /// Not a real phase, but represents the router is finished (or has
    /// aborted) the transaction and you may interact with is again.
    public static var complete: Avoid.TransactionPhases { .init(rawValue: 8) }

}

extension Avoid.Router {
    
    
    
}
