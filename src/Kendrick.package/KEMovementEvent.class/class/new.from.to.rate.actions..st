as yet unclassified
new: aCompartment from: popID_i to: popID_j rate: value actions: anObject
	^ super new
		compartment: aCompartment;
		fromStatus: popID_i;
		toStatus: popID_j;
		rate: (KENumerical new number: value);
		actions: anObject