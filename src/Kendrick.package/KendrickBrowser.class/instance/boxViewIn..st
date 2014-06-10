as yet unclassified
boxViewIn: constructor

	"show the model like box and relation between its"
	constructor roassal
			title: 'Model like box';
			act: [:p | p update]
				icon: GLMUIThemeExtraIcons glamorousRefresh
				entitled: 'Update';
			painting: [:view :models |
				|transit demographie |
				demographie := OrderedCollection new.
				demographie add: 'Deces';
								add: 'Naissance'.

				view shape rectangle; withCenteredText; size: 80.
				view nodes: ((models compartments collect:[:each | each status asString]), (demographie  collect:[:a | a asString])).
				models generateEvents do: [:event | 
					transit := KETransition new. 
					event actions keysAndValuesDo: [:key :value|  
						value < 0 ifTrue: [ transit fromStatus: key];
						 		     ifFalse: [transit toStatus: key].
					].
					view shape arrowedLineWithOffset: 0.5; width: 4.
					(((transit fromStatus) isNil) and:[(transit toStatus) isNotNil]) ifTrue:[view edgeFromAssociation: 'Naissance' -> (transit toStatus asString).].
					(((transit fromStatus) isNotNil) and:[(transit toStatus) isNil]) ifTrue:[ view edgeFromAssociation: (transit fromStatus asString)-> 'Deces'.].
				
					view edgeFromAssociation: (transit fromStatus asString) -> (transit toStatus asString).
				].
				view horizontalTreeLayout.]