as yet unclassified
selectTransitionIn: list have: status

|transitions|

transitions := Bag new.
list do:[:each|
	(each fromStatus = status) ifTrue: [transitions add: each]
	].
^transitions