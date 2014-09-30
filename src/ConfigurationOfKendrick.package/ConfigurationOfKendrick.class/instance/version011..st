versions
version011: spec
	<version: '0.11' imports: #('0.3-baseline' )>

	spec for: #'common' do: [
		spec blessing: #'stable'.
		spec description: 'version 0.11'.
		spec author: 'SergeStinckwich'.
		spec timestamp: '9/30/2014 16:40'.
		spec 
			project: 'Moose' with: '5.0-baseline';
			project: 'SciSmalltalk' with: '0.14'.
		spec package: 'Kendrick' with: 'Kendrick-SergeStinckwich.282']
