tests-as yet unclassified
spatialConcern
	| tmp1 |
	tmp1 := KEModelPart new.
	tmp1
		addAttribute: #patch value: (1 to: 5) asArray;
		addParameter: #rho.
	(1 to: 5)
		do: [ :arg1 | 
			arg1 < 5
				ifTrue: [ tmp1
						addTransitionFrom: {(#patch -> arg1)}
						to: {(#patch -> (arg1 + 1))}
						probability: [ :arg2 | arg2 atParameter: #rho ] ]
				ifFalse: [ tmp1
						addTransitionFrom: {(#patch -> arg1)}
						to: {(#patch -> 1)}
						probability: [ :arg3 | arg3 atParameter: #rho ] ] ].
	^ tmp1