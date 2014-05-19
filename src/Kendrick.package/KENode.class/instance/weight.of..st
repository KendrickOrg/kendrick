as yet unclassified
weight: aSymbol of: adjacentNodeID
	|index|
	index := adjacentNodes indexOf: adjacentNodeID.
	index = 0 ifTrue: [ ^ 0 ].
	^ (weights at: aSymbol) at: index.