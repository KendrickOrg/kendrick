accessing
plotCompositeDiagram: anObject data: data
	|diagrams builder|
	xLabel := 'Time'.
	yLabel := 'Number of individuals of each class'.
	diagrams := OrderedCollection new.
	1 to: (data size) do: [ :i| 
		diagrams add: 
			((GETLineDiagram new)
				y: [ :x| (data at: i) at: x ];
				models: ((data at: i) index);
				color: (colorList at: i))
		 ].
	builder := GETDiagramBuilder new.
	builder compositeDiagram
		xAxisLabel: xLabel;
		yAxisLabel: yLabel;
		height: 300;
		regularAxis;
		diagrams: diagrams.	
	builder open
	