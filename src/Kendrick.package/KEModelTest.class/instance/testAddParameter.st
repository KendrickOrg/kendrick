tests
testAddParameter
	|model |
	model := KEModel new.
	model addParameter: #beta-> 0.02.
	model addParameter: #gamma->0.01.
	self should: [ model parameters size >= 2 ]
	