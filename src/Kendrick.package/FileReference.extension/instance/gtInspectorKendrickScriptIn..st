*Kendrick-InternalDSL-DSL
gtInspectorKendrickScriptIn: arg1
	<gtInspectorPresentationOrder: -10>
	<gtInspectorTag: #custom>
	<gtInspectorTag: #kendrick>
	| tmp2 |
	tmp2 := arg1 pharoScript.
	tmp2
		title: 'Code';
		display: [ self readStreamDo: [ :arg2 | arg2 contents ] ];
		act: [ :arg3 | 
				KendrickInternalDSLEntities
					cleanUpForInteractiveSessions;
					currentProjectDir: self projectNameForKendrick.
				arg3
					selectionInterval: (1 to: arg3 text size);
					highlightEvaluateAndDo: [ :arg4 | arg3 selection: arg4 ] ]
			icon: GLMUIThemeExtraIcons glamorousGo
			on: $G
			entitled: 'Do it all and go';
		installDefaultSelectionActions;
		act: [ :arg5 | 
				| tmp4 |
				tmp4 := self.
				tmp4
					ensureDelete;
					writeStreamDo: [ :arg6 | arg6 nextPutAll: arg5 text asString ] ]
			icon: GLMUIThemeExtraIcons glamorousSave
			on: $s
			entitled: 'Save';
		when: [ self isFile and: [ self extension = 'kendrick' ] ]