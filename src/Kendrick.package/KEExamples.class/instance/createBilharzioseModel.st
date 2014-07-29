tests
createBilharzioseModel
	|model|
	model := KEModel new.
	model population compartments: #(S1 I1 M P S2 I2).
	model population
		at: #S1 put: 1;
		at: #I1 put: 1;
		at: #M put: 0;
		at: #P put: 0;
		at: #S2 put: 1;
		at: #I2 put: 1.
	
	model addParameter: #Lambda1 value: 8000.
	model addParameter: #Lambda2 value: 200.
	model addParameter: #mu1 value: 0.0000384.
	model addParameter: #mu2 value: 0.000569.
	model addParameter: #mu3 value: 0.9.
	model addParameter: #mu4 value: 0.004.
	model addParameter: #beta1 value: 0406e-8.
	model addParameter: #beta2 value: 0.615.
	model addParameter: #delta1 value: 0.0039.
	model addParameter: #delta2 value: 0.0004012.
	model addParameter: #gamma1 value: 0.00232.
	model addParameter: #gamma2 value: 2.6.
	model addParameter: #k value: 300. 
	model addParameter: #anpha1 value: 0.3e-8. 
	model addParameter: #M0 value: 1e6.
	model addParameter: #epsilon value: 0.3.
	model addParameter: #k1 value: 10.
	model addParameter: #k2 value: 10.
	model addParameter: #eta value: 0.03.
	model addParameter: #theta value: 0.1.
	model addParameter: #tau value: 0.05.
	
	model addEquation: ('S1:t=Lambda1-((beta1*P*S1)/(1+anpha1*P))-mu1*S1+eta*I1' parseAsAnEquation).
	model addEquation: ('I1:t=((beta1*P*S1)/(1+anpha1*P))-(mu1+delta1+eta)*I1' parseAsAnEquation).
	model addEquation: ('M:t=k*gamma1*I1-mu3*M' parseAsAnEquation).
	model addEquation: ('S2:t=Lambda2-((beta2*M*S2)/(M0+epsilon*M*M))-(mu2+theta)*S2' parseAsAnEquation).
	model addEquation: ('I2:t=((beta2*M*S2)/(M0+epsilon*M*M))-(mu2+delta2+theta)*I2' parseAsAnEquation).
	model addEquation: ('P:t=gamma2*I2-(mu4+tau)*P' parseAsAnEquation).
	
	^ model
	
