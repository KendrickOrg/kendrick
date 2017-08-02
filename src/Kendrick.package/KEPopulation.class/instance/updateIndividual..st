adding
updateIndividual: ind
	ind updateAttributes: ind nextStatus.
	ind currentStatus: ind nextStatus.
	ind nextStatus: nil