as yet unclassified
sizeOfPopulation: associations
	|c |
	associations = #population ifTrue: [ ^ compartments values sum ].
	c := 0.
	compartments keysAndValuesDo: [ :k :v|
		(k associations includesAll: associations) ifTrue: [ c := c + v ]
	].
	^ c
	
	
	
	