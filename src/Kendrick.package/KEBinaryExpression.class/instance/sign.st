testing
sign
	op = #*
		ifTrue: [ ^ rightHandSide sign * leftHandSide sign ].
	^ 1