accessing
compartments: aCollection
	|dataOfComps|
	self compartments ifNil: [ compartments := Dictionary new ].
	aCollection isDictionary ifFalse: [ 
		|reader|
		(reader := STONReader on: aCollection readStream) allowComplexMapKeys: true.
		dataOfComps := reader next
		 ] ifTrue: [ dataOfComps := aCollection ].
	dataOfComps keysAndValuesDo: [ :k :v|
		compartments at: k put: v
		 ].
	
 
	