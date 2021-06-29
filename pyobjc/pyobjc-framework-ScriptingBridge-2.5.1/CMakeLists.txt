project(pyobjc-ScriptingBridge)

install_pyobjc_wrapper(ScriptingBridge
	EXTRA_MODULE_NAME "_ScriptingBridge"
	EXTRA_MODULE_DEPENDS
		ScriptingBridge
)
