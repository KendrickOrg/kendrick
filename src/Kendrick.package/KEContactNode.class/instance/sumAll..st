as yet unclassified
sumAll: anArray
	anArray isNumber ifTrue: [ ^ anArray ].
	anArray isArray ifTrue: [ ^ (anArray collect: [ :each| self sumAll: each ]) sum ]