as yet unclassified
new: aCompartment from: popID_i to: popID_j rate: value
	^ super new
		compartment: aCompartment;
		fromStatus: popID_i;
		toStatus: popID_j;
		interRate: (KENumerical new number: value)