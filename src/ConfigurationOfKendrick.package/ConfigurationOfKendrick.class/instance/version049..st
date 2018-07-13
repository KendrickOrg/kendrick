versions
version049: spec
	<version: '0.49' imports: #('0.15-baseline' )>

	spec for: #'common' do: [
		spec blessing: #'stable'.
		spec description: 'version 0.49'.
		spec author: 'SergeStinckwich'.
		spec timestamp: '2018-07-13T14:40:34.596444+01:00'.
		spec 
			project: 'Glamour' with: '3.3.3';
			project: 'MooseAlgosGraphGenerators' with: '0.1';
			baseline: 'PolyMath';
			project: 'Ston' with: '0.19'.
		spec package: 'Kendrick' with: 'Kendrick-SergeStinckwich.702'. ].
