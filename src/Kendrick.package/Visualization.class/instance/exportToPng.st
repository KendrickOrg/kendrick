public-api
exportToPng
	| tmp1 tmp2 tmp4 |
	tmp1 := './Sources/' , KendrickInternalDSLEntities currentProjectDir
		, '/Output/'.
	tmp1 asFileReference exists
		ifFalse: [ tmp1 := './Sources/Projects/'
				, KendrickInternalDSLEntities currentProjectDir , '/Output/' ].
	tmp2 := tmp1 , self id , '.png'.
	tmp2 asFileReference exists
		ifTrue: [ tmp2 asFileReference delete ].
	tmp4 := RTCanvasExporter canvas: self canvas.
	tmp4
		whole;
		defaultScale;
		oversizedBy: 20 @ 20;
		format: #png;
		fileName: tmp2;
		ifNil: [ ^ nil ];
		export.
	^ self canvas