project(pyobjc-ExceptionHandling)

install_pyobjc_wrapper(ExceptionHandling)

install_pyobjc_sources("pyobjc_ExceptionHandling_tools_sources"
	DESTINATION libexec/darling/System/Library/Frameworks/Python.framework/Versions/2.7/Extras/lib/python/PyObjC/PyObjCTools
	SOURCES
		#Lib/PyObjCTools/__init__.py # pyobjc_core already installs an identical file in the same location
		Lib/PyObjCTools/Debugging.py
)
