data
sampleModelsV2

"SampleModelsV2 ifNil: 
["
	|model|   
	SampleModelsV2 := GLMAnnouncingCollection new.
	
	model := KEModel new.
	model atCompartment: #S putNumberOfIndividuals: 1e5 - 1.
	model atCompartment: #I putNumberOfIndividuals: 1.
	model atCompartment: #R putNumberOfIndividuals: 0.
	model atParameter: #beta put: 0.0052.
	model atParameter: #gamma put: 365 / 7.
	model addEquation: (PPODEParser parse: 'S:t=-beta*S*I').
	model addEquation: (PPODEParser parse: 'I:t=beta*S*I-gamma*I').
	model addEquation: (PPODEParser parse: 'R:t=gamma*I').
	model runDeterministSimulationFrom: 0.0 to: 1.0 withStep: 0.0001.
	SampleModelsV2 add: model.
	
	model := KEModel new.
	model atCompartment: #S putNumberOfIndividuals: 99999.
	model atCompartment: #E putNumberOfIndividuals: 0.
	model atCompartment: #I putNumberOfIndividuals: 1.
	model atCompartment: #R putNumberOfIndividuals: 0.
	model atParameter: #beta put: 0.0052.
	model atParameter: #gamma put: 365 / 7.
	model atParameter: #sigma put: 365 / 7.
	model atParameter: #mu put: 1 / 80.
	model atParameter: #N put: 100000.
	model addEquation: (PPODEParser parse: 'S:t=mu*N-beta*S*I-mu*S').
	model addEquation: (PPODEParser parse: 'E:t=beta*S*I-sigma*E-mu*E').
	model addEquation: (PPODEParser parse: 'I:t=sigma*E-gamma*I-mu*I').
	model addEquation: (PPODEParser parse: 'R:t=gamma*I-mu*R').
	model runDeterministSimulationFrom: 0.0 to: 1.0 withStep: 0.0001.
	SampleModelsV2 add: model.
	
	model := KEModel new.
	model atCompartment: #S putNumberOfIndividuals: 99999.
	model atCompartment: #E putNumberOfIndividuals: 1.
	model atCompartment: #I putNumberOfIndividuals: 1.
	model atCompartment: #R putNumberOfIndividuals: 0.
	model atParameter: #beta put: 0.0052.
	model atParameter: #gamma put: 365 / 7.
	model atParameter: #sigma put: 365 / 7.
	model atParameter: #mu put: 1 / 80.
	model atParameter: #to put: 2.
	model atParameter: #N put: 100000.
	model addEquation: (PPODEParser parse: 'S:t=mu*N-beta*S*I-mu*S+to*R').
	model addEquation: (PPODEParser parse: 'E:t=beta*S*I-sigma*E-mu*E').
	model addEquation: (PPODEParser parse: 'I:t=sigma*E-gamma*I-mu*I').
	model addEquation: (PPODEParser parse: 'R:t=gamma*I-mu*R-to*R').
	model runDeterministSimulationFrom: 0.0 to: 1.0 withStep: 0.0001.
	SampleModelsV2 add: model.
	"]."
^SampleModelsV2