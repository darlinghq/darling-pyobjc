project(pyobjc)

#
# NOTE: we depend on `build_pybundle` from python_modules; make sure this submodule is included after that one
#

add_compile_definitions(
	PyObjC_BUILD_RELEASE=1015
	#ENABLE_DTRACE # no DTrace for Darling
	OBJC_OLD_DISPATCH_PROTOTYPES=0
	_FORTIFY_SOURCE=0
	MACOSX
)

include_directories(
	pyobjc/pyobjc-core-2.5.1/Lib/pyobjc_core.egg-info/include
)

#
# Helper function to byte-compile and install a set of Python sources.
# Note that the sources (and their byte-compiled complements) will be copied to the destination flatly
# (that is to say, any structure/heirarchy present in the input will be ignored).
#
function(install_pyobjc_sources target_name)
	cmake_parse_arguments(PYOBJC "" "DESTINATION" "SOURCES" ${ARGN})
	install(FILES ${PYOBJC_SOURCES} DESTINATION "${PYOBJC_DESTINATION}")
	pyc("${target_name}" SOURCES ${PYOBJC_SOURCES} DESTINATION "${PYOBJC_DESTINATION}")
endfunction()

#
# Helper function to install an egg-info directory for a PyObjC framework wrapper.
#
function(install_pyobjc_framework_egg_info framework_name)
	install(
		DIRECTORY "Lib/pyobjc_framework_${framework_name}.egg-info/"
		DESTINATION "libexec/darling/System/Library/Frameworks/Python.framework/Versions/2.7/Extras/lib/python/PyObjC/pyobjc_framework_${framework_name}-2.5.1-py2.7.egg-info"
	)
endfunction()

#
# Helper function to simplify installation for PyObjC framework wrappers.
# Note that the wrapper must contain *at least* `__init__.py` in its Python sources (and `_metadata.py` as well, unless the NO_METADATA option is given).
#
# This helper will also automatically install the egg-info for the wrapper (unless the `NO_EGG_INFO` option is given).
#
function(install_pyobjc_wrapper framework_name)
	cmake_parse_arguments(PYOBJC_WRAPPER "NO_EGG_INFO;NO_METADATA" "EXTRA_MODULE_NAME;PREFIX" "EXTRA_SOURCES;EXTRA_MODULE_DEPENDS" ${ARGN})

	set(PYOBJC_WRAPPER_SOURCES "Lib/${PYOBJC_WRAPPER_PREFIX}${framework_name}/__init__.py")
	if (NOT PYOBJC_WRAPPER_NO_METADATA)
		list(APPEND PYOBJC_WRAPPER_SOURCES "Lib/${PYOBJC_WRAPPER_PREFIX}${framework_name}/_metadata.py")
	endif()
	list(APPEND PYOBJC_WRAPPER_SOURCES "${PYOBJC_WRAPPER_EXTRA_SOURCES}")

	install_pyobjc_sources("pyobjc_${framework_name}_sources"
		DESTINATION libexec/darling/System/Library/Frameworks/Python.framework/Versions/2.7/Extras/lib/python/PyObjC/${framework_name}
		SOURCES
			"${PYOBJC_WRAPPER_SOURCES}"
	)

	if (PYOBJC_WRAPPER_EXTRA_MODULE_NAME)
		build_pybundle("pyobjc_${framework_name}_extra_module"
			OUTPUT_NAME "${PYOBJC_WRAPPER_EXTRA_MODULE_NAME}"
			PYTHON_VERSION "2.7"
			FAT
			DESTINATION "libexec/darling/System/Library/Frameworks/Python.framework/Versions/2.7/Extras/lib/python/PyObjC/${PYOBJC_WRAPPER_PREFIX}${framework_name}"
			SOURCES
				"Modules/${PYOBJC_WRAPPER_EXTRA_MODULE_NAME}.m"
			DEPENDS
				"${PYOBJC_WRAPPER_EXTRA_MODULE_DEPENDS}"
		)
	endif()

	if (NOT PYOBJC_WRAPPER_NO_EGG_INFO)
		install_pyobjc_framework_egg_info("${framework_name}")
	endif()
