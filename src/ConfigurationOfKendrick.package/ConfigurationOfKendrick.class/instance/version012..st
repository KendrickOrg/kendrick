versions
version012: spec
	<version: '0.12' imports: #('0.3-baseline' )>

	spec for: #'common' do: [
		spec blessing: #'stable'.
		spec description: 'version 0.12'.
		spec author: 'SergeStinckwich'.
		spec timestamp: '10/09/2014 15:07'.
		spec 
			project: 'Moose' with: '5.0-baseline';
			project: 'SciSmalltalk' with: '0.14'.
		spec package: 'Kendrick' with: 'Kendrick-BUIThiMaiAnh.287']
