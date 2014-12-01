as yet unclassified
atParameter: anObject
	|key param|
	(anObject isSymbol | anObject isDictionary)
	ifFalse: [ 
		|reader|
		(reader := STONReader on: anObject readStream) allowComplexMapKeys: true.
		key := reader next
		 ]
	ifTrue: [ key := anObject ].
	^ parameters at: key ifAbsent: [ 
		key isDictionary ifTrue: [ 
			param := parameters at: (key keys first) ifAbsent: [ nil ].
			param ifNotNil: [ |tmp| 
				tmp := param at: (key values first) ifAbsent: [ ^ nil ].
				tmp isDictionary ifTrue: [ ^ KEDictionary from: tmp ].
				^ tmp ]
		 ].
		^ nil ]
	
	