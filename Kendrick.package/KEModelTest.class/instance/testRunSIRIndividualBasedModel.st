tests
testRunSIRIndividualBasedModel

| model |
model := KEModel new.
model atCompartment:#S putNumberOfIndividuals: 1e5-1.
model atCompartment:#I putNumberOfIndividuals: 1.
model atCompartment:#R putNumberOfIndividuals: 0.
model atParameter:#beta put: 0.0052.
model atParameter: #gamma put: 365/7.
model atParameter: #mu put: 1/80.
model atParameter: #N put: 100000.
"model addEquation: (PPODEParser parse: 'S:t=-beta*S*I').
model addEquation: (PPODEParser parse: 'I:t=beta*S*I-gamma*I').
model addEquation: (PPODEParser parse: 'R:t=gamma*I')."

model addEquation: (PPODEParser parse:'S:t= mu*N-beta*S*I-mu*S').
model addEquation: (PPODEParser parse: 'I:t=beta*S*I-gamma*I-mu*I').
model addEquation: (PPODEParser parse: 'R:t=gamma*I-mu*R').

model runIndividualBasedSimulationFor: 1.0 withStep: 0.0027.

self assert: 1e5 equals: ( model numberOfIndividualsAtCompartment: #S )+ (model numberOfIndividualsAtCompartment: #I) + (model numberOfIndividualsAtCompartment: #R)