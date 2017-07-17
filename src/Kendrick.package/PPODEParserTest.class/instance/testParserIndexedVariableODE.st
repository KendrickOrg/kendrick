tests
testParserIndexedVariableODE
	"self new testParserIndexedVariableODE"
	|betaEquation|
	"betaEquation := 'beta[i][j]=exp(-(i-j)^2/d)' parseAsAnEquation.
	self assert: (betaEquation variable isAnIndexedVariable) equals: true.
	self assert: (betaEquation variable symbol) equals: #beta.
	self assert: ((betaEquation variable atIndex: 1) symbol) equals: #i.
	self assert: ((betaEquation variable atIndex: 1) isAVariable) equals: true.
	self assert: ((betaEquation variable atIndex: 2) symbol) equals: #j"
	betaEquation :=  'S[p][s]:t=mu[p][s]*N[p][s]-sum(i,beta[i][s]*I[p][i])/N[p][i]*S[p][s]-mu[p][s]*S[p][s]+sum(q,rho[s][p][q]*S[q][s])-sum(q,rho[s][q][p])*S[p][s]+nu*R[p][s]' parseAsAnEquation.
   self assert: ((betaEquation variable atIndex: 1) symbol) equals: #p.
	self assert: ((betaEquation variable atIndex: 1) isAVariable) equals: true.
	self assert: ((betaEquation variable atIndex: 2) symbol) equals: #s