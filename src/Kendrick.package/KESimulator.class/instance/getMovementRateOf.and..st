accessing
getMovementRateOf: aPID_i and: aPID_j
	|movementRates subPop1 subPop2|
	movementRates := Array new: 2.
	subPop1 := model population at: aPID_i.
	subPop2 := model population at: aPID_j.
	subPop1 parent = subPop2 parent 
	ifTrue: [ 
		|g|
		g := subPop1 parent graph.
		movementRates at: 1 put: ((g nodes at: (aPID_i last)) weight: #movement of: (aPID_j last)).
		movementRates at: 2 put: ((g nodes at: (aPID_j last)) weight: #movement of: (aPID_i last)) 
		 ]
	ifFalse: [ 
		movementRates := self getMovementRateOf: (subPop1 parent id) and: (subPop2 parent id)
		 ].
	^ movementRates
