as yet unclassified
boxViewIn: constructor

	"show the model like box and relation between its"
	constructor roassal
			title: 'Model like box';
			act: [:p | p update]
				icon: GLMUIThemeExtraIcons glamorousRefresh
				entitled: 'Update';
			painting: [:view :models |
				|transit|
				view interaction highlightNodesWhenOver: [ :node | Array with: node ].
				view shape rectangle; withCenteredText; size: 100.
				view nodes: (models compartments collect:[:each | each status asString]).
				
				models generateEvents do: [:event | 
					transit := KETransition new. 
					event actions keysAndValuesDo: [:key :value|  
						value < 0 ifTrue: [ transit fromStatus: key];
						 		     ifFalse: [transit toStatus: key].
					].
					view shape arrowedLineWithOffset: 0.5; width: 4.
					view edgeFromAssociation: (transit fromStatus asString) -> (transit toStatus asString).
				].
				view horizontalTreeLayout .]