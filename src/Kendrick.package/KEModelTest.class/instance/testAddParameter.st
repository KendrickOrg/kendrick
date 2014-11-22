tests
testAddParameter
	|model |
	model := KEModel new.
	model oldVersion: false.
	model addParameter: '{#beta: 0.0052, #gamma: 52}'.
	self assert: model parameters isDictionary equals: true.
	self assert: (model parameters at: #beta) equals: 0.0052