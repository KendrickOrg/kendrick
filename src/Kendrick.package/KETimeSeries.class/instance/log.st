accessing
log
	"This function will take log of data and return a new Time Series"
	^ KETimeSeries from: (data collect: [ :each| each log]) withIndex: index copy