accessing
initialize
	super initialize.
	actions := Dictionary new.
	rate := nil. "is an expression"
	interRate := nil. "is an expression"
	toStatus := #empty.
	fromStatus := #empty.
	"values at: 1 for storing intra-rate, values at: 2 for storing inter-rate if this event has inter-pop interaction"
	values := #(-1 -1)
	