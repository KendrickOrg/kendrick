versions
version043: spec
	<version: '0.43' imports: #('0.12-baseline')>
	spec
		for: #common
		do: [ spec blessing: #stable.
			spec description: 'version 0.43'.
			spec
				"project: 'Moose' with: '6.1-baseline';"
				project: 'PolyMath' with: '0.40-baseline';
				project: 'Ston' with: '0.19'.
				spec package: 'Moose-Algos-Graph-Generators' with: 'Moose-Algos-Graph-Generators-SergeStinckwich.41'. 
			spec package: 'Kendrick' with: 'Kendrick-SergeStinckwich.682'.
]