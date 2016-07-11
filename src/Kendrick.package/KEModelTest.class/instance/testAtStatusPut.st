tests
testAtStatusPut
	|model|
	model := KEModel new.
	model population: (KEPopulation size: 100000).
	model addAttribute: #status value: #(S I R).
	model addAttribute: #country value: #(A B C).
	model atStatus: #S put: 100000.
	self should: (model atCompartment: {#status->#S. #country->#A}) >= 33333.
	self should: (model atCompartment: {#status->#S. #country->#B}) >= 33333.
	self should: (model atCompartment: {#status->#S. #country->#C}) >= 33333.
	