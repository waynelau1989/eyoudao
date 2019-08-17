#! /bin/bash

OS=`uname`


INSTALL_FILES="detail simple pyfanyi eyoudao xslt"

if [ -z "$INSTALL_DIR" ];then
	echo "[INSTALL_DIR] dir is empty!"
	echo "You can use [make install INSTALL_DIR=/path_to_install]"
	exit 1
else
	echo "INSTALL_DIR=$INSTALL_DIR"
fi

DEST_DIR="$INSTALL_DIR/eyoudao"

if [ ! -d "$DEST_DIR" ];then
	mkdir -p "$DEST_DIR"
fi

if [ "$OS" == "Darwin" ];then
	/bin/cp -Rvf $INSTALL_FILES $DEST_DIR
	/usr/bin/sed -i "" -e 's|\/INSTALL_DIR|'"${INSTALL_DIR}"'|g' $DEST_DIR/detail/commonfile.xsl
	/usr/bin/sed -i "" -e 's|\/INSTALL_DIR|'"${INSTALL_DIR}"'|g' $DEST_DIR/detail/result.xsl
	/usr/bin/sed -i "" -e 's|\/INSTALL_DIR|'"${INSTALL_DIR}"'|g' $DEST_DIR/simple/simple.xsl
else
	cp -rdvf $INSTALL_FILES $DEST_DIR
	sed -i "s/\/INSTALL_DIR/${INSTALL_DIR}/g" $DEST_DIR/detail/commonfile.xsl
	sed -i "s/\/INSTALL_DIR/${INSTALL_DIR}/g" $DEST_DIR/detail/result.xsl
	sed -i "s/\/INSTALL_DIR/${INSTALL_DIR}/g" $DEST_DIR/simple/simple.xsl
fi
