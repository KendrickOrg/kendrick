accessing
sizeOfPopulation: anArrayOfValues

	"eg. anArrayOfValues = {#S. #human. #female}, this function counts all individuals having the value attributes in anArrayOfValues"
	"anArrayOrAValue decribe a subpopulation"
	| c array |
	c := 0.
	array := OrderedCollection new.
	anArrayOfValues isArray
		ifTrue: [ array addAll: anArrayOfValues ]
		ifFalse: [ array add: anArrayOfValues ].
	^self population sizeOfPopulation: array