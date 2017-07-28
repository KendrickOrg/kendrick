as yet unclassified
after

ModelComponent MultiSpeciesSpatial	
	population: 27500;
	attributes: #(status -> S E I R);
	parameters: #(N mu sigma gamma rho beta p q s i);
	S: #(
			#(500 4990)
			#(500 5000)
			#(500 5000)
			#(500 5000)
			#(500 5000)
	);
	I: #(
		#(0 10)
		#(0 0)
		#(0 0)
		#(0 0)
		#(0 0)
	);
	N: #(
		#(500 5000)
		#(500 5000)
		#(500 5000)
		#(500 5000)
		#(500 5000)
	);
	mu: #(
		#(0.000365 0.00137)
		#(0.000365 0.00137)
		#(0.000365 0.00137)
		#(0.000365 0.00137)
		#(0.000365 0.00137)
	);
	sigma: #(
		#(0.5 0.67)
		#(0.5 0.67)
		#(0.5 0.67)
		#(0.5 0.67)
		#(0.5 0.67)
	);
	gamma: #(
		#(0.25 0.233)
		#(0.25 0.233)
		#(0.25 0.233)
		#(0.25 0.233)
		#(0.25 0.233)
	);
	rho: #(
		#(#(0.0 0.03 0.0 0.0 0.0) #(0.0 0.0 0.03 0.0 0.0) #(0.0 0.0 0.0 0.03 0.0) #(0.0 0.0 0.0 0.0 0.03) #(0.03 0.0 0.0 0.0 0.0))
		#(#(0.0 0.1 0.0 0.0 0.0) #(0.0 0.0 0.1 0.0 0.0) #(0.0 0.0 0.0 0.1 0.0) #(0.0 0.0 0.0 0.0 0.1) #(0.1 0.0 0.0 0.0 0.0))
	);
	beta: #(#(0 0.21) #(0 0.42));
	p: #(1 2 3 4 5);
	q: #(1 2 3 4 5);
	s: #(1 2);
	i: #(1 2);
	equations: #(
		S[p][s]:t=mu[p][s]*N[p][s]-sum(i,beta[i][s]*I[p][i])/N[p][i]*S[p][s]-mu[p][s]*S[p][s]+sum(q,rho[s][p][q]*S[q][s])-sum(q,rho[s][q][p])*S[p][s]+nu*R[p][s].
		E[p][s]:t=sum(i,beta[i][s]*I[p][i])/N[p][i]*S[p][s]-sigma[p][s]*E[p][s]-mu[p][s]*E[p][s]+sum(q,rho[s][p][q]*E[q][s])-sum(q,rho[s][q][p])*E[p][s].
		I[p][s]:t=sigma[p][s]*E[p][s]-gamma[p][s]*I[p][s]-mu[p][s]*I[p][s]+sum(q,rho[s][p][q]*I[q][s])-sum(q,rho[s][q][p])*I[p][s].
		R[p][s]:t=gamma[p][s]*I[p][s]-mu[p][s]*I[p][s]-nu*R[p][s]+sum(q,rho[s][p][q]*R[q][s])-sum(q,rho[s][q][p])*R[p][s].
	).
		
Simulation SpatialRungeKutta rungeKutta
	for: 'MultiSpeciesSpatial';
	from: 0; 
	to: 500; 
	step: 1.
	
Visualization SpatialDiagramViz diagram 
	forModel: 'SpatialRungeKutta';
	data: #(I_species);"seems to be need some more handling here"
	legendTitle: 'Total of Infectious';
	legends: #( 'humans' 'birds' );
	xLabel: 'Time (days)'.