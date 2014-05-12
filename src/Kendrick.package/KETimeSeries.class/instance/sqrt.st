accessing
sqrt
	"This function will take sqrt of data and return a new Time Series"
	^ KETimeSeries from: (data collect: [ :each| each sqrt]) withIndex: index copy