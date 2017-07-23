as yet unclassified 
exampleRK4SEIRandMultiHostAndIndexVariables
	"self new exampleRK4SEIRandMultiHostAndIndexVariables"
	"Created by ThanhNT 18/7"
	|model simulator db f|
	model := self model4SEIRandMultiHostAndIndexVariables.
	"Run the model with RK4"
	simulator := KESimulator new: #RungeKutta from: 0 to: 500 step: 1.
   simulator executeOn: model.
   db := KEDiagramBuilder new.

   f := [:name| |d tmp|
        tmp := (simulator timeSeriesOutputsAt: name) collect: [ :e| e value ].
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