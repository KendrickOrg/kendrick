as yet unclassified
addAdapter: anAdapter
	adapters ifNil: [ adapters := OrderedCollection new ].
	anAdapter atArgument: #simulator put: self simulator. 
	adapters add: anAdapter
	