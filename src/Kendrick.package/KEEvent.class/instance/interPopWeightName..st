accessing
interPopWeightName: aParameter
	aParameter ifNil: [ interPopWeightName := nil ].
	aParameter ifNotNil: [ interPopWeightName := aParameter ]
	