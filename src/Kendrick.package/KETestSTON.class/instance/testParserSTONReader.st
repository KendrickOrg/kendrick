as yet unclassified
testParserSTONReader
	|reader aCollection dataOfComps compartments|
	aCollection := #(S I R).
	compartments ifNil: [ compartments := Dictionary new ].
	aCollection isDictionary 
	ifFalse: [ 
		|key|
		reader := aCollection readStream.
		dataOfComps := Dictionary new.
		[ key := reader next] whileNotNil:[
			dataOfComps at: key put: 0.
		].
	] 
	ifTrue: [ dataOfComps := aCollection ].
	
	dataOfComps keysAndValuesDo: [ :k :v|
		compartments at: k put: v
	].
	self assert: (compartments at:'S') isNotNil.