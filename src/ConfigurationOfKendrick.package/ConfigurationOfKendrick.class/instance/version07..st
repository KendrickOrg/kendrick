versions
version07: spec
	<version: '0.7' imports: #('0.3-baseline' )>

	spec for: #'common' do: [
		spec blessing: #'stable'.
		spec description: 'version 0.7'.
		spec author: 'SergeStinckwich'.
		spec timestamp: '6/18/2014 00:16'.
		spec 
			project: 'Moose' with: '5.0-baseline';
			project: 'SciSmalltalk' with: '0.9'.
		spec package: 'Kendrick' with: 'Kendrick-SergeStinckwich.197'. ].
