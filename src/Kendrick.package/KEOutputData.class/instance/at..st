as yet unclassified
at: aClassName
	|key|
	key := aClassName.
	aClassName isString ifTrue: [ key := STON fromString: aClassName ].
	^ data at: key ifAbsent: [ 
		|c|
		c := KEDictionary new.
		data keysAndValuesDo: [ :k :v|
			(k associations includesAll: (key associations)) ifTrue: [ 
				|temp|
				temp := k copy.
				key keysDo: [ :each| temp removeKey: each ].
				c at: temp put: v
				 ]
			 ].
		^ c
		 ]