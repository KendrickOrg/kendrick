accessing
sizeOfPopulation: array
	| c |
	c := 0.
	self compartments
		keysAndValuesDo: [ :k :v | 
			(k values includesAll: array)
				ifTrue: [ c := c + v ] ].
	^ c