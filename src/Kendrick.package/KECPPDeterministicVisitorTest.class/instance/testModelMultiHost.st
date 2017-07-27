as yet unclassified
testModelMultiHost
	| tmp1 tmp2 tmp3 tmp4 tmp5 |
	tmp2 := KEModel new.
	tmp2
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
	tmp2
		addEquation: tmp3;
		addEquation: tmp4.
	tmp5 := tmp2 runDeterministSimulationFrom: 0 to: 5 withStep: 0.01.
	tmp1 := KECPPDeterministicVisitor new.
	tmp1
		function: #sqrt;
		visitNode: tmp2.
	self
		assert: tmp1 compartments size = 2;
		assert: tmp1 parameters size = 6