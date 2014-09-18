accessing
mapStatusWith: anEvent
	"This function will map fromStatus and toStatus to ones of anEvent"
	(fromStatus = #empty) & (anEvent fromStatus ~= #empty) ifTrue: [ fromStatus := anEvent fromStatus ].
	(toStatus = #empty) & (anEvent toStatus ~= #empty) ifTrue: [ toStatus := anEvent toStatus ]