accessing
do: aFunction
	^ KETimeSeries from: (data collect: [ :each | each perform: aFunction ]) withIndex: index copy