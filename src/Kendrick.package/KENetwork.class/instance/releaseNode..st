as yet unclassified
releaseNode: ind
	"If a node is available, add this node into the emptyRooms list"
	|stt aNodeID|
	"Update number of contacts for other nodes in contact with this released node"
	aNodeID := ind id.
	stt := ind currentStatus at: #status.
	(nodes at: aNodeID) adjacentNodes keysDo: [ :each|
		(nodes at: each) atContact: stt remove: 1
		]
