versions
version018: spec
	<version: '0.18' imports: #('0.6-baseline' )>

	spec for: #'common' do: [
		spec blessing: #'stable'.
		spec description: 'version 0.18'.
		spec author: 'SergeStinckwich'.
		spec timestamp: '4/28/2015 23:00'.
		spec 
			project: 'Moose' with: '5.0-baseline';
			project: 'SciSmalltalk' with: '0.16-baseline';
			project: 'Ston' with: '0.12';
			project: 'Glamour' with: '3.0.8'.
		spec 
			package: 'Kendrick' with: 'Kendrick-SergeStinckwich.368';
			package: 'Glamour-Magritte-Presentations' with: 'Glamour-Magritte-Presentations-AndreiChis.7'. ].
