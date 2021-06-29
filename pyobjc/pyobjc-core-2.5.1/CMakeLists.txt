project(pyobjc-core)

add_compile_definitions(
	PyObjC_STRICT_DEBUGGING
)

build_pybundle(pyobjc_core
	OUTPUT_NAME "_objc"
	PYTHON_VERSION "2.7"
	FAT
	DESTINATION "libexec/darling/System/Library/Frameworks/Python.framework/Versions/2.7/Extras/lib/python/PyObjC/objc"
	SOURCES
		Modules/objc/alloc_hack.m
		Modules/objc/block_support.m
		Modules/objc/bundle-variables.m
		Modules/objc/class-builder.m
		Modules/objc/class-list.m
		Modules/objc/closure_pool.m
		Modules/objc/coder-category.m
		Modules/objc/corefoundation.m
		Modules/objc/formal-protocol.m
		Modules/objc/fsref.m
		Modules/objc/fsspec.m
		Modules/objc/function.m
		Modules/objc/informal-protocol.m
		Modules/objc/instance-var.m
		Modules/objc/ivar-accessor.m
		Modules/objc/libffi_support.m
		Modules/objc/method-accessor.m
		Modules/objc/method-imp.m
		Modules/objc/method-signature.m
		Modules/objc/module.m
		Modules/objc/objc_super.m
		Modules/objc/objc_support.m
		Modules/objc/objc_util.m
		Modules/objc/objc-class.m
		Modules/objc/objc-NULL.m
		Modules/objc/objc-object.m
		Modules/objc/objc-runtime-compat.m
		Modules/objc/ObjCPointer.m
		Modules/objc/OC_NSBundleHack.m
		Modules/objc/OC_PythonArray.m
		Modules/objc/OC_PythonData.m
		Modules/objc/OC_PythonDate.m
		Modules/objc/OC_PythonDictionary.m
		Modules/objc/OC_PythonEnumerator.m
		Modules/objc/OC_PythonNumber.m
		Modules/objc/OC_PythonObject.m
		Modules/objc/OC_PythonSet.m
		Modules/objc/OC_PythonString.m
		Modules/objc/OC_PythonUnicode.m
		Modules/objc/opaque-pointer.m
		Modules/objc/pointer-support.m
		Modules/objc/proxy-registry.m
		Modules/objc/pyobjc-api.m
		Modules/objc/pyobjc-compat.m
		Modules/objc/registry.m
		Modules/objc/selector.m
		Modules/objc/socketsupport.m
		Modules/objc/struct-wrapper.m
		Modules/objc/super-call.m
		Modules/objc/toll-free-bridging.m
		Modules/objc/unicode-object.m
		Modules/objc/varlist.m
	DEPENDS
		CoreFoundation
		Foundation
		Carbon
		ffi
		objc
)

install_pyobjc_sources(pyobjc_core_sources
	DESTINATION libexec/darling/System/Library/Frameworks/Python.framework/Versions/2.7/Extras/lib/python/PyObjC/objc
	SOURCES
		Lib/objc/__init__.py
		Lib/objc/_bridges.py
		Lib/objc/_bridgesupport.py
		Lib/objc/_category.py
		Lib/objc/_compat.py
		Lib/objc/_context.py
		Lib/objc/_convenience.py
		Lib/objc/_descriptors.py
		Lib/objc/_dyld.py
		Lib/objc/_framework.py
		Lib/objc/_gnustep.py
		Lib/objc/_lazyimport.py
		Lib/objc/_locking.py
		Lib/objc/_properties.py
		Lib/objc/_protocols.py
		Lib/objc/_pycoder.py
		Lib/objc/_pythonify.py
		Lib/objc/_setup.py
)

install_pyobjc_sources(pyobjc_core_tools_sources
	DESTINATION libexec/darling/System/Library/Frameworks/Python.framework/Versions/2.7/Extras/lib/python/PyObjC/PyObjCTools
	SOURCES
		Lib/PyObjCTools/__init__.py
		Lib/PyObjCTools/KeyValueCoding.py
		Lib/PyObjCTools/MachSignals.py
		Lib/PyObjCTools/Signals.py
		Lib/PyObjCTools/TestSupport.py
)

install(DIRECTORY Lib/pyobjc_core.egg-info/ DESTINATION libexec/darling/System/Library/Frameworks/Python.framework/Versions/2.7/Extras/lib/python/PyObjC/pyobjc_core-2.5.1-py2.7.egg-info)
