tests
testAtStatusPut2
	| tmp1 |
	tmp1 := KEModel new.
	tmp1
		population: (KEPopulation size: 100);
		addAttribute: #status value: #(#S #I #R);
		addAttribute: #node
			value: ((1 to: 100) collect: [ :arg1 | arg1 asString asSymbol ]);
		atStatus: #S put: 99.
	self
		should:
			(tmp1
				atCompartment:
					{(#status -> #S).
					(#node -> #'1')}) = 1;
		should:
			(tmp1
				atCompartment:
					{(#status -> #S).
					(#node -> #'2')}) = 1;
		should:
			(tmp1
				atCompartment:
					{(#status -> #S).
					(#node -> #'3')}) = 1;
		should:
			(tmp1
				atCompartment:
					{(#status -> #S).
					(#node -> #'100')}) >= 0