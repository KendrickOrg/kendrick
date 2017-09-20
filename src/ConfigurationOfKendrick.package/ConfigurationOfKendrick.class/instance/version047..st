versions
version047: spec
	<version: '0.47' imports: #('0.14-baseline' )>

	spec for: #'common' do: [
		spec blessing: #'stable'.
		spec description: 'version 0.47'.
		spec author: 'SergeStinckwich'.
		spec timestamp: '9/20/2017 15:23'.
		spec 
			project: 'Glamour' with: '3.3.3';
			project: 'MooseAlgosGraphGenerators' with: '0.1';
			project: 'PolyMath' with: '0.40-baseline';
			project: 'Ston' with: '0.19'.
		spec package: 'Kendrick' with: 'Kendrick-SergeStinckwich.699'. ].
