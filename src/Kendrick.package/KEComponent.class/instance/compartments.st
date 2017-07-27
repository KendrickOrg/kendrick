public-api
compartments
	^ self compartmentNames collect: [ :arg1 | KECompartment from: arg1 ]