testing
sign
	^ (op = #-)
		ifTrue: [^expression sign negated]
		ifFalse:[^expression sign]