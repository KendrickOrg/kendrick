accessing
executeOn: model times: times
	from = #empty ifFalse:
	[  
		|old new|
		old := model compartments at: from.
		new := old - times.
		new < 0 ifTrue: [ new := 0 ].
		model compartments at: from put: new
	].
	to = #empty ifFalse:
	[  
		|old new|
		old := model compartments at: to.
		new := old + times.
		model compartments at: to put: new
	]	