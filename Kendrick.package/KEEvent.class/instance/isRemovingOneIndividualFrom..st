testing
isRemovingOneIndividualFrom: aStatus
	actions keysAndValuesDo: [:key :value| ^(key symbol == aStatus)&(value == -1)].