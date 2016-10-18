*Kendrick-InternalDSL-DSL
gtInspectorKendrickScriptIn: composite
	<gtInspectorPresentationOrder: -10>
	<gtInspectorTag: #custom>
	<gtInspectorTag: #kendrick>
	
	composite pharoScript
			title: 'Code';
			display: [ self readStreamDo: [ :s | s contents ] ];
			act: [ :text |
					KendrickInternalDSLEntities cleanUpForInteractiveSessions.
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