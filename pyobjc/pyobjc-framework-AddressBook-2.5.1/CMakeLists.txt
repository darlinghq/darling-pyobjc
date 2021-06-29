project(pyobjc-AddressBook)

install_pyobjc_wrapper(AddressBook
	EXTRA_MODULE_NAME "_AddressBook"
	EXTRA_MODULE_DEPENDS
		AddressBook
)
