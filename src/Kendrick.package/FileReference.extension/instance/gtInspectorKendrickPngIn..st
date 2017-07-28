*Kendrick-InternalDSL-DSL
gtInspectorKendrickPngIn: composite
	<gtInspectorPresentationOrder: -10>
	<gtInspectorTag: #custom>
	<gtInspectorTag: #kendrick>
	
	composite morph
			title: 'Picture';
			display: [ self binaryReadStreamDo: [ :stream | PNGReadWriter formFromStream: stream ] ];
			when: [ self isFile and: [ self mimeTypes notNil and: [ self mimeTypes first matches: ZnMimeType imagePng ] ] ]