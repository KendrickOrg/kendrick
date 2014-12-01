tests
testAddParameterAtLocalScope
	|model |
	model := KEModel new.
	model oldVersion: false.
	model addParameter: '{
		{#specie: #reservoir1}:{
			#beta: {{#specie: #mosquito}: 0.02, #yourself: 0.0},
			#mu: 52,
			#N: 10000
			}
		}'.
	self assert: (model atParameter: '{#specie: #reservoir1}') isDictionary equals: true.
	self assert: (model atParameter: '{{#specie: #reservoir1}:#beta}') isDictionary equals: true

		
	