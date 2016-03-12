versions
version032: spec
	<version: '0.32' imports: #('0.10-baseline' )>

	spec for: #'common' do: [
		spec blessing: #'stable'.
		spec description: 'version 0.32'.
		spec author: 'Serge Stinckwich'.
		spec timestamp: '2016-03-12T15:46:39.687573+01:00'.
		spec 
			project: 'Moose' with: '6.0-baseline';
			project: 'SciSmalltalk' with: '0.42';
			project: 'Ston' with: '0.15';
			project: 'Glamour' with: '3.3.0'.
		spec package: 'Kendrick' with: 'Kendrick-SergeStinckwich.485'. ]
