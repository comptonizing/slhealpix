lib_LTLIBRARIES=libslhealpix.la
libslhealpix_la_SOURCES=healpix-module.c

install-data-hook:
	mkdir -p @prefix@/lib/slang/v2/modules
	rm -f @prefix@/lib/slang/v2/modules/healpix-module.so
	ln -s ../../../libslhealpix.so @prefix@/lib/slang/v2/modules/healpix-module.so

sldir=@prefix@/share/slsh/local-packages/
sl_DATA=healpix.sl

helpdir=@prefix@/share/slsh/local-packages/help/
help_DATA=healpix.hlp

healpix.tm: healpix.sl
	@top_builddir@/build-aux/tm-strip $< >>$@

.tm.hlp:
	rm -f $@
	@top_builddir@/build-aux/tmexpand -I@top_builddir@/build-aux/tmdata/ -Mslhlp_isisscripts $< $@

CLEANFILES=$(help_DATA)
