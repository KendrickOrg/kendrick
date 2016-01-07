examples
SIRDemographyConcern

	| SIRDemographyConcern |
	SIRDemographyConcern := KEConcern new.
	SIRDemographyConcern attributes: 
		{#status->#(#S #I #R)}.
	SIRDemographyConcern addParameters: {#beta. #gamma. #mu}.
	SIRDemographyConcern addEquation: 'S:t=mu*N-beta*S*I-mu*S' parseAsAnEquation.
	SIRDemographyConcern addEquation: 'I:t=beta*S*I-gamma*I-mu*I' parseAsAnEquation.
	SIRDemographyConcern addEquation: 'R:t=gamma*I-mu*R' parseAsAnEquation.
	
	^ SIRDemographyConcern 