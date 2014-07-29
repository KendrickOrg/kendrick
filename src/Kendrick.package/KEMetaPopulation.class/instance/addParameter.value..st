adding
addParameter: parameter value: value
	value isArray
	ifTrue: [ 
		1 to: (value size) do: [ :i| (subPopulations at: i) addParameter: parameter value: (value at: i) ]
		 ]
	ifFalse: [ 
		self isPopulation
		ifTrue: [ 
			parameters ifNil: [ parameters := Dictionary new ].
			parameters at: parameter put: (KEParameter new symbol: parameter; value: value)
			 ]
		ifFalse: [ 
			subPopulations do: [ :each| each addParameter: parameter value: value ]
			 ]
		 ]