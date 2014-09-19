accessing
plotSingleDiagram: aStatus data: timeSeries
	| b |
	b := RTCharterBuilder new.
	b extent: 400 @ 200.
	b shape rectangle size: 0.
	b points: timeSeries index.
	b x: #yourself.
	b y: [ :x | timeSeries at: x ].
	b connectDotColor: Color blue.
	b axisXTitled: 'Time'.
	b axisYTitled: 'Number of individuals of ' , aStatus asString.
	b build.
	b open