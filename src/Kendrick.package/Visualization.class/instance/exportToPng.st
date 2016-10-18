public-api
exportToPng

	['./Library/Output/' asFileReference createDirectory] on: Error do: [  ].

	('./Library/Output/' , self id , '.png') asFileReference 
		exists ifTrue: [ ('./Library/Output/' , self id , '.png') asFileReference delete ].	

	(RTCanvasExporter canvas: self canvas)
		whole;
		defaultScale;
		oversizedBy: 20 @ 20;
		format: #png;
		fileName: ('./Library/Output/' , self id , '.png'); 
		ifNil: [ ^ nil ];
		export.
		
	^ self canvas