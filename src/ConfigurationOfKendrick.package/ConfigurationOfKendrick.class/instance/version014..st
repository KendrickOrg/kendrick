versions
version014: spec
	<version: '0.14' imports: #('0.3-baseline' )>

	spec for: #'common' do: [
		spec blessing: #'stable'.
		spec description: 'version 0.14'.
		spec author: 'SergeStinckwich'.
		spec timestamp: '2014-11-24T18:21:19.244195+01:00'.
		spec 
			project: 'Moose' with: '5.0-baseline';
			project: 'SciSmalltalk' with: '0.16';
			project: 'Ston' with:'0.10'.
		spec package: 'Kendrick' with: 'Kendrick-SergeStinckwich.307']
