tests
testNumberOfEventOfMultiHostsModel
	|model eventImpl eventList dsdt didt|
	model := KEModel new.
	dsdt := 'S[i]:t=mu[i]*N[i]-sum(j, beta[i][j]*I[j])*S[i]-mu[i]*S[i]' parseAsAnEquation.
	didt := 'I[i]:t=sum(j, beta[i][j]*I[j])*S[i]-(mu[i]+v)*I[i]' parseAsAnEquation.
	model addEquation: dsdt.
	model addEquation: didt.
	eventImpl := (KERuntimeCouplingEventImpl new) model: model.
	eventList := eventImpl events.
	self assert: 4 equals: eventList size