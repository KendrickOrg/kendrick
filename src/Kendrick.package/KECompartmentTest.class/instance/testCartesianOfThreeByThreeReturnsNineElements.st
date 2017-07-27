tests
testCartesianOfThreeByThreeReturnsNineElements
	| tmp1 |
	tmp1 := KEModel new.
	tmp1
		attributes:
			{(#status -> #(#S #I #R)).
			(#species -> #(#mosquito #reservoir1 #reservoir2))}.
	self assert: tmp1 compartments size equals: 9