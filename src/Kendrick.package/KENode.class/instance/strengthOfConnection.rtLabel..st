as yet unclassified
strengthOfConnection: adjacentNodeLabel rtLabel: rtLabel
	(adjacentNodes at: adjacentNodeLabel) do: [ :e| 
		(rtLabel includes: e key) ifTrue: [ ^ e value ] ]