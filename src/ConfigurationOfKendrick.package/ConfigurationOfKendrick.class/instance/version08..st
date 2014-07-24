versions
version08: spec
	<version: '0.8' imports: #('0.3-baseline' )>

	spec for: #'common' do: [
		spec blessing: #'stable'.
		spec description: 'version 0.8'.
		spec author: 'SergeStinckwich'.
		spec timestamp: '7/24/2014 16:33'.
		spec 
			project: 'Moose' with: '5.0-baseline';
			project: 'SciSmalltalk' with: '0.12'.
		spec package: 'Kendrick' with: 'Kendrick-SergeStinckwich.197'. ].
