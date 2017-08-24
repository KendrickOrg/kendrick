as yet unclassified 
reAssignParameterN
	| temp |
	temp := model atParameter: #N.
	temp isNumber
		ifFalse: [ model
				atParameter: #N
				assignValue: [ :aModel | aModel atCompartment: aModel currentCompartment ] ]