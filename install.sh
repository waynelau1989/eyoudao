#! /bin/bash

OS=`uname`

CMD_CP="cp -rdvf"
CMD_SED="sed -i"

if [ "$OS" == "Darwin" ];then
	CMD_CP="/bin/cp -Rvf"
	CMD_SED="/usr/bin/sed -i \"\" -e"
fi

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


$CMD_CP $INSTALL_FILES $DEST_DIR
$CMD_SED 's|\/INSTALL_DIR|'"${INSTALL_DIR}"'|g' $DEST_DIR/detail/commonfile.xsl
$CMD_SED 's|\/INSTALL_DIR|'"${INSTALL_DIR}"'|g' $DEST_DIR/detail/result.xsl
$CMD_SED 's|\/INSTALL_DIR|'"${INSTALL_DIR}"'|g' $DEST_DIR/simple/simple.xsl

