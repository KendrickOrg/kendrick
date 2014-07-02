as yet unclassified
new: aCompartment from: popID_i to: popID_j rate: value
	|_actions|
	_actions := Dictionary new.
	_actions at: popID_i put: -1.
	_actions at: popID_j put: 1.
	^ super new
		compartment: aCompartment;
		fromStatus: popID_i;
		toStatus: popID_j;
		rate: (KENumerical new number: value);
		actions: _actions