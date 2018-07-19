Class {
	#name : #KECPPDeterministicVisitorTest,
	#superclass : #TestCase,
	#category : 'Kendrick-Tests-Code-Generators'
}

{ #category : #'as yet unclassified' }
KECPPDeterministicVisitorTest >> expectedFailures [

^{#testModelMultiDisease. #testModelMultiHost. #testSEIRModelWithTemporalForcing. #testSEIRModelWithVaccination. #testSIRModel. #testSIRModelWithDemography.}
]

{ #category : #'as yet unclassified' }
KECPPDeterministicVisitorTest >> testModelMultiDisease [
	| model compartment dsdt didt result visitor |
	model := KEModel new.
	model atCompartment: #SS putNumberOfIndividuals: 9998.
	model atCompartment: #IS putNumberOfIndividuals: 1.
	model atCompartment: #SI putNumberOfIndividuals: 1.
	model atCompartment: #RS putNumberOfIndividuals: 0.
	model atCompartment: #SR putNumberOfIndividuals: 0.
	model atCompartment: #II putNumberOfIndividuals: 0.
	model atCompartment: #RI putNumberOfIndividuals: 0.
	model atCompartment: #IR putNumberOfIndividuals: 0.
	model atCompartment: #RR putNumberOfIndividuals: 0.
	model atParameter: #beta1 put: 0.008.
	model atParameter: #beta2 put: 0.01.
	model atParameter: #N put: 10000.
	model atParameter: #sigma1 put: 52.
	model atParameter: #sigma2 put: 52.
	model atParameter: #mu put: 1 / 80.
	model addEquation: ('SS:t=mu*N-beta1*SS*(IS+II+IR)-beta2*SS*(SI+II+RI)-mu*SS').
	model addEquation: ('IS:t=beta1*SS*(IS+II+IR)-(mu+sigma1)*IS').
	model addEquation: ('SI:t=beta2*SS*(SI+II+RI)-(mu+sigma2)*SI').
	model addEquation: ('RS:t=sigma1*IS-beta2*RS*(SI+II+RI)-mu*RS').
	model addEquation: ('SR:t=sigma2*SI-beta1*SR*(IS+II+IR)-mu*SR').
	model addEquation: ('II:t=beta1*SI*(IS+II+IR)+beta2*IS*(SI+II+RI)-(sigma1+sigma2+mu)*II').
	model addEquation: ('RI:t=sigma1*II-(mu+sigma2)*RI').
	model addEquation: ('IR:t=sigma2*II-(mu+sigma1)*IR').
	model addEquation: ('RR:t=sigma1*IR+sigma2*RI-mu*RR').
	result := model runDeterministSimulationFrom: 0 to: 100 withStep: 0.01.
	visitor := KECPPDeterministicVisitor new.
	visitor visitNode: model.
	self assert: visitor compartments size = 9.
	self assert: visitor parameters size = 6.
]

{ #category : #'as yet unclassified' }
KECPPDeterministicVisitorTest >> testModelMultiHost [
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
]

{ #category : #'as yet unclassified' }
KECPPDeterministicVisitorTest >> testSEIRModelWithTemporalForcing [
	| model result visitor |
	model := KEModel new.
	model atCompartment: #S putNumberOfIndividuals: 99999.
	model atCompartment: #E putNumberOfIndividuals: 1.
	model atCompartment: #I putNumberOfIndividuals: 1.
	model atCompartment: #R putNumberOfIndividuals: 0.
	model atParameter: #beta put: 0.0052.
	model atParameter: #gamma put: 365 / 7.
	model atParameter: #sigma put: 365 / 7.
	model atParameter: #mu put: 1 / 80.
	model atParameter: #betaAmp put: 0.3.
	model atParameter: #N put: 100000.
	model addEquation: ('S:t=mu*N-beta*(1+betaAmp*cos(t))*S*I-mu*S').
	model addEquation: ('E:t=beta*(1+betaAmp*cos(t))*S*I-sigma*E-mu*E').
	model addEquation: ('I:t=sigma*E-gamma*I-mu*I').
	model addEquation: ('R:t=gamma*I-mu*R').
	result := model runDeterministSimulationFrom: 0 to: 400 withStep: 0.01.
	visitor := KECPPDeterministicVisitor new.
	visitor visitNode: model.
	self assert: (visitor compartments size) = 4.
	self assert: (visitor parameters size) = 6.
]

{ #category : #'as yet unclassified' }
KECPPDeterministicVisitorTest >> testSEIRModelWithVaccination [
	| model result visitor |
	model := KEModel new.
	model atCompartment: #S putNumberOfIndividuals: 99999.
	model atCompartment: #E putNumberOfIndividuals: 1.
	model atCompartment: #I putNumberOfIndividuals: 1.
	model atCompartment: #R putNumberOfIndividuals: 0.
	model atParameter: #beta put: 0.0052.
	model atParameter: #gamma put: 365 / 7.
	model atParameter: #sigma put: 365 / 7.
	model atParameter: #mu put: 1 / 80.
	model atParameter: #p put: 0.0.
	model atParameter: #N put: 100000.
	model addEquation: ('S:t=mu*(1-p)*N-beta*S*I-mu*S').
	model addEquation: ('E:t=beta*S*I-sigma*E-mu*E').
	model addEquation: ('I:t=sigma*E-gamma*I-mu*I').
	model addEquation: ('R:t=mu*p*N*gamma*I-mu*R').
	result := model runDeterministSimulationFrom: 0 to: 100 withStep: 0.01.
	visitor := KECPPDeterministicVisitor new.
	visitor visitNode: model.
	self assert: (visitor compartments size) = 4.
	self assert: (visitor parameters size) = 6.
]

{ #category : #'as yet unclassified' }
KECPPDeterministicVisitorTest >> testSIRModel [
	| model visitor simulator|
	model := KEModel new population: (KEPopulation size: 100000).
	model attributes: {#status->#(#S #I #R)}.
	model atCompartment: { #status->#S } put: 99999.
	model atCompartment: { #status->#I } put: 1.
	model atCompartment: { #status->#R } put: 0.
		
	model addParameters: {#beta->0.0052. #gamma->52}.
	model addEquation: 'S:t=-beta*S*I'.
	model addEquation: 'I:t=beta*S*I - gamma*I'.
	model addEquation: 'R:t=gamma*I'.
	simulator := KESimulator new: #RungeKutta from: 0.0 to: 0.3 step: 0.0027.
	simulator executeOn: model.
	visitor := KECPPDeterministicVisitor new.
	visitor visitNode: model.
	self assert: (visitor compartments size) = 3.
	self assert: (visitor parameters size) = 2.
]

{ #category : #'as yet unclassified' }
KECPPDeterministicVisitorTest >> testSIRModelWithDemography [
	| model result visitor |
	model := KEModel new.
	model atCompartment: #S putNumberOfIndividuals: 99999.
	model atCompartment: #I putNumberOfIndividuals: 1.
	model atCompartment: #R putNumberOfIndividuals: 0.
	model atParameter: #beta put: 0.0052.
	model atParameter: #gamma put: 365 / 7.
	model atParameter: #mu put: 1 / 80.
	model atParameter: #N put: 100000.
	model addEquation: ('S:t= mu*N-beta*S*I-mu*S').
	model addEquation: ('I:t=beta*S*I-gamma*I-mu*I').
	model addEquation: ('R:t=gamma*I-mu*R').
	result := model runDeterministSimulationFrom: 0.0 to: 1.0 withStep: 0.001.
	visitor := KECPPDeterministicVisitor new.
	visitor visitNode: model.
	self assert: (visitor compartments size) = 3.
	self assert: (visitor parameters size) = 4.
]
