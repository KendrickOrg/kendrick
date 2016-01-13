versions
version025: spec
	<version: '0.25' imports: #('0.9-baseline' )>

	spec for: #'common' do: [
		spec blessing: #'stable'.
		spec description: 'version 0.25'.
		spec author: 'SergeStinckwich'.
		spec timestamp: '13/1/2015 10:13'.
		spec 
			project: 'Moose' with: '6.0-baseline';
			project: 'SciSmalltalk' with: '0.25-baseline';
			project: 'Ston' with: '0.14';
			project: 'Glamour' with: '3.3.0';
			project: 'VirtualGPU' with: '0.1-baseline'.
		spec package: 'Kendrick' with: 'Kendrick-SergeStinckwich.451'. ]
