sources
exampleVisualizeEbolaDataFromCaitlinRiversRepository

	| tab data minValue b lb |
	tab := RTTabTable new
		input: (ZnEasy get: 'https://raw.githubusercontent.com/cmrivers/ebola/master/country_timeseries.csv') contents
		usingDelimiter: $,.
	tab removeFirstRow.
	tab replaceEmptyValuesWith: '0' inColumns: (2 to: 12) asArray.
	tab convertColumnsAsInteger: (2 to: 12) asArray.
	tab convertColumnAsDateAndTime: 1.
	tab replaceZeroWithCumulativeValuesInColumns: (2 to: 12) asArray.
	data := tab values reversed.
	minValue := data minValue: [ :aData | aData first julianDayNumber ].
	b := RTCharterBuilder new.
	b extent: 400 @ 200.
	b shape ellipse size: 0.
	b points: data.
	b connectDotColor: Color blue.
	b y: [ :v | v at: 3 ].
	b x: [ :v | v first julianDayNumber - minValue ].
	b points: data.
	b connectDotColor: Color green.
	b y: [ :v | v at: 4 ].
	b x: [ :v | v first julianDayNumber - minValue ].
	b axisConfiguration
		labelRotation: -30;
		labelConvertion: [ :v | Date julianDayNumber: v + minValue ].
	b axisX.
	b resetAxisConfiguration.
	b axisY.
	b build.
	lb := RTLegendBuilder new.
	lb view: b view.
	lb addText: 'Ebola cases'.
	lb addColor: Color blue text: 'Guinea'.
	lb addColor: Color green text: 'Liberia'.
	lb build.
	^b view