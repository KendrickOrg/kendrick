tests
testCompartment
	| tmp1 |
	tmp1 := KEModel new.
	self assert: tmp1 compartments size equals: 0.
	tmp1
		attributes:
			{(#status -> #(#S #I #R)).
			(#species -> #(#mosquito #reservoir1 #reservoir2))}.
	self
		assert: tmp1 compartments size equals: 9;
		assert: tmp1 compartments first nbAttributes equals: 2