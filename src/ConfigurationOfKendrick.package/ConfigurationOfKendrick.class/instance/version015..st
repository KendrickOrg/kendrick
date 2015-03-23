versions
version015: spec
	<version: '0.15' imports: #('0.4-baseline' )>

	spec for: #'common' do: [
		spec blessing: #'stable'.
		spec description: 'version 0.15'.
		spec author: 'SergeStinckwich'.
		spec timestamp: '3/23/2015 16:34'.
		spec 
			project: 'Moose' with: '5.0-baseline';
			project: 'SciSmalltalk' with: '0.16-baseline';
			project: 'Ston' with: '0.10'.
		spec package: 'Kendrick' with: 'Kendrick-BuiThiMaiAnh.363'. ].
