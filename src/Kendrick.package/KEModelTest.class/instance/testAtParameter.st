tests
testAtParameter
	|model |
	model := KEModel new.
	model addParameters: '{
		{#species: #reservoir1}:{
			#beta: {
				{#species: #mosquito}: 0.02, 
				{#species: #reservoir2}: 0.02, 
				#yourself: 0.0},
			#mu: 52,
			#N: 10000
			}
		}'.
	model addParameters: '{ #gamma: 52 }'.
	self assert: (model atParameter: #gamma) equals: 52.
	self assert: (model atParameter: '{{#species: #reservoir1}: #beta}') isDictionary equals: true