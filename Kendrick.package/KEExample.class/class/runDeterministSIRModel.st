as yet unclassified
runDeterministSIRModel

"self runDeterministSIRModel"
| model result |
model := KEModel new.
model atCompartment:#S putNumberOfIndividuals: 1e5-1.
model atCompartment:#I putNumberOfIndividuals: 1.
model atCompartment:#R putNumberOfIndividuals: 0.
model atParameter:#beta put: 0.0052.
model atParameter: #gamma put: 365/7.

model addEquation: (PPODEParser parse:'S:t=-beta*S*I').
model addEquation: (PPODEParser parse: 'I:t=beta*S*I-gamma*I').
model addEquation: (PPODEParser parse: 'R:t=gamma*I').

result := model runDeterministSimulationFrom: 0.0 to: 1.0 with: 0.0001.
result plot: #I in: model.



