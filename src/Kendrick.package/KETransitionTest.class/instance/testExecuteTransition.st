tests
testExecuteTransition
	|tr model |
	tr := KETransition
			from: '{#status: #S}'
			to: '{#status: #I}'
			probability: [ :f :t :m| (m atParameter: #beta) * f * t ].
	model := KEModel new population: (KEPopulation size: 10001).
	model attributes: { #status->#(S I R) }.
	model atCompartment: { #status->#S } put: 10000 atOthersPut: 0.
	model atCompartment: { #status->#I } put: 1.
	model addParameters: {#beta->0.0052. #gamma->52}.
	tr executeOn: model times: 1.
	self assert: (model atCompartment: '{#status:#S}') equals: 9999.
	self assert: (model atCompartment: '{#status:#I}') equals: 2.  