accessing
plotCompositeDiagram: statusCollection data: timeSeriesCollection
	| b normalizer lb|
	
	b := RTCharterBuilder new.
	b extent: 400 @ 200.
	normalizer := RTMultiLinearColorForIdentity new objects: timeSeriesCollection; colors: (ColorPalette qualitative colors: timeSeriesCollection size scheme: 'Set1').
	1 to: timeSeriesCollection size do: [ :i | 
		b shape rectangle size: 0.
		b points: (timeSeriesCollection at: i) index.
		b x: #yourself.
		b y: [ :x | (timeSeriesCollection at: i) at: x ].
		b connectDotColor: (normalizer rtValue: (timeSeriesCollection at:i)) ].
	b axisXTitled: 'Time'.
	b axisYTitled: 'Number of individuals of each class'.
	lb := RTLegend2Builder new.
	lb view: b view.
	lb addText: 'Compartiments'.
	1 to: timeSeriesCollection size do: [ :i|
			lb addColor: (normalizer rtValue: (timeSeriesCollection at:i)) text: (statusCollection at:i).
		 ].
	lb build.
	b build.
	b view @ RTZoomableView.
	b open