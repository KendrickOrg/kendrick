versions
version027: spec
	<version: '0.27' imports: #('0.10-baseline' )>

	spec for: #'common' do: [
		spec blessing: #'stable'.
		spec description: 'version 0.27'.
		spec author: 'Serge Stinckwich'.
		spec timestamp: '13/1/2015 14:12'.
		spec 
			project: 'Moose' with: '6.0-baseline';
			project: 'SciSmalltalk' with: '0.39';
			project: 'Ston' with: '0.14';
			project: 'Glamour' with: '3.3.0'.
		spec package: 'Kendrick' with: 'Kendrick-SergeStinckwich.471'. ]
