as yet unclassified
viewDataAtTime: arg1
	| tmp1 |
	status isEmpty
		ifTrue: [ ^ self
				error: 'You should set up the status that you want to view with the network' ].
	status size > 1
		ifTrue: [ isAtIndividualLevel := true ]
		ifFalse: [ isAtIndividualLevel := false ].
	tmp1 := data first indexOfTime: arg1.
	vizData := Dictionary new.
	network allContacts
		do: [ :arg2 | 
			vizData
				at: arg2
				put: (Dictionary newFrom: (status collect: [ :arg3 | arg3 -> 0 ])) ].
	data
		do: [ :arg4 | 
			| tmp2 tmp3 tmp4 |
			tmp2 := arg4 compartment at: #node.
			tmp3 := arg4 compartment at: #status.
			(status includes: tmp3) & ((arg4 data at: tmp1) > 0)
				ifTrue: [ tmp4 := (vizData at: tmp2) at: tmp3.
					(vizData at: tmp2) at: tmp3 put: tmp4 + (arg4 data at: tmp1) ] ].
	network allContacts
		do: [ :arg5 | 
			vizData
				at: arg5
				put: ((vizData at: arg5) associations select: [ :arg6 | arg6 value > 0 ]) ].
	vizData values
		detect: [ :arg7 | arg7 size > 1 ]
		ifFound: [ ^ self
				error: 'A node of visualizing network should represent one status' ]