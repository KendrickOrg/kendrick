tests
testParserFunctionCos

|  model s i r equation |
model := KEModel new.
s := (KECompartment new) status: #S; numberOfIndividuals: 99999.
i := (KECompartment new) status: #I; numberOfIndividuals: 1.
r := (KECompartment new) status: #R; numberOfIndividuals: 0.
model addCompartment: s; addCompartment: i; addCompartment: r.
model atParameter: #beta put: 0.0052.
model atParameter: #gamma put: 365/7.
model timeValue: 10.

equation := 'S:t=cos(2*t)' parseAsAnEquation.
model addEquation: equation.

self assert: (equation variable symbol) equals: #S.
self assert: (equation tVariable symbol) equals: #t.
self assert: (equation expression evaluateWithModel: model) equals: 20 cos




