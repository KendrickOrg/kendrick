as yet unclassified
moveRatesFrom: aPID_1 to: aPID_2
	|model pop1 pop2 moveRates|
	model := self model.
	pop1 := model population at: aPID_1.
	pop2 := model population at: aPID_2.
	moveRates := Array new: 2.
	pop1 parent = pop2 parent
	ifTrue: [  
		|g|
		g := pop1 parent graph.
		moveRates at: 1 put: ((g nodes at: (aPID_1 last)) weight: #movement of: (aPID_2 last)).
		moveRates at: 2 put: ((g nodes at: (aPID_2 last)) weight: #movement of: (aPID_1 last)) 
		]
	ifFalse: [  
		moveRates := self moveRatesBetween: (pop1 parent populationID asArray) and: (pop2 parent populationID asArray)
		].
	^ moveRates