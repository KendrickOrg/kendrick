as yet unclassified
testSIRModel

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

dsdt := 'S:t=-beta*S*I' parseAsODEEquation.
didt :=  'I:t=beta*S*I-gamma*I' parseAsODEEquation.
drdt :=  'R:t=gamma*I' parseAsODEEquation.
model addEquation: dsdt.
model addEquation: didt.
model addEquation: drdt.

self assert: (model numberOfEquations) equals:3.

