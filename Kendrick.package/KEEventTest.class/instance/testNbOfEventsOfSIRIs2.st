tests
testNbOfEventsOfSIRIs2

|  model s i r dsdt didt drdt l ex a c b d count t |
model := KEModel new.

model atCompartment:#S putNumberOfIndividuals: 1-1e-6.
model atCompartment:#I putNumberOfIndividuals: 1e-6.
model atCompartment:#R putNumberOfIndividuals: 0.

model atParameter: #beta put: 520.
model atParameter: #gamma put: 365/7.

dsdt := 'S:t=-beta*S*I' parseAsAnEquation.
didt := 'I:t=beta*S*I-gamma*I' parseAsAnEquation.
drdt := 'R:t=gamma*I' parseAsAnEquation.

model addEquation: dsdt.
model addEquation: didt.
model addEquation: drdt.
l := model generateEvents.
self assert: 2  equals: l size