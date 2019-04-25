Extension { #name : #KEModel }

{ #category : #'*Kendrick-InternalDSL-DSL' }
KEModel >> gtInspectorKendrickGraphIn: composite [
	<gtInspectorPresentationOrder: -20>
	<gtInspectorTag: #kendrick>
	composite roassal2
		title: 'Graph';
		painting: [ :view | 
			| graph lab nodes |
			graph := (KEGraphFromCompartments on: self) run.
			lab := RTLabel new.
			nodes := (RTEllipse new
				size: 15;
				color: (Color blue alpha: 0.4)) + (lab text: [ :e | e model associations.  ]) elementsOn: graph nodes.
			nodes @ RTDraggable.
			view addAll: nodes.
			RTEdgeBuilder new
				view: view;
				shape:
					(RTArrowedLine new
						color: Color black;
						attachPoint: RTBorderAttachPoint new);
				source: graph edges connectFrom: #from to: #to.
			(RTLayoutBuilder new forceWithCharge: -450) on: view elements.
			view ]
]

{ #category : #'*Kendrick-InternalDSL-DSL' }
KEModel >> resetTime [
	t := 0
]
