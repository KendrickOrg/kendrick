as yet unclassified
testSEIRModelWithTemporalForcing
	| model result visitor |
	model := KEModel new.
	model atCompartment: #S putNumberOfIndividuals: 99999.
	model atCompartment: #E putNumberOfIndividuals: 1.
	model atCompartment: #I putNumberOfIndividuals: 1.
	model atCompartment: #R putNumberOfIndividuals: 0.
	model atParameter: #beta put: 0.0052.
	model atParameter: #gamma put: 365 / 7.
	model atParameter: #sigma put: 365 / 7.
	model atParameter: #mu put: 1 / 80.
	model atParameter: #betaAmp put: 0.3.
	model atParameter: #N put: 100000.
	model addEquation: ('S:t=mu*N-beta*(1+betaAmp*cos(t))*S*I-mu*S').
	model addEquation: ('E:t=beta*(1+betaAmp*cos(t))*S*I-sigma*E-mu*E').
	model addEquation: ('I:t=sigma*E-gamma*I-mu*I').
	model addEquation: ('R:t=gamma*I-mu*R').
	result := model runDeterministSimulationFrom: 0 to: 400 withStep: 0.01.
	visitor := KECPPDeterministicVisitor new.
	visitor visitNode: model.
	self assert: (visitor compartments size) = 4.
	self assert: (visitor parameters size) = 6.