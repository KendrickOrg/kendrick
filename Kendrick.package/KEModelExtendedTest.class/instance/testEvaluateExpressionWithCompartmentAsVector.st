tests
testEvaluateExpressionWithCompartmentAsVector
"This test is for evaluating an expression in which each compartment is a vector"
|model compartment dsdt didt|

model := KEIndexedModel new.
model atCompartment: #S putNumberOfIndividuals: #(10000 9000 12000).
model atCompartment: #I putNumberOfIndividuals: #(1 0 0).

model atParameter: #beta put: {{1/4 . 1/5 . 1/8} . {1/2 . 1/4 . 1/5}}.
model atParameter: #j put: (1 to: 3). 
model atParameter: #i put: (1 to: 3).
self assert: (model atParameter: #j at: 2) equals: 2. "j is an interval"
self assert: (model atParameter: #beta at: 2 at: 3 ) equals: 1/5.

dsdt := 'S[i]:t=-sum(j, beta[i, j]*I[j])*S[i]' parseAsAnEquation.
didt := 'I[i]:t=sum(j, beta[i,j]*I[j])*S[i]' parseAsAnEquation.
model addEquation: dsdt.
model addEquation: didt.
model indexName: #i.
model eqIdValue: 2.

self assert: ((model equations) size) equals: 6.
self assert: (dsdt variable symbol) equals: #S.
self assert: (dsdt tVariable symbol) equals: #t.
self assert: (dsdt idVariable) equals: #i.
self assert: (dsdt expression evaluateWithModel: model) equals: (-4500).
self assert: (didt expression evaluateWithModel: model) equals: 4500.