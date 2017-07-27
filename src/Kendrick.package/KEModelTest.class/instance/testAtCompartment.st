tests
testAtCompartment
	| tmp1 tmp2 |
	tmp1 := KEModel new population: (KEPopulation size: 100000).
	tmp1
		attributes:
			{(#status -> #(#S #I #R)).
			(#region -> #(#A #B #C))};
		atCompartment:
			{(#status -> #S).
			(#region -> #A)}
			put: 99999
			atOthersPut: 0.
	tmp2 := tmp1 atCompartment: '{#region: #A, #status: #S}'.
	self assert: tmp2 equals: 99999