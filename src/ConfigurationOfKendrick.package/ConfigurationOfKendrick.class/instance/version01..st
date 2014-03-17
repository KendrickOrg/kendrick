versions
version01: spec
	<version: '0.1' imports: #('0.1-baseline' )>

	spec for: #'common' do: [
		spec blessing: #'stable'.
		spec description: 'version 0.1'.
		spec author: 'SergeStinckwich'.
		spec timestamp: '3/17/2014 19:39'.
		spec 
			project: 'Fame' with: '1.4-snapshot';
			project: 'GraphET' with: '0.3-snapshot'.
		spec package: 'Kendrick' with: 'Kendrick-SergeStinckwich.187'. ].
