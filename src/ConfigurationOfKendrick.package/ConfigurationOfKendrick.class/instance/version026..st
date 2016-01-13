versions
version026: spec
	<version: '0.26' imports: #('0.9-baseline' )>

	spec for: #'common' do: [
		spec blessing: #'stable'.
		spec description: 'version 0.26'.
		spec author: 'SergeStinckwich'.
		spec timestamp: '13/1/2015 13:57'.
		spec 
			project: 'Moose' with: '6.0-baseline';
			project: 'SciSmalltalk' with: '0.39';
			project: 'Ston' with: '0.14';
			project: 'Glamour' with: '3.3.0';
			project: 'VirtualGPU' with: '0.1-baseline'.
		spec package: 'Kendrick' with: 'Kendrick-SergeStinckwich.451'. ]
