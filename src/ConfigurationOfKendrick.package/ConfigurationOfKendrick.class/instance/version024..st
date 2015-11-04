as yet unclassified
version024: spec
	<version: '0.24' imports: #('0.9-baseline' )>

	spec for: #'common' do: [
		spec blessing: #'stable'.
		spec description: 'version 0.24'.
		spec author: 'SergeStinckwich'.
		spec timestamp: '11/4/2015 16:12'.
		spec 
			project: 'Moose' with: 'development';
			project: 'SciSmalltalk' with: '0.18-baseline';
			project: 'Ston' with: '0.14';
			project: 'Glamour' with: '3.3.0';
			project: 'VirtualGPU' with: '0.1-baseline'.
		spec package: 'Kendrick' with: 'Kendrick-BuiThiMaiAnh.450'. ]
