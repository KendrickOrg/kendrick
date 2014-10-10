accessing
initialize
	super initialize.
	actions := Dictionary new.
	rate := nil. "is an expression"
	toStatus := #empty.
	fromStatus := #empty.
	