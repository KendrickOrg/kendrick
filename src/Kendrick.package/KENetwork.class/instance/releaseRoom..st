as yet unclassified
releaseRoom: aNodeID
	"If a node is available, add this node into the emptyRooms list"
	emptyRooms ifNil: [ emptyRooms := OrderedCollection new ].
	emptyRooms add: aNodeID