Extension { #name : #FileReference }

{ #category : #'*Kendrick-Core' }
FileReference >> gtInspectorKendrickLibraryIn: composite [
	<gtInspectorPresentationOrder: -10>
	<gtInspectorTag: #custom>
	<gtInspectorTag: #kendrick>
	
	
	
	^ composite table 
		title: 'Folder';
		display: [ 
			| children |
			children := self directories, (self files select: [:file | file basename asString first ~= $.]). "no hidden files"
			self isRoot 
				ifTrue: [ children ]
				ifFalse: [ 
					children asOrderedCollection
						"addFirst: self parent;" "should not navigate like this !" 
						yourself ] ];
		column: 'Entity' evaluated: [:each | (self isChildOf: each) 
								"ifTrue: [ '..' ]" "should not navigate like this !" 
								ifFalse: [ each basename ]] width: 400;
		"column: 'Size' evaluated: [:each | each humanReadableSize] width: 100;
		column: 'Creation' evaluated: [ :each | 
			String streamContents: [:s | 
				each creationTime printYMDOn: s.
				s nextPut: Character space.
				each creationTime printHMSOn: s ]];"
		icon: [ :each | 
			each isDirectory 
				ifTrue: [ GLMUIThemeExtraIcons glamorousFolder ] 
				ifFalse: [ GLMUIThemeExtraIcons glamorousBrowse ] ];
		when: [self isDirectory "and: [self hasChildren]"];
		selectionAct: [:table | table selection delete. table update] entitled: 'Delete';
		act: [ :table |
			 (UIManager default request: 'New Directory name?' initialAnswer: '') 
					ifNotNil: [:name | (self / name) ensureCreateDirectory ].
			 table update
			 ] icon: GLMUIThemeExtraIcons glamorousFolder entitled: 'Create Directory';		
		act: [ :table |
			 (UIManager default request: 'New File name?' initialAnswer: '') 
					ifNotNil: [:name | (self / (name , '.kendrick')) ensureCreateFile ].
			 table update
			 ] icon: GLMUIThemeExtraIcons glamorousBrowse entitled: 'Create File';		
		act: [ :table | table update ] icon: GLMUIThemeExtraIcons glamorousRefresh entitled: 'Refresh'.";
		selection: (children isEmpty ifFalse: [ children first ] ifTrue: [ nil]);
		update."
]

{ #category : #'*Kendrick-Core' }
FileReference >> gtInspectorKendrickPngIn: composite [
	<gtInspectorPresentationOrder: -10>
	<gtInspectorTag: #custom>
	<gtInspectorTag: #kendrick>
	
	composite morph
			title: 'Picture';
			display: [ self binaryReadStreamDo: [ :stream | PNGReadWriter formFromStream: stream ] ];
			when: [ self isFile and: [ self mimeTypes notNil and: [ self mimeTypes first matches: ZnMimeType imagePng ] ] ]
]

{ #category : #'*Kendrick-Core' }
FileReference >> gtInspectorKendrickScriptIn: composite [
	<gtInspectorPresentationOrder: -10>
	<gtInspectorTag: #custom>
	<gtInspectorTag: #kendrick>
	
	composite pharoScript
			title: 'Code';
			display: [ self readStreamDo: [ :s | s contents ] ];
			act: [ :text |

					KendrickInternalDSLEntities cleanUpForInteractiveSessions.
					KendrickInternalDSLEntities currentProjectDir: self projectNameForKendrick.
					text selectionInterval: (1 to: text text size).
					text highlightEvaluateAndDo: [ :result | text selection: result ] ]
				icon: GLMUIThemeExtraIcons glamorousGo
				on: $G
				entitled: 'Do it all and go';
			installDefaultSelectionActions;
			act: [ :text |
				self ensureDelete; writeStreamDo: [ :s | s nextPutAll: text text asString ] ]
				icon: GLMUIThemeExtraIcons glamorousSave
				on: $s
				entitled: 'Save';
			when: [ self isFile and: [ self extension = 'kendrick'] ]
]

{ #category : #'*Kendrick-Core' }
FileReference >> kendrickDescription [

	"not in Projects"
	^ self basename asString
	
]

{ #category : #'*Kendrick-Core' }
FileReference >> projectNameForKendrick [

	"not in Projects"
	({'Library' . 'Scripts'} includes: self parent basename) ifTrue: [ ^ self parent basename ].
		
	^ self parent basename = 'Projects'
		ifTrue: [ self basename ]
		ifFalse: [   
			self parent projectNameForKendrick 
		] 
	
]
