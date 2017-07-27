as yet unclassified
testUpdateIndividual
	| tmp1 tmp2 |
	tmp1 := KEPopulation new.
	tmp1
		compartments:
			(Dictionary
				newFrom:
					{((Dictionary newFrom: {(#status -> #S)}) -> 999).
					((Dictionary newFrom: {(#status -> #I)}) -> 1).
					((Dictionary newFrom: {(#status -> #R)}) -> 0)}).
	tmp2 := tmp1 individuals last.
	tmp2 nextStatus: (Dictionary newFrom: {(#status -> #R)}).
	tmp1 updateIndividual: tmp2.
	self
		assert: tmp1 individuals size equals: 1000;
		assert: tmp1 individuals last nextStatus equals: nil;
		assert: (tmp1 individuals last currentStatus at: #status)
			equals: #R