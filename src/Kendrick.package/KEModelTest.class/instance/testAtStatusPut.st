tests
testAtStatusPut
	| tmp1 |
	tmp1 := KEModel new.
	tmp1
		population: (KEPopulation size: 100000);
		addAttribute: #status value: #(#S #I #R);
		addAttribute: #country value: #(#A #B #C);
		atStatus: #S put: 100000.
	self
		should:
			(tmp1
				atCompartment:
					{(#status -> #S).
					(#country -> #A)}) >= 33333;
		should:
			(tmp1
				atCompartment:
					{(#status -> #S).
					(#country -> #B)}) >= 33333;
		should:
			(tmp1
				atCompartment:
					{(#status -> #S).
					(#country -> #C)}) >= 33333