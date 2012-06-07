as yet unclassified
testParserFunctionSinIntegrated

|  model s i r dsdt didt drdt |
model := KEModel new.
s := (KECompartment new) status: #S; numberOfIndividuals: 100000.
i := (KECompartment new) status: #I; numberOfIndividuals: 0.
r := (KECompartment new) status: #R; numberOfIndividuals: 0.
model addCompartment: s; addCompartment: i; addCompartment: r.
model atParameter: #beta put: 0.0052.
model atParameter: #gamma put: 365/7.
model atParameter: #mu put: 1/80.
model atParameter: #betaAmp put: 0.3.
model atParameter: #N put: 100000.
model timeValue: 1.

dsdt := 'S:t=mu*N-beta*(1+betaAmp*cos(t))*S*I-mu*S' parseAsODEEquation.
model addEquation: dsdt.

self assert: (dsdt variable symbol) equals: #S.
self assert: (dsdt tVariable symbol) equals: #t.
self assert: (dsdt expression evaluateWithModel: model) equals: (0).




