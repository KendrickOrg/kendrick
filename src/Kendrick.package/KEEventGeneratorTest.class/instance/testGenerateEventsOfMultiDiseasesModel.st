tests
testGenerateEventsOfMultiDiseasesModel
	| tmp1 tmp2 tmp3 |
	tmp1 := KEModel new.
	tmp1
		population: KEPopulation new;
		addEquation: 'SS:t=mu*N-beta1*SS*(IS+II+IR)-beta2*SS*(SI+II+RI)-mu*SS';
		addEquation: 'IS:t=beta1*SS*(IS+II+IR)-beta2*IS*(SI+II+RI)-(mu+sigma1)*IS';
		addEquation: 'SI:t=beta2*SS*(SI+II+RI)-beta1*SI*(IS+II+IR)-(mu+sigma2)*SI';
		addEquation: 'RS:t=sigma1*IS-beta2*RS*(SI+II+RI)-mu*RS';
		addEquation: 'SR:t=sigma2*SI-beta1*SR*(IS+II+IR)-mu*SR';
		addEquation: 'II:t=beta1*SI*(IS+II+IR)+beta2*IS*(SI+II+RI)-(sigma1+sigma2+mu)*II';
		addEquation: 'RI:t=beta2*RS*(SI+II+RI)+sigma1*II-(mu+sigma2)*RI';
		addEquation: 'IR:t=beta1*SR*(IS+II+IR)+sigma2*II-(mu+sigma1)*IR';
		addEquation: 'RR:t=sigma1*IR+sigma2*RI-mu*RR'.
	tmp2 := KEEventGenerator new.
	tmp3 := tmp2 generateEvents: tmp1.
	self assert: tmp3 size equals: 22