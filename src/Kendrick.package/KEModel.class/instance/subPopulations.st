accessing
subPopulations
	subPopulations ifNil: [ subPopulations := population subPopulations ].
	^ subPopulations