"
KEChart is the main class to plot results of simulation in Kendrick.

How to use KEChar:

	chart := KEChart new
		addDataFrame: df1;
		addDataFrame: df2;
		addDataFrame: df3.
	chart plot

will plot on the same chart, the 3 dataframes df1, df2 and df3.
"
Class {
	#name : #KEChart,
	#superclass : #KEEntity,
	#instVars : [
		'xLabel',
		'yLabel',
		'legendTitle',
		'dataFrames'
	],
	#category : #'Kendrick-Core-Visualisation-Roassal3'
}

{ #category : #accessing }
KEChart >> addDataFrame: aDataFrame [
	dataFrames add: aDataFrame
]

{ #category : #'public - plots' }
KEChart >> build [
	| c p x y lb  |
	c := RSChart new.
	self legends
		withIndexDo: [ :each :i | 
			p := RSLinePlot new.
			x := (dataFrames at: i) rowNames.
			y := x collect: [ :j | ((dataFrames at: i) row: j) contents first ].
			p
				x: x y: y.
			c addPlot: p ].
	c addDecoration: RSVerticalTick new asFloat.
	c addDecoration: RSHorizontalTick new asFloat.
	xLabel
		ifNil: [ c xlabel: 'Time (days)' ]
		ifNotNil: [ c xlabel: xLabel ].
	yLabel
		ifNil: [ c ylabel: 'Number of individuals' ]
		ifNotNil: [ c ylabel: yLabel ].
	c title: legendTitle.
	c build.
	lb := RSLegend new.
	lb container: c canvas.
	self legends
		do: [ :each | 
			lb text: each].
	lb build.
	^ lb canvas
]

{ #category : #initialization }
KEChart >> initialize [
	dataFrames := OrderedCollection new.
	legendTitle := ''
]

{ #category : #accessing }
KEChart >> legendTitle: aString [
	legendTitle := aString
]

{ #category : #accessing }
KEChart >> legends [
	^ dataFrames collect: [ :each | each columnNames first ]
]

{ #category : #'public - plots' }
KEChart >> plot [
	| c p x y lb|
	c := RSChart new.
	self legends
		withIndexDo: [ :each :i | 
			p := RSLinePlot new.
			x := (dataFrames at: i) rowNames.
			y := x collect: [ :j | ((dataFrames at: i) row: j) contents first ].
			p
				x: x y: y.
			c addPlot: p ].
	c addDecoration: RSVerticalTick new asFloat.
	c addDecoration: RSHorizontalTick new asFloat.
	xLabel
		ifNil: [ c xlabel: 'Time (days)' ]
		ifNotNil: [ c xlabel: xLabel ].
	yLabel
		ifNil: [ c ylabel: 'Number of individuals' ]
		ifNotNil: [ c ylabel: yLabel ].
	c title: legendTitle.
	c build.
	lb := RSLegend new.
	lb container: c canvas.
	self legends
		doWithIndex: [ :lbl :index | 
   lb text: lbl withBoxColor: (c plots at:index) computeColor].
	lb build.
	lb canvas open
]

{ #category : #'public - plots' }
KEChart >> plotHistogram [
	| c p x y lb |
	c := RSChart new.
	self legends
		withIndexDo: [ :each :i | 
			p := RSBarPlot new.
			x := (dataFrames at: i) rowNames.
			y := x collect: [ :j | ((dataFrames at: i) row: j) contents first ].
			p
				x: x y: y.
			c addPlot: p ].
	c addDecoration: RSVerticalTick new asFloat.
	c
		addDecoration:
			(RSHorizontalTick new
				doNotUseNiceLabel;
				asFloat).
	xLabel
		ifNil: [ c xlabel: 'Time (days)' ]
		ifNotNil: [ c xlabel: xLabel ].
	yLabel
		ifNil: [ c ylabel: 'Number of individuals' ]
		ifNotNil: [ c ylabel: yLabel ].
	c title: legendTitle.
	c build.
	lb := RSLegend new.
	lb container: c canvas.
	self legends
		do: [ :each | 
			lb text: each ].
	lb build.
	lb canvas open
]

{ #category : #'public - plots' }
KEChart >> plotLog [
	| c p x y lb  |
	c := RSChart new.
	self legends
		withIndexDo: [ :each :i | 
				p := RSLinePlot new.
			x := (dataFrames at: i) rowNames.
			y := x collect: [ :j | ((dataFrames at: i) row: j) contents first ].
			p
				x: x y: y log.
			c addPlot: p ].
	c addDecoration: RSVerticalTick new asFloat.
	c addDecoration: RSHorizontalTick new asFloat.
	c yLog.
	xLabel
		ifNil: [ c xlabel: 'Time (days)' ]
		ifNotNil: [ c xlabel: xLabel ].
	yLabel
		ifNil: [ c ylabel: 'Log (Number of individuals)' ]
		ifNotNil: [ c ylabel: yLabel ].
	c title: legendTitle.
	c build.
	lb := RSLegend new.
	lb container: c canvas.
	self legends
		do: [ :each | 
				lb text: each ].
	lb build.
	lb canvas open
]

{ #category : #'public - plots' }
KEChart >> plotScatter [
	| c p x y lb  |
	c := RSChart new.
	self legends
		withIndexDo: [ :each :i | 
			p := RSScatterPlot new.
			x := (dataFrames at: i) rowNames.
			y := x collect: [ :j | ((dataFrames at: i) row: j) contents first ].
			p
				x: x y: y.
			c addPlot: p ].
	c addDecoration: RSVerticalTick new asFloat.
	c
		addDecoration:
			(RSHorizontalTick new
				doNotUseNiceLabel;
				asFloat).
	xLabel
		ifNil: [ c xlabel: 'Time (days)' ]
		ifNotNil: [ c xlabel: xLabel ].
	yLabel
		ifNil: [ c ylabel: 'Number of individuals' ]
		ifNotNil: [ c ylabel: yLabel ].
	c title: legendTitle.
	c build.
	lb := RSLegend new.
	lb container: c canvas.
	self legends
		do: [ :each | 
			lb text: each ].
	lb build.
	lb canvas open
]

{ #category : #'public - plots' }
KEChart >> plotSqrt [
	| c p x y lb |
	c := RSChart new.
	self legends
		withIndexDo: [ :each :i | 
			p := RSLinePlot new.
			x := (dataFrames at: i) rowNames.
			y := x collect: [ :j | ((dataFrames at: i) row: j) contents first ].
			p
				x: x y: y sqrt.
			c addPlot: p ].
	c addDecoration: RSVerticalTick new asFloat.
	c addDecoration: RSHorizontalTick new asFloat.
	c ySqrt.
	xLabel
		ifNil: [ c xlabel: 'Time (days)' ]
		ifNotNil: [ c xlabel: xLabel ].
	yLabel
		ifNil: [ c ylabel: 'Sqrt (Number of individuals)' ]
		ifNotNil: [ c ylabel: yLabel ].
	c title: legendTitle.
	c build.
	lb := RSLegend new.
	lb container: c canvas.
	self legends
		do: [ :each | 
			lb text: each ].
	lb build.
	lb canvas open
]

{ #category : #accessing }
KEChart >> xLabel: aString [
	xLabel := aString
]

{ #category : #accessing }
KEChart >> yLabel: aString [
	yLabel := aString
]
