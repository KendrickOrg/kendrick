initialize opencl
createContext
	platform :=OpenCL firstPlatform.
	device := platform firstGPUDevice.
	context := OpenCL createContextForPlatform: platform device: device.
