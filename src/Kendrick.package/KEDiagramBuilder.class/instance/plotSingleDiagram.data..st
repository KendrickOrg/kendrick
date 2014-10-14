accessing
plotSingleDiagram: aStatus data: timeSeries
	| b lb |
	b := RTCharterBuilder new.
	b extent: 400 @ 200.
	b shape rectangle size: 0.
	b points: timeSeries index.
	b x: #yourself.
	b y: [ :x | timeSeries at: x ].
	b connectDotColor: Color blue.
	b axisXTitled: 'Time'.
	b axisYTitled: 'Number of individuals'.
	lb := RTLegendBuilder new.
	lb view: b view.
	lb addText: 'Compartiment'.
	lb addColor: Color blue text: aStatus asString.
	lb build.
	b build.
	b view @ RTZoomableView.
	b open