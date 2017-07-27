tests
testAtParameterAssignValue
	| tmp1 |
	tmp1 := KEModel new.
	tmp1
		addParameters:
			{(#beta -> 0.01).
			(#gamma -> 0.02)}.
	self assert: (tmp1 atParameter: #beta) equals: 0.01.
	tmp1
		atParameter: #beta
			assignValue: [ :arg1 | 
			| tmp2 |
			tmp2 := arg1 currentCompartment at: #species.
			tmp2 = #mosquito
				ifTrue: [ ^ 0.03 ].
			tmp2 = #reservoir1
				ifTrue: [ ^ 0.005 ].
			tmp2 = #reservoir2
				ifTrue: [ ^ 0.001 ] ];
		currentCompartment:
			(Dictionary
				newFrom:
					{(#status -> #S).
					(#species -> #mosquito)}).
	self assert: (tmp1 atParameter: #beta) equals: 0.03