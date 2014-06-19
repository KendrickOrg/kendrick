accessing
with: parameter value: value
	value isArray
	ifTrue: [ 1 to: (value size) do: [ : each| (nodes at: each) with: parameter value: (value at: each) ] ]
	ifFalse: [ 
		self isAPopulationOfCompartments 
		ifTrue: [ 
			parameters ifNil: [ parameters := Dictionary new ].
			parameters at: parameter put: (KEParameter new symbol: parameter; value: value).
			 ]
		ifFalse: [ 
			nodes do: [ :each| each with: parameter value: value ]
			 ]		
		]
	