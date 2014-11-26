as yet unclassified
at: aClassName
	|key|
	key := aClassName.
	key = #all ifTrue: [ ^ data associations ].
	aClassName isString ifTrue: [ key := STON fromString: aClassName ].
	key isArray ifTrue: [ 
		|rs|
		rs := OrderedCollection new.
		key do: [ :k| |tmp|
			tmp := self dataAt: k.
			tmp isCollection ifTrue: [ rs addAll: tmp ] ifFalse: [ rs add: tmp ]
			 ].
		^ rs asArray
		 ].
	^ self dataAt: key
	