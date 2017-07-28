examples
SIRDemographyConcern

	| SIRDemographyConcern |
	SIRDemographyConcern := KEModelPart new.
	SIRDemographyConcern attributes: 
		{#status->#(#S #I #R)}.
	SIRDemographyConcern addParameters: {#beta. #gamma. #mu}.
	SIRDemographyConcern addEquation: 'S:t=mu*N-beta*S*I-mu*S'.
	SIRDemographyConcern addEquation: 'I:t=beta*S*I-gamma*I-mu*I'.
	SIRDemographyConcern addEquation: 'R:t=gamma*I-mu*R'.
	
	^ SIRDemographyConcern 