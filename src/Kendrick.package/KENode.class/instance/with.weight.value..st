as yet unclassified
with: adjacentNodeID weight: aSymbol value: value
	(adjacentNodes at: adjacentNodeID ifAbsentPut: (OrderedCollection new)) add: (aSymbol->value).
	