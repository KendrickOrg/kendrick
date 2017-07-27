as yet unclassified
boxViewIn: arg1
	| tmp2 |
	tmp2 := arg1 roassal2.
	tmp2
		title: 'Model like box';
		act: [ :arg2 | arg2 update ]
			icon: GLMUIThemeExtraIcons glamorousRefresh
			entitled: 'Update';
		painting: [ :arg3 :arg4 | 
			| tmp4 tmp5 tmp6 tmp7 tmp8 tmp9 tmp10 tmp15 tmp17 |
			tmp9 := 0.
			tmp10 := 0.
			tmp5 := OrderedCollection new.
			tmp4 := OrderedCollection new.
			tmp8 := OrderedCollection new.
			arg4 population compartments
				collect: [ :arg5 | tmp4 add: arg5 asString ].
			tmp7 := KEEventGenerator new generateEvents: arg4.
			tmp7
				do: [ :arg6 | 
					| tmp11 |
					(arg6 fromStatus asString = 'empty'
						and: [ arg6 toStatus isNotEmpty ])
						ifTrue: [ tmp11 := 'Naissance' , tmp10 asString.
							tmp8 add: tmp11.
							tmp5 add: tmp11 -> arg6 toStatus asString.
							tmp10 := tmp10 + 1 ].
					(arg6 fromStatus isNotEmpty
						and: [ arg6 toStatus asString = 'empty' ])
						ifTrue: [ tmp11 := 'Deces' , tmp9 asString.
							tmp8 add: tmp11.
							tmp5 add: arg6 fromStatus asString -> tmp11.
							tmp9 := tmp9 + 1 ].
					(arg6 fromStatus isNotEmpty and: [ arg6 toStatus isNotEmpty ])
						ifTrue: [ tmp5 add: arg6 fromStatus asString -> arg6 toStatus asString ] ].
			tmp4
				do: [ :arg7 | 
					| tmp12 |
					tmp12 := arg3 elementFromModel: arg7.
					tmp12
						ifNil: [ tmp12 := (RTBox new size: 80) + RTLabel elementOn: arg7.
							tmp12 @ RTDraggable ].
					arg3 add: tmp12 ].
			tmp8
				do: [ :arg8 | 
					| tmp13 |
					tmp13 := arg3 elementFromModel: arg8.
					tmp13
						ifNil: [ tmp13 := RTBox new elementOn: arg8.
							tmp13 @ RTDraggable ].
					arg3 add: tmp13 ].
			tmp15 := RTArrowedLine new.
			tmp15 color: Color red.
			tmp6 := tmp15 attachPoint: RTHorizontalAttachPoint instance.
			RTEdge
				buildEdgesFromObjects: tmp5
				from: #key
				to: #value
				using: tmp6
				inView: arg3.
			tmp17 := RTHorizontalTreeLayout.
			tmp17
				new;
				on: arg3 elements.
			arg3 @ RTDraggableView ]