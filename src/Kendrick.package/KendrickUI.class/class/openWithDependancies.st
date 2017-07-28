as yet unclassified
openWithDependancies

((SmalltalkImage current lastImagePath) asFileReference parent / 'Sources') exists ifFalse:[

	ZnClient new url: 'https://gitlab.com/ird-ummisco-npapoylias/kendrick-extentions/raw/master/example.zip'; downloadTo: 'example.zip'.

UIManager default informUserDuring: 
		[ :bar | 
	(ZipArchive new
			readFrom: 'example.zip' asFileReference)
			extractAllTo: (SmalltalkImage current lastImagePath) asFileReference parent
			informing: bar 
			overwrite: true].

'example.zip' asFileReference delete.
].
	^ self open