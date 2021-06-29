project(pyobjc-ScreenSaver)

install_pyobjc_wrapper(ScreenSaver)

# can't use EXTRA_MODULE_NAME because it has a different source name
build_pybundle(pyobjc_ScreenSaver_inlines
	OUTPUT_NAME "_inlines"
	PYTHON_VERSION "2.7"
	FAT
	DESTINATION "libexec/darling/System/Library/Frameworks/Python.framework/Versions/2.7/Extras/lib/python/PyObjC/ScreenSaver"
	SOURCES
		"Modules/_ScreenSaver_inlines.m"
	DEPENDS
		ScreenSaver
)