endfunction()

add_subdirectory(pyobjc/pyobjc-core-2.5.1)
add_subdirectory(pyobjc/pyobjc-framework-Accounts-2.5.1)
add_subdirectory(pyobjc/pyobjc-framework-AddressBook-2.5.1)
add_subdirectory(pyobjc/pyobjc-framework-AppleScriptKit-2.5.1)
add_subdirectory(pyobjc/pyobjc-framework-AppleScriptObjC-2.5.1)
add_subdirectory(pyobjc/pyobjc-framework-Automator-2.5.1)
add_subdirectory(pyobjc/pyobjc-framework-CFNetwork-2.5.1)
add_subdirectory(pyobjc/pyobjc-framework-Cocoa-2.5.1)
add_subdirectory(pyobjc/pyobjc-framework-Collaboration-2.5.1)
add_subdirectory(pyobjc/pyobjc-framework-CoreData-2.5.1)
add_subdirectory(pyobjc/pyobjc-framework-CoreLocation-2.5.1)
add_subdirectory(pyobjc/pyobjc-framework-CoreText-2.5.1)
add_subdirectory(pyobjc/pyobjc-framework-DictionaryServices-2.5.1)
add_subdirectory(pyobjc/pyobjc-framework-EventKit-2.5.1)
add_subdirectory(pyobjc/pyobjc-framework-ExceptionHandling-2.5.1)
add_subdirectory(pyobjc/pyobjc-framework-FSEvents-2.5.1)
add_subdirectory(pyobjc/pyobjc-framework-InputMethodKit-2.5.1)
add_subdirectory(pyobjc/pyobjc-framework-InstallerPlugins-2.5.1)
add_subdirectory(pyobjc/pyobjc-framework-InstantMessage-2.5.1)
add_subdirectory(pyobjc/pyobjc-framework-LatentSemanticMapping-2.5.1)
add_subdirectory(pyobjc/pyobjc-framework-LaunchServices-2.5.1)
add_subdirectory(pyobjc/pyobjc-framework-Message-2.5.1)
add_subdirectory(pyobjc/pyobjc-framework-OpenDirectory-2.5.1)
add_subdirectory(pyobjc/pyobjc-framework-PreferencePanes-2.5.1)
add_subdirectory(pyobjc/pyobjc-framework-PubSub-2.5.1)
add_subdirectory(pyobjc/pyobjc-framework-QTKit-2.5.1)
add_subdirectory(pyobjc/pyobjc-framework-Quartz-2.5.1)
add_subdirectory(pyobjc/pyobjc-framework-ScreenSaver-2.5.1)
add_subdirectory(pyobjc/pyobjc-framework-ScriptingBridge-2.5.1)
add_subdirectory(pyobjc/pyobjc-framework-SearchKit-2.5.1)
add_subdirectory(pyobjc/pyobjc-framework-ServiceManagement-2.5.1)
add_subdirectory(pyobjc/pyobjc-framework-Social-2.5.1)
add_subdirectory(pyobjc/pyobjc-framework-SyncServices-2.5.1)
add_subdirectory(pyobjc/pyobjc-framework-SystemConfiguration-2.5.1)
add_subdirectory(pyobjc/pyobjc-framework-WebKit-2.5.1)

install(FILES gen/PyObjC.pth DESTINATION libexec/darling/System/Library/Frameworks/Python.framework/Versions/2.7/Extras/lib/python)
install(
	FILES
		gen/pyobjc_framework_Cocoa-2.5.1-py2.7-nspkg.pth
		gen/pyobjc_framework_ExceptionHandling-2.5.1-py2.7-nspkg.pth
	DESTINATION libexec/darling/System/Library/Frameworks/Python.framework/Versions/2.7/Extras/lib/python/PyObjC
)
