as yet unclassified
testContactsOf
	| tmp1 tmp2 tmp3 |
	tmp2 := KEModel new population: (KEPopulation size: 100).
	tmp3 := KEContactNetwork
		nodes: 100
		topology:
			{#random.
			(#p -> 1)}.
	tmp2
		addAttribute: #node value: tmp3 allContacts;
		addAttribute: #network value: {tmp3}.
	1 to: 100 do: [ :tmp4 | 
		tmp2
			atCompartment:
				{(#node -> tmp4 asString asSymbol).
				(#network -> tmp3)}
			put: 1 ].
	tmp2
		currentCompartment:
			(Dictionary
				newFrom:
					{(#node -> #'1').
					(#network -> tmp3)}).
	tmp1 := tmp3 atNode: #'1'.
	self assert: (tmp1 contactsOf: {tmp2}) equals: 99