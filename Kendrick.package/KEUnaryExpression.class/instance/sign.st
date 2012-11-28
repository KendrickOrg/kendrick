as yet unclassified
sign
	^ op = #-
		ifTrue: [ ^ expression sign negated ]
		ifFalse: [ ^ expression sign ]