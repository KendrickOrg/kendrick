public-api
others: arg1
	otherCompartmentValue := arg1.
	backEndEntity attributes
		associationsDo: [ :arg2 | 
			arg2 value
				do: [ :arg3 | 
					(explicitelySetCompartments includes: arg3)
						ifFalse: [ self atCompartment: arg3 value: arg1 ] ] ]