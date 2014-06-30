tests
testNumberOfEventOfMultiHostsModel2
	|model eventImpl eventList dsdt didt drdt|
	model := KEModel new.
	dsdt := 'S[i]:t=mu[i]*N[i]-sum(j, beta[i][j]*I[j])*S[i]-mu[i]*S[i]' parseAsAnEquation.
	didt := 'I[i]:t=sum(j, beta[i][j]*I[j])*S[i]-(mu[i]+v)*I[i]' parseAsAnEquation.
	drdt := 'R[i]:t=v*I[i]-mu[i]*R[i]' parseAsAnEquation.
	model addEquation: dsdt.
	model addEquation: didt.
	model addEquation: drdt.
	eventImpl := (KERuntimeCouplingEventImpl new) model: model.
	eventList := eventImpl events.
	self assert: 6 equals: eventList size