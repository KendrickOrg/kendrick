versions
version029: spec
	<version: '0.29' imports: #('0.10-baseline' )>

	spec for: #'common' do: [
		spec blessing: #'stable'.
		spec description: 'version 0.29'.
		spec author: 'Serge Stinckwich'.
		spec timestamp: '18/1/2015 18:27'.
		spec 
			project: 'Moose' with: '6.0-baseline';
			project: 'SciSmalltalk' with: '0.39';
			project: 'Ston' with: '0.15';
			project: 'Glamour' with: '3.3.0'.
		spec package: 'Kendrick' with: 'Kendrick-SergeStinckwich.474'. ]
