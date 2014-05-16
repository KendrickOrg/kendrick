accessing
run: type from: tMin to: tMax step: step algorithm: algorithm
	type = 'IBM' ifTrue: [ 
		simulator :=  (KEIndividualBasedSimulator new) tMin: tMin; tMax: tMax; step: step; model: self copy; algorithm: algorithm 
		 ].
	type = 'deterministic' ifTrue: [ 
		simulator := (KEDeterministicSimulator new) tMin: tMin; tMax: tMax; step: step; model: self copy; algorithm: algorithm
		 ].
	type = 'stochastic' ifTrue: [ 
		simulator := KEStochasticSimulator new: algorithm tMin: tMin tMax: tMax step: step model: self copy
		 ].
	simulator execute
	