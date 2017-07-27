as yet unclassified
sizeOfCompartments: arg1
	| tmp2 |
	tmp2 := 0.
	self compartments
		keysAndValuesDo: [ :arg2 :arg3 | 
			(arg2 associations includesAll: arg1)
				ifTrue: [ tmp2 := tmp2 + arg3 ] ].
	^ tmp2