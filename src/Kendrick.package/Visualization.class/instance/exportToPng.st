public-api
exportToPng

	['./Output/' asFileReference createDirectory] on: Error do: [  ].

	('./Output/' , self id , '.png') asFileReference 
		exists ifTrue: [ ('./Output/' , self id , '.png') asFileReference delete ].	

	(RTCanvasExporter canvas: self canvas)
		whole;
		defaultScale;
		oversizedBy: 20 @ 20;
		format: #png;
		fileName: ('./Output/' , self id , '.png'); 
		ifNil: [ ^ nil ];
		export.
		
	^ self canvas