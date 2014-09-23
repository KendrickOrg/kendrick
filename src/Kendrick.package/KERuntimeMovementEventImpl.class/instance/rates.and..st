as yet unclassified
rates: aPID_i and: aPID_j
	|moveRates pop1 pop2|
	moveRates := Array new: 2.
	pop1 := model population at: aPID_i.
	pop2 := model population at: aPID_j.
	pop1 parent = pop2 parent
	ifTrue: [ 
		|g|
		g := pop1 parent graph.
		moveRates at: 1 put: ((g nodes at: (aPID_i last)) weight: #movement of: (aPID_j last)).
		moveRates at: 2 put: ((g nodes at: (aPID_j last)) weight: #movement of: (aPID_i last)) 
		 ]
	ifFalse: [ 
		moveRates := self moveRatesBetween: (pop1 parent id) and: (pop2 parent id)
		 ].
	^ moveRates
	
