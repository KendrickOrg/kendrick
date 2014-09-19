versions
version09: spec
	<version: '0.9' imports: #('0.3-baseline' )>

	spec for: #'common' do: [
		spec blessing: #'stable'.
		spec description: 'version 0.9'.
		spec author: 'SergeStinckwich'.
		spec timestamp: '9/19/2014 13:16'.
		spec 
			project: 'Moose' with: '5.0-baseline';
			project: 'SciSmalltalk' with: '0.14'.
		spec package: 'Kendrick' with: 'Kendrick-BuiThiMaiAnh.269']
