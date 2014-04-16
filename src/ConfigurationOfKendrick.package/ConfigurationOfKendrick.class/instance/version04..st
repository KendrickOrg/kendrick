versions
version04: spec
	<version: '0.4' imports: #('0.3-baseline' )>

	spec for: #'common' do: [
		spec blessing: #'stable'.
		spec description: 'version 0.4'.
		spec author: 'SergeStinckwich'.
		spec timestamp: '4/16/2014 17:01'.
		spec project: 'Moose' with: '5.0-baseline'.
		spec project: 'SciSmalltalk' with: '0.9'.
		spec 
			package: 'Kendrick' with: 'Kendrick-SergeStinckwich.187' ].
