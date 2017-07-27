as yet unclassified
testModelMultiDisease
	| tmp1 tmp2 tmp3 tmp4 tmp5 tmp6 |
	tmp1 := KEModel new.
	tmp1
		atCompartment: #SS putNumberOfIndividuals: 9998;
		atCompartment: #IS putNumberOfIndividuals: 1;
		atCompartment: #SI putNumberOfIndividuals: 1;
		atCompartment: #RS putNumberOfIndividuals: 0;
		atCompartment: #SR putNumberOfIndividuals: 0;
		atCompartment: #II putNumberOfIndividuals: 0;
		atCompartment: #RI putNumberOfIndividuals: 0;
		atCompartment: #IR putNumberOfIndividuals: 0;
		atCompartment: #RR putNumberOfIndividuals: 0;
		atParameter: #beta1 put: 0.008;
		atParameter: #beta2 put: 0.01;
		atParameter: #N put: 10000;
		atParameter: #sigma1 put: 52;
		atParameter: #sigma2 put: 52;
		atParameter: #mu put: 1 / 80;
		addEquation: 'SS:t=mu*N-beta1*SS*(IS+II+IR)-beta2*SS*(SI+II+RI)-mu*SS';
		addEquation: 'IS:t=beta1*SS*(IS+II+IR)-(mu+sigma1)*IS';
		addEquation: 'SI:t=beta2*SS*(SI+II+RI)-(mu+sigma2)*SI';
		addEquation: 'RS:t=sigma1*IS-beta2*RS*(SI+II+RI)-mu*RS';
		addEquation: 'SR:t=sigma2*SI-beta1*SR*(IS+II+IR)-mu*SR';
		addEquation: 'II:t=beta1*SI*(IS+II+IR)+beta2*IS*(SI+II+RI)-(sigma1+sigma2+mu)*II';
		addEquation: 'RI:t=sigma1*II-(mu+sigma2)*RI';
		addEquation: 'IR:t=sigma2*II-(mu+sigma1)*IR';
		addEquation: 'RR:t=sigma1*IR+sigma2*RI-mu*RR'.
	tmp5 := tmp1 runDeterministSimulationFrom: 0 to: 100 withStep: 0.01.
	tmp6 := KECPPDeterministicVisitor new.
	tmp6 visitNode: tmp1.
	self
		assert: tmp6 compartments size = 9;
		assert: tmp6 parameters size = 6