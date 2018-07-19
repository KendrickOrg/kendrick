Class {
	#name : #KEEventGeneratorTest,
	#superclass : #TestCase,
	#category : 'Kendrick-Tests-Semantic-Model-Core'
}

{ #category : #tests }
KEEventGeneratorTest >> testGenerateEvents1 [
	|model population eventGenerator events|
	model := KEModel new.
	population := KEPopulation new.
	model population: population.
	
	model addEquation: ('S:t=-betaI*S*I-betaH*S*H-betaF*S*F').
	model addEquation: ('E:t=betaI*S*I+betaH*S*H+betaF*S*F-anpha*E').
	model addEquation: ('I:t=anpha*E').
	
	
	eventGenerator := KEEventGenerator new.
	events := eventGenerator generateEvents: model.
	self assert: (events size) equals: 2
]

{ #category : #tests }
KEEventGeneratorTest >> testGenerateEventsOfMultiDiseasesModel [
	|model eventGenerator events|
	model := KEModel new.
	model population: (KEPopulation new).
	model addEquation: 'SS:t=mu*N-beta1*SS*(IS+II+IR)-beta2*SS*(SI+II+RI)-mu*SS'.
	model addEquation: 'IS:t=beta1*SS*(IS+II+IR)-beta2*IS*(SI+II+RI)-(mu+sigma1)*IS'.
	model addEquation: 'SI:t=beta2*SS*(SI+II+RI)-beta1*SI*(IS+II+IR)-(mu+sigma2)*SI'.
	model addEquation: 'RS:t=sigma1*IS-beta2*RS*(SI+II+RI)-mu*RS'.
	model addEquation: 'SR:t=sigma2*SI-beta1*SR*(IS+II+IR)-mu*SR'.
	model addEquation: 'II:t=beta1*SI*(IS+II+IR)+beta2*IS*(SI+II+RI)-(sigma1+sigma2+mu)*II'.
	model addEquation: 'RI:t=beta2*RS*(SI+II+RI)+sigma1*II-(mu+sigma2)*RI'.
	model addEquation: 'IR:t=beta1*SR*(IS+II+IR)+sigma2*II-(mu+sigma1)*IR'.
	model addEquation: 'RR:t=sigma1*IR+sigma2*RI-mu*RR'.
	
	eventGenerator := KEEventGenerator new.
	events := eventGenerator generateEvents: model.
	
	self assert: (events size) equals: 22.
]

{ #category : #tests }
KEEventGeneratorTest >> testGenerateEventsOfMultiHostsModel [
	|model eventGenerator events dsdt didt|
	model := KEModel new.
	
	dsdt := 'S[i]:t=mu[i]*N[i]-sum(j, beta[i][j]*I[j])*S[i]-mu[i]*S[i]'.
	didt := 'I[i]:t=sum(j, beta[i][j]*I[j])*S[i]-(mu[i]+v)*I[i]'.
	model addEquation: dsdt.
	model addEquation: didt.
	
	eventGenerator := KEEventGenerator new.
	events := eventGenerator generateEvents: model.
	self assert: (events size) equals: 4.
]

{ #category : #tests }
KEEventGeneratorTest >> testGenerateEventsOfSIRMetapopulationModel [
	|model events eventGenerator|
	model := KEModel new.
	
	model addEquation: ('S:t=mu*N-beta*S*I-mu*S').
	model addEquation: ('I:t=beta*S*I-v*I-mu*I').
	model addEquation: ('R:t=v*I-mu*R').  
	
	eventGenerator := KEEventGenerator new.
	events := eventGenerator generateEvents: model.
	self assert: (events size) equals: 6.
]

{ #category : #tests }
KEEventGeneratorTest >> testGenerateEventsOfSIRModel [
	|model events eventGenerator|
	model := KEModel new.
	
	model addEquation: ('S:t=-beta*S*I').
	model addEquation: ('I:t=beta*S*I-gamma*I').
	model addEquation: ('R:t=gamma*I').
	
	eventGenerator := KEEventGenerator new.
	events := eventGenerator generateEvents: model.
	self assert: (events size) equals: 2
]
