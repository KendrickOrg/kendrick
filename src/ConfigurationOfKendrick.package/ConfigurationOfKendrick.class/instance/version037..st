versions
version037: spec
	<version: '0.37' imports: #('0.10-baseline')>
	spec
		for: #common
		do: [ spec blessing: #stable.
			spec description: 'version 0.37'.
			spec author: 'SergeStinckwich'.
			spec timestamp: '2016-10-18T16:10:42.307984+02:00'.
			spec
				project: 'Moose' with: '6.0-baseline';
				project: 'SciSmalltalk' with: '0.29-baseline';
				project: 'Ston' with: '0.19'.
			spec package: 'Kendrick' with: 'Kendrick-SergeStinckwich.537' ]