public-api
extends: anotherEntityName
	"copy down semantics -- check how shallow is the default copy on this one"
	|previousId|
	previousId := id.
	self become: (self class withId: anotherEntityName) copy.
	self id: previousId.