versions
version06: spec
	<version: '0.6' imports: #('0.3-baseline' )>

	spec for: #'common' do: [
		spec blessing: #'stable'.
		spec description: 'version 0.6'.
		spec author: 'SergeStinckwich'.
		spec timestamp: '6/17/2014 00:16'.
		spec 
			project: 'Moose' with: '5.0-baseline';
			project: 'SciSmalltalk' with: '0.9'.
		spec package: 'Kendrick' with: 'Kendrick-ATREVIFabrice.196'. ].