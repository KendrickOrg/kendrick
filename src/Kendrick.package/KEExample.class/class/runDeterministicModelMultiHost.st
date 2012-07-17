as yet unclassified
runDeterministicModelMultiHost

|model compartment dsdt didt|

model := KEModelExtended new.
model atCompartment: #S putNumberOfIndividuals: #(9999 1000 2000).
model atCompartment: #I putNumberOfIndividuals: #(1 0 0).

model atParameter: #beta put: {{0 . 0.02 . 0.02} . {0.02 . 0 . 0} . {0.02 . 0 . 0}}.
model atParameter: #N put: #(10000 1000 2000).
model atParameter: #mu put: {365/30 . 1/20 . 1/20}.
model atParameter: #v put: 52.
model atParameter: #j put: (1 to: 3). 
model atParameter: #i put: (1 to: 3).
self assert: (model atParameter: #j at: 2) equals: 2. "j is an interval"
self assert: (model atParameter: #beta at: 2 at: 3 ) equals: 0.

dsdt := 'S[i]:t=mu[i]*N[i]-sum(j, beta[i, j]*I[j])*S[i]-mu[i]*S[i]' parseAsAnEquation.
didt := 'I[i]:t=sum(j, beta[i,j]*I[j])*S[i]-(mu[i]+v)*I[i]' parseAsAnEquation.
model addEquation: dsdt.
model addEquation: didt.

model runDeterministSimulationFrom: 0 to: 40  with: 0.01  function: #sqrt.