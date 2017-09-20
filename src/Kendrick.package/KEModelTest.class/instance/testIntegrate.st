tests
testIntegrate
	|model concern|
	model := KEModel new population: (KEPopulation size: 1000).
	concern := KEModelPart new.
	concern addAttribute: #status value: #(S I R).
	concern 
		addTransitionFrom: { #status->#S } 
		to: { #status->#I } 
		probability: [ :aModel| aModel atParameter: #lambda].
	concern 
		addTransitionFrom: { #status->#I } 
		to: { #status->#R } 
		probability: [ :aModel| (aModel atParameter: #gamma)].
	concern addParameters: { #beta. #gamma }.
	concern addParameter: #lambda value: [ :aModel| (aModel atParameter: #beta) * (aModel atCompartment: {#status->#I}) ]. 
	model integrate: concern.
	self should: ((model parameters size)  >= 3).
	self assert: (model transitions size) equals: 2.
	self assert: (model attributes size) equals: 1.
	self assert: (model compartments size) equals: 3.  