tests
testAddParameterInScopeValue
	|model |
	model := KEModel new.
	model addParameter: #beta inScope: (#species->#mosquito) value: 0.02. 
	self assert: (model atParameter: #beta atScope: {#species->#mosquito}) equals: 0.02

		
	