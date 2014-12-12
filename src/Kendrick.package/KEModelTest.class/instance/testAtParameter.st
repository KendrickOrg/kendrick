tests
testAtParameter
	|model |
	model := KEModel new.
	model addParameters: '{
		{#specie: #reservoir1}:{
			#beta: {
				{#specie: #mosquito}: 0.02, 
				{#specie: #reservoir2}: 0.02, 
				#yourself: 0.0},
			#mu: 52,
			#N: 10000
			}
		}'.
	model addParameters: '{ #gamma: 52 }'.
	self assert: (model atParameter: #gamma) equals: 52.
	self assert: (model atParameter: '{{#specie: #reservoir1}: #beta}') isDictionary equals: true