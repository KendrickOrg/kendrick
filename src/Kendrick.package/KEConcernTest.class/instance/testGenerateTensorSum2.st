tests-as yet unclassified
testGenerateTensorSum2
	|concern model|
	concern := KEConcern new.
	concern addAttribute: #status value: #(S I R).
	model := KEModel new.
	model addAttribute: #species value: #(mosquito reservoir1 reservoir2).
	concern addTransitionFrom: { #status->#S } to: { #status->#I } probability: [ :aModel| (aModel atParameter: #beta) * (aModel atCompartment: {#status->#I})].
	concern addTransitionFrom: { #status->#I } to: { #status->#R } probability: [ :aModel| (aModel atParameter: #gamma)].
	self assert: model transitions size equals: 9.
	self assert: (concern generateTensorSum: model transitions) size equals: 6
	