tests
testBuildACompartmentFromSTON
	| c |
	c := KECompartment fromSTON: '{#status: #I, #patch:''1''}'.
	self assert: c nbAttributes equals: 2