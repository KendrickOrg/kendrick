versions
version03: spec
	<version: '0.3' imports: #('0.3-baseline' )>

	spec for: #'common' do: [
		spec blessing: #'stable'.
		spec description: 'version 0.3'.
		spec author: 'SergeStinckwich'.
		spec timestamp: '4/16/2014 14:34'.
		spec project: 'Moose' with: '5.0-baseline'.
		spec project: 'SciSmalltalk' with: '0.8'.
		spec 
			package: 'Kendrick' with: 'Kendrick-SergeStinckwich.187' ].
