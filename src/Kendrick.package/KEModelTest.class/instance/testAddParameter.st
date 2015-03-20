tests
testAddParameter
	|model |
	model := KEModel new.
	model addParameter: '{#beta: 0.0052}'.
	self assert: model parameters isDictionary equals: true.
	self assert: (model parameters at: #beta) equals: 0.0052.
	model addParameter: #beta->100.
	self assert: (model atParameter: #beta) equals: 100 