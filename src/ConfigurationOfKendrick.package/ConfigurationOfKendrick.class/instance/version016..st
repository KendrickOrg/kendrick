versions
version016: spec
	<version: '0.16' imports: #('0.4-baseline' )>

	spec for: #'common' do: [
		spec blessing: #'stable'.
		spec description: 'version 0.16'.
		spec author: 'SergeStinckwich'.
		spec timestamp: '4/22/2015 17:16'.
		spec 
			project: 'Moose' with: '5.0-baseline';
			project: 'SciSmalltalk' with: '0.16-baseline';
			project: 'Ston' with: '0.12'.
		spec package: 'Kendrick' with: 'Kendrick-BuiThiMaiAnh.364'. ].
