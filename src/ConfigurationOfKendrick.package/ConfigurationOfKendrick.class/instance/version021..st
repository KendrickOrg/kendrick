as yet unclassified
version021: spec
	<version: '0.21' imports: #('0.8-baseline' )>

	spec for: #'common' do: [
		spec blessing: #'stable'.
		spec description: 'version 0.21'.
		spec author: 'SergeStinckwich'.
		spec timestamp: '6/1/2015 10:05'.
		spec 
			project: 'Moose' with: '5.1-baseline';
			project: 'SciSmalltalk' with: '0.18-baseline';
			project: 'Ston' with: '0.12';
			project: 'Glamour' with: '3.3.0';
			project: 'VirtualGPU' with:'0.1-baseline'.
		spec package: 'Kendrick' with: 'Kendrick-BuiThiMaiAnh.377'. ]
