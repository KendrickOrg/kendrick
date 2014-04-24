accessing
weightOf: adjacentNodeID
	^ weights at: (adjacentNodes indexOf: adjacentNodeID ifAbsent: [ ^ 0 ] )