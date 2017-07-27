as yet unclassified
gtInspectorGraphIn: arg1
	<gtInspectorPresentationOrder: 30>
	| tmp2 |
	tmp2 := arg1 roassal2.
	tmp2
		title: 'View';
		painting: [ :arg2 | 
			| tmp3 tmp4 tmp5 tmp7 tmp9 tmp11 |
			tmp3 := (KEGraphFromCompartments on: self) run.
			tmp4 := RTLabel new.
			tmp7 := RTEllipse new.
			tmp7 size: 15.
			tmp5 := (tmp7 color: (Color blue alpha: 0.4))
				+ (tmp4 text: [ :arg3 | arg3 model any asString ])
				elementsOn: tmp3 nodes.
			tmp5 @ RTDraggable.
			arg2 addAll: tmp5.
			tmp9 := RTEdgeBuilder new.
			tmp9 view: arg2.
			tmp11 := RTArrowedLine new.
			tmp11 color: Color black.
			tmp9
				shape: (tmp11 attachPoint: RTBorderAttachPoint new);
				source: tmp3 edges connectFrom: #from to: #to.
			(RTLayoutBuilder new forceWithCharge: -450) on: arg2 elements.
			arg2 ]