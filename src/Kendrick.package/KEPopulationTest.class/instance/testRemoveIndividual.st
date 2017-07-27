as yet unclassified
testRemoveIndividual
	| tmp1 |
	tmp1 := KEPopulation new.
	tmp1
		compartments:
			(Dictionary
				newFrom:
					{((Dictionary newFrom: {(#status -> #S)}) -> 999).
					((Dictionary newFrom: {(#status -> #I)}) -> 1).
					((Dictionary newFrom: {(#status -> #R)}) -> 0)});
		removeIndividual: tmp1 individuals last.
	self
		assert: tmp1 individuals size equals: 1000;
		assert: tmp1 diedIndList size equals: 1;
		assert: tmp1 individuals last isAlive equals: false