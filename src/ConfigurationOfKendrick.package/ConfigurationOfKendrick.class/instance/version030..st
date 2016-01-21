versions
version030: spec
	<version: '0.30' imports: #('0.10-baseline' )>

	spec for: #'common' do: [
		spec blessing: #'stable'.
		spec description: 'version 0.30'.
		spec author: 'Serge Stinckwich'.
		spec timestamp: '21/1/2015 8:10'.
		spec 
			project: 'Moose' with: '6.0-baseline';
			project: 'SciSmalltalk' with: '0.39';
			project: 'Ston' with: '0.15';
			project: 'Glamour' with: '3.3.0'.
		spec package: 'Kendrick' with: 'Kendrick-BuiThiMaiAnh.476'. ]
