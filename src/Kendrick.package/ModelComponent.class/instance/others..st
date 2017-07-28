public-api
others: anInteger

	otherCompartmentValue := anInteger.

	backEndEntity attributes
		associationsDo: [ :assoc | 
			assoc value do: [:var |
				(explicitelySetCompartments includes: var)
					ifFalse: [ self atCompartment: var value: anInteger ]
			] 
		]