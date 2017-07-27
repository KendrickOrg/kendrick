as yet unclassified
openWithDependancies
	(SmalltalkImage current lastImagePath asFileReference parent
		/ 'Sources') exists
		ifFalse: [ | tmp2 |
			tmp2 := ZnClient new.
			tmp2
				url: 'https://gitlab.com/ird-ummisco-npapoylias/kendrick-extentions/raw/master/example.zip';
				downloadTo: 'example.zip'.
			UIManager default
				informUserDuring: [ :arg1 | 
					(ZipArchive new readFrom: 'example.zip' asFileReference)
						extractAllTo: SmalltalkImage current lastImagePath asFileReference parent
						informing: arg1
						overwrite: true ].
			'example.zip' asFileReference delete ].
	^ self open