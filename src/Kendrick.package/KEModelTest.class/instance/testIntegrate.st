tests-accessing
testIntegrate
	|model concern|
	model := KEModel new.
	concern := KEConcern new.
	concern addAttribute: #status value: #(S I R).
	concern 
		addTransitionFrom: { #status->#S } 
		to: { #status->#I } 
		probability: [ :aModel| (aModel atParameter: #beta) * (aModel atCompartment: {#status->#I})].
	concern 
		addTransitionFrom: { #status->#I } 
		to: { #status->#R } 
		probability: [ :aModel| (aModel atParameter: #gamma)].
	concern addParameters: { #beta. #gamma }.
	model integrate: concern.
	self should: ((model parameters size)  >= 2).
	self assert: (model transitions size) equals: 2.
	self assert: (model attributes size) equals: 1.
	self assert: (model compartmentNames size) equals: 3.  