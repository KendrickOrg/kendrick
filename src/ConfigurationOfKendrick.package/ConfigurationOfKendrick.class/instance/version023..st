as yet unclassified
version023: spec
	<version: '0.23' imports: #('0.9-baseline' )>

	spec for: #'common' do: [
		spec blessing: #'stable'.
		spec description: 'version 0.23'.
		spec author: 'SergeStinckwich'.
		spec timestamp: '6/23/2015 11:54'.
		spec 
			project: 'Moose' with: '5.1';
			project: 'SciSmalltalk' with: '0.18-baseline';
			project: 'Ston' with: '0.14';
			project: 'Glamour' with: '3.3.0';
			project: 'VirtualGPU' with:'0.1-baseline'.
		spec package: 'Kendrick' with: 'Kendrick-SergeStinckwich.422'. ]
