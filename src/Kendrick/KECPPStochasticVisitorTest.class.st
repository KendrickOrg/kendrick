Class {
	#name : #KECPPStochasticVisitorTest,
	#superclass : #TestCase,
	#category : 'Kendrick-Tests-Code-Generators'
}

{ #category : #'as yet unclassified' }
KECPPStochasticVisitorTest >> expectedFailures [

^{#testMultihostStochasticModel. #testSEIRModelWithLossOfImmunityStochasticModel. #testSIRStochasticModel}
]

{ #category : #'as yet unclassified' }
KECPPStochasticVisitorTest >> testMultihostStochasticModel [
	| model visitor dsdt didt |
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
	"model runIndividualBasedSimulationFrom: 0 to: 0.5  withStep:  0.0027."
	model simulator: ((KEStochasticSimulator new) tMin: 0.0; tMax: 5.0; step: 0.01; model: model; algorithm: #GillespieDirect).
	model generateEvents.
	visitor := KECPPStochasticVisitor new.
	visitor function: #sqrt.
	visitor visitNode: model.
	self assert: (visitor compartments size) = 2.
	self assert: (visitor parameters size) = 6.
	
]

{ #category : #'as yet unclassified' }
KECPPStochasticVisitorTest >> testSEIRModelWithLossOfImmunityStochasticModel [
	| model visitor |
	model := KEModel new.
	model atCompartment: #S putNumberOfIndividuals: 99999.
	model atCompartment: #E putNumberOfIndividuals: 1.
	model atCompartment: #I putNumberOfIndividuals: 1.
	model atCompartment: #R putNumberOfIndividuals: 0.
	model atParameter: #beta put: 0.0052.
	model atParameter: #gamma put: 365 / 7.
	model atParameter: #sigma put: 365 / 7.
	model atParameter: #mu put: 1 / 80.
	model atParameter: #to put: 2.
	model atParameter: #N put: 100000.
	model addEquation: ('S:t=mu*N-beta*S*I-mu*S+to*R').
	model addEquation: ('E:t=beta*S*I-sigma*E-mu*E').
	model addEquation: ('I:t=sigma*E-gamma*I-mu*I').
	model addEquation: ('R:t=gamma*I-mu*R-to*R').
	model simulator: ((KEStochasticSimulator new) tMin: 0.0; tMax: 1.0; step: 0.001; model: model; algorithm: #GillespieDirect).
	model generateEvents.
	visitor := KECPPStochasticVisitor  new.
	visitor visitNode: model.
	self assert: (visitor compartments size) = 4.
	self assert: (visitor parameters size) = 6.
	
]

{ #category : #'as yet unclassified' }
KECPPStochasticVisitorTest >> testSIRStochasticModel [
	| model visitor |
	model := KEModel new.
	model atCompartment: #S putNumberOfIndividuals: 1e5 - 1.
	model atCompartment: #I putNumberOfIndividuals: 1.
	model atCompartment: #R putNumberOfIndividuals: 0.
	model atParameter: #beta put: 0.0052.
	model atParameter: #gamma put: 365 / 7.
	model addEquation: ('S:t=-beta*S*I').
	model addEquation: ('I:t=beta*S*I-gamma*I').
	model addEquation: ('R:t=gamma*I').
	model runStochasticSimulationFrom: 0 to: 50/365 withStep:  0.5 / 365.
	visitor := KECPPStochasticVisitor  new.
	visitor visitNode: model.
	self assert: (visitor compartments size) = 3.
	self assert: (visitor parameters size) = 2.
	
]
