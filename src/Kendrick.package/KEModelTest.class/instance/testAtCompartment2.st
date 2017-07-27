tests
testAtCompartment2
	| tmp1 |
	tmp1 := KEModel new population: (KEPopulation size: 100000).
	tmp1
		attributes:
			{(#status -> #(#S #I #R)).
			(#region -> #(#A #B #C))};
		atCompartment:
			{(#status -> #S).
			(#region -> #A)}
			put: 99999
			atOthersPut: 0;
		atCompartment:
			{(#status -> #I).
			(#region -> #A)}
			put: 1.
	self
		assert:
			(tmp1
				atCompartment:
					{(#region -> #A).
					(#status -> #S)})
			equals: 99999;
		assert: (tmp1 atCompartment: {(#region -> #A)})
			equals: #(99999 1 0);
		assert: (tmp1 atCompartment: {(#status -> #S)})
			equals: #(99999 0 0)