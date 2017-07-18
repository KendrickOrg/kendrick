as yet unclassified
initialize
	super initialize.
	attributes := Dictionary new.
	attributes at: #alive put: true.
	nextStatus := nil