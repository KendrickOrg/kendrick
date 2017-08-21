tests
testIndexedEquationsToTransitions
	"self new testIndexedEquationsToTransitions"

	| model |
	model := KEModel new.
	model addAttribute: #status value: #(#S #I #R).
	model addAttribute: #species value: #(#mosquito #reservoir1 #reservoir2).
	model atParameter: #i assignValue: (1 to: 3).
	model atParameter: #j assignValue: (1 to: 3).
	model addEquation: 'S[i]:t=mu[i]*N[i]-sum(j, beta[i][j]*I[j])*S[i]-mu[i]*S[i]'.
	model addEquation: 'I[i]:t=sum(j, beta[i][j]*I[j])*S[i]-(mu[i]+gamma)*I[i]'.
	model addEquation: 'R[i]:t=gamma*I[i] - mu[i]*R[i]'.
	self assert: model transitions size equals: 18