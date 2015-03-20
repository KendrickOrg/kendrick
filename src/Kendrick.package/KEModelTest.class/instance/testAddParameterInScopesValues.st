tests
testAddParameterInScopesValues
	|model |
	model := KEModel new.
	model addParameter: #mu inScopes: (#species->#(#mosquito #reservoir1 #reservoir2)) values: {365/7. 1/20. 1/20}. 
	self assert: (model atParameter: '{#species: #mosquito}') isDictionary equals: true.
	self assert: (model atParameter: '{{#species: #mosquito}:#mu}') equals: 365/7

		
	