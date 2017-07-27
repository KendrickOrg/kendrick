as yet unclassified
testMultiHostsIndividualBasedModel
	| tmp1 tmp2 tmp3 tmp4 tmp6 |
	tmp1 := KEModel new.
	tmp1
		atCompartment: #S putNumberOfIndividuals: {9999 . 1000 . 2000};
		atCompartment: #I putNumberOfIndividuals: {1 . 0 . 0};
		atParameter: #beta
			put: #(#(0 0.02 0.02) #(0.02 0.0 0.0) #(0.02 0.0 0.0));
		atParameter: #N put: #(10000 1000 2000);
		atParameter: #mu
			put:
			{(365 / 30).
			(1 / 20).
			(1 / 20)};
		atParameter: #v put: 52;
		atParameter: #j put: (1 to: 3);
		atParameter: #i put: (1 to: 3).
	tmp3 := 'S[i]:t=mu[i]*N[i]-sum(j, beta[i, j]*I[j])*S[i]-mu[i]*S[i]'.
	tmp4 := 'I[i]:t=sum(j, beta[i,j]*I[j])*S[i]-(mu[i]+v)*I[i]'.
	tmp1
		addEquation: tmp3;
		addEquation: tmp4.
	tmp6 := KEIndividualBasedSimulator new.
	tmp6
		tMin: 0.0;
		tMax: 5.0;
		step: 0.25;
		model: tmp1.
	tmp1 simulator: (tmp6 algorithm: #default).
	tmp1 simulator
		generateTransitionOfEvents;
		initializeListIndividuals.
	tmp2 := KECPPIndividualBasedVisitor new.
	tmp2
		function: #sqrt;
		visitNode: tmp1.
	self
		assert: tmp2 compartments size = 2;
		assert: tmp2 parameters size = 6