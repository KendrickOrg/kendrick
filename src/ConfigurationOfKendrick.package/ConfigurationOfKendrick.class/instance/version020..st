versions
version020: spec
	<version: '0.20' imports: #('0.7-baseline' )>

	spec for: #'common' do: [
		spec blessing: #'stable'.
		spec description: 'version 0.20'.
		spec author: 'SergeStinckwich'.
		spec timestamp: '5/27/2015 10:22'.
		spec 
			project: 'Moose' with: '5.1-baseline';
			project: 'SciSmalltalk' with: '0.18-baseline';
			project: 'Ston' with: '0.12';
			project: 'Glamour' with: '3.3.0'.
		spec package: 'Kendrick' with: 'Kendrick-BuiThiMaiAnh.377'. ]
