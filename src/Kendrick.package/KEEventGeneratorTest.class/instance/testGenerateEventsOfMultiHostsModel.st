tests
testGenerateEventsOfMultiHostsModel
	| tmp1 tmp2 tmp3 tmp4 tmp5 |
	tmp1 := KEModel new.
	tmp4 := 'S[i]:t=mu[i]*N[i]-sum(j, beta[i][j]*I[j])*S[i]-mu[i]*S[i]'.
	tmp5 := 'I[i]:t=sum(j, beta[i][j]*I[j])*S[i]-(mu[i]+v)*I[i]'.
	tmp1
		addEquation: tmp4;
		addEquation: tmp5.
	tmp2 := KEEventGenerator new.
	tmp3 := tmp2 generateEvents: tmp1.
	self assert: tmp3 size equals: 4