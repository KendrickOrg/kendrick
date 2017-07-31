as yet unclassified 
getIndexedEquations4Model: aModel
	aModel atParameter: #beta assignValue: #(4e-4 2e-2) .
	aModel atParameter: #gamma assignValue: #(5e-2 1e-1).
	aModel atParameter: #mu assignValue: #(5e-4  5e-4).
	
	"model addEquation: 'S:t=-beta*S*I'.
	model addEquation: 'I:t=beta*S*I - gamma*I'.
	model addEquation: 'R:t=gamma*I'.
	"
	
	aModel addEquation: 'S[i]:t=-beta[i]*S[i]*I[i]'.
	aModel addEquation: 'I[i]:t=beta[i]*S[i]*I[i]-gamma[i]*I[i]'.
	aModel addEquation: 'R[i]:t=gamma[i]*I[i]'.
	^ aModel

