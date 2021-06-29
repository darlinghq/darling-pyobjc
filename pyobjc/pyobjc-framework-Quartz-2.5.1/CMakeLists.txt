project(pyobjc-Quartz)

install_pyobjc_wrapper(Quartz
	NO_METADATA
)

install_pyobjc_wrapper(CoreVideo
	NO_EGG_INFO
	PREFIX "Quartz/"
	EXTRA_MODULE_NAME "_CVPixelBuffer"
)

install_pyobjc_wrapper(ImageIO
	NO_EGG_INFO
	PREFIX "Quartz/"
)

install_pyobjc_wrapper(ImageKit
	NO_EGG_INFO
	PREFIX "Quartz/"
)

install_pyobjc_wrapper(PDFKit
	NO_EGG_INFO
	PREFIX "Quartz/"
)

install_pyobjc_wrapper(QuartzComposer
	NO_EGG_INFO
	PREFIX "Quartz/"
)

install_pyobjc_wrapper(QuartzCore
	NO_EGG_INFO
	PREFIX "Quartz/"
)

install_pyobjc_wrapper(QuartzFilters
	NO_EGG_INFO
	PREFIX "Quartz/"
)

install_pyobjc_wrapper(QuickLookUI
	NO_EGG_INFO
	PREFIX "Quartz/"
)

#
# CoreGraphics needs a bit more than the others
#

install_pyobjc_wrapper(CoreGraphics
	NO_EGG_INFO
	PREFIX "Quartz/"
	EXTRA_SOURCES
		Lib/Quartz/CoreGraphics/_contextmanager.py
	EXTRA_MODULE_NAME "_coregraphics"
	EXTRA_MODULE_DEPENDS
		ApplicationServices
)

build_pybundle("pyobjc_CoreGraphics_inlines"
	OUTPUT_NAME "_inlines"
	PYTHON_VERSION "2.7"
	FAT
	DESTINATION "libexec/darling/System/Library/Frameworks/Python.framework/Versions/2.7/Extras/lib/python/PyObjC/Quartz/CoreGraphics"
	SOURCES
		"Modules/_CoreGraphics_inlines.m"
)

build_pybundle("pyobjc_CoreGraphics_callbacks"
	OUTPUT_NAME "_callbacks"
	PYTHON_VERSION "2.7"
	FAT
	DESTINATION "libexec/darling/System/Library/Frameworks/Python.framework/Versions/2.7/Extras/lib/python/PyObjC/Quartz/CoreGraphics"
	SOURCES
		"Modules/_callbacks.m"
)

build_pybundle("pyobjc_CoreGraphics_doubleindirect"
	OUTPUT_NAME "_doubleindirect"
	PYTHON_VERSION "2.7"
	FAT
	DESTINATION "libexec/darling/System/Library/Frameworks/Python.framework/Versions/2.7/Extras/lib/python/PyObjC/Quartz/CoreGraphics"
	SOURCES
		"Modules/_doubleindirect.m"
)

build_pybundle("pyobjc_CoreGraphics_sortandmap"
	OUTPUT_NAME "_sortandmap"
	PYTHON_VERSION "2.7"
	FAT
	DESTINATION "libexec/darling/System/Library/Frameworks/Python.framework/Versions/2.7/Extras/lib/python/PyObjC/Quartz/CoreGraphics"
	SOURCES
		"Modules/_sortandmap.m"
)
