as yet unclassified
acceptKEVariable: arg1
	| tmp1 tmp2 |
	tmp2 := WriteStream on: (String new: 60).
	arg1 symbol == #t
		ifTrue: [ tmp2 nextPutAll: arg1 symbol asString.
			^ tmp2 contents ].
	tmp1 := parameters at: arg1 symbol ifAbsent: [  ].
	tmp1
		ifNil: [ compartments
				at: arg1 symbol
				ifAbsent: [ tmp2 nextPutAll: arg1 symbol asString.
					^ tmp2 contents ].
			isDeterministic
				ifTrue: [ tmp2
						nextPutAll: 'x(' , (compartments at: arg1 symbol) asString , ', 0)' ]
				ifFalse: [ tmp2
						nextPutAll: 'x[' , (compartments at: arg1 symbol) asString , '][0]' ] ]
		ifNotNil: [ tmp2 nextPutAll: arg1 symbol asString ].
	^ tmp2 contents