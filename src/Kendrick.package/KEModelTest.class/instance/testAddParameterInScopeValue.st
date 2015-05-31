tests
testAddParameterInScopeValue
	|model |
	model := KEModel new.
	model addParameter: #beta inScope: (#species->#mosquito) value: 0.02. 
	self assert: (model atParameter: '{#species: #mosquito}') isDictionary equals: true.
	self assert: (model atParameter: '{{#species: #mosquito}:#beta}') equals: 0.02

		
	