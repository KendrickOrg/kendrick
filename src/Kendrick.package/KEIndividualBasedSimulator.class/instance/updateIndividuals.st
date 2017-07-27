as yet unclassified
updateIndividuals
	| tmp1 tmp2 tmp3 |
	model population individuals
		do: [ :arg1 | 
			(arg1 isAlive and: [ arg1 nextStatus isNotNil ])
				ifTrue: [ (arg1 nextStatus at: #status) = #empty
						ifTrue: [ model population removeIndividual: arg1 ]
						ifFalse: [ model population updateIndividual: arg1 ] ] ].
	tmp1 := model transitions size.
	tmp3 := tmp1.
	1 to: tmp3 do: [ :tmp4 | 
		tmp2 := nil.
		tmp2 := model transitions at: tmp4.
		tmp2 executeOn: model times: (self transitionNbExecutions at: tmp4).
		self transitionNbExecutions at: tmp4 put: 0 ]