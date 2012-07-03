tests
testNbOfEventsOfSIRIs2

|  model s i r dsdt didt drdt l ex a c b d count t |
model := KEModel new.

model atCompartment:#S putNumberOfIndividuals: 1-1e-6.
model atCompartment:#I putNumberOfIndividuals: 1e-6.
model atCompartment:#R putNumberOfIndividuals: 0.

model atParameter: #beta put: 520.
model atParameter: #gamma put: 365/7.

dsdt := 'S:t=-beta*S*I' parseAsODEEquation.
didt := 'I:t=beta*S*I-gamma*I' parseAsODEEquation.
drdt := 'R:t=gamma*I' parseAsODEEquation.

model addEquation: dsdt.
model addEquation: didt.
model addEquation: drdt.
l := model generateEvents.
self assert: 2  equals: l size