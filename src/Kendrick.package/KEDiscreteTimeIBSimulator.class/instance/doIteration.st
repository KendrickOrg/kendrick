as yet unclassified
doIteration
	model PIDList do: [ :pid|
		|subPop indList|
		model setPID: pid.
		pid isArray ifTrue: [ model setIndex: (pid last) ].
		subPop := model population at: pid.
		indList := subPop graph indList.
		indList do: [ :ind|
			"ind ifNotNil: [" 
			(ind attributes at: #alive) ifTrue: [  	
				model addTemporalParameter: #ind value: (ind id). 
				self calProb: ind ].
			 ].
		"Specially processing for the birth of new ind"
		self doBirthEvent: subPop
		 ]