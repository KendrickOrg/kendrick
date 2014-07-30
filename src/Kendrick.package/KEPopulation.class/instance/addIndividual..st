adding
addIndividual: ind
	ind populationID: (self populationID asArray).
	(ind id) 
	ifNil: [ 
		ind id: (self indList size + 1).
		^ (self indList add: ind)
		]
	ifNotNil: [ 
		(ind id > (self indList size)) ifTrue: [ ^ (self indList add: ind) ].
		^ (self indList at: (ind id) put: ind)
		 ].