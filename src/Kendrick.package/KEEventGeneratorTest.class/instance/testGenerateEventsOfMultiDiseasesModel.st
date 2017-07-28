tests
testGenerateEventsOfMultiDiseasesModel
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