tests
testAtParameterAtScope
	|model |
	model := KEModel new.
	model addParameter: #beta->0.02.
	model addParameter: #gamma->0.01.
	self assert: (model atParameter: #gamma atScope: #population) equals: 0.01.
	
	