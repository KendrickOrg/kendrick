accessing
plotCompositeDiagram: statusCollection data: data
	| b normalizer|
	
	b := RTCharterBuilder new.
	b extent: 400 @ 200.
	normalizer := RTMultiLinearColorForIdentity new objects: statusCollection.
	1 to: data size do: [ :i | 
		b shape rectangle size: 0.
		b points: (data at: i) index.
		b x: #yourself.
		b y: [ :x | (data at: i) at: x ].
		b connectDotColor: (normalizer rtValue: (statusCollection at:i)) ].
	b axisXTitled: 'Time'.
	b axisYTitled: 'Number of individuals of each class'.
	b build.
	b open