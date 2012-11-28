tests
testNbOfEventsOfSIRModelIs2

| model s i r dsdt didt drdt |
model := KEModel new.

model atCompartment:#S putNumberOfIndividuals: 1-1e-6.
model atCompartment:#I putNumberOfIndividuals: 1e-6.
model atCompartment:#R putNumberOfIndividuals: 0.

model atParameter: #beta put: 520.
model atParameter: #gamma put: 365/7.

dsdt := 'S:t=-beta*S*I' parseAsAnEquation.
didt := 'I:t=beta*S*I-gamma*I' parseAsAnEquation.
drdt := 'R:t=gamma*I' parseAsAnEquation.

model addAllEquations: {dsdt. didt. drdt}.

self assert: model generateEvents size equals: 2