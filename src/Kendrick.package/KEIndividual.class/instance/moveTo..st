as yet unclassified
moveTo: subPopulation
	subPopulation graph newInd: self in: (subPopulation id).
	(subPopulation at: (self currentStatus)) addIndividual: 1.