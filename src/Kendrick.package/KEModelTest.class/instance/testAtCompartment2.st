tests
testAtCompartment2
	|model |
	model := KEModel new population: (KEPopulation size: 100000).
	model attributes: { #status->#(S I R). #region->#(A B C) }.
	model atCompartment: { #status->#S. #region->#A } put: 99999 atOthersPut: 0.
	model atCompartment: { #status->#I. #region->#A } put: 1.
	
	self assert: (model atCompartment: {#region->#A. #status->#S}) equals: 99999.
	self assert: (model atCompartment: {#region->#A}) equals: #(99999 1 0).
	self assert: (model atCompartment: {#status->#S}) equals: #(99999 0 0).