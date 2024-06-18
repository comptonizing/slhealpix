lib_LTLIBRARIES=libslhealpix.la
libslhealpix_la_SOURCES=healpix-module.c

install-data-hook:
	mkdir -p @prefix@/lib/slang/v2/modules
	rm -f @prefix@/lib/slang/v2/modules/healpix-module.so
	ln -s ../../../libslhealpix.so @prefix@/lib/slang/v2/modules/healpix-module.so

