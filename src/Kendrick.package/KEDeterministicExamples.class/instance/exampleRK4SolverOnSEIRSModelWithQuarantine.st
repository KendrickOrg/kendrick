examples
exampleRK4SolverOnSEIRSModelWithQuarantine
	"self new exampleRK4SolverOnSEIRSModelWithQuarantine"
	| model SEIRConcern SEIRSConcern QuarantineConcern simulator dB|
	model := KEModel new.
	model population: (KEPopulation size: 5000).
	SEIRConcern := KEConcern new.
	SEIRConcern attributes: {#status->#(#S #E #I #R)}.
	SEIRConcern addParameters: { #beta. #gamma. #mu. #sigma}.
	SEIRConcern addParameter: #lambda value: 'beta*I/N'.
	SEIRConcern addEquations: { 
		'S:t=mu*N - lambda*S - mu*S'.
		'E:t=lambda*S - sigma*E - mu*E'.
		'I:t=sigma*E - gamma*I - mu*I'.
		'R:t=gamma*I - mu*R'
	 }.		
	
	SEIRSConcern := KEConcern dependOn: SEIRConcern.
	SEIRSConcern addTransitionFrom: { #status->#R } to: { #status->#S } probability: 'nu'.
	SEIRSConcern addParameter: #nu.
	
	QuarantineConcern := KEConcern dependOn: SEIRConcern.
	QuarantineConcern addStatus: #(Q).
	QuarantineConcern addTransitionFrom: { #status->#I } to: { #status->#Q } probability: 'delta'.
	QuarantineConcern addTransitionFrom: { #status->#Q } to: { #status->#R } probability: 'epsilon'.
	QuarantineConcern addTransitionFrom: { #status->#Q } to: #empty probability: 'mu'.
	QuarantineConcern addParameters: { #delta. #epsilon }.
	QuarantineConcern addParameter: #lambda value: 'beta*I/(N-Q)'.
	
	model integrate: SEIRConcern.
	model integrate: SEIRSConcern.
	model integrate: QuarantineConcern.
	
	model atParameter: #beta assignValue: 2.14.
	model atParameter: #gamma assignValue: 0.143.
	model atParameter: #sigma assignValue: 0.125.
	model atParameter: #mu assignValue: 0.0000351.
	model atParameter: #nu assignValue: 0.00274.
	model atParameter: #delta assignValue: 0.068.
	model atParameter: #epsilon assignValue: 0.027.
	
	model atCompartment: { #status->#S } put: 4999.
	model atCompartment: { #status->#I } put: 1.
	model atCompartment: { #status->#R } put: 0.
	model atCompartment: { #status->#E } put: 0.
	
	simulator := KESimulator new: #RungeKutta from: 0.0 to: 365 step: 1.
	simulator executeOn: model.
	dB := KEDiagramBuilder new.
	dB data: (simulator allTimeSeries ).
	dB xLabel: 'Time (year)'.
	dB open.