accessing
plotCompositeDiagram: anObject data: data
	| b |
	b := RTCharterBuilder new.
	b extent: 400 @ 200.
	1 to: data size do: [ :i | 
		b shape rectangle size: 0.
		b points: (data at: i) index.
		b x: #yourself.
		b y: [ :x | (data at: i) at: x ].
		b connectDotColor: (colorList at: i) ].
	b axisXTitled: 'Time'.
	b axisYTitled: 'Number of individuals of each class'.
	b build.
	b open