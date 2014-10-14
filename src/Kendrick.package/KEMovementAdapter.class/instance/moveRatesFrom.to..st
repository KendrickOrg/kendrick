as yet unclassified
moveRatesFrom: pop1 to: pop2
	|model moveRates|
	model := self model.
	moveRates := Array new: 2.
	pop1 parent = pop2 parent
	ifTrue: [  
		|g|
		g := pop1 parent graph.
		moveRates at: 1 put: ((g nodes at: (pop1 populationID)) weight: #movement of: (pop2 populationID)).
		moveRates at: 2 put: ((g nodes at: (pop2 populationID)) weight: #movement of: (pop1 populationID)) 
		]
	ifFalse: [  
		moveRates := self moveRatesFrom: (pop1 parent) to: (pop2 parent)
		].
	^ moveRates