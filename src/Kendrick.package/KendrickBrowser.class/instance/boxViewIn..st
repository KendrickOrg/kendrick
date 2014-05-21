as yet unclassified
boxViewIn: constructor

	"show the model like box and relation between its"

	constructor roassal
			title: 'Model like box';
			act: [:p | p update]
				icon: GLMUIThemeExtraIcons glamorousRefresh
				entitled: 'Update';
			painting: [:view :number |
				view interaction highlightNodesWhenOver: [ :node | Array with: node ].
				view shape rectangle; withCenteredText; size: 100.
				view nodes: (number compartments collect:[:each | each status asString]). 
				view treeLayout .]