*Kendrick-InternalDSL-DSL
gtInspectorKendrickLibraryIn: arg1
	<gtInspectorPresentationOrder: -10>
	<gtInspectorTag: #custom>
	<gtInspectorTag: #kendrick>
	| tmp2 |
	tmp2 := arg1 table.
	tmp2
		title: 'Folder';
		display: [ | tmp3 |
			tmp3 := self directories
				, (self files select: [ :arg2 | arg2 basename asString first ~= $. ]).
			self isRoot
				ifTrue: [ tmp3 ]
				ifFalse: [ tmp3 asOrderedCollection yourself ] ];
		column: 'Entity'
			evaluated: [ :arg3 | 
			(self isChildOf: arg3)
				ifFalse: [ arg3 basename ] ]
			width: 400;
		icon: [ :arg4 | 
			arg4 isDirectory
				ifTrue: [ GLMUIThemeExtraIcons glamorousFolder ]
				ifFalse: [ GLMUIThemeExtraIcons glamorousBrowse ] ];
		when: [ self isDirectory ];
		selectionAct: [ :arg5 | 
			arg5 selection delete.
			arg5 update ]
			entitled: 'Delete';
		act: [ :arg6 | 
			| tmp4 |
			(tmp4 := UIManager default
				request: 'New Directory name?'
				initialAnswer: '')
				ifNotNil: [ (self / tmp4) ensureCreateDirectory ].
			arg6 update ]
			icon: GLMUIThemeExtraIcons glamorousFolder
			entitled: 'Create Directory';
		act: [ :arg7 | 
			| tmp5 |
			(tmp5 := UIManager default
				request: 'New File name?'
				initialAnswer: '')
				ifNotNil: [ (self / (tmp5 , '.kendrick')) ensureCreateFile ].
			arg7 update ]
			icon: GLMUIThemeExtraIcons glamorousBrowse
			entitled: 'Create File'.
	^ tmp2
		act: [ :arg8 | arg8 update ]
		icon: GLMUIThemeExtraIcons glamorousRefresh
		entitled: 'Refresh'