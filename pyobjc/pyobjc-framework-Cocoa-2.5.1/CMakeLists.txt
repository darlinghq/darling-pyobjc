project(pyobjc-Cocoa)

install_pyobjc_framework_egg_info(Cocoa)

#
# Cocoa
#

install_pyobjc_sources(pyobjc_cocoa_sources
	DESTINATION libexec/darling/System/Library/Frameworks/Python.framework/Versions/2.7/Extras/lib/python/PyObjC/Cocoa
	SOURCES
		Lib/Cocoa/__init__.py
)

#
# PyObjCTools
#

install_pyobjc_sources(pyobjc_cocoa_tools_sources
	DESTINATION libexec/darling/System/Library/Frameworks/Python.framework/Versions/2.7/Extras/lib/python/PyObjC/PyObjCTools
	SOURCES
		#Lib/PyObjCTools/__init__.py # pyobjc_core already installs an identical file in the same location
		Lib/PyObjCTools/AppCategories.py
		Lib/PyObjCTools/AppHelper.py
		Lib/PyObjCTools/Conversion.py
		Lib/PyObjCTools/FndCategories.py
		Lib/PyObjCTools/NibClassBuilder.py
)

#
# CoreFoundation
#

build_pybundle(pyobjc_cf_inlines
	OUTPUT_NAME "_inlines"
	PYTHON_VERSION "2.7"
	FAT
	DESTINATION "libexec/darling/System/Library/Frameworks/Python.framework/Versions/2.7/Extras/lib/python/PyObjC/CoreFoundation"
	SOURCES
		Modules/_CoreFoundation_inlines.m
	DEPENDS
		CoreFoundation
)

build_pybundle(pyobjc_cf
	OUTPUT_NAME "_CoreFoundation"
	PYTHON_VERSION "2.7"
	FAT
	DESTINATION "libexec/darling/System/Library/Frameworks/Python.framework/Versions/2.7/Extras/lib/python/PyObjC/CoreFoundation"
	SOURCES
		Modules/_CoreFoundation.m
	DEPENDS
		CoreFoundation
)

install_pyobjc_sources(pyobjc_cf_sources
	DESTINATION libexec/darling/System/Library/Frameworks/Python.framework/Versions/2.7/Extras/lib/python/PyObjC/CoreFoundation
	SOURCES
		Lib/CoreFoundation/__init__.py
		Lib/CoreFoundation/_metadata.py
		Lib/CoreFoundation/_static.py
)

#
# Foundation
#

build_pybundle(pyobjc_foundation_inlines
	OUTPUT_NAME "_inlines"
	PYTHON_VERSION "2.7"
	FAT
	DESTINATION "libexec/darling/System/Library/Frameworks/Python.framework/Versions/2.7/Extras/lib/python/PyObjC/Foundation"
	SOURCES
		Modules/_Foundation_inlines.m
	DEPENDS
		Foundation
)

build_pybundle(pyobjc_foundation
	OUTPUT_NAME "_Foundation"
	PYTHON_VERSION "2.7"
	FAT
	DESTINATION "libexec/darling/System/Library/Frameworks/Python.framework/Versions/2.7/Extras/lib/python/PyObjC/Foundation"
	SOURCES
		Modules/_Foundation.m
	DEPENDS
		Foundation
)

install_pyobjc_sources(pyobjc_foundation_sources
	DESTINATION libexec/darling/System/Library/Frameworks/Python.framework/Versions/2.7/Extras/lib/python/PyObjC/Foundation
	SOURCES
		Lib/Foundation/__init__.py
		Lib/Foundation/_context.py
		Lib/Foundation/_functiondefines.py
		Lib/Foundation/_metadata.py
		Lib/Foundation/_nsindexset.py
		Lib/Foundation/_nsobject.py
)

#
# AppKit
#

build_pybundle(pyobjc_appkit_inlines
	OUTPUT_NAME "_inlines"
	PYTHON_VERSION "2.7"
	FAT
	DESTINATION "libexec/darling/System/Library/Frameworks/Python.framework/Versions/2.7/Extras/lib/python/PyObjC/AppKit"
	SOURCES
		Modules/_AppKit_inlines.m
	DEPENDS
		AppKit
)

build_pybundle(pyobjc_appkit
	OUTPUT_NAME "_AppKit"
	PYTHON_VERSION "2.7"
	FAT
	DESTINATION "libexec/darling/System/Library/Frameworks/Python.framework/Versions/2.7/Extras/lib/python/PyObjC/AppKit"
	SOURCES
		Modules/_AppKit.m
	DEPENDS
		AppKit
)

install_pyobjc_sources(pyobjc_appkit_sources
	DESTINATION libexec/darling/System/Library/Frameworks/Python.framework/Versions/2.7/Extras/lib/python/PyObjC/AppKit
	SOURCES
		Lib/AppKit/__init__.py
		Lib/AppKit/_metadata.py
		Lib/AppKit/_nsapp.py
)
