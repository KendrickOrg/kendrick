tests
testAddParameterAtLocalScope
	|model |
	model := KEModel new.
	model test: false.
	model addParameter: '{
		{#specie: #reservoir1}:{
			#beta: {{#specie: #mosquito}: 0.02, #others: 0.0},
			#mu: 52,
			#N: 10000
			}
		}'.
		

		
	