tests
testAtStatusPut2
	|model|
	model := KEModel new.
	model population: (KEPopulation size: 100).
	model addAttribute: #status value: #(S I R).
	model addAttribute: #node value: ((1 to: 100) collect: [:i| i asString asSymbol]).
	model atStatus: #S put: 99.
	self should: (model atCompartment: {#status->#S. #node->#'1'}) = 1.
	self should: (model atCompartment: {#status->#S. #node->#'2'}) = 1.
	self should: (model atCompartment: {#status->#S. #node->#'3'}) = 1.
	self should: (model atCompartment: {#status->#S. #node->#'100'}) >= 0.
	
	