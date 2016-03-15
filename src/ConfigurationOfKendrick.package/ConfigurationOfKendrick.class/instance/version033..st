versions
version033: spec
	<version: '0.33' imports: #('0.10-baseline' )>

	spec for: #'common' do: [
		spec blessing: #'stable'.
		spec description: 'version 0.33'.
		spec author: 'Serge Stinckwich'.
		spec timestamp: '2016-03-15T10:48:56.227108+00:00'.
		spec 
			project: 'Moose' with: '6.0-baseline';
			project: 'SciSmalltalk' with: '0.42';
			project: 'Ston' with: '0.15';
			project: 'Glamour' with: '3.3.0'.
		spec package: 'Kendrick' with: 'Kendrick-BuiThiMaiAnh.503'. ]
