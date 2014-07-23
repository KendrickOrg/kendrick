meta
passType: type
	type = #IBM ifTrue: [ ^ KEIndividualBasedSimulator ].
	type = #deterministic ifTrue: [ ^ KEDeterministicSimulator ].
	type = #stochastic ifTrue: [ ^ KEStochasticSimulator ].