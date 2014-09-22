versions
version010: spec
	<version: '0.10' imports: #('0.3-baseline' )>

	spec for: #'common' do: [
		spec blessing: #'stable'.
		spec description: 'version 0.10 - All green tests'.
		spec author: 'SergeStinckwich'.
		spec timestamp: '9/22/2014 12:30'.
		spec 
			project: 'Moose' with: '5.0-baseline';
			project: 'SciSmalltalk' with: '0.14'.
		spec package: 'Kendrick' with: 'Kendrick-BuiThiMaiAnh.272']
