as yet unclassified
sizeOfPopulation: associations
	|c |
	associations = #population ifTrue: [ ^ self compartments values sum ].
	c := 0.
	self compartments keysAndValuesDo: [ :k :v|
		(k associations includesAll: associations) ifTrue: [ c := c + v ]
	].
	^ c
	
	
	
	