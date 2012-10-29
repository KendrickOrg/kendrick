as yet unclassified
runSEIRTemporalForcing

"self runSEIRTemporalForcing"

| model result |
model := KEModel new.
model atCompartment:#S putNumberOfIndividuals: 99999.
model atCompartment: #E putNumberOfIndividuals: 1.
model atCompartment:#I putNumberOfIndividuals: 1.
model atCompartment:#R putNumberOfIndividuals: 0.
model atParameter:#beta put: 0.0052.
model atParameter: #gamma put: 365/7.
model atParameter: #sigma put: 365/7.
model atParameter: #mu put: 1/80.
model atParameter: #betaAmp put: 0.3.
model atParameter: #N put: 100000.

model addEquation: (PPODEParser parse:'S:t=mu*N-beta*(1+betaAmp*cos(t))*S*I-mu*S').
model addEquation: (PPODEParser parse:'E:t=beta*(1+betaAmp*cos(t))*S*I-sigma*E-mu*E').
model addEquation: (PPODEParser parse:'I:t=sigma*E-gamma*I-mu*I').
model addEquation: (PPODEParser parse:'R:t=gamma*I-mu*R').

"result := model runDeterministSimulationFrom: 0 to: 400 with: 0.01.
result plot: #I in: model do: #log."
model runStochasticSimulationFor: (10/365).
model plot.