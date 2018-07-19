Class {
	#name : #KERoassalExamples,
	#superclass : #KEExamples,
	#category : 'Kendrick-Examples'
}

{ #category : #sources }
KERoassalExamples >> exampleVisualizeEbolaDataFromCaitlinRiversRepository [
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
]

{ #category : #icons }
KERoassalExamples >> exampleVisualizeEbolaDataFromCaitlinRiversRepositoryIcon [
	^ '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
RU5ErkJggg=='
]

{ #category : #sources }
KERoassalExamples >> exampleVisualizeEbolaFatalities [
| b tab ds data |
	"Preparing the data"
	tab := RTTabTable new input: (ZnEasy get: 'http://bit.ly/EbolaCSV') contents usingDelimiter: $,.
	tab removeFirstRow.
	tab replaceEmptyValuesWith: '0' inColumns: #(10 11).
	tab convertColumnsAsInteger: #(10 11).
	tab convertColumnsAsDateAndTime: #(3 4).
	data := tab values reversed.

	"Charting the data"
	b := RTGrapher new.
	b extent: 400 @ 200.

	ds := RTStackedDataSet new.
	ds interaction fixedPopupText: [ :row | row value at: 12 ]. 
	ds dotShape ellipse 
		color: (Color blue alpha: 0.3);
		size: [ :row  | (row at: 11) / 5 ].
	ds points: data.
	ds connectColor: Color blue.
	ds y: [ :r | r at: 10 ].
	ds highlightIf: [ :row | (row at: 10) > 100 ] using: [ :row | row third year ].
	b add: ds. 

	b axisX noLabel; numberOfTicks: tab values size.
	b axisY noDecimal.
	b build.
	^b view
]

{ #category : #icons }
KERoassalExamples >> exampleVisualizeEbolaFatalitiesIcon [
	^ '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
AABJRU5ErkJggg=='
]

{ #category : #examples }
KERoassalExamples >> label [
	^ 'Epidemiological data visualization examples'
]
