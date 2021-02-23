Class {
	#name : #KEChart,
	#superclass : #KEEntity,
	#instVars : [
		'data',
		'xLabel',
		'yLabel',
		'legends',
		'legendTitle'
	],
	#category : #'Kendrick-Core-Visualisation-Roassal3'
}

{ #category : #'as yet unclassified' }
KEChart >> buildLegends [
	legends ifNil: [ legends := data collect: [ :each | each columnNames first ] ]
]

{ #category : #accessing }
KEChart >> data [ 
	^data 
]

{ #category : #accessing }
KEChart >> data: aCollection [
	data := aCollection.
	self buildLegends
]

{ #category : #initialization }
KEChart >> initialize [
	data := OrderedCollection new
]

{ #category : #accessing }
KEChart >> legendTitle [
	^ legendTitle
]

{ #category : #accessing }
KEChart >> legendTitle: aString [
	legendTitle := aString
]

{ #category : #accessing }
KEChart >> legends [
	^ legends
]

{ #category : #accessing }
KEChart >> legends: aCollection [
	legends := aCollection
]

{ #category : #'as yet unclassified' }
KEChart >> plot [
	| c p x y lb normalize |
	normalize := RTMultiLinearColorForIdentity new
		objects: self legends;
		colors: (RTColorPalette qualitative colors: 9 scheme: 'Set1').
	c := RSChart new.
	1 to: legends size do: [ :i | 
		| d |
		d := normalize rtValue: (legends at: i).
		p := RSLinePlot new.
		x := (data at: i) rowNames.
		y := x collect: [ :j | ((data at: i) row: j) contents first ].
		p
			x: x y: y;
			color: d.
		c addPlot: p ].
	c addDecoration: RSVerticalTick new asFloat.
	c addDecoration: RSHorizontalTick new asFloat.
	xLabel
		ifNil: [ c xlabel: 'Time (days)' ]
		ifNotNil: [ c xlabel: xLabel ].
	yLabel
		ifNil: [ c ylabel: 'Number of individuals' ]
		ifNotNil: [ c ylabel: yLabel ].
	self legendTitle ifNil: [ legendTitle := '' ].
	c title: legendTitle.
	c build.
	lb := RSLegend new.
	lb container: c canvas.
	legends do: [ :each | 
		| d |
		d := normalize rtValue: each.
		lb text: each withBoxColor: d ].
	lb build.
	lb canvas open
]

{ #category : #'as yet unclassified' }
KEChart >> plotHistogram [
	| c p x y lb normalize |
	normalize := RTMultiLinearColorForIdentity new
		objects: self legends;
		colors: (RTColorPalette qualitative colors: 9 scheme: 'Set1').
	c := RSChart new.
	1 to: legends size do: [ :i | 
		| d |
		d := normalize rtValue: (legends at: i).
		p := RSBarPlot new.
		x := (data at: i) rowNames.
		y := x collect: [ :j | ((data at: i) row: j) contents first ].
		p
			x: x y: y;
			color: d.
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
	self legendTitle ifNil: [ legendTitle := '' ].
	c title: legendTitle.
	c build.
	lb := RSLegend new.
	lb container: c canvas.
	legends do: [ :each | 
		| d |
		d := normalize rtValue: each.
		lb text: each withBoxColor: d ].
	lb build.
	lb canvas open
]

{ #category : #'as yet unclassified' }
KEChart >> plotLog [
	| c p x y lb normalize |
	normalize := RTMultiLinearColorForIdentity new
		objects: self legends;
		colors: (RTColorPalette qualitative colors: 9 scheme: 'Set1').
	#(yLog)
		do: [ :sel | 
			c := RSChart new.
			1 to: legends size do: [ :i | 
				| d |
				d := normalize rtValue: (legends at: i).
				p := RSLinePlot new.
				x := (data at: i) rowNames.
				y := x collect: [ :j | ((data at: i) row: j) contents first ].
				p
					x: x y: y log;
					color: d.
				c addPlot: p ].
			c addDecoration: RSVerticalTick new asFloat.
			c addDecoration: RSHorizontalTick new asFloat.
			c perform: sel.
			c yLog.
			"c title: sel."
			xLabel
				ifNil: [ c xlabel: 'Time (days)' ]
				ifNotNil: [ c xlabel: xLabel ].
			yLabel
				ifNil: [ c ylabel: 'Log (Number of individuals)' ]
				ifNotNil: [ c ylabel: yLabel ].
			self legendTitle ifNil: [ legendTitle := '' ].
			c title: legendTitle.
			c build.
			lb := RSLegend new.
			lb container: c canvas.
			legends do: [ :each | 
				| d |
				d := normalize rtValue: each.
				lb text: each withBoxColor: d ].
			lb build.
			lb canvas open ]
]

{ #category : #'as yet unclassified' }
KEChart >> plotScatter [
	| c p x y lb normalize |
	normalize := RTMultiLinearColorForIdentity new
		objects: self legends;
		colors: (RTColorPalette qualitative colors: 9 scheme: 'Set1').
	c := RSChart new.
	1 to: legends size do: [ :i | 
		| d |
		d := normalize rtValue: (legends at: i).
		p := RSScatterPlot new.
		x := (data at: i) rowNames.
		y := x collect: [ :j | ((data at: i) row: j) contents first ].
		p
			x: x y: y;
			color: d.
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
	self legendTitle ifNil: [ legendTitle := '' ].
	c title: legendTitle.
	c build.
	lb := RSLegend new.
	lb container: c canvas.
	legends do: [ :each | 
		| d |
		d := normalize rtValue: each.
		lb text: each withBoxColor: d ].
	lb build.
	lb canvas open
]

{ #category : #'as yet unclassified' }
KEChart >> plotSqrt [
	| c p x y lb normalize |
	normalize := RTMultiLinearColorForIdentity new
		objects: self legends;
		colors: (RTColorPalette qualitative colors: 9 scheme: 'Set1').
	#(ySqrt)
		do: [ :sel | 
			c := RSChart new.
			1 to: legends size do: [ :i | 
				| d |
				d := normalize rtValue: (legends at: i).
				p := RSLinePlot new.
				x := (data at: i) rowNames.
				y := x collect: [ :j | ((data at: i) row: j) contents first ].
				p
					x: x y: y sqrt;
					color: d.
				c addPlot: p ].
			c addDecoration: RSVerticalTick new asFloat.
			c addDecoration: RSHorizontalTick new asFloat.
			c perform: sel.
			c ySqrt.
			xLabel
				ifNil: [ c xlabel: 'Time (days)' ]
				ifNotNil: [ c xlabel: xLabel ].
			yLabel
				ifNil: [ c ylabel: 'Sqrt (Number of individuals)' ]
				ifNotNil: [ c ylabel: yLabel ].
			self legendTitle ifNil: [ legendTitle := '' ].
			c title: legendTitle.
			c build.
			lb := RSLegend new.
			lb container: c canvas.
			legends do: [ :each | 
				| d |
				d := normalize rtValue: each.
				lb text: each withBoxColor: d ].
			lb build.
			lb canvas open ]
]

{ #category : #accessing }
KEChart >> xLabel [
	^ xLabel
]

{ #category : #accessing }
KEChart >> xLabel: aString [
	xLabel := aString
]

{ #category : #accessing }
KEChart >> yLabel [
	^ yLabel
]

{ #category : #accessing }
KEChart >> yLabel: aString [
	yLabel := aString
]
