Extension { #name : #TRCanvas }

{ #category : #'*Kendrick-InternalDSL-DSL' }
TRCanvas >> gtInspectorKendrickViewIn: composite [
	<gtInspectorPresentationOrder: -20>
	<gtInspectorTag: #custom>
	<gtInspectorTag: #kendrick>
	composite roassal2
		title: 'Canvas';
		initializeView: [ RTView new setCanvas: self ]
		
]
