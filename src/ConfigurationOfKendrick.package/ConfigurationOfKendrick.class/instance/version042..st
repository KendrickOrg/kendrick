versions
version042: spec
	<version: '0.42' imports: #('0.10-baseline')>
	spec
		for: #common
		do: [ spec blessing: #stable.
			spec description: 'version 0.42'.
			spec
				project: 'Moose' with: '6.1-baseline';
				project: 'SciSmalltalk' with: '0.29-baseline';
				project: 'Ston' with: '0.19'.
			spec package: 'Kendrick' with: 'Kendrick-NickPapoulias.592' ]