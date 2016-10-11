versions
version036: spec
	<version: '0.36' imports: #('0.10-baseline' )>

	spec for: #'common' do: [
		spec blessing: #'stable'.
		spec description: 'version 0.36'.
		spec author: 'SergeStinckwich'.
		spec timestamp: '2016-10-11T16:40:24.692661+02:00'.
		spec 
			project: 'Moose' with: '6.0-baseline';
			project: 'SciSmalltalk' with: '0.29-baseline';
			project: 'Ston' with: '0.19'.
		spec package: 'Kendrick' with: 'Kendrick-SergeStinckwich.536'. ].
