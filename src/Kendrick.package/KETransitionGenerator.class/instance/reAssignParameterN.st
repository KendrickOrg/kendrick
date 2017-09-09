as yet unclassified 
reAssignParameterN
	| temp |
	model class = KEModel
		ifTrue: [ model population compartments
				ifNotNil: [ temp := model atParameter: #N.
					temp isArray
						ifTrue: [ model
								atParameter: #N
								assignValue: [ :aModel | 
									| c |
									c := aModel currentCompartment copy.
									c removeKey: #status.
									aModel sizeOfPopulation: c values ] ] ] ]