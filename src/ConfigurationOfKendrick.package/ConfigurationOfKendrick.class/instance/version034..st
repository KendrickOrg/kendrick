versions
version034: spec
	<version: '0.34' imports: #('0.10-baseline' )>

	spec for: #'common' do: [
		spec blessing: #'stable'.
		spec description: 'version 0.34'.
		spec author: 'SergeStinckwich'.
		spec timestamp: '6/27/2016 12:29'.
		spec 
			project: 'Moose' with: '6.0-baseline';
			project: 'SciSmalltalk' with: '0.28-baseline';
			project: 'Ston' with: '0.19';
			project: 'Glamour' with: '3.3.2'.
		spec package: 'Kendrick' with: 'Kendrick-BuiThiMaiAnh.525'. ].
