as yet unclassified
generateTensorSum: aTransitionList
	|result keys|
	result := OrderedCollection new.
	keys := self generateKeys: aTransitionList.
	(self transitions select: [ :t| t probability ~= 0 ]) do: [ :t| 
		result addAll: (self generateTransitionsFrom: t and: keys)	
	].
	keys := self generateKeys: (self transitions).
	(aTransitionList select: [ :t| t probability ~= 0 ]) do: [ :t|
		result addAll: (self generateTransitionsFrom: t and: keys)
	].
	^ result