tests
testMultiHostModelWith3HostSpeciesAnd6Compartiments

|model dsdt didt|

model := KEIndexedModel new.

model atCompartment: #S putNumberOfIndividuals: #(9999 1000 2000).
model atCompartment: #I putNumberOfIndividuals: #(1 0 0).

model atParameter: #beta put: #( #(0 0.02 0.02) #(0.02 0 0) #(0.02 0 0)).
model atParameter: #mu put: {365/30 . 1/20 . 1/20}.
model atParameter: #v put: 52.

model atParameter: #j put: (1 to: 3). 
model atParameter: #i put: (1 to: 3).

dsdt := 'S[i]:t=mu[i]-sum(j, beta[i, j]*I[j])*S[i]-mu[i]*S[i]' parseAsAnEquation.
didt := 'I[i]:t=sum(j, beta[i,j]*I[j])*S[i]-(mu[i]+v)*I[i]' parseAsAnEquation.

model addAllEquations: {dsdt. didt}.

self assert: (model numberOfSpecies) equals: 3.
self assert: ((model equations) size) equals: 6