accessing
getPopulationIDs
	|popIDList|
	popIDList := OrderedCollection new.
	self isPopulation ifTrue: [ ^ #(0) ].
	subPopulations do: [ :each|
		each isPopulation
		ifTrue: [ popIDList add: each populationID asArray ]
		ifFalse: [ popIDList addAll: each getPopulationIDs ]
		 ].
	^ popIDList asArray