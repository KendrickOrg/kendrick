tests
testAddParameters
	|model |
	model := KEModel new.
	model addParameters: {#beta->0.02. #gamma->0.01}.
	model addParameters: {#epsilon->0.01. #sigma->0.02}.
	self assert: (model atParameter: #beta) equals: 0.02.
	self assert: (model atParameter: #epsilon) equals: 0.01