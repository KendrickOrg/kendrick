as yet unclassified
sizeOfPopulation: associations
	|c |
	associations = #population ifTrue: [ ^ self population compartments values sum ].
	c := 0.
	self population compartments keysAndValuesDo: [ :k :v|
		(k associations includesAll: associations) ifTrue: [ c := c + v ]
	].
	^ c
	
	
	
	