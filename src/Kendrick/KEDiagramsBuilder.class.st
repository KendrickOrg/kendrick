Class {
	#name : #KEDiagramsBuilder,
	#superclass : #KEPlot,
	#instVars : [
		'xLabel',
		'yLabel',
		'legends',
		'legendTitle'
	],
	#category : #'Kendrick-Core-Visualisation-Roassal3'
}

{ #category : #'as yet unclassified' }
KEDiagramsBuilder >> buildLegends [
	legends ifNil: [ legends := data collect: [ :each | each columnNames first ] ]
]

{ #category : #accessing }
KEDiagramsBuilder >> data: aCollection [
	super data: aCollection.
	self buildLegends
]

{ #category : #accessing }
KEDiagramsBuilder >> legendTitle [
	^ legendTitle
]

{ #category : #accessing }
KEDiagramsBuilder >> legendTitle: aString [
	legendTitle := aString
]

{ #category : #accessing }
KEDiagramsBuilder >> legends [
	^ legends
]

{ #category : #accessing }
KEDiagramsBuilder >> legends: aCollection [
	legends := aCollection
]

{ #category : #'as yet unclassified' }
KEDiagramsBuilder >> plot [
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
	1 to: legends size do: [ :i | 
		| d |
		d := normalize rtValue: (legends at: i).
		lb text: (legends at: i) withBoxColor: d ].
	lb build.
	lb canvas open
]

{ #category : #accessing }
KEDiagramsBuilder >> xLabel [
	^ xLabel
]

{ #category : #accessing }
KEDiagramsBuilder >> xLabel: aString [
	xLabel := aString
]

{ #category : #accessing }
KEDiagramsBuilder >> yLabel [
	^ yLabel
]

{ #category : #accessing }
KEDiagramsBuilder >> yLabel: aString [
	yLabel := aString
]
