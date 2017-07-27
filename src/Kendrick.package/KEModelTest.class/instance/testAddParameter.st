tests
testAddParameter
	| tmp1 |
	tmp1 := KEModel new.
	tmp1
		addParameter: #beta -> 0.02;
		addParameter: #gamma -> 0.01.
	self should: [ tmp1 parameters size >= 2 ]