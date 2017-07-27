*Kendrick-InternalDSL-DSL
gtInspectorKendrickViewIn: arg1
	<gtInspectorPresentationOrder: -20>
	<gtInspectorTag: #custom>
	<gtInspectorTag: #kendrick>
	| tmp2 |
	tmp2 := arg1 roassal2.
	tmp2
		title: 'Canvas';
		initializeView: [ RTView new setCanvas: self ]