versions
version048: spec
	<version: '0.48' imports: #('0.14-baseline' )>

	spec for: #'common' do: [
		spec blessing: #'stable'.
		spec description: 'version 0.48'.
		spec author: 'SergeStinckwich'.
		spec timestamp: '9/20/2017 16:42'.
		spec 
			project: 'Glamour' with: '3.3.3';
			project: 'MooseAlgosGraphGenerators' with: '0.1';
			project: 'PolyMath' with: '0.40-baseline';
			project: 'Ston' with: '0.19'.
		spec package: 'Kendrick' with: 'Kendrick-SergeStinckwich.702'. ].
