project(pyobjc-OpenDirectory)

install_pyobjc_wrapper(OpenDirectory)

# can't use EXTRA_SOURCES because it needs to be installed to a different directory
install_pyobjc_sources(pyobjc_CFOpenDirectory_sources
	DESTINATION libexec/darling/System/Library/Frameworks/Python.framework/Versions/2.7/Extras/lib/python/PyObjC/CFOpenDirectory
	SOURCES
		"Lib/CFOpenDirectory/__init__.py"
		"Lib/CFOpenDirectory/_metadata.py"
)
