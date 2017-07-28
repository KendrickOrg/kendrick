tests
testEvaluateProbability
	|tr model rs|
	model := KEModel new population: (KEPopulation size: 10001).
	model attributes: { #status->#(S I R) }.
	model atCompartment: { #status->#S } put: 10000 atOthersPut: 0.
	model atCompartment: { #status->#I } put: 1.
	tr := KETransition
			from: '{#status: #S}'
			to: '{#status: #I}'
			probability: [ :fr :to :t| (model atParameter: #beta) * fr * to ].
	
	model addParameters: {#beta->0.0052. #gamma->52}.
	rs := tr probability 
			value: (model atCompartment: tr from)
			value: (model atCompartment: tr to)
			value: 0.
	self assert: rs equals: 52