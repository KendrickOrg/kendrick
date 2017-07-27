as yet unclassified
graphView: arg1
	| tmp2 |
	tmp2 := arg1 roassal2.
	tmp2
		title: 'Visualization';
		act: [ :arg2 | arg2 update ]
			icon: GLMUIThemeExtraIcons glamorousRefresh
			entitled: 'Update';
		painting: [ :arg3 :arg4 | 
			| tmp3 |
			arg4 class == KETimeSeries
				ifTrue: [ tmp3 := RTCharterBuilder new view: arg3.
					tmp3 extent: 400 @ 200.
					tmp3 shape rectangle size: 0.
					tmp3
						points: arg4 index;
						x: #yourself;
						y: [ :arg5 | arg4 at: arg5 ];
						connectDotColor: Color blue;
						axisXTitled: 'Time';
						axisYTitled: 'Number of individuals of ' , (donne keyAtValue: arg4);
						build.
					arg3 canvas camera translateBy: 0 @ -100.
					arg3 @ RTDraggableView ] ]