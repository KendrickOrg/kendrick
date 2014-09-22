accessing
plotCompositeDiagram: statusCollection data: timeSeriesCollection
	| b normalizer|
	
	b := RTCharterBuilder new.
	b extent: 400 @ 200.
	normalizer := RTMultiLinearColorForIdentity new objects: statusCollection; colors: (ColorPalette qualitative colors: statusCollection size scheme: 'Set1').
	1 to: timeSeriesCollection size do: [ :i | 
		b shape rectangle size: 0.
		b points: (timeSeriesCollection at: i) index.
		b x: #yourself.
		b y: [ :x | (timeSeriesCollection at: i) at: x ].
		b connectDotColor: (normalizer rtValue: (statusCollection at:i)) ].
	b axisXTitled: 'Time'.
	b axisYTitled: 'Number of individuals of each class'.
	b build.
	b view @ RTZoomableView.
	b open