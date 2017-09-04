as yet unclassified 
reAssignParameterN
	| temp |
	temp := model atParameter: #N.
	temp isArray
		ifTrue: [ model
				atParameter: #N
				assignValue: [ :aModel | 
					| c |
					c := aModel currentCompartment copy.
					c removeKey: #status.
					
					aModel sizeOfPopulation: c values ] ]