as yet unclassified
convertToCompatibleBackendRepresentation
	| tmp1 tmp3 |
	tmp1 := OrderedCollection new.
	tmp3 := nil.
	eqAsSymExpr
		do: [ :arg1 | 
			(arg1 = #--> or: [ arg1 = #-- ])
				ifFalse: [ arg1 = #'.'
						ifTrue: [ tmp1 add: tmp3.
							tmp3 := nil ]
						ifFalse: [ tmp3 = nil
								ifTrue: [ tmp3 := arg1 ]
								ifFalse: [ tmp3 := tmp3 -> arg1 ] ] ] ].
	^ tmp1