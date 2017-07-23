as yet unclassified 
modelRK4SolverOnSIRDemoMultiConcerns
	"Created by ThanhNT 21/7/2017"
	| model |
	model := KEModel new population: (KEPopulation size: 10000).
	model attributes: {#status->#(#S #I #R)}.
	model atCompartment: '{#status: #S}' put: #(#(4975 4975)).
	model atCompartment: '{#status: #I}' put: #(#(25 25)).
	model atCompartment: '{#status: #R}' put: #(#(0 0)).
	"model addParameter: #beta value: 1 / 5000.
	model addParameter: #gamma value: 1 / 10.0."
	model atParameter: #beta assignValue: #(#((1 / 2500) (1 / 5000))) .
	model atParameter: #gamma assignValue: #(#((1 / 20.0) (1 / 10.0))).
	model atParameter: #mu assignValue: #(#(5e-4  5e-4)).
	model
     atParameter: #i assignValue: (1 to: 2).
	model addEquation: 'S[i]:t=mu[i]*N[i]-beta[i]*S[i]*I[i]-mu[i]*S[i]'.
	model addEquation: 'I[i]:t=beta[i]*S[i]*I[i]-gamma[i]*I[i]-mu[i]*I[i]'.
	model addEquation: 'R[i]:t=gamma[i]*I[i]-mu[i]*R[i]'.
	^ model