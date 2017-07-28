accessing
sizeOfPopulation: anArrayOfValues
	"anArrayOfValues describe a subpopulation like {#S. #human. #female}. Returns the nb of individus that verify this property"

	| array |
	array := OrderedCollection new.
	anArrayOfValues isArray
		ifTrue: [ array addAll: anArrayOfValues ]
		ifFalse: [ array add: anArrayOfValues ].
	^ self population sizeOfPopulation: array