as yet unclassified
testParameterAsExpression1

|  model s i r dsdt didt drdt |
model := KEIndexedModel new.
s := (KECompartment new) status: #S; numberOfIndividuals: 1.
i := (KECompartment new) status: #I; numberOfIndividuals: 1.
r := (KECompartment new) status: #R; numberOfIndividuals: 0.
model addCompartment: s; addCompartment: i; addCompartment: r.
model atParameter: #beta putExpression: 'beta[i,j]=(i-j)^2' parseAsAnEquation. 
model atParameter: #i put: (50 to: 100).
model atParameter: #j put: (50 to: 100).

dsdt := 'S:t=-beta[i, j]*S*I' parseAsAnEquation.
model addEquation: dsdt.
model eqIdVariable: #i.
model eqIdValue: 50.
model fnIdVariable: #j.
model fnIdValue: 70.

self assert: (dsdt variable symbol) equals: #S.
self assert: (dsdt tVariable symbol) equals: #t.
self assert: (dsdt expression evaluateWithModel: model) equals: (-400).