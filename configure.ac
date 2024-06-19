AC_INIT([slhealpix],[0.1],[philipp.ph.weber@fau.de])

AC_CONFIG_AUX_DIR([build-aux])
AM_INIT_AUTOMAKE([-Wall -Werror foreign])
AC_CONFIG_MACRO_DIRS([build-aux/m4])

AM_PROG_AR
LT_PREREQ([2.4.6])
LT_INIT


AC_PROG_CC
CFLAGS="$CFLAGS -g -pedantic -W -Wall -O2"

# FIND SLANG
AC_ARG_WITH(slang,
            [AS_HELP_STRING([--with-slang=<slang path>],[Path to the slang installation])],
            slang_dir=$withval,
            slang_dir=notgiven)
AS_IF([ [[ "$slang_dir" == "yes" ]] ],
      [AC_MSG_ERROR([you must write some directory behind --with-slang ...])]
      )
AS_IF([ [[ "$slang_dir" != "notgiven" ]] ],
      [
	AS_IF([ [[ ! -d $slang_dir ]] ],
	      [AC_MSG_ERROR([slang directory "$slang_dir" does not exist!])]
	      )
	AC_MSG_NOTICE([slang installation is $slang_dir])
	AC_SUBST([SLANG], [$slang_dir])
	LDFLAGS="$LDFLAGS -L${slang_dir}/lib"
	CFLAGS="$CFLAGS -I${slang_dir}/include"
	CPPFLAGS="$CPPFLAGS -I${slang_dir}/include"
       ]
      )

# FIND HEASOFT
AC_ARG_WITH(heasoft,
            [AS_HELP_STRING([--with-heasoft=<heasoft path>],[Path to the heasoft installation])],
            heasoft_dir=$withval,
            heasoft_dir=notgiven)
AS_IF([ [[ "$heasoft_dir" == "yes" ]] ],
      [AC_MSG_ERROR([you must write some directory behind --with-heasoft ...])]
      )
AS_IF([ [[ "$heasoft_dir" != "notgiven" ]] ],
      [
	AS_IF([ [[ ! -d $heasoft_dir ]] ],
	      [AC_MSG_ERROR([heasoft directory "$heasoft_dir" does not exist!])]
	      )
	AC_MSG_NOTICE([heasoft installation is $heasoft_dir])
	AC_SUBST([HEASOFT], [$heasoft_dir])
	LDFLAGS="$LDFLAGS -L${heasoft_dir}/lib"
	CFLAGS="$CFLAGS -I${heasoft_dir}/include"
	CPPFLAGS="$CPPFLAGS -I${heasoft_dir}/include"
       ]
      )

# FIND HEALPIX
AC_ARG_WITH(healpix,
            [AS_HELP_STRING([--with-healpix=<healpix path>],[Path to the healpix installation])],
            healpix_dir=$withval,
            healpix_dir=notgiven)
AS_IF([ [[ "$healpix_dir" == "yes" ]] ],
      [AC_MSG_ERROR([you must write some directory behind --with-healpix ...])]
      )
AS_IF([ [[ "$healpix_dir" != "notgiven" ]] ],
      [
	AS_IF([ [[ ! -d $healpix_dir ]] ],
	      [AC_MSG_ERROR([healpix directory "$healpix_dir" does not exist!])]
	      )
	AC_MSG_NOTICE([healpix installation is $healpix_dir])
	AC_SUBST([HEALPIX], [$healpix_dir])
	LDFLAGS="$LDFLAGS -L${healpix_dir}/lib"
	CFLAGS="$CFLAGS -I${healpix_dir}/include"
	CPPFLAGS="$CPPFLAGS -I${healpix_dir}/include"
       ]
      )

AC_CHECK_HEADERS([slang.h], [], [AC_MSG_ERROR([slang.h not found!])], [])
AC_CHECK_HEADERS([fitsio.h], [], [AC_MSG_ERROR([fitsio.h not found (should be part of heasoft!)])], [])
AC_CHECK_HEADERS([chealpix.h], [], [AC_MSG_ERROR([chealpix.h not found!])], [])

AC_SEARCH_LIBS([cos], [m], [], [AC_MSG_ERROR([math library not found!])], [])
AC_SEARCH_LIBS([SLang_restart], [slang], [], [AC_MSG_ERROR([slang library not found!])], [])
AC_SEARCH_LIBS([ffopen], [cfitsio], [], [AC_MSG_ERROR([cfitsio library not found (should be part of heasoft)!])], [])
AC_SEARCH_LIBS([vec2ang], [chealpix], [], [AC_MSG_ERROR([healpix library not found!])], [])


AC_CONFIG_FILES([Makefile
		 src/Makefile
		 ])

AC_OUTPUT
