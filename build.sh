EXTRAS="$(python -c "import sys, os;print(os.path.join(sys.prefix, 'Extras'))")"
EXTRASLIBPYTHON=${EXTRAS}/lib/python
EXTRASPYOBJC=${EXTRASLIBPYTHON}/PyObjC
DSTROOT="$(pwd)/dist"
SRCROOT="$(pwd)"
RC_CFLAGS=

pushd 'pyobjc'
for pkg in pyobjc-core* pyobjc-framework-Cocoa* `ls -d pyobjc-framework-* | grep -v pyobjc-framework-Cocoa`; do \
	pushd "$pkg"
	ARCHFLAGS="${RC_CFLAGS} -DOBJC_OLD_DISPATCH_PROTOTYPES=0 -D_FORTIFY_SOURCE=0" PYTHONPATH="${EXTRASPYOBJC}:${DSTROOT}${EXTRASPYOBJC}" \
	python setup.py install --home="${EXTRAS}" --root="${DSTROOT}"
	popd
done
popd

pushd "${DSTROOT}${EXTRASLIBPYTHON}"
install -d PyObjC
for x in *; do
	if [ "$x" != PyObjC -a "$x" != PyObjC.pth ]; then
		if [ -e PyObjC/$x ]; then
			cp -r $x PyObjC/$x
			rm -rf $x
		else
			mv "$x" PyObjC
		fi
	fi
done
popd

for i in AVFoundation; do
	install -d ${DSTROOT}${EXTRASPYOBJC}/$i
	sed "s/@XXX@/$i/g" "${SRCROOT}/patches/newmoduletemplate.py" > "${DSTROOT}${EXTRASPYOBJC}/$i/__init__.py"
	python -c "import py_compile;py_compile.compile('${DSTROOT}${EXTRASPYOBJC}/$i/__init__.py')"
	chmod 0644 "${DSTROOT}${EXTRASPYOBJC}/$i/__init__.py"*
done
