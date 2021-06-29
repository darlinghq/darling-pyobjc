project(pyobjc-CFNetwork)

install_pyobjc_wrapper(CFNetwork
	EXTRA_MODULE_NAME "_manual"
	EXTRA_MODULE_DEPENDS
		CoreServices
)
