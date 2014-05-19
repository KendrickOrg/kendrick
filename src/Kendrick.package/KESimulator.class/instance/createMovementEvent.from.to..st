accessing
createMovementEvent: compartment from: aPID_i to: aPID_j 
	|movementRates events actions|
	events := Array new: 2.
	actions := Dictionary new.
	actions at: aPID_i put: -1.
	actions at: aPID_j put: 1.
	movementRates := self getMovementRateOf: aPID_i and: aPID_j.
	events at: 1 put: (KEMovementEvent new: compartment from: aPID_i to: aPID_j rate: (movementRates at: 1) actions: actions).
	actions at: aPID_i put: 1.
	actions at: aPID_j put: -1.
	events at: 2 put: (KEMovementEvent new: compartment from: aPID_j to: aPID_i rate: (movementRates at: 2) actions: actions).
	^ events
	