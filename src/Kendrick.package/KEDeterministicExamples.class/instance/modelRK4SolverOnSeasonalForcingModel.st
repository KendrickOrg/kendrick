examples
modelRK4SolverOnSeasonalForcingModel
	"self new exampleRK4SolverOnSeasonalForcingModel"

	| model |
	model := KEModel new population: (KEPopulation size: 100000).
	model attributes: { #status->#(#S #E #I #R) }.
	model atCompartment: { #status->#S } put: 99999 atOthersPut: 0.
	model atCompartment: { #status->#I } put: 1.
	model addParameters: {
		#beta0->0.0052.
		#gamma->52. 
		#sigma->52. 
		#betaAmp->0.3.
		#mu->0.0125}.
	model
		addParameter: #beta 
		value: 'beta0*(1 + (betaAmp*cos(t)))' parseAsAnExpression.
	model 
		addEquation: 'S:t=mu*N-beta*S*I-mu*S'.
	model 
		addEquation: 'E:t=beta*S*I-sigma*E-mu*E'.
	model 
		addEquation: 'I:t=sigma*E-gamma*I-mu*I'.
	model 
		addEquation: 'R:t=gamma*I-mu*R'.
	^ model