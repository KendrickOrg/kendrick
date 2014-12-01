accessing
probability
	probability ifNil: [ probability := [ :m| 
			m addParameter: #subPopulation value: subPopulation.
			(self rate evaluateWithModel: m) abs ] ].
	^ probability 