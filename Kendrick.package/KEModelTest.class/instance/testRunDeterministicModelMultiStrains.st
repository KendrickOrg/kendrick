as yet unclassified
testRunDeterministicModelMultiStrains

|model compartment dsdt didt|

model := KEModel new.
"Each compartment composes 100 strains"
model atCompartment: #S numberOfSpecies: 100.
model withCompartment: #S from: 2 to: 100  numberOfIndividuals: 1.
model withCompartment: #S atIndex: 1  numberOfIndividuals: 0.98.
model atCompartment: #I numberOfSpecies: 100.
model withCompartment: #I from: 2 to: 100  numberOfIndividuals: 0.
model withCompartment: #I atIndex: 1  numberOfIndividuals: 0.02.

model atParameter: #beta put: 'beta=3*v' parseAsAnEquation.
model atParameter: #n put: 100.
model atParameter: #mu put: 1/80.
model atParameter: #v put: 52.
model atParameter: #d put: 5.
model atParameter: #m put: 0.01.
model atParameter: #sigma put: 'sigma[i,j]=exp(-(((i-j)/d)^2))' parseAsAnEquation.
model atParameter: #j put: (1 to: 100). 
model atParameter: #i put: (1 to: 100).

dsdt := 'S[i]:t=mu-sum(j, sigma[i, j]*I[j])*S[i]*beta-mu*S[i]' parseAsAnEquation.
didt := 'I[i]:t=beta*S[i]*I[i]-(mu+v)*I[i]+m*(I[i-1]+I[i+1]-2*I[i])' parseAsAnEquation.
model addEquation: dsdt.
model addEquation: didt.

self assert: ((model equations) size) equals: 200.
self assert: (dsdt variable symbol) equals: #S.
self assert: (dsdt tVariable symbol) equals: #t.
self assert: (dsdt idVariable) equals: #i.
self assert: (didt idVariable) equals: #i.
"model runDeterministSimulationFrom: 0 to: 8  with: 0.01  function: nil."


