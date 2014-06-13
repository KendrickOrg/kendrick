as yet unclassified
with: adjacentNodeID weight: aSymbol value: weight function: aBlock
	|temp|
	adjacentNodes add: adjacentNodeID.
	temp := weights at: aSymbol ifAbsent: [ nil ].
	temp ifNil: [ weights at: aSymbol put: (OrderedCollection new) ].
	(weights at: aSymbol) add: (aBlock value: weight). 