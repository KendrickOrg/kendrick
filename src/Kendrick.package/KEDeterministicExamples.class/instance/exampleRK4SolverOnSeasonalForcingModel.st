examples
exampleRK4SolverOnSeasonalForcingModel
	"self new exampleRK4SolverOnSeasonalForcingModel"
	|model simulator output dB |
	model := KEModel new.
	model buildFromCompartments: '{
		{ #status: #S }: 99999,
		{ #status: #E }: 0,
		{ #status: #I }: 1,
		{ #status: #R }: 0
	}'.
	model addParameters: '{#beta0: 0.0052, #gamma: 52, #sigma: 52, #betaAmp: 0.3, #N: 100000, #mu: 0.0125}'.
	model addParameter: #beta expression: 'beta0*(1 + (betaAmp*cos(t)))' parseAsAnExpression. 
	model addEquation: 'S:t=mu*N-beta*S*I-mu*S' parseAsAnEquation.
	model addEquation: 'E:t=beta*S*I-sigma*E-mu*E' parseAsAnEquation.
	model addEquation: 'I:t=sigma*E-gamma*I-mu*I' parseAsAnEquation.
	model addEquation: 'R:t=gamma*I-mu*R' parseAsAnEquation.
	simulator := KESimulator new: #RungeKutta from: 0.0 to: 400 step: 0.01.
	simulator executeOn: model.
	output := simulator data.
	dB := KEDiagramBuilder new.
	dB data: (output dataAt: '{#status: #I}') do: #log.
	dB open