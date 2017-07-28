tests
testAddParameterValue
	|model |
	model := KEModel new.
	model addParameter: #beta value: 0.02.

	self assert: (model atParameter: #beta) equals: 0.02.