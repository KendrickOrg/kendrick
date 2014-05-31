as yet unclassified
releaseRoom: aNodeID
	"If a node is available, add this node into the emptyRooms list"
	|stt|
	"Update number of contacts for other nodes in contact with this released node"
	stt := (indList at: aNodeID) currentStatus.
	(nodes at: aNodeID) adjacentNodes do: [ :each|
		(nodes at: each) at: stt remove: 1
		 ].
	emptyRooms add: aNodeID.
	indList at: aNodeID put: nil