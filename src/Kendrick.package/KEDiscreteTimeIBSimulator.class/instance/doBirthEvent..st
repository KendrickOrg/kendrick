as yet unclassified
doBirthEvent: subPop
	|rand r p|
	rand := Random new.
	r := (eventRates at: #empty) first.
		p := 1 - (((r * step) negated) exp).
		(p > (rand next)) ifTrue: [ 
			|new stt|
			new := KEIndividual new.
			stt := ((eventList at: #empty) first toStatus).
			new currentStatus: stt.
			subPop graph newInd: new in: (subPop id).
			(subPop at: stt) addIndividual: 1
			 ]