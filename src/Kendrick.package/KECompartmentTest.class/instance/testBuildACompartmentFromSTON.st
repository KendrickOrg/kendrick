tests
testBuildACompartmentFromSTON
	| tmp1 |
	tmp1 := KECompartment fromSTON: '{#status: #I, #patch:''1''}'.
	self assert: tmp1 nbAttributes equals: 2