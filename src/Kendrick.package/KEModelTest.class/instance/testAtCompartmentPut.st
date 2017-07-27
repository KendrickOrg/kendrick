tests
testAtCompartmentPut
	| tmp1 |
	tmp1 := KEModel new.
	tmp1
		population: (KEPopulation size: 100000);
		addAttribute: #status value: #(#S #I #R);
		atCompartment: {(#status -> #S)} put: 100000.
	self assert: (tmp1 atCompartment: {(#status -> #S)}) equals: 100000