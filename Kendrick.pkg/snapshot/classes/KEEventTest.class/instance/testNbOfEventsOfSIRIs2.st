
!KEEventTest methodsFor: 'as yet unclassified'!
testNbOfEventsOfSIRIs2

|  model s i r dsdt didt drdt |
model := KEModel new.
s := (KECompartment new) status: #S; numberOfIndividuals: 1-1e-6.
i := (KECompartment new) status: #I; numberOfIndividuals: 1e-6.
r := (KECompartment new) status: #R; numberOfIndividuals: 0.
model addCompartment: s; addCompartment: i; addCompartment: r.
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

self assert: model events size equals: 2! !
