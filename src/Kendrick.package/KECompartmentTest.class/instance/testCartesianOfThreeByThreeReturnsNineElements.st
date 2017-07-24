tests
testCartesianOfThreeByThreeReturnsNineElements
	| model |
	model := KEModel new.
	model
		attributes:
			{(#status -> #(#S #I #R)).
			(#species -> #(#mosquito #reservoir1 #reservoir2))}.
	self assert: model compartments size equals: 9