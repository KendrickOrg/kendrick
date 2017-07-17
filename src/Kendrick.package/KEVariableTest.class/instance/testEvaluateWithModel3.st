tests
testEvaluateWithModel3
	"self new testEvaluateWithModel3"
	|model expr simulator db f|
	"model := self initialize4TestEvaluateWithModel3."
			
	"model atParameter: #gamma assignValue: #(
        												#(0.25 0.233 0.8)
														#(0.1  0.2   0.3)
														#(0    1     2)
    												).

    model atCompartment: { #status->#I. #species->#mosquito } put: 1 atOthersPut: 0.
    model atCompartment: { #status->#S. #species->#mosquito } put: 9999.
    model atCompartment: { #status->#S. #species->#reservoir1 } put: 1000.
    model atCompartment: { #status->#S. #species->#reservoir2 } put: 2000."

	"expr := 'S[1]*gamma[3][1]' parseAsAnExpression."
	
	"model := self prepare4FirstTestCase."
	model := self prepare4SecondTestCase.
	
	"expr := 'S[1]*3' parseAsAnExpression.
	self assert: (expr evaluateWithModel: model) equals: 0."
	simulator := KESimulator new: #RungeKutta from: 0 to: 500 step: 1.
    simulator executeOn: model.
    db := KEDiagramBuilder new.

    f := [:name| |d tmp|
        tmp := (simulator timeSeriesAt: name) collect: [ :e| e value ].
        d := OrderedCollection new.
        1 to: tmp first data size do: [ :k| d add: (tmp collect: [:e| e data at: k]) sum ].
        (KETimeSeries from: d withIndex: tmp first index) compartment: (STON fromString: name)
        ].
    db data: { 
        (f value: '{#status:#I, #species:#bird}'). 
        (f value: '{#status: #I, #species: #human}') }.
    db xLabel: 'Time (days)'.
    db legendTitle: 'Total of infectious'.
    db legends: { 'birds'. 'humans' }.

    db open.