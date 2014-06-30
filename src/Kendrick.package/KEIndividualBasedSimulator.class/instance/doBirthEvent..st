as yet unclassified
doBirthEvent: subPop
	|rand r p|
	rand := Random new.
	r := (model population at: (model getPID)) rates at: #empty ifAbsent: [ nil ].
	r ifNotNil: [ 
		p := 1 - ((((r first) * step) negated) exp).
		(p > (rand next)) ifTrue: [ 
			|new stt|
			new := KEIndividual new.
			stt := (((rtImpls at: 1) events at: #empty) first toStatus).
			new currentStatus: stt.
			new nextStatus: #new.
			new updateStatus: model
			 ]
		 ]
	