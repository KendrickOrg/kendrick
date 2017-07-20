examples
exampleRK4SolverOnSEIRSModelWithTwoStrains
	"self new exampleRK4SolverOnSEIRSModelWithTwoStrains"
	| model SEIRConcern SEIRSConcern twoStrains simulator dB data|
	model := KEModel new.
	model population: (KEPopulation size: 5000).
	SEIRConcern := KEModelPart new.
	SEIRConcern attributes: {#status->#(#S #E #I #R)}.
	SEIRConcern addParameters: { #beta. #gamma. #mu. #sigma}.
	SEIRConcern addParameter: #lambda value: 'beta*I/N'.
	SEIRConcern addEquations: { 
		'S:t=mu*N - lambda*S - mu*S'.
		'E:t=lambda*S - sigma*E - mu*E'.
		'I:t=sigma*E - gamma*I - mu*I'.
		'R:t=gamma*I - mu*R'
	 }.		
	
	SEIRSConcern := KEModelPart extends: SEIRConcern.
	SEIRSConcern addTransitionFrom: { #status->#R } to: { #status->#S } probability: 'nu'.
	SEIRSConcern addParameter: #nu.
	
	twoStrains := KEModelPart extends: SEIRSConcern.
	twoStrains splitStatus: {  #(I). #strains->#(1 2) }.
	twoStrains addParameters: { #beta1. #beta2 }.
	
	model integrate: twoStrains.
		
	model atParameter: #beta1 assignValue: 0.42.
	model atParameter: #beta2 assignValue: 0.0042.
	model atParameter: #gamma assignValue: [ :aModel| |c val| 
			c := aModel currentCompartment at: #status.
			c = #I1 ifTrue: [ val := 0.233 ].
			c = #I2 ifTrue: [ val := 0.00233 ].
			val
		].
	model atParameter: #sigma assignValue: [ :aModel| |c val| 
			c := aModel nextCompartment at: #status.
			c = #I1 ifTrue: [ val := 0.67 ].
			c = #I2 ifTrue: [ val := 0.0067 ].
			val
		].
	model atParameter: #mu assignValue: 0.00137.
	model atParameter: #nu assignValue: 0.00274.
	model atParameter: #lambda assignValue: '((beta1*I1)+(beta2*I2))/N'.
	
	model atCompartment: { #status->#S } put: 4990.
	model atCompartment: { #status->#I } put: 0.
	model atCompartment: { #status->#I1 } put: 10.
	model atCompartment: { #status->#I2 } put: 0.
	model atCompartment: { #status->#R } put: 0.
	model atCompartment: { #status->#E } put: 0.

	simulator := KESimulator new: #RungeKutta from: 0.0 to: 365 step: 1.
	simulator executeOn: model.
	dB := KEDiagramBuilder new.
	data := OrderedCollection new.
	data addAll: (simulator allTimesSeriesContaining: '{#status: #I1}').
	data addAll: (simulator allTimesSeriesContaining: '{#status: #I2}').
	dB data: data.
	dB xLabel: 'Time (year)'.
	dB open.