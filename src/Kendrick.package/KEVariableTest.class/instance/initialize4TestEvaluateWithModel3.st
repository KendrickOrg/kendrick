tests
initialize4TestEvaluateWithModel3
	|model multiHostConcern|
	model := KEModel new.
	model population: (KEPopulation size: 13000).
	model attributes: {(#status -> #(#S #I #R))}.

	model addParameter: #beta value: 1.
	
	multiHostConcern := KEModelPart new.
	multiHostConcern 
 	  addAttribute: #species 
  	 value: #(#mosquito #reservoir1 #reservoir2).

	model integrate: multiHostConcern.

	
	model atParameter: #gamma assignValue: #(
        												#(0.25 0.233 0.8)
														#(0.1  0.2   0.3)
														#(0    1     2)
    												).

    model atCompartment: { #status->#I. #species->#mosquito } put: 1 atOthersPut: 0.
    model atCompartment: { #status->#S. #species->#mosquito } put: 9999.
    model atCompartment: { #status->#S. #species->#reservoir1 } put: 1000.
    model atCompartment: { #status->#S. #species->#reservoir2 } put: 2000.

	^model
	
	"model atParameter: #N assignValue: [ :aModel| |c| 
        c := aModel currentCompartment at: #species.
        aModel sizeOfPopulation: c
        ]."