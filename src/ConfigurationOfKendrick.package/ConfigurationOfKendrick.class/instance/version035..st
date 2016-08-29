versions
version035: spec
	<version: '0.35' imports: #('0.10-baseline' )>

	spec for: #'common' do: [
		spec blessing: #'stable'.
		spec description: 'version 0.35'.
		spec author: 'SergeStinckwich'.
		spec timestamp: '8/29/2016 15:57'.
		spec 
			project: 'Moose' with: '6.0-baseline';
			project: 'SciSmalltalk' with: '0.29-baseline';
			project: 'Ston' with: '0.19';
			project: 'Glamour' with: '3.3.2'.
		spec package: 'Kendrick' with: 'Kendrick-BuiThiMaiAnh.532'. ].
