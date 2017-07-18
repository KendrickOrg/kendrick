protected
attributeValuesIncludes: variable

	^ (attributes values select: [ :values | values includes: variable ]) isEmpty not