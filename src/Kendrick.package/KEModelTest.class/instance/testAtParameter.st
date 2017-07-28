tests
testAtParameter
	|model |
	model := KEModel new.
	model addParameter: #beta->0.02.
	model addParameter: #gamma->0.01.
	self assert: (model atParameter: #gamma) equals: 0.01.
	self assert: (model atParameter: #beta) equals: 0.02
	