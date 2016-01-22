tests
testAtCompartment
	|model compartment|
	model := KEModel new population: (KEPopulation size: 100000).
	model attributes: { #status->#(S I R). #region->#(A B C) }.
	model atCompartment: { #status->#S. #region->#A } put: 99999 atOthersPut: 0.
	compartment := model atCompartment: '{#region: #A, #status: #S}'.
	self assert: compartment equals: 99999