accessing
weight: aParameter
	aParameter ifNil: [ weight := nil ].
	aParameter ifNotNil: [ weight := aParameter ]
	