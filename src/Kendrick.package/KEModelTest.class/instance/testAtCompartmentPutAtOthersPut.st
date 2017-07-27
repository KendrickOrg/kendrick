tests
testAtCompartmentPutAtOthersPut
	| tmp1 |
	tmp1 := KEModel new.
	tmp1
		population: (KEPopulation size: 100000);
		addAttribute: #status value: #(#S #I #R);
		atCompartment: {(#status -> #S)} put: 100000 atOthersPut: 0.
	self assert: (tmp1 atCompartment: {(#status -> #S)}) equals: 100000