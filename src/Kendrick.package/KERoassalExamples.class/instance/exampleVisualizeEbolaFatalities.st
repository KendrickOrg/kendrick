sources
exampleVisualizeEbolaFatalities
| b tab data |
	
	"Preparing the data"
	tab := RTTabTable new input: (ZnEasy get: 'http://bit.ly/EbolaCSV') contents usingDelimiter: $,.
	tab removeFirstRow.
	tab replaceEmptyValuesWith: '0' inColumns: #(10 11).
	tab convertColumnsAsInteger: #(10 11).
	tab convertColumnsAsDateAndTime: #(3 4).
	data := tab values reversed.
	
	"Charting the data"
	b := RTCharterBuilder new.
	b extent: 400 @ 200.
	b interaction popupText: [ :row | row at: 12 ].
	b shape ellipse
		color: (Color blue alpha: 0.3);
		size: [ :row | (row at: 11) / 5 ].
	b points: data.
	b connectDotColor: Color blue.
	b allY: [ :r | r at: 10 ].
	b stackX.
	b axisConfiguration
		noLabel;
		numberOfTicks: tab values size.
	b axisX.
	b newAxisConfiguration noDecimals.
	b axisY.
	b highlightIf: [ :row | (row at: 10) > 100 ] using: [ :row | row third year ].
	b build.
	^ b view