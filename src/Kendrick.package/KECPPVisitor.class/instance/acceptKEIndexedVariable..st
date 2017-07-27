as yet unclassified
acceptKEIndexedVariable: arg1
	| tmp1 tmp2 |
	tmp2 := WriteStream on: (String new: 60).
	tmp1 := parameters at: arg1 symbol ifAbsent: [  ].
	tmp1
		ifNil: [ isDeterministic
				ifTrue: [ tmp2
						nextPutAll:
							'x(' , (compartments at: arg1 symbol) asString , ', '
								, arg1 idExpression1 asString , ')' ]
				ifFalse: [ tmp2
						nextPutAll:
							'x[' , (compartments at: arg1 symbol) asString , ']['
								, arg1 idExpression1 asString , ']' ] ]
		ifNotNil: [ (arg1 idExpression2 isNumerical
				and: [ arg1 idExpression2 number = -1 ])
				ifTrue: [ tmp2
						nextPutAll: arg1 symbol asString , '[' , arg1 idExpression1 asString , ']' ]
				ifFalse: [ tmp2
						nextPutAll:
							arg1 symbol asString , '[' , arg1 idExpression1 asString , ']['
								, arg1 idExpression2 asString , ']' ] ].
	^ tmp2 contents