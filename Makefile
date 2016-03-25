ZLIB_DIR = zlib/
LUA_INC	 = /usr/local/include
LUA_LIB	 = /usr/local/lib

ZLIB_SRC = $(addprefix $(ZLIB_DIR), \
		adler32.c\
		compress.c\
		crc32.c\
		deflate.c\
		gzclose.c\
		gzlib.c\
		gzread.c\
		gzwrite.c\
		infback.c\
		inffast.c\
		inflate.c\
		inftrees.c\
		trees.c\
		uncompr.c\
		zutil.c\
		)

MINIZIP_DIR = minizip/

MINIZIP_SRC = $(addprefix $(MINIZIP_DIR), \
ioapi.c\
mztools.c\
unzip.c\
zip.c\
)


all: zip.so

zip.so : luazip.c $(ZLIB_SRC) $(MINIZIP_SRC)
	gcc --shared -Wall -fPIC -o $@  -I$(ZLIB_DIR) -I$(MINIZIP_DIR) $^ -I$(LUA_INC) -L$(LUA_LIB)-llua

clean:
	rm -f  zip.so
