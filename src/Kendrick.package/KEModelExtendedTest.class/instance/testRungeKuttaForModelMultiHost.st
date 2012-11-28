tests
testRungeKuttaForModelMultiHost

|model compartment dsdt didt solverRK nbIterations result |

model := KEIndexedModel new.
model atCompartment: #S putNumberOfIndividuals: #(9999 1000 2000).
model atCompartment: #I putNumberOfIndividuals: #(1 0 0).

model atParameter: #beta put: {{0 . 0.02 . 0.02} . {0.02 . 0 . 0} . {0.02 . 0 . 0}}.
model atParameter: #N put: #(10000 1000 2000).
model atParameter: #mu put: {365/30 . 1/20 . 1/20}.
model atParameter: #v put: #(52 52 52).
model atParameter: #j put: (1 to: 3). 
model atParameter: #i put: (1 to: 3).
self assert: (model atParameter: #j at: 2) equals: 2. "j is an interval"
self assert: (model atParameter: #beta at: 2 at: 3 ) equals: 0.

dsdt := 'S[i]:t=mu[i]*N[i]-sum(j, beta[i, j]*I[j])*S[i]-mu[i]*S[i]' parseAsAnEquation.
didt := 'I[i]:t=sum(j, beta[i,j]*I[j])*S[i]-(mu[i]+v[i])*I[i]' parseAsAnEquation.
model addEquation: dsdt.
model addEquation: didt.
model indexName: #i.
model eqIdValue: 2.

self assert: ((model getEquationsList) size) equals: 6.
self assert: (dsdt variable symbol) equals: #S.
self assert: (dsdt tVariable symbol) equals: #t.
self assert: (dsdt idVariable) equals: #i.
self assert: (didt idVariable) equals: #i.

solverRK := RungeKuttaSolver new.
solverRK finalValueOfX: 40.
solverRK initialValueOfX: 0.
solverRK stepSize: 0.1.

nbIterations := ((40 - 0) / 0.1) rounded.
self assert: (solverRK calculateNbOfIterations) equals: nbIterations.

result := solverRK solver2: model.
self assert: (result size) equals: 3.
self assert: ((result at: 1) size) equals: nbIterations.
self assert: ((result at: 1) size) equals: nbIterations.
self assert: ((result at: 2) size) equals: nbIterations.
self assert: ((result at: 3) size) equals: nbIterations.


