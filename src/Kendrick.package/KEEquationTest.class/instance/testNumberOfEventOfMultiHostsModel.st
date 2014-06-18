tests
testNumberOfEventOfMultiHostsModel
	|model eventList dsdt didt|
	model := KEModel new.
	model atParameter: #j put: (1 to: 3). 
	model atParameter: #i put: (1 to: 3).
	dsdt := 'S[i]:t=mu[i]*N[i]-sum(j, beta[i, j]*I[j])*S[i]-mu[i]*S[i]' parseAsAnEquation.
	didt := 'I[i]:t=sum(j, beta[i,j]*I[j])*S[i]-(mu[i]+v)*I[i]' parseAsAnEquation.
	model addEquation: dsdt.
	model addEquation: didt.
	eventList := model generateEvents.
	self assert: 12 equals: eventList size