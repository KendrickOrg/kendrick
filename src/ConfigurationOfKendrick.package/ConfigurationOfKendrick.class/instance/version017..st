versions
version017: spec
	<version: '0.17' imports: #('0.5-baseline' )>

	spec for: #'common' do: [
		spec blessing: #'stable'.
		spec description: 'version 0.17'.
		spec author: 'SergeStinckwich'.
		spec timestamp: '4/28/2015 22:05'.
		spec 
			project: 'Moose' with: '5.0-baseline';
			project: 'SciSmalltalk' with: '0.16-baseline';
			project: 'Ston' with: '0.12'.
		spec 
			package: 'Kendrick' with: 'Kendrick-AlvaroJosePeraltaOcampo.366';
			package: 'Glamour-Magritte-Presentations' with: 'Glamour-Magritte-Presentations-AndreiChis.7'. ].
