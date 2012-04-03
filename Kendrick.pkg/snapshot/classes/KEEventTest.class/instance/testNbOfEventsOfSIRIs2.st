
!KEEventTest methodsFor: 'as yet unclassified'!
testNbOfEventsOfSIRIs2

|  model s i r dsdt didt drdt |
model := KEModel new.

model atCompartment:#S putNumberOfIndividuals: 1-1e-6.
model atCompartment:#I putNumberOfIndividuals: 1e-6.
model atCompartment:#R putNumberOfIndividuals: 0.

model atParameter: #beta put: 520.
model atParameter: #gamma put: 365/7.
self assert: (model atParameter: #beta) equals: 520.
self assert: (model atParameter: #gamma) equals: 365/7.

dsdt := PPODEParser parse:'S:t=-beta*S*I'.
didt := PPODEParser parse: 'I:t=beta*S*I-gamma*I'.
drdt := PPODEParser parse: 'R:t=gamma*I'.
model addEquation: dsdt.
model addEquation: didt.
model addEquation: drdt.

self assert: 2  equals: model events size! !
