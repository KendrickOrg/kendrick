accessing
contactedIndividuals: model
	|contacts currentInd currentPop|
	contacts := OrderedCollection new.
	currentInd := model currentIndividual.
	currentPop := model population at: (model currentPopulationID).
	currentPop graph 
	ifNil: [ 
		contacts := currentPop indList collect: [ :each| 
			each currentStatus = clinicStatus ifTrue: [ each id ] ]
		 ]
	ifNotNil: [ 
		contacts := (currentPop graph nodes at: (currentInd)) adjacentNodes collect: [ :each| (currentPop indList at: each) currentStatus = clinicStatus ifTrue: [ each ] ]
		 ].
	^ contacts