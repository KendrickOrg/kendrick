behavior
die
	|ind model pop|
	ind := self arguments at: #ind.
	model := self arguments at: #model.
	pop := model population at: (model getPID).
	pop graph hasNetwork ifTrue: [ pop graph releaseRoom: (ind id) ].
	(pop at: ind currentStatus) removeIndividual: 1.
	^ true