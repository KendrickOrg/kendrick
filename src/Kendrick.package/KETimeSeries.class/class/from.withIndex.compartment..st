instance creation
from: anArray withIndex: anArrayOfTimeIndex compartment: aCompartmentName
	^ super new
		data: anArray;
		index: anArrayOfTimeIndex;
		compartment: aCompartmentName  