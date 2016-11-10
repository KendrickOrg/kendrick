public-api
exportToPng

	|outDir filePath|

	outDir := './Sources/', KendrickInternalDSLEntities currentProjectDir , '/Output/'. 
	outDir asFileReference exists 
		ifFalse: [ outDir := './Sources/Projects/', KendrickInternalDSLEntities currentProjectDir , '/Output/'].
	filePath := (outDir , self id , '.png').

	"[outDir asFileReference createDirectory] on: Error do: [  ]."

	filePath asFileReference 
		exists ifTrue: [ filePath asFileReference delete ].	

	(RTCanvasExporter canvas: self canvas)
		whole;
		defaultScale;
		oversizedBy: 20 @ 20;
		format: #png;
		fileName: filePath; 
		ifNil: [ ^ nil ];
		export.
		
	^ self canvas