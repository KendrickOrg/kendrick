public-api
sumOverTimeSeries: name

	"refactor !!"
	|d tmp|
    tmp := (simulation timeSeriesOutputsAt: name) collect: [ :e| e value ].
    d := OrderedCollection new.
    1 to: tmp first data size do: [ :k| d add: (tmp collect: [:e| e data at: k]) sum ].
    ^ (KETimeSeries from: d withIndex: tmp first index) compartment: (STON fromString: name)
   