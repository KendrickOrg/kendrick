as yet unclassified
before
	| tmp1 tmp2 tmp3 tmp4 |
	tmp1 := KEModel new.
	tmp1
		atCompartment: #S
			put: #(#(500 4990) #(500 5000) #(500 5000) #(500 5000) #(500 5000))
			atOthersPut: #(#(0 0) #(0 0) #(0 0) #(0 0) #(0 0));
		atCompartment: #I put: #(#(0 10) #(0 0) #(0 0) #(0 0) #(0 0));
		atParameter: #N
			assignValue: #(#(500 5000) #(500 5000) #(500 5000) #(500 5000) #(500 5000));
		atParameter: #mu
			assignValue: #(#(0.000365 0.00137) #(0.000365 0.00137) #(0.000365 0.00137) #(0.000365 0.00137) #(0.000365 0.00137));
		atParameter: #sigma
			assignValue: #(#(0.5 0.67) #(0.5 0.67) #(0.5 0.67) #(0.5 0.67) #(0.5 0.67));
		atParameter: #gamma
			assignValue: #(#(0.25 0.233) #(0.25 0.233) #(0.25 0.233) #(0.25 0.233) #(0.25 0.233));
		atParameter: #nu assignValue: 0.00274;
		atParameter: #rho
			assignValue:
			{(0.03
				* #(#(0 1 0 0 0) #(0 0 1 0 0) #(0 0 0 1 0) #(0 0 0 0 1) #(1 0 0 0 0))).
			(0.1
				* #(#(0 1 0 0 0) #(0 0 1 0 0) #(0 0 0 1 0) #(0 0 0 0 1) #(1 0 0 0 0)))};
		atParameter: #beta assignValue: #(#(0 0.21) #(0 0.42));
		atParameter: #p assignValue: (1 to: 5);
		atParameter: #q assignValue: (1 to: 5);
		atParameter: #s assignValue: (1 to: 2);
		atParameter: #i assignValue: (1 to: 2);
		addEquation:
			'S[p][s]:t=mu[p][s]*N[p][s]-sum(i,beta[i][s]*I[p][i])/N[p][i]*S[p][s]-mu[p][s]*S[p][s]+sum(q,rho[s][p][q]*S[q][s])-sum(q,rho[s][q][p])*S[p][s]+nu*R[p][s]'
				parseAsAnEquation;
		addEquation:
			'E[p][s]:t=sum(i,beta[i][s]*I[p][i])/N[p][i]*S[p][s]-sigma[p][s]*E[p][s]-mu[p][s]*E[p][s]+sum(q,rho[s][p][q]*E[q][s])-sum(q,rho[s][q][p])*E[p][s]'
				parseAsAnEquation;
		addEquation:
			'I[p][s]:t=sigma[p][s]*E[p][s]-gamma[p][s]*I[p][s]-mu[p][s]*I[p][s]+sum(q,rho[s][p][q]*I[q][s])-sum(q,rho[s][q][p])*I[p][s]'
				parseAsAnEquation;
		addEquation:
			'R[p][s]:t=gamma[p][s]*I[p][s]-mu[p][s]*I[p][s]-nu*R[p][s]+sum(q,rho[s][p][q]*R[q][s])-sum(q,rho[s][q][p])*R[p][s]'
				parseAsAnEquation.
	tmp2 := KESimulator
		new: #RungeKutta
		from: 0
		to: 500
		by: 1.
	tmp2 executeOn: tmp1.
	tmp3 := KEDiagramBuilder new.
	tmp4 := [ :arg1 | 
	| tmp5 tmp6 tmp7 |
	tmp6 := (tmp2 allTimesSeriesContaining: arg1)
		collect: [ :arg2 | arg2 value ].
	tmp5 := OrderedCollection new.
	tmp7 := tmp6 first data size.
	1 to: tmp7 do: [ :tmp8 | tmp5 add: (tmp6 collect: [ :arg3 | arg3 data at: tmp8 ]) sum ].
	(KETimeSeries from: tmp5 withIndex: tmp6 first index)
		compartment: (STON fromString: arg1) ].
	tmp3
		data:
			{(tmp4 value: '{#status:#I, #species:#bird}').
			(tmp4 value: '{#status: #I, #species: #human}')};
		xLabel: 'Time (days)';
		legendTitle: 'Total of infectious';
		legends: {'birds' . 'humans'};
		open.
	^ tmp2 -> tmp1