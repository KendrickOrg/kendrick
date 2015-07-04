as yet unclassified
sizeOfCompartments: keys
	|c|
	c := 0.
	self compartments keysAndValuesDo: [ :k :v|
		(k associations includesAll: keys) ifTrue: [ c := c + v ]
	].
	^ c
	
	
	