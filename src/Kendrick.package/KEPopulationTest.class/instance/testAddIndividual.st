as yet unclassified
testAddIndividual
	| tmp1 tmp2 |
	tmp1 := KEPopulation new.
	tmp1
		compartments:
			(Dictionary
				newFrom:
					{((Dictionary newFrom: {(#status -> #S)}) -> 999).
					((Dictionary newFrom: {(#status -> #I)}) -> 1).
					((Dictionary newFrom: {(#status -> #R)}) -> 0)}).
	tmp2 := KEIndividual new
		currentStatus: (Dictionary newFrom: {(#status -> #I)}).
	tmp1 addIndividual: tmp2.
	self assert: tmp1 individuals size equals: 1001