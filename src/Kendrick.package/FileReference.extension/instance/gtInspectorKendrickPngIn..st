*Kendrick-InternalDSL-DSL
gtInspectorKendrickPngIn: arg1
	<gtInspectorPresentationOrder: -10>
	<gtInspectorTag: #custom>
	<gtInspectorTag: #kendrick>
	| tmp2 |
	tmp2 := arg1 morph.
	tmp2
		title: 'Picture';
		display: [ self
				binaryReadStreamDo: [ :arg2 | PNGReadWriter formFromStream: arg2 ] ];
		when: [ self isFile
				and: [ self mimeTypes notNil
						and: [ self mimeTypes first matches: ZnMimeType imagePng ] ] ]