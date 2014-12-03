accessing
compartments: aCollection
	compartments ifNil: [ compartments := Dictionary new ].
	aCollection keysAndValuesDo: [ :k :v|
		compartments at: k put: v
		 ].
	
 
	