as yet unclassified
doIteration
	model subPopulations do: [ :each|
		|indList|
		model currentSubPopulation: each.
		"pid isArray ifTrue: [ model setIndex: (pid last) ]."
		model setIndex: (each populationID).
		"subPop := model population at: pid."
		indList := each indList.
		indList do: [ :ind|
			(ind attributes at: #alive) ifTrue: [  	
				model addTemporalParameter: #ind value: (ind id). 
				self calProb: ind ]
			 ].
		"Specially processing for the birth of new ind"
		self doBirthEvent: each
		 ]