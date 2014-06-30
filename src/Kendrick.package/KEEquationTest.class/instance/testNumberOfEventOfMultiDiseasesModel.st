tests
testNumberOfEventOfMultiDiseasesModel
	|model eventList eventImpl|
	model := KEModel new.
	model addEquation: (PPODEParser parse: 'SS:t=mu*N-beta1*SS*(IS+II+IR)-beta2*SS*(SI+II+RI)-mu*SS').
	model addEquation: (PPODEParser parse: 'IS:t=beta1*SS*(IS+II+IR)-beta2*IS*(SI+II+RI)-(mu+sigma1)*IS').
	model addEquation: (PPODEParser parse: 'SI:t=beta2*SS*(SI+II+RI)-beta1*SI*(IS+II+IR)-(mu+sigma2)*SI').
	model addEquation: (PPODEParser parse: 'RS:t=sigma1*IS-beta2*RS*(SI+II+RI)-mu*RS').
	model addEquation: (PPODEParser parse: 'SR:t=sigma2*SI-beta1*SR*(IS+II+IR)-mu*SR').
	model addEquation: (PPODEParser parse: 'II:t=beta1*SI*(IS+II+IR)+beta2*IS*(SI+II+RI)-(sigma1+sigma2+mu)*II').
	model addEquation: (PPODEParser parse: 'RI:t=beta2*RS*(SI+II+RI)+sigma1*II-(mu+sigma2)*RI').
	model addEquation: (PPODEParser parse: 'IR:t=beta1*SR*(IS+II+IR)+sigma2*II-(mu+sigma1)*IR').
	model addEquation: (PPODEParser parse: 'RR:t=sigma1*IR+sigma2*RI-mu*RR').
	eventImpl := (KERuntimeCouplingEventImpl new) model: model.
	eventList := eventImpl events.
	self assert: 22 equals: eventList size.
	eventList := eventList select: [ :each| each isCouplingEvent ].
	self assert: 6 equals: eventList size.