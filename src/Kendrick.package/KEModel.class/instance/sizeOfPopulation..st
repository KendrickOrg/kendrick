accessing
sizeOfPopulation: anArrayOrAValue
	"eg. anArrayOfValues = {#S. #human. #female}, this function counts all individuals having the value attributes in anArrayOfValues"

	| c array |
	c := 0.
	array := OrderedCollection new.
	anArrayOrAValue isArray
		ifTrue: [ array addAll: anArrayOrAValue ]
		ifFalse: [ array add: anArrayOrAValue ].
	self population compartments
		keysAndValuesDo: [ :k :v | 
			(k values includesAll: array)
				ifTrue: [ c := c + v ] ].
	^ c