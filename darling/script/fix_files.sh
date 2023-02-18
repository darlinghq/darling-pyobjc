SRCPATH=$(cd ../.. && pwd)

for path in $SRCPATH/pyobjc/pyobjc-framework-Cocoa-*/Lib/PyObjCTools/Conversion.py; do
	cp $path $path.orig
	unifdef -t -UPY3K -o $path $path
done;