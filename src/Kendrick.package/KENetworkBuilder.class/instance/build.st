as yet unclassified
build
	| tmp1 tmp2 tmp3 tmp4 tmp5 |
	tmp1 := RTMondrian new.
	colors isEmpty
		ifTrue: [ colors add: #red ].
	isAtIndividualLevel
		ifTrue: [ | tmp8 |
			tmp8 := tmp1 shape circle.
			tmp8
				size: 5;
				if: [ :arg1 | (vizData at: arg1) isEmpty ]
					color: (Color veryLightGray alpha: 0.1);
				if: [ :arg2 | (vizData at: arg2) isEmpty not ]
					color: [ :arg3 | 
					Color
						perform: (colors at: (status indexOf: (vizData at: arg3) first key)) ] ]
		ifFalse: [ tmp1 shape circle color: ((Color perform: colors first) alpha: 0.4) ].
	tmp1 nodes: network allContacts.
	tmp1 edges notUseInLayout
		connectToAll: [ :arg4 | (network atNode: arg4) adjacentNodes ].
	isAtIndividualLevel
		ifFalse: [ tmp3 := vizData copy.
			tmp3
				keysDo: [ :arg5 | 
					(tmp3 at: arg5) isEmpty
						ifTrue: [ tmp3 at: arg5 put: {(status first -> 0)} ] ].
			tmp1 normalizer
				normalizeSize: [ :arg6 | (tmp3 at: arg6) first value ]
				min: (tmp3 values collect: [ :arg7 | arg7 first value ]) min
				max: (tmp3 values collect: [ :arg8 | arg8 first value ]) max ].
	tmp1 layout cluster.
	tmp1 build.
	tmp2 := RTLegendBuilder new.
	tmp2 view: tmp1 view.
	isAtIndividualLevel
		ifTrue: [ tmp4 := 'circle = an individual; '.
			tmp5 := status size.
			1 to: tmp5 do: [ :tmp6 | 
				tmp4 := tmp4 , (colors at: tmp6) asString , ' circle = '
					, (status at: tmp6) asString , ';' ].
			tmp4 := tmp4 , 'gray circle = others'.
			tmp2 addText: tmp4 ]
		ifFalse: [ tmp2
				addText:
					'Circle=node,size=number of ' , status first asString
						, ';gray links=contacts' ].
	networkLegend ifNotNil: [ tmp2 addText: networkLegend ].
	tmp2 build.
	^ tmp1