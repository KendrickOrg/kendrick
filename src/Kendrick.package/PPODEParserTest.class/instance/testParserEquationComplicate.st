as yet unclassified
testParserEquationComplicate

|  model s i r dsdt didt drdt |
model := KEModelExtended new.
s := (KECompartment new) status: #S; numberOfIndividuals: 1.
i := (KECompartment new) status: #I; numberOfIndividuals: 1.
r := (KECompartment new) status: #R; numberOfIndividuals: 0.
model addCompartment: s; addCompartment: i; addCompartment: r.
model atParameter: #beta put:#((520 260) (1 1)).
model atParameter: #gamma put: 365/7.

dsdt := 'S[j]:t=-beta[1, 1]*S*I' parseAsODEEquation.
model addEquation: dsdt.

self assert: (dsdt variable symbol) equals: #S.
self assert: (dsdt tVariable symbol) equals: #t.
self assert: (dsdt idVariable) equals: #j.
self assert: (dsdt expression evaluateWithModel: model) equals: (-520).



