examples
SIRDemographyConcern
	| tmp1 |
	tmp1 := KEModelPart new.
	tmp1
		attributes: {(#status -> #(#S #I #R))};
		addParameters: {#beta . #gamma . #mu};
		addEquation: 'S:t=mu*N-beta*S*I-mu*S';
		addEquation: 'I:t=beta*S*I-gamma*I-mu*I';
		addEquation: 'R:t=gamma*I-mu*R'.
	^ tmp1