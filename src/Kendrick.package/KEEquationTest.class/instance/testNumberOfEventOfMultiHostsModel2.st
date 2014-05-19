tests
testNumberOfEventOfMultiHostsModel2
	|model simulator eventList dsdt didt drdt|
	model := KEModel2 new.
	dsdt := 'S[i]:t=mu[i]*N[i]-sum(j, beta[i][j]*I[j])*S[i]-mu[i]*S[i]' parseAsAnEquation.
	didt := 'I[i]:t=sum(j, beta[i][j]*I[j])*S[i]-(mu[i]+v)*I[i]' parseAsAnEquation.
	drdt := 'R[i]:t=v*I[i]-mu[i]*R[i]' parseAsAnEquation.
	model addEquation: dsdt.
	model addEquation: didt.
	model addEquation: drdt.
	simulator := (KESimulator new) model: model.
	eventList := simulator generateEvents.
	self assert: 6 equals: eventList size