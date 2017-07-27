tests
testAtParameter
	| tmp1 |
	tmp1 := KEModel new.
	tmp1
		addParameter: #beta -> 0.02;
		addParameter: #gamma -> 0.01.
	self
		assert: (tmp1 atParameter: #gamma) equals: 0.01;
		assert: (tmp1 atParameter: #beta) equals: 0.02