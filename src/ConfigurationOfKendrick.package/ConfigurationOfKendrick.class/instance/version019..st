versions
version019: spec
	<version: '0.19' imports: #('0.7-baseline' )>

	spec for: #'common' do: [
		spec blessing: #'stable'.
		spec description: 'version 0.19'.
		spec author: 'SergeStinckwich'.
		spec timestamp: '5/08/2015 18:09'.
		spec 
			project: 'Moose' with: '5.0-baseline';
			project: 'SciSmalltalk' with: '0.17-baseline';
			project: 'Ston' with: '0.12';
			project: 'Glamour' with: '3.3.0'.
		spec package: 'Kendrick' with: 'Kendrick-SergeStinckwich.373'. ].
