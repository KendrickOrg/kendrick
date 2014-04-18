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