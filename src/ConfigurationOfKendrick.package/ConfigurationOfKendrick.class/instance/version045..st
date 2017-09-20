versions
version045: spec
	<version: '0.45' imports: #('0.13-baseline' )>

	spec for: #'common' do: [
		spec blessing: #'stable'.
		spec description: 'version 0.45'.
		spec author: 'SergeStinckwich'.
		spec timestamp: '9/20/2017 14:05'.
		spec 
			project: 'Glamour' with: '3.3.3';
			project: 'PolyMath' with: '0.40-baseline';
			project: 'Ston' with: '0.19'.
		spec 
			package: 'Kendrick' with: 'Kendrick-SergeStinckwich.698';
			package: #'Moose-Algos-Graph-Generators' with: 'Moose-Algos-Graph-Generators-SergeStinckwich.41'. ].
