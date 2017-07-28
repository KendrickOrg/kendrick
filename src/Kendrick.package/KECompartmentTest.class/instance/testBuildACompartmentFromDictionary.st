tests
testBuildACompartmentFromDictionary
	| c |
	c := KECompartment from: {#status->#I. #patch-> #'1'}.
	self assert: c nbAttributes equals: 2