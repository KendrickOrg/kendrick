as yet unclassified
gtInspectorKendrickGraphIn: arg1
	<gtInspectorPresentationOrder: -20>
	<gtInspectorTag: #custom>
	<gtInspectorTag: #kendrick>
	| tmp2 |
	tmp2 := Composition Temp.
	tmp2 model: 'mTemp'.
	^ ((tmp2 concern: self id) instVarNamed: #backEndEntity)
		gtInspectorKendrickGraphIn: arg1