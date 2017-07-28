accessing
from: anArray
	^ super new
		data: anArray;
		index: ((1 to: anArray size) asArray)