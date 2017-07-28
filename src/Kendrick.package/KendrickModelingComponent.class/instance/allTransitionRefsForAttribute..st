public-api
allTransitionRefsForAttribute: attribute
	
	^ (attributes at: attribute) collect: [:comp | '{#' , attribute asString , ': #' , comp , '}']