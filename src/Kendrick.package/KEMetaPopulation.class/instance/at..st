accessing
at: anID
	|index|
	anID = 0 ifTrue: [ ^ self ].
	anID isNumber ifTrue: [ ^ subPopulations at: anID ].
	anID isArray ifTrue: [ |temp|
		temp := self.
		anID do: [ :each| temp := temp at: each ].
		^ temp
		 ].
	"anID is a name in subPopulationsNames"
	index := (subPopulationNames indexOf: anID).
	index = 0 ifTrue: [ ^ nil ].
	^ subPopulations at: index.