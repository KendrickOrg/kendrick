accessing
run: type from: tMin to: tMax step: step algorithm: algorithm
	type = 'IBM' ifTrue: [ 
		simulator :=  (KEIndividualBasedSimulator new) tMin: tMin; tMax: tMax; step: step; model: self; algorithm: algorithm 
		 ].
	type = 'deterministic' ifTrue: [ 
		simulator := (KEDeterministicSimulator new) tMin: tMin; tMax: tMax; step: step; model: self; algorithm: algorithm
		 ].
	type = 'stochastic' ifTrue: [ 
		simulator := (KEStochasticSimulator new) tMin: tMin; tMax: tMax; step: step; model: self; algorithm: algorithm
		 ].
	^ simulator execute
	