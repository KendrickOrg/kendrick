as yet unclassified 
reAssignParameterN
	| temp |
	temp := model atParameter: #N.
	temp isArray
		ifTrue: [ model
				atParameter: #N
				assignValue: [ :aModel | 
					| c currentComp |
					c := aModel currentCompartment copy.
					c removeKey: #status.
					"c := aModel currentCompartment at: #species."
					"c := currentComp values."
					aModel sizeOfPopulation: (c values) ] ]