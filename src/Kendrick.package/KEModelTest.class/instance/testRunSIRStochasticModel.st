as yet unclassified
testRunSIRStochasticModel

| model |
model := KEModel new.
model atCompartment:#S putNumberOfIndividuals: 1e6-1.
model atCompartment:#I putNumberOfIndividuals: 1.
model atCompartment:#R putNumberOfIndividuals: 0.
model atParameter:#beta put: 520/1e6.
model atParameter: #gamma put: 365/7.
self assert: (model atParameter:#beta) equals: 520/1e6.
self assert: (model atParameter:#gamma) equals: 365/7.

model addEquation: (PPODEParser parse:'S:t=-beta*S*I').
model addEquation: (PPODEParser parse: 'I:t=beta*S*I-gamma*I').
model addEquation: (PPODEParser parse: 'R:t=gamma*I').

model runStochasticSimulationFor: 0.01.

self assert: 1e6 equals: ( model numberOfIndividualsAtCompartment: #S )+ (model numberOfIndividualsAtCompartment: #I) + (model numberOfIndividualsAtCompartment: #R)