project(pyobjc-WebKit)

install_pyobjc_wrapper(WebKit
	EXTRA_MODULE_NAME "_WebKit"
	EXTRA_MODULE_DEPENDS
		WebKit
)

install_pyobjc_wrapper(JavaScriptCore
	NO_EGG_INFO
)
