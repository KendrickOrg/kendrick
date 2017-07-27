as yet unclassified
testContactsOf
	| tmp1 tmp2 |
	tmp1 := KEModel new population: (KEPopulation size: 100).
	tmp2 := KEContactNetwork
		nodes: 100
		topology:
			{#random.
			(#p -> 1)}.
	tmp1
		addAttribute: #node value: tmp2 allContacts;
		addAttribute: #network value: {tmp2}.
	1 to: 100 do: [ :tmp3 | 
		tmp1
			atCompartment:
				{(#node -> tmp3 asString asSymbol).
				(#network -> tmp2)}
			put: 1 ].
	tmp1
		currentCompartment:
			(Dictionary
				newFrom:
					{(#node -> #'1').
					(#network -> tmp2)}).
	self
		assert:
			(tmp2
				contactsOf:
					{tmp1.
					(#node -> #'1')})
		equals: 99