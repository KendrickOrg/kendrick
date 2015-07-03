examples
modelRK4SolverOnSeasonalForcingModel
	"self new exampleRK4SolverOnSeasonalForcingModel"

	| model |
	model := KEModel new.
	model population attributes: '{ #status: [#S, #E, #I, #R] }'.
	model
		buildFromCompartments:
			'{
		{ #status: #S }: 99999,
		{ #status: #E }: 0,
		{ #status: #I }: 1,
		{ #status: #R }: 0
	}'.
	model addParameters: '{
		#beta0: 0.0052, 
		#gamma: 52, 
		#sigma: 52, 
		#betaAmp: 0.3, 
		#N: #sizeOfPopulation, 
		#mu: 0.0125}'.
	model
		addParameter: #beta 
		value: 'beta0*(1 + (betaAmp*cos(t)))' parseAsAnExpression.
	model 
		addEquation: 'S:t=mu*N-beta*S*I-mu*S' parseAsAnEquation.
	model 
		addEquation: 'E:t=beta*S*I-sigma*E-mu*E' parseAsAnEquation.
	model 
		addEquation: 'I:t=sigma*E-gamma*I-mu*I' parseAsAnEquation.
	model 
		addEquation: 'R:t=gamma*I-mu*R' parseAsAnEquation.
	^ model