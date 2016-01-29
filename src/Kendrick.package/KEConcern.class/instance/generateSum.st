as yet unclassified
generateSum
	"should not call if dependencyConcern is nil"
	dependencyConcern ifNil: [ ^ self error: 'The concern has no dependency concern' ].
	