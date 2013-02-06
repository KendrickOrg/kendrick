as yet unclassified
runStochasticMultiHostModel

"self runStochasticMultiHostModel"

|model dsdt didt result|

model := KEIndexedModel new.
model atCompartment: #S putNumberOfIndividuals: #(9999 1000 2000).
model atCompartment: #I putNumberOfIndividuals: #(1 0 0).

model atParameter: #beta put: {{0 . 0.02 . 0.02} . {0.02 . 0 . 0} . {0.02 . 0 . 0}}.
model atParameter: #N put: #(10000 1000 2000).
model atParameter: #mu put: {365/30 . 1/20 . 1/20}.
model atParameter: #v put: 52.
model atParameter: #j put: (1 to: 3). 
model atParameter: #i put: (1 to: 3).

dsdt := 'S[i]:t=mu[i]*N[i]-sum(j, beta[i, j]*I[j])*S[i]-mu[i]*S[i]' parseAsAnEquation.
didt := 'I[i]:t=sum(j, beta[i,j]*I[j])*S[i]-(mu[i]+v)*I[i]' parseAsAnEquation.
model addEquation: dsdt.
model addEquation: didt.

result := model runStochasticSimulationFor: 1.
result plot: #I at: 1 in: model do: #sqrt

