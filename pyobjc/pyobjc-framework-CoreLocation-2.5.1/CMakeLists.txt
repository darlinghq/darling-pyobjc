project(pyobjc-CoreLocation)

install_pyobjc_wrapper(CoreLocation
	EXTRA_MODULE_NAME "_CoreLocation"
	EXTRA_MODULE_DEPENDS
		CoreLocation
)
