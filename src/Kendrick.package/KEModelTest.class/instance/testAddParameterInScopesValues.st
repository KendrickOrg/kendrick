tests
testAddParameterInScopesValues
	|model |
	model := KEModel new.
	model addParameter: #mu inScopes: {#species->#mosquito. #species->#reservoir1. #species->#reservoir2} values: {365/7. 1/20. 1/20}. 
	model addParameter: #gamma value: 0.01.
	
	self assert: (model atParameter: #mu atScope: {#species->#mosquito}) equals: 365/7.
	self assert: (model atParameter: #gamma) equals: 0.01.
	