examples
modelRK4SolverOnMultipleRiskGroupsModel
	"self new exampleRK4SolverOnMultipleRiskGroupsModel"
	| model riskGroupConcern |
	riskGroupConcern := self riskGroupConcern.
	model := KEModel new population: (KEPopulation size: 100000).
	model attributes: {#status->#(S I)}.
	model addParameter: #beta value: 16e-9.
	model addParameter: #gamma value: 0.2.
	model addParameter: #lambda value: 'beta*I'. 
	model addEquation: 'S:t=gamma*I-lambda*S'.
	model addEquation: 'I:t=lambda*S-gamma*I'.
	
	model integrate: riskGroupConcern.
	model addParameter: #rho value: [ :aModel| |c val|
		c := aModel currentCompartment at: #riskGroup.
		c = 1 ifTrue: [ val := #(0 0 0 0 0) ].
		c = 2 ifTrue: [ val := #(0 9 30 180 300) ].
		c = 3 ifTrue: [ val := #(0 30 100 600 1000) ].
		c = 4 ifTrue: [ val := #(0 180 600 3600 6000) ].
		c = 5 ifTrue: [ val := #(0 300 1000 6000 10000) ].
		val
	]. 
	model atParameter: #lambda assignValue: [:aModel| 
		((aModel atParameter: #beta) *
		(aModel atCompartment: {#status->#I}) *
		(aModel atParameter: #rho)) sum
	].
	model atCompartment: { #status->#I. #riskGroup->5 } put: 1 atOthersPut: 0.
	model atCompartment: { #status->#S. #riskGroup->1 } put: 6000.
	model atCompartment: { #status->#S. #riskGroup->2 } put: 31000.
	model atCompartment: { #status->#S. #riskGroup->3 } put: 52000.
	model atCompartment: { #status->#S. #riskGroup->4 } put: 8000.
	model atCompartment: { #status->#S. #riskGroup->5 } put: 2999.

	^ model