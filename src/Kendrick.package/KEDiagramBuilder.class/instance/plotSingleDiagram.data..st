accessing
plotSingleDiagram: anObject data: timeSeries
	|diag|
	xLabel := 'Time'.
	yLabel := 'Number of individuals of ' , anObject asString.
	diag := GETDiagramBuilder new.
	diag lineDiagram
		height: 300;
		models: (timeSeries index);
		y: [ :x| timeSeries at: x ];
		color: colorList first;
		xAxisLabel: xLabel;
		yAxisLabel: yLabel;
		regularAxis.
	diag open
	
	"Charter version does not work, at the moment"
	"
	| b |
	b := RTCharterBuilder new.
	b extent: 400 @ 200.
	b shape ellipse size: 0.
	b points: #(0.0),(timeSeries index).
	b y: [ :x | x = 0.0 ifTrue:[0.0] ifFalse:[timeSeries at:x]].	
	b axisX.
	b axisY.
	b curve.
	b open"
