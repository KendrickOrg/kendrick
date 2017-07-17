as yet unclassified 
testParserIndexODE
	"self new testParserIndexODE"
	"Created by ThanhNT 12/7"
	"under constructing"
	| model multiHostConcern visitor simulator compartments |
	model := KEModel new population: (KEPopulation size: 27500).
	model attributes: {#status->#(#S #E #I #R)}.

	multiHostConcern := KEModelPart new.
	multiHostConcern addAttribute: #species value: #(#human #bird).
	model integrate: multiHostConcern.

	model atCompartment: { #status->#S. #species->#human } put: 10000.
	model atCompartment: { #status->#S. #species->#bird } put: 10000.
	
	model atCompartment: { #status->#E. #species->#human } put: 2500.
	model atCompartment: { #status->#E. #species->#bird } put: 2500.	
		
	model atCompartment: { #status->#I. #species->#human } put: 1000.
	model atCompartment: { #status->#I. #species->#bird } put: 1000.	
	
	model atCompartment: { #status->#R. #species->#human } put: 250.
	model atCompartment: { #status->#R. #species->#bird } put: 250.
		
	model := self addParametersForTestParserIndexODE: model.
	"model atParameter: #N assignValue: #( #(500 5000)
													  #(500 5000)
		  											  #(500 5000)
													  #(500 5000)
													  #(500 5000)
													).
	model atParameter: #mu assignValue: #(
        												#(0.000365 0.00137)
        												#(0.000365 0.00137)
        												#(0.000365 0.00137)
        												#(0.000365 0.00137)
        												#(0.000365 0.00137)
    												).
	model atParameter: #sigma assignValue: #( #(0.5 0.67)
													  #(0.5 0.67)
		  											  #(0.5 0.67)
													  #(0.5 0.67)
													  #(0.5 0.67)
													).
	model atParameter: #gamma assignValue: #(
        												#(0.25 0.233)
        												#(0.25 0.233)
        												#(0.25 0.233)
        												#(0.25 0.233)
        												#(0.25 0.233)
    												)."
	model addEquation:  'S[p][s]:t=mu[p][s]*N[p][s]-sum(i,beta[i][s]*I[p][i])/N[p][i]*S[p][s]-mu[p][s]*S[p][s]+sum(q,rho[s][p][q]*S[q][s])-sum(q,rho[s][q][p])*S[p][s]+nu*R[p][s]'.
	
	
	
	simulator := KESimulator new: #RungeKutta from: 0.0 to: 0.3 step: 0.0027.
	visitor := TCPPDeterministicVisitor new.
	visitor model: model.
	compartments := visitor compartments.
	
	simulator executeOn: model.
	
visitor simulator: simulator.
		
	visitor visitNode: model.
	"model 
        atParameter: #N
        assignValue: 
        [ :aModel| |c val| 
            c := aModel currentCompartment at: #species.
            c = #human ifTrue: [ val := 500 ].
            c = #bird ifTrue: [ val := 5000 ].
            val
        ]."
	"self halt."
	"model 
        atParameter: #mu
        assignValue: 
        [ :aModel| |c val| 
            c := aModel currentCompartment at: #species.
            c = #human ifTrue: [ val := 0.000365 ].
            c = #bird ifTrue: [ val := 0.00137 ].
            val
        ].
	model 
        atParameter: #sigma
        assignValue: 
        [ :aModel| |c val| 
            c := aModel currentCompartment at: #species.
            c = #human ifTrue: [ val := 0.5 ].
            c = #bird ifTrue: [ val := 0.67 ].
            val
        ].
	model 
        atParameter: #gamma
        assignValue: 
        [ :aModel| |c val| 
            c := aModel currentCompartment at: #species.
            c = #human ifTrue: [ val := 0.25 ].
            c = #bird ifTrue: [ val := 0.233 ].
            val
        ]."
	"model atParameter: #N assignValue: #(  #(500 5000)
													  #(500 5000)
		  											  #(500 5000)
													  #(500 5000)
													  #(500 5000)
													)."
	"model atParameter: #beta put: #(#(0 0.02 0.02) #(0.02 0.0 0.0) #(0.02 0.0 0.0))."
	"model atCompartment: { #status->#S } put: #( #(500 4990) 
															  #(500 5000) 
															  #(500 5000) 
															  #(500 5000)
  															  #(500 5000)
															).
	model atCompartment: { #status->#I } put: #( #(0 10) 
															  #(0 0) 
															  #(0 0) 
															  #(0 0)
  															  #(0 0)
															).		
	model atParameter: #N assignValue: #(  #(500 5000)
													  #(500 5000)
		  											  #(500 5000)
													  #(500 5000)
													  #(500 5000)
													)."