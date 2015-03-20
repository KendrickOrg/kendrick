tests
testAddParameters
	|model |
	model := KEModel new.
	model addParameters: '{#beta: 0.0052, #gamma: 52}'.
	self assert: model parameters isDictionary equals: true.
	self assert: (model parameters at: #beta) equals: 0.0052.
	model addParameters: { #beta->100. #gamma->50 }.
	self assert: model parameters isDictionary equals: true.
	self assert: (model atParameter: #beta) equals: 100