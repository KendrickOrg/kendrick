accessing
run: type from: tMin to: tMax step: step algorithm: algorithm
	|countStep|
	self addParameter: #die value: 0.
	type = 'IBM' ifTrue: [  
		simulator :=  KEIndividualBasedSimulator new: algorithm tMin: tMin tMax: tMax step: step model: self copy
		 ].
	type = 'deterministic' ifTrue: [ 
		simulator := (KEDeterministicSimulator new) tMin: tMin; tMax: tMax; step: step; model: self copy; algorithm: algorithm
		 ].
	type = 'stochastic' ifTrue: [ 
		simulator := KEStochasticSimulator new: algorithm tMin: tMin tMax: tMax step: step model: self copy
		 ].
	countStep := 'Step: ', simulator execute asString.
	Transcript show: countStep;cr.
	