tests
testAddParameters
	| tmp1 |
	tmp1 := KEModel new.
	tmp1
		addParameters:
			{(#beta -> 0.02).
			(#gamma -> 0.01)};
		addParameters:
			{(#epsilon -> 0.01).
			(#sigma -> 0.02)}.
	self
		assert: (tmp1 atParameter: #beta) equals: 0.02;
		assert: (tmp1 atParameter: #epsilon) equals: 0.01