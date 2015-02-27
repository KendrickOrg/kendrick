sources
exampleVisualizeEbolaDataFromCaitlinRiversRepository
| tab data minValue b lb ds1 ds2|
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

	b := RTGrapher new.
	b extent: 300 @ 200.
	
	ds1 := RTStackedDataSet new.
	ds1 dotShape ellipse size: 0.
	ds1 points: data.
	ds1 connectColor: Color blue.
	ds1 y: [ :v | v at: 3 ].
	ds1 x: [ :v | v first julianDayNumber - minValue ].
	b add: ds1.

	ds2 := RTStackedDataSet new.
	ds2 dotShape ellipse size: 0.
	ds2 points: data.
	ds2 connectColor: Color green.
	ds2 y: [ :v | v at: 4 ].
	ds2 x: [ :v | v first julianDayNumber - minValue ].
	b add: ds2.
	
	b axisY
		noDecimal;
		title: 'cases'.
	
	b axisX
		labelRotation: -30;
		labelConvertion: [ :v | Date julianDayNumber: v + minValue ].
	
	b build.
	lb := RTLegendBuilder new.
	lb view: b view.
	lb addText: 'Ebola cases'.
	lb addColor: Color blue text: 'Guinea'.
	lb addColor: Color green text: 'Liberia'.
	lb build.
	^b view