project(pyobjc-CoreText)

install_pyobjc_wrapper(CoreText
	EXTRA_MODULE_NAME "_manual"
	EXTRA_MODULE_DEPENDS
		CoreServices
)
