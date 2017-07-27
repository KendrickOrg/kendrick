as yet unclassified
testGenerateEvents1
	| tmp1 tmp2 tmp3 tmp4 |
	tmp1 := KEModel new.
	tmp2 := KEPopulation new.
	tmp1
		population: tmp2;
		addEquation: 'S:t=-betaI*S*I-betaH*S*H-betaF*S*F';
		addEquation: 'E:t=betaI*S*I+betaH*S*H+betaF*S*F-anpha*E';
		addEquation: 'I:t=anpha*E'.
	tmp3 := KEEventGenerator new.
	tmp4 := tmp3 generateEvents: tmp1.
	self assert: tmp4 size equals: 2