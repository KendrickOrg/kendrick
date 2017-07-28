as yet unclassified
testModelMultiHost
	| visitor model dsdt didt result |
	model := KEModel new.
	model atCompartment: #S putNumberOfIndividuals: {9999 . 1000 . 2000}.    
	model atCompartment: #I putNumberOfIndividuals: { 1 . 0 . 0 }.    

	model atParameter: #beta put: #(#(0 0.02 0.02) #(0.02 0.0 0.0) #(0.02 0.0 0.0)).
	model atParameter: #N put: #(10000 1000 2000).
	model
		atParameter: #mu
		put:
			{(365 / 30).
			(1 / 20).
			(1 / 20)}.
	model atParameter: #v put: 52.
	model atParameter: #j put: (1 to: 3).
	model atParameter: #i put: (1 to: 3).
	dsdt := 'S[i]:t=mu[i]*N[i]-sum(j, beta[i, j]*I[j])*S[i]-mu[i]*S[i]'.
	didt := 'I[i]:t=sum(j, beta[i,j]*I[j])*S[i]-(mu[i]+v)*I[i]'.
	model addEquation: dsdt.
	model addEquation: didt.	

	result := model runDeterministSimulationFrom: 0 to: 5 withStep: 0.01.

	visitor := KECPPDeterministicVisitor new.
	visitor function: #sqrt.
	visitor visitNode: model.
	self assert: visitor compartments size = 2.
	self assert: visitor parameters size = 6.