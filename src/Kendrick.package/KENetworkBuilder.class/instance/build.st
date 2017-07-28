as yet unclassified
build
	|b lb|
	b := RTMondrian new.
	colors isEmpty ifTrue: [ colors add: #red ].
	isAtIndividualLevel 	
	ifTrue: [ 
		b shape circle size: 5; 
				  if: [ :n | (vizData at: n) isEmpty ] color: (Color veryLightGray alpha: 0.1);
				  if: [ :n | (vizData at: n) isEmpty not ] color: [:n| (Color perform: (colors at: (status indexOf: ((vizData at: n) first key))))].
		]
	ifFalse: [ b shape circle color: ((Color perform: colors first) alpha: 0.4) ].
	b nodes: network allContacts.
	b edges notUseInLayout connectToAll: [ :n| (network atNode: n) adjacentNodes ]. 
	
	isAtIndividualLevel ifFalse: [ 
		|nodeData|
		nodeData := vizData copy.
		nodeData keysDo: [ :k|( nodeData at: k) isEmpty ifTrue: [ (nodeData at: k put: {status first -> 0}) ] ].
		b normalizer 
			normalizeSize: [ :n| (nodeData at: n) first value ] 
			min: (nodeData values collect: [:e| e first value]) min 
			max: (nodeData values collect: [:e| e first value]) max.
		].
	
	b layout cluster.
	b build.

	lb := RTLegendBuilder new.
	lb view: b view.
	isAtIndividualLevel 
	ifTrue: [ 
		|str|
		str := 'circle = an individual; '.
		1 to: status size do: [ :i| str := str, (colors at: i) asString, ' circle = ', (status at: i) asString, ';' ].
		str := str, 'gray circle = others'.
		lb addText: str ]
	ifFalse: [ lb addText: 'Circle=node,size=number of ', status first asString,';gray links=contacts' ].
	networkLegend ifNotNil: [ lb addText: networkLegend  ].
	lb build.
	
	^ b