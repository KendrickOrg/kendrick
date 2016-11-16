*Kendrick-InternalDSL-DSL
gtInspectorKendrickLibraryIn: composite
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