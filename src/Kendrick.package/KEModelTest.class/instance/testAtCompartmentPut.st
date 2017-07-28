tests
testAtCompartmentPut
	|model|
	model := KEModel new.
	model population: (KEPopulation size: 100000).
	model addAttribute: #status value: #(S I R).
	model atCompartment: { #status->#S } put: 100000.
	self assert: (model atCompartment: {#status->#S}) equals: 100000.
	