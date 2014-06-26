as yet unclassified
release: ind
	"If a node is available, add this node into the emptyRooms list"
	|stt aNodeID|
	"Update number of contacts for other nodes in contact with this released node"
	aNodeID := ind id.
	"stt := (indList at: aNodeID) currentStatus."
	stt := ind currentStatus.
	(nodes at: aNodeID) adjacentNodes do: [ :each|
		(nodes at: each) at: stt remove: 1
		 ].
	self emptyRooms add: aNodeID.
	"Mark this individual is died"
	ind attributes at: #alive put: false.
	"indList at: aNodeID put: nil".
	^ stt