versions
version013: spec
	<version: '0.13' imports: #('0.3-baseline' )>

	spec for: #'common' do: [
		spec blessing: #'stable'.
		spec description: 'version 0.13'.
		spec author: 'SergeStinckwich'.
		spec timestamp: '10/16/2014 11:35'.
		spec 
			project: 'Moose' with: '5.0-baseline';
			project: 'SciSmalltalk' with: '0.14'.
		spec package: 'Kendrick' with: 'Kendrick-SergeStinckwich.306']
