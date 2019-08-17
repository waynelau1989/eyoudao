
CFLAGS			:=
LDFLAGS			:=
INCLUDES		:=
LIBS			:=
LIB_PATHS		:=
OBJ_NAME		:= xslt

ifeq ($(shell uname),Darwin)
	INCLUDES	+= /usr/local/opt/libxml2/include/libxml2
	INCLUDES	+= /usr/local/opt/libxslt/include
	LIBS		+= xml2
	LIBS		+= xslt
	LIB_PATHS	+= /usr/local/opt/libxml2/lib
	LIB_PATHS	+= /usr/local/opt/libxslt/lib

	LDFLAGS		+= $(addprefix -l, $(LIBS))
	CFLAGS		+= $(addprefix -I, $(INCLUDES))
	CFLAGS		+= $(addprefix -L, $(LIB_PATHS))
else
	CFLAGS		+= `xslt-config --cflags --libs`
endif

$(OBJ_NAME):xslt.c
	gcc -o $(OBJ_NAME) xslt.c $(LDFLAGS) $(CFLAGS)


all:$(OBJ_NAME)

clean:
	rm xslt

install:$(OBJ_NAME)
	@./install.sh
