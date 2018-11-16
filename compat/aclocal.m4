# generated automatically by aclocal 1.15 -*- Autoconf -*-

# Copyright (C) 1996-2014 Free Software Foundation, Inc.

# This file is free software; the Free Software Foundation
# gives unlimited permission to copy and/or distribute it,
# with or without modifications, as long as this notice is preserved.

# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY, to the extent permitted by law; without
# even the implied warranty of MERCHANTABILITY or FITNESS FOR A
# PARTICULAR PURPOSE.

m4_ifndef([AC_CONFIG_MACRO_DIRS], [m4_defun([_AM_CONFIG_MACRO_DIRS], [])m4_defun([AC_CONFIG_MACRO_DIRS], [_AM_CONFIG_MACRO_DIRS($@)])])
m4_ifndef([AC_AUTOCONF_VERSION],
  [m4_copy([m4_PACKAGE_VERSION], [AC_AUTOCONF_VERSION])])dnl
m4_if(m4_defn([AC_AUTOCONF_VERSION]), [2.69],,
[m4_warning([this file was generated for autoconf 2.69.
You have another version of autoconf.  It may work, but is not guaranteed to.
If you have problems, you may need to regenerate the build system entirely.
To do so, use the procedure documented by the package, typically 'autoreconf'.])])

# Copyright (C) 2002-2014 Free Software Foundation, Inc.
#
# This file is free software; the Free Software Foundation
# gives unlimited permission to copy and/or distribute it,
# with or without modifications, as long as this notice is preserved.

# AM_AUTOMAKE_VERSION(VERSION)
# ----------------------------
# Automake X.Y traces this macro to ensure aclocal.m4 has been
# generated from the m4 files accompanying Automake X.Y.
# (This private macro should not be called outside this file.)
AC_DEFUN([AM_AUTOMAKE_VERSION],
[am__api_version='1.15'
dnl Some users find AM_AUTOMAKE_VERSION and mistake it for a way to
dnl require some minimum version.  Point them to the right macro.
m4_if([$1], [1.15], [],
      [AC_FATAL([Do not call $0, use AM_INIT_AUTOMAKE([$1]).])])dnl
])

# _AM_AUTOCONF_VERSION(VERSION)
# -----------------------------
# aclocal traces this macro to find the Autoconf version.
# This is a private macro too.  Using m4_define simplifies
# the logic in aclocal, which can simply ignore this definition.
m4_define([_AM_AUTOCONF_VERSION], [])

# AM_SET_CURRENT_AUTOMAKE_VERSION
# -------------------------------
# Call AM_AUTOMAKE_VERSION and AM_AUTOMAKE_VERSION so they can be traced.
# This function is AC_REQUIREd by AM_INIT_AUTOMAKE.
AC_DEFUN([AM_SET_CURRENT_AUTOMAKE_VERSION],
[AM_AUTOMAKE_VERSION([1.15])dnl
m4_ifndef([AC_AUTOCONF_VERSION],
  [m4_copy([m4_PACKAGE_VERSION], [AC_AUTOCONF_VERSION])])dnl
_AM_AUTOCONF_VERSION(m4_defn([AC_AUTOCONF_VERSION]))])

# Figure out how to run the assembler.                      -*- Autoconf -*-

# Copyright (C) 2001-2014 Free Software Foundation, Inc.
#
# This file is free software; the Free Software Foundation
# gives unlimited permission to copy and/or distribute it,
# with or without modifications, as long as this notice is preserved.

# AM_PROG_AS
# ----------
AC_DEFUN([AM_PROG_AS],
[# By default we simply use the C compiler to build assembly code.
AC_REQUIRE([AC_PROG_CC])
test "${CCAS+set}" = set || CCAS=$CC
test "${CCASFLAGS+set}" = set || CCASFLAGS=$CFLAGS
AC_ARG_VAR([CCAS],      [assembler compiler command (defaults to CC)])
AC_ARG_VAR([CCASFLAGS], [assembler compiler flags (defaults to CFLAGS)])
_AM_IF_OPTION([no-dependencies],, [_AM_DEPENDENCIES([CCAS])])dnl
])

# AM_AUX_DIR_EXPAND                                         -*- Autoconf -*-

# Copyright (C) 2001-2014 Free Software Foundation, Inc.
#
# This file is free software; the Free Software Foundation
# gives unlimited permission to copy and/or distribute it,
# with or without modifications, as long as this notice is preserved.

# For projects using AC_CONFIG_AUX_DIR([foo]), Autoconf sets
# $ac_aux_dir to '$srcdir/foo'.  In other projects, it is set to
# '$srcdir', '$srcdir/..', or '$srcdir/../..'.
#
# Of course, Automake must honor this variable whenever it calls a
# tool from the auxiliary directory.  The problem is that $srcdir (and
# therefore $ac_aux_dir as well) can be either absolute or relative,
# depending on how configure is run.  This is pretty annoying, since
# it makes $ac_aux_dir quite unusable in subdirectories: in the top
# source directory, any form will work fine, but in subdirectories a
# relative path needs to be adjusted first.
#
# $ac_aux_dir/missing
#    fails when called from a subdirectory if $ac_aux_dir is relative
# $top_srcdir/$ac_aux_dir/missing
#    fails if $ac_aux_dir is absolute,
#    fails when called from a subdirectory in a VPATH build with
#          a relative $ac_aux_dir
#
# The reason of the latter failure is that $top_srcdir and $ac_aux_dir
# are both prefixed by $srcdir.  In an in-source build this is usually
# harmless because $srcdir is '.', but things will broke when you
# start a VPATH build or use an absolute $srcdir.
#
# So we could use something similar to $top_srcdir/$ac_aux_dir/missing,
# iff we strip the leading $srcdir from $ac_aux_dir.  That would be:
#   am_aux_dir='\$(top_srcdir)/'`expr "$ac_aux_dir" : "$srcdir//*\(.*\)"`
# and then we would define $MISSING as
#   MISSING="\${SHELL} $am_aux_dir/missing"
# This will work as long as MISSING is not called from configure, because
# unfortunately $(top_srcdir) has no meaning in configure.
# However there are other variables, like CC, which are often used in
# configure, and could therefore not use this "fixed" $ac_aux_dir.
#
# Another solution, used here, is to always expand $ac_aux_dir to an
# absolute PATH.  The drawback is that using absolute paths prevent a
# configured tree to be moved without reconfiguration.

AC_DEFUN([AM_AUX_DIR_EXPAND],
[AC_REQUIRE([AC_CONFIG_AUX_DIR_DEFAULT])dnl
# Expand $ac_aux_dir to an absolute path.
am_aux_dir=`cd "$ac_aux_dir" && pwd`
])

# AM_CONDITIONAL                                            -*- Autoconf -*-

# Copyright (C) 1997-2014 Free Software Foundation, Inc.
#
# This file is free software; the Free Software Foundation
# gives unlimited permission to copy and/or distribute it,
# with or without modifications, as long as this notice is preserved.

# AM_CONDITIONAL(NAME, SHELL-CONDITION)
# -------------------------------------
# Define a conditional.
AC_DEFUN([AM_CONDITIONAL],
[AC_PREREQ([2.52])dnl
 m4_if([$1], [TRUE],  [AC_FATAL([$0: invalid condition: $1])],
       [$1], [FALSE], [AC_FATAL([$0: invalid condition: $1])])dnl
AC_SUBST([$1_TRUE])dnl
AC_SUBST([$1_FALSE])dnl
_AM_SUBST_NOTMAKE([$1_TRUE])dnl
_AM_SUBST_NOTMAKE([$1_FALSE])dnl
m4_define([_AM_COND_VALUE_$1], [$2])dnl
if $2; then
  $1_TRUE=
  $1_FALSE='#'
else
  $1_TRUE='#'
  $1_FALSE=
fi
AC_CONFIG_COMMANDS_PRE(
[if test -z "${$1_TRUE}" && test -z "${$1_FALSE}"; then
  AC_MSG_ERROR([[conditional "$1" was never defined.
Usually this means the macro was only invoked conditionally.]])
fi])])

# Copyright (C) 1999-2014 Free Software Foundation, Inc.
#
# This file is free software; the Free Software Foundation
# gives unlimited permission to copy and/or distribute it,
# with or without modifications, as long as this notice is preserved.


# There are a few dirty hacks below to avoid letting 'AC_PROG_CC' be
# written in clear, in which case automake, when reading aclocal.m4,
# will think it sees a *use*, and therefore will trigger all it's
# C support machinery.  Also note that it means that autoscan, seeing
# CC etc. in the Makefile, will ask for an AC_PROG_CC use...


# _AM_DEPENDENCIES(NAME)
# ----------------------
# See how the compiler implements dependency checking.
# NAME is "CC", "CXX", "OBJC", "OBJCXX", "UPC", or "GJC".
# We try a few techniques and use that to set a single cache variable.
#
# We don't AC_REQUIRE the corresponding AC_PROG_CC since the latter was
# modified to invoke _AM_DEPENDENCIES(CC); we would have a circular
# dependency, and given that the user is not expected to run this macro,
# just rely on AC_PROG_CC.
AC_DEFUN([_AM_DEPENDENCIES],
[AC_REQUIRE([AM_SET_DEPDIR])dnl
AC_REQUIRE([AM_OUTPUT_DEPENDENCY_COMMANDS])dnl
AC_REQUIRE([AM_MAKE_INCLUDE])dnl
AC_REQUIRE([AM_DEP_TRACK])dnl

m4_if([$1], [CC],   [depcc="$CC"   am_compiler_list=],
      [$1], [CXX],  [depcc="$CXX"  am_compiler_list=],
      [$1], [OBJC], [depcc="$OBJC" am_compiler_list='gcc3 gcc'],
      [$1], [OBJCXX], [depcc="$OBJCXX" am_compiler_list='gcc3 gcc'],
      [$1], [UPC],  [depcc="$UPC"  am_compiler_list=],
      [$1], [GCJ],  [depcc="$GCJ"  am_compiler_list='gcc3 gcc'],
                    [depcc="$$1"   am_compiler_list=])

AC_CACHE_CHECK([dependency style of $depcc],
               [am_cv_$1_dependencies_compiler_type],
[if test -z "$AMDEP_TRUE" && test -f "$am_depcomp"; then
  # We make a subdir and do the tests there.  Otherwise we can end up
  # making bogus files that we don't know about and never remove.  For
  # instance it was reported that on HP-UX the gcc test will end up
  # making a dummy file named 'D' -- because '-MD' means "put the output
  # in D".
  rm -rf conftest.dir
  mkdir conftest.dir
  # Copy depcomp to subdir because otherwise we won't find it if we're
  # using a relative directory.
  cp "$am_depcomp" conftest.dir
  cd conftest.dir
  # We will build objects and dependencies in a subdirectory because
  # it helps to detect inapplicable dependency modes.  For instance
  # both Tru64's cc and ICC support -MD to output dependencies as a
  # side effect of compilation, but ICC will put the dependencies in
  # the current directory while Tru64 will put them in the object
  # directory.
  mkdir sub

  am_cv_$1_dependencies_compiler_type=none
  if test "$am_compiler_list" = ""; then
     am_compiler_list=`sed -n ['s/^#*\([a-zA-Z0-9]*\))$/\1/p'] < ./depcomp`
  fi
  am__universal=false
  m4_case([$1], [CC],
    [case " $depcc " in #(
     *\ -arch\ *\ -arch\ *) am__universal=true ;;
     esac],
    [CXX],
    [case " $depcc " in #(
     *\ -arch\ *\ -arch\ *) am__universal=true ;;
     esac])

  for depmode in $am_compiler_list; do
    # Setup a source with many dependencies, because some compilers
    # like to wrap large dependency lists on column 80 (with \), and
    # we should not choose a depcomp mode which is confused by this.
    #
    # We need to recreate these files for each test, as the compiler may
    # overwrite some of them when testing with obscure command lines.
    # This happens at least with the AIX C compiler.
    : > sub/conftest.c
    for i in 1 2 3 4 5 6; do
      echo '#include "conftst'$i'.h"' >> sub/conftest.c
      # Using ": > sub/conftst$i.h" creates only sub/conftst1.h with
      # Solaris 10 /bin/sh.
      echo '/* dummy */' > sub/conftst$i.h
    done
    echo "${am__include} ${am__quote}sub/conftest.Po${am__quote}" > confmf

    # We check with '-c' and '-o' for the sake of the "dashmstdout"
    # mode.  It turns out that the SunPro C++ compiler does not properly
    # handle '-M -o', and we need to detect this.  Also, some Intel
    # versions had trouble with output in subdirs.
    am__obj=sub/conftest.${OBJEXT-o}
    am__minus_obj="-o $am__obj"
    case $depmode in
    gcc)
      # This depmode causes a compiler race in universal mode.
      test "$am__universal" = false || continue
      ;;
    nosideeffect)
      # After this tag, mechanisms are not by side-effect, so they'll
      # only be used when explicitly requested.
      if test "x$enable_dependency_tracking" = xyes; then
	continue
      else
	break
      fi
      ;;
    msvc7 | msvc7msys | msvisualcpp | msvcmsys)
      # This compiler won't grok '-c -o', but also, the minuso test has
      # not run yet.  These depmodes are late enough in the game, and
      # so weak that their functioning should not be impacted.
      am__obj=conftest.${OBJEXT-o}
      am__minus_obj=
      ;;
    none) break ;;
    esac
    if depmode=$depmode \
       source=sub/conftest.c object=$am__obj \
       depfile=sub/conftest.Po tmpdepfile=sub/conftest.TPo \
       $SHELL ./depcomp $depcc -c $am__minus_obj sub/conftest.c \
         >/dev/null 2>conftest.err &&
       grep sub/conftst1.h sub/conftest.Po > /dev/null 2>&1 &&
       grep sub/conftst6.h sub/conftest.Po > /dev/null 2>&1 &&
       grep $am__obj sub/conftest.Po > /dev/null 2>&1 &&
       ${MAKE-make} -s -f confmf > /dev/null 2>&1; then
      # icc doesn't choke on unknown options, it will just issue warnings
      # or remarks (even with -Werror).  So we grep stderr for any message
      # that says an option was ignored or not supported.
      # When given -MP, icc 7.0 and 7.1 complain thusly:
      #   icc: Command line warning: ignoring option '-M'; no argument required
      # The diagnosis changed in icc 8.0:
      #   icc: Command line remark: option '-MP' not supported
      if (grep 'ignoring option' conftest.err ||
          grep 'not supported' conftest.err) >/dev/null 2>&1; then :; else
        am_cv_$1_dependencies_compiler_type=$depmode
        break
      fi
    fi
  done

  cd ..
  rm -rf conftest.dir
else
  am_cv_$1_dependencies_compiler_type=none
fi
])
AC_SUBST([$1DEPMODE], [depmode=$am_cv_$1_dependencies_compiler_type])
AM_CONDITIONAL([am__fastdep$1], [
  test "x$enable_dependency_tracking" != xno \
  && test "$am_cv_$1_dependencies_compiler_type" = gcc3])
])


# AM_SET_DEPDIR
# -------------
# Choose a directory name for dependency files.
# This macro is AC_REQUIREd in _AM_DEPENDENCIES.
AC_DEFUN([AM_SET_DEPDIR],
[AC_REQUIRE([AM_SET_LEADING_DOT])dnl
AC_SUBST([DEPDIR], ["${am__leading_dot}deps"])dnl
])


# AM_DEP_TRACK
# ------------
AC_DEFUN([AM_DEP_TRACK],
[AC_ARG_ENABLE([dependency-tracking], [dnl
AS_HELP_STRING(
  [--enable-dependency-tracking],
  [do not reject slow dependency extractors])
AS_HELP_STRING(
  [--disable-dependency-tracking],
  [speeds up one-time build])])
if test "x$enable_dependency_tracking" != xno; then
  am_depcomp="$ac_aux_dir/depcomp"
  AMDEPBACKSLASH='\'
  am__nodep='_no'
fi
AM_CONDITIONAL([AMDEP], [test "x$enable_dependency_tracking" != xno])
AC_SUBST([AMDEPBACKSLASH])dnl
_AM_SUBST_NOTMAKE([AMDEPBACKSLASH])dnl
AC_SUBST([am__nodep])dnl
_AM_SUBST_NOTMAKE([am__nodep])dnl
])

# Generate code to set up dependency tracking.              -*- Autoconf -*-

# Copyright (C) 1999-2014 Free Software Foundation, Inc.
#
# This file is free software; the Free Software Foundation
# gives unlimited permission to copy and/or distribute it,
# with or without modifications, as long as this notice is preserved.


# _AM_OUTPUT_DEPENDENCY_COMMANDS
# ------------------------------
AC_DEFUN([_AM_OUTPUT_DEPENDENCY_COMMANDS],
[{
  # Older Autoconf quotes --file arguments for eval, but not when files
  # are listed without --file.  Let's play safe and only enable the eval
  # if we detect the quoting.
  case $CONFIG_FILES in
  *\'*) eval set x "$CONFIG_FILES" ;;
  *)   set x $CONFIG_FILES ;;
  esac
  shift
  for mf
  do
    # Strip MF so we end up with the name of the file.
    mf=`echo "$mf" | sed -e 's/:.*$//'`
    # Check whether this is an Automake generated Makefile or not.
    # We used to match only the files named 'Makefile.in', but
    # some people rename them; so instead we look at the file content.
    # Grep'ing the first line is not enough: some people post-process
    # each Makefile.in and add a new line on top of each file to say so.
    # Grep'ing the whole file is not good either: AIX grep has a line
    # limit of 2048, but all sed's we know have understand at least 4000.
    if sed -n 's,^#.*generated by automake.*,X,p' "$mf" | grep X >/dev/null 2>&1; then
      dirpart=`AS_DIRNAME("$mf")`
    else
      continue
    fi
    # Extract the definition of DEPDIR, am__include, and am__quote
    # from the Makefile without running 'make'.
    DEPDIR=`sed -n 's/^DEPDIR = //p' < "$mf"`
    test -z "$DEPDIR" && continue
    am__include=`sed -n 's/^am__include = //p' < "$mf"`
    test -z "$am__include" && continue
    am__quote=`sed -n 's/^am__quote = //p' < "$mf"`
    # Find all dependency output files, they are included files with
    # $(DEPDIR) in their names.  We invoke sed twice because it is the
    # simplest approach to changing $(DEPDIR) to its actual value in the
    # expansion.
    for file in `sed -n "
      s/^$am__include $am__quote\(.*(DEPDIR).*\)$am__quote"'$/\1/p' <"$mf" | \
	 sed -e 's/\$(DEPDIR)/'"$DEPDIR"'/g'`; do
      # Make sure the directory exists.
      test -f "$dirpart/$file" && continue
      fdir=`AS_DIRNAME(["$file"])`
      AS_MKDIR_P([$dirpart/$fdir])
      # echo "creating $dirpart/$file"
      echo '# dummy' > "$dirpart/$file"
    done
  done
}
])# _AM_OUTPUT_DEPENDENCY_COMMANDS


# AM_OUTPUT_DEPENDENCY_COMMANDS
# -----------------------------
# This macro should only be invoked once -- use via AC_REQUIRE.
#
# This code is only required when automatic dependency tracking
# is enabled.  FIXME.  This creates each '.P' file that we will
# need in order to bootstrap the dependency handling code.
AC_DEFUN([AM_OUTPUT_DEPENDENCY_COMMANDS],
[AC_CONFIG_COMMANDS([depfiles],
     [test x"$AMDEP_TRUE" != x"" || _AM_OUTPUT_DEPENDENCY_COMMANDS],
     [AMDEP_TRUE="$AMDEP_TRUE" ac_aux_dir="$ac_aux_dir"])
])

# Do all the work for Automake.                             -*- Autoconf -*-

# Copyright (C) 1996-2014 Free Software Foundation, Inc.
#
# This file is free software; the Free Software Foundation
# gives unlimited permission to copy and/or distribute it,
# with or without modifications, as long as this notice is preserved.

# This macro actually does too much.  Some checks are only needed if
# your package does certain things.  But this isn't really a big deal.

dnl Redefine AC_PROG_CC to automatically invoke _AM_PROG_CC_C_O.
m4_define([AC_PROG_CC],
m4_defn([AC_PROG_CC])
[_AM_PROG_CC_C_O
])

# AM_INIT_AUTOMAKE(PACKAGE, VERSION, [NO-DEFINE])
# AM_INIT_AUTOMAKE([OPTIONS])
# -----------------------------------------------
# The call with PACKAGE and VERSION arguments is the old style
# call (pre autoconf-2.50), which is being phased out.  PACKAGE
# and VERSION should now be passed to AC_INIT and removed from
# the call to AM_INIT_AUTOMAKE.
# We support both call styles for the transition.  After
# the next Automake release, Autoconf can make the AC_INIT
# arguments mandatory, and then we can depend on a new Autoconf
# release and drop the old call support.
AC_DEFUN([AM_INIT_AUTOMAKE],
[AC_PREREQ([2.65])dnl
dnl Autoconf wants to disallow AM_ names.  We explicitly allow
dnl the ones we care about.
m4_pattern_allow([^AM_[A-Z]+FLAGS$])dnl
AC_REQUIRE([AM_SET_CURRENT_AUTOMAKE_VERSION])dnl
AC_REQUIRE([AC_PROG_INSTALL])dnl
if test "`cd $srcdir && pwd`" != "`pwd`"; then
  # Use -I$(srcdir) only when $(srcdir) != ., so that make's output
  # is not polluted with repeated "-I."
  AC_SUBST([am__isrc], [' -I$(srcdir)'])_AM_SUBST_NOTMAKE([am__isrc])dnl
  # test to see if srcdir already configured
  if test -f $srcdir/config.status; then
    AC_MSG_ERROR([source directory already configured; run "make distclean" there first])
  fi
fi

# test whether we have cygpath
if test -z "$CYGPATH_W"; then
  if (cygpath --version) >/dev/null 2>/dev/null; then
    CYGPATH_W='cygpath -w'
  else
    CYGPATH_W=echo
  fi
fi
AC_SUBST([CYGPATH_W])

# Define the identity of the package.
dnl Distinguish between old-style and new-style calls.
m4_ifval([$2],
[AC_DIAGNOSE([obsolete],
             [$0: two- and three-arguments forms are deprecated.])
m4_ifval([$3], [_AM_SET_OPTION([no-define])])dnl
 AC_SUBST([PACKAGE], [$1])dnl
 AC_SUBST([VERSION], [$2])],
[_AM_SET_OPTIONS([$1])dnl
dnl Diagnose old-style AC_INIT with new-style AM_AUTOMAKE_INIT.
m4_if(
  m4_ifdef([AC_PACKAGE_NAME], [ok]):m4_ifdef([AC_PACKAGE_VERSION], [ok]),
  [ok:ok],,
  [m4_fatal([AC_INIT should be called with package and version arguments])])dnl
 AC_SUBST([PACKAGE], ['AC_PACKAGE_TARNAME'])dnl
 AC_SUBST([VERSION], ['AC_PACKAGE_VERSION'])])dnl

_AM_IF_OPTION([no-define],,
[AC_DEFINE_UNQUOTED([PACKAGE], ["$PACKAGE"], [Name of package])
 AC_DEFINE_UNQUOTED([VERSION], ["$VERSION"], [Version number of package])])dnl

# Some tools Automake needs.
AC_REQUIRE([AM_SANITY_CHECK])dnl
AC_REQUIRE([AC_ARG_PROGRAM])dnl
AM_MISSING_PROG([ACLOCAL], [aclocal-${am__api_version}])
AM_MISSING_PROG([AUTOCONF], [autoconf])
AM_MISSING_PROG([AUTOMAKE], [automake-${am__api_version}])
AM_MISSING_PROG([AUTOHEADER], [autoheader])
AM_MISSING_PROG([MAKEINFO], [makeinfo])
AC_REQUIRE([AM_PROG_INSTALL_SH])dnl
AC_REQUIRE([AM_PROG_INSTALL_STRIP])dnl
AC_REQUIRE([AC_PROG_MKDIR_P])dnl
# For better backward compatibility.  To be removed once Automake 1.9.x
# dies out for good.  For more background, see:
# <http://lists.gnu.org/archive/html/automake/2012-07/msg00001.html>
# <http://lists.gnu.org/archive/html/automake/2012-07/msg00014.html>
AC_SUBST([mkdir_p], ['$(MKDIR_P)'])
# We need awk for the "check" target (and possibly the TAP driver).  The
# system "awk" is bad on some platforms.
AC_REQUIRE([AC_PROG_AWK])dnl
AC_REQUIRE([AC_PROG_MAKE_SET])dnl
AC_REQUIRE([AM_SET_LEADING_DOT])dnl
_AM_IF_OPTION([tar-ustar], [_AM_PROG_TAR([ustar])],
	      [_AM_IF_OPTION([tar-pax], [_AM_PROG_TAR([pax])],
			     [_AM_PROG_TAR([v7])])])
_AM_IF_OPTION([no-dependencies],,
[AC_PROVIDE_IFELSE([AC_PROG_CC],
		  [_AM_DEPENDENCIES([CC])],
		  [m4_define([AC_PROG_CC],
			     m4_defn([AC_PROG_CC])[_AM_DEPENDENCIES([CC])])])dnl
AC_PROVIDE_IFELSE([AC_PROG_CXX],
		  [_AM_DEPENDENCIES([CXX])],
		  [m4_define([AC_PROG_CXX],
			     m4_defn([AC_PROG_CXX])[_AM_DEPENDENCIES([CXX])])])dnl
AC_PROVIDE_IFELSE([AC_PROG_OBJC],
		  [_AM_DEPENDENCIES([OBJC])],
		  [m4_define([AC_PROG_OBJC],
			     m4_defn([AC_PROG_OBJC])[_AM_DEPENDENCIES([OBJC])])])dnl
AC_PROVIDE_IFELSE([AC_PROG_OBJCXX],
		  [_AM_DEPENDENCIES([OBJCXX])],
		  [m4_define([AC_PROG_OBJCXX],
			     m4_defn([AC_PROG_OBJCXX])[_AM_DEPENDENCIES([OBJCXX])])])dnl
])
AC_REQUIRE([AM_SILENT_RULES])dnl
dnl The testsuite driver may need to know about EXEEXT, so add the
dnl 'am__EXEEXT' conditional if _AM_COMPILER_EXEEXT was seen.  This
dnl macro is hooked onto _AC_COMPILER_EXEEXT early, see below.
AC_CONFIG_COMMANDS_PRE(dnl
[m4_provide_if([_AM_COMPILER_EXEEXT],
  [AM_CONDITIONAL([am__EXEEXT], [test -n "$EXEEXT"])])])dnl

# POSIX will say in a future version that running "rm -f" with no argument
# is OK; and we want to be able to make that assumption in our Makefile
# recipes.  So use an aggressive probe to check that the usage we want is
# actually supported "in the wild" to an acceptable degree.
# See automake bug#10828.
# To make any issue more visible, cause the running configure to be aborted
# by default if the 'rm' program in use doesn't match our expectations; the
# user can still override this though.
if rm -f && rm -fr && rm -rf; then : OK; else
  cat >&2 <<'END'
Oops!

Your 'rm' program seems unable to run without file operands specified
on the command line, even when the '-f' option is present.  This is contrary
to the behaviour of most rm programs out there, and not conforming with
the upcoming POSIX standard: <http://austingroupbugs.net/view.php?id=542>

Please tell bug-automake@gnu.org about your system, including the value
of your $PATH and any error possibly output before this message.  This
can help us improve future automake versions.

END
  if test x"$ACCEPT_INFERIOR_RM_PROGRAM" = x"yes"; then
    echo 'Configuration will proceed anyway, since you have set the' >&2
    echo 'ACCEPT_INFERIOR_RM_PROGRAM variable to "yes"' >&2
    echo >&2
  else
    cat >&2 <<'END'
Aborting the configuration process, to ensure you take notice of the issue.

You can download and install GNU coreutils to get an 'rm' implementation
that behaves properly: <http://www.gnu.org/software/coreutils/>.

If you want to complete the configuration process using your problematic
'rm' anyway, export the environment variable ACCEPT_INFERIOR_RM_PROGRAM
to "yes", and re-run configure.

END
    AC_MSG_ERROR([Your 'rm' program is bad, sorry.])
  fi
fi
dnl The trailing newline in this macro's definition is deliberate, for
dnl backward compatibility and to allow trailing 'dnl'-style comments
dnl after the AM_INIT_AUTOMAKE invocation. See automake bug#16841.
])

dnl Hook into '_AC_COMPILER_EXEEXT' early to learn its expansion.  Do not
dnl add the conditional right here, as _AC_COMPILER_EXEEXT may be further
dnl mangled by Autoconf and run in a shell conditional statement.
m4_define([_AC_COMPILER_EXEEXT],
m4_defn([_AC_COMPILER_EXEEXT])[m4_provide([_AM_COMPILER_EXEEXT])])

# When config.status generates a header, we must update the stamp-h file.
# This file resides in the same directory as the config header
# that is generated.  The stamp files are numbered to have different names.

# Autoconf calls _AC_AM_CONFIG_HEADER_HOOK (when defined) in the
# loop where config.status creates the headers, so we can generate
# our stamp files there.
AC_DEFUN([_AC_AM_CONFIG_HEADER_HOOK],
[# Compute $1's index in $config_headers.
_am_arg=$1
_am_stamp_count=1
for _am_header in $config_headers :; do
  case $_am_header in
    $_am_arg | $_am_arg:* )
      break ;;
    * )
      _am_stamp_count=`expr $_am_stamp_count + 1` ;;
  esac
done
echo "timestamp for $_am_arg" >`AS_DIRNAME(["$_am_arg"])`/stamp-h[]$_am_stamp_count])

# Copyright (C) 2001-2014 Free Software Foundation, Inc.
#
# This file is free software; the Free Software Foundation
# gives unlimited permission to copy and/or distribute it,
# with or without modifications, as long as this notice is preserved.

# AM_PROG_INSTALL_SH
# ------------------
# Define $install_sh.
AC_DEFUN([AM_PROG_INSTALL_SH],
[AC_REQUIRE([AM_AUX_DIR_EXPAND])dnl
if test x"${install_sh+set}" != xset; then
  case $am_aux_dir in
  *\ * | *\	*)
    install_sh="\${SHELL} '$am_aux_dir/install-sh'" ;;
  *)
    install_sh="\${SHELL} $am_aux_dir/install-sh"
  esac
fi
AC_SUBST([install_sh])])

# Copyright (C) 2003-2014 Free Software Foundation, Inc.
#
# This file is free software; the Free Software Foundation
# gives unlimited permission to copy and/or distribute it,
# with or without modifications, as long as this notice is preserved.

# Check whether the underlying file-system supports filenames
# with a leading dot.  For instance MS-DOS doesn't.
AC_DEFUN([AM_SET_LEADING_DOT],
[rm -rf .tst 2>/dev/null
mkdir .tst 2>/dev/null
if test -d .tst; then
  am__leading_dot=.
else
  am__leading_dot=_
fi
rmdir .tst 2>/dev/null
AC_SUBST([am__leading_dot])])

# Check to see how 'make' treats includes.	            -*- Autoconf -*-

# Copyright (C) 2001-2014 Free Software Foundation, Inc.
#
# This file is free software; the Free Software Foundation
# gives unlimited permission to copy and/or distribute it,
# with or without modifications, as long as this notice is preserved.

# AM_MAKE_INCLUDE()
# -----------------
# Check to see how make treats includes.
AC_DEFUN([AM_MAKE_INCLUDE],
[am_make=${MAKE-make}
cat > confinc << 'END'
am__doit:
	@echo this is the am__doit target
.PHONY: am__doit
END
# If we don't find an include directive, just comment out the code.
AC_MSG_CHECKING([for style of include used by $am_make])
am__include="#"
am__quote=
_am_result=none
# First try GNU make style include.
echo "include confinc" > confmf
# Ignore all kinds of additional output from 'make'.
case `$am_make -s -f confmf 2> /dev/null` in #(
*the\ am__doit\ target*)
  am__include=include
  am__quote=
  _am_result=GNU
  ;;
esac
# Now try BSD make style include.
if test "$am__include" = "#"; then
   echo '.include "confinc"' > confmf
   case `$am_make -s -f confmf 2> /dev/null` in #(
   *the\ am__doit\ target*)
     am__include=.include
     am__quote="\""
     _am_result=BSD
     ;;
   esac
fi
AC_SUBST([am__include])
AC_SUBST([am__quote])
AC_MSG_RESULT([$_am_result])
rm -f confinc confmf
])

# Fake the existence of programs that GNU maintainers use.  -*- Autoconf -*-

# Copyright (C) 1997-2014 Free Software Foundation, Inc.
#
# This file is free software; the Free Software Foundation
# gives unlimited permission to copy and/or distribute it,
# with or without modifications, as long as this notice is preserved.

# AM_MISSING_PROG(NAME, PROGRAM)
# ------------------------------
AC_DEFUN([AM_MISSING_PROG],
[AC_REQUIRE([AM_MISSING_HAS_RUN])
$1=${$1-"${am_missing_run}$2"}
AC_SUBST($1)])

# AM_MISSING_HAS_RUN
# ------------------
# Define MISSING if not defined so far and test if it is modern enough.
# If it is, set am_missing_run to use it, otherwise, to nothing.
AC_DEFUN([AM_MISSING_HAS_RUN],
[AC_REQUIRE([AM_AUX_DIR_EXPAND])dnl
AC_REQUIRE_AUX_FILE([missing])dnl
if test x"${MISSING+set}" != xset; then
  case $am_aux_dir in
  *\ * | *\	*)
    MISSING="\${SHELL} \"$am_aux_dir/missing\"" ;;
  *)
    MISSING="\${SHELL} $am_aux_dir/missing" ;;
  esac
fi
# Use eval to expand $SHELL
if eval "$MISSING --is-lightweight"; then
  am_missing_run="$MISSING "
else
  am_missing_run=
  AC_MSG_WARN(['missing' script is too old or missing])
fi
])

# Helper functions for option handling.                     -*- Autoconf -*-

# Copyright (C) 2001-2014 Free Software Foundation, Inc.
#
# This file is free software; the Free Software Foundation
# gives unlimited permission to copy and/or distribute it,
# with or without modifications, as long as this notice is preserved.

# _AM_MANGLE_OPTION(NAME)
# -----------------------
AC_DEFUN([_AM_MANGLE_OPTION],
[[_AM_OPTION_]m4_bpatsubst($1, [[^a-zA-Z0-9_]], [_])])

# _AM_SET_OPTION(NAME)
# --------------------
# Set option NAME.  Presently that only means defining a flag for this option.
AC_DEFUN([_AM_SET_OPTION],
[m4_define(_AM_MANGLE_OPTION([$1]), [1])])

# _AM_SET_OPTIONS(OPTIONS)
# ------------------------
# OPTIONS is a space-separated list of Automake options.
AC_DEFUN([_AM_SET_OPTIONS],
[m4_foreach_w([_AM_Option], [$1], [_AM_SET_OPTION(_AM_Option)])])

# _AM_IF_OPTION(OPTION, IF-SET, [IF-NOT-SET])
# -------------------------------------------
# Execute IF-SET if OPTION is set, IF-NOT-SET otherwise.
AC_DEFUN([_AM_IF_OPTION],
[m4_ifset(_AM_MANGLE_OPTION([$1]), [$2], [$3])])

# Copyright (C) 1999-2014 Free Software Foundation, Inc.
#
# This file is free software; the Free Software Foundation
# gives unlimited permission to copy and/or distribute it,
# with or without modifications, as long as this notice is preserved.

# _AM_PROG_CC_C_O
# ---------------
# Like AC_PROG_CC_C_O, but changed for automake.  We rewrite AC_PROG_CC
# to automatically call this.
AC_DEFUN([_AM_PROG_CC_C_O],
[AC_REQUIRE([AM_AUX_DIR_EXPAND])dnl
AC_REQUIRE_AUX_FILE([compile])dnl
AC_LANG_PUSH([C])dnl
AC_CACHE_CHECK(
  [whether $CC understands -c and -o together],
  [am_cv_prog_cc_c_o],
  [AC_LANG_CONFTEST([AC_LANG_PROGRAM([])])
  # Make sure it works both with $CC and with simple cc.
  # Following AC_PROG_CC_C_O, we do the test twice because some
  # compilers refuse to overwrite an existing .o file with -o,
  # though they will create one.
  am_cv_prog_cc_c_o=yes
  for am_i in 1 2; do
    if AM_RUN_LOG([$CC -c conftest.$ac_ext -o conftest2.$ac_objext]) \
         && test -f conftest2.$ac_objext; then
      : OK
    else
      am_cv_prog_cc_c_o=no
      break
    fi
  done
  rm -f core conftest*
  unset am_i])
if test "$am_cv_prog_cc_c_o" != yes; then
   # Losing compiler, so override with the script.
   # FIXME: It is wrong to rewrite CC.
   # But if we don't then we get into trouble of one sort or another.
   # A longer-term fix would be to have automake use am__CC in this case,
   # and then we could set am__CC="\$(top_srcdir)/compile \$(CC)"
   CC="$am_aux_dir/compile $CC"
fi
AC_LANG_POP([C])])

# For backward compatibility.
AC_DEFUN_ONCE([AM_PROG_CC_C_O], [AC_REQUIRE([AC_PROG_CC])])

# Copyright (C) 2001-2014 Free Software Foundation, Inc.
#
# This file is free software; the Free Software Foundation
# gives unlimited permission to copy and/or distribute it,
# with or without modifications, as long as this notice is preserved.

# AM_RUN_LOG(COMMAND)
# -------------------
# Run COMMAND, save the exit status in ac_status, and log it.
# (This has been adapted from Autoconf's _AC_RUN_LOG macro.)
AC_DEFUN([AM_RUN_LOG],
[{ echo "$as_me:$LINENO: $1" >&AS_MESSAGE_LOG_FD
   ($1) >&AS_MESSAGE_LOG_FD 2>&AS_MESSAGE_LOG_FD
   ac_status=$?
   echo "$as_me:$LINENO: \$? = $ac_status" >&AS_MESSAGE_LOG_FD
   (exit $ac_status); }])

# Check to make sure that the build environment is sane.    -*- Autoconf -*-

# Copyright (C) 1996-2014 Free Software Foundation, Inc.
#
# This file is free software; the Free Software Foundation
# gives unlimited permission to copy and/or distribute it,
# with or without modifications, as long as this notice is preserved.

# AM_SANITY_CHECK
# ---------------
AC_DEFUN([AM_SANITY_CHECK],
[AC_MSG_CHECKING([whether build environment is sane])
# Reject unsafe characters in $srcdir or the absolute working directory
# name.  Accept space and tab only in the latter.
am_lf='
'
case `pwd` in
  *[[\\\"\#\$\&\'\`$am_lf]]*)
    AC_MSG_ERROR([unsafe absolute working directory name]);;
esac
case $srcdir in
  *[[\\\"\#\$\&\'\`$am_lf\ \	]]*)
    AC_MSG_ERROR([unsafe srcdir value: '$srcdir']);;
esac

# Do 'set' in a subshell so we don't clobber the current shell's
# arguments.  Must try -L first in case configure is actually a
# symlink; some systems play weird games with the mod time of symlinks
# (eg FreeBSD returns the mod time of the symlink's containing
# directory).
if (
   am_has_slept=no
   for am_try in 1 2; do
     echo "timestamp, slept: $am_has_slept" > conftest.file
     set X `ls -Lt "$srcdir/configure" conftest.file 2> /dev/null`
     if test "$[*]" = "X"; then
	# -L didn't work.
	set X `ls -t "$srcdir/configure" conftest.file`
     fi
     if test "$[*]" != "X $srcdir/configure conftest.file" \
	&& test "$[*]" != "X conftest.file $srcdir/configure"; then

	# If neither matched, then we have a broken ls.  This can happen
	# if, for instance, CONFIG_SHELL is bash and it inherits a
	# broken ls alias from the environment.  This has actually
	# happened.  Such a system could not be considered "sane".
	AC_MSG_ERROR([ls -t appears to fail.  Make sure there is not a broken
  alias in your environment])
     fi
     if test "$[2]" = conftest.file || test $am_try -eq 2; then
       break
     fi
     # Just in case.
     sleep 1
     am_has_slept=yes
   done
   test "$[2]" = conftest.file
   )
then
   # Ok.
   :
else
   AC_MSG_ERROR([newly created file is older than distributed files!
Check your system clock])
fi
AC_MSG_RESULT([yes])
# If we didn't sleep, we still need to ensure time stamps of config.status and
# generated files are strictly newer.
am_sleep_pid=
if grep 'slept: no' conftest.file >/dev/null 2>&1; then
  ( sleep 1 ) &
  am_sleep_pid=$!
fi
AC_CONFIG_COMMANDS_PRE(
  [AC_MSG_CHECKING([that generated files are newer than configure])
   if test -n "$am_sleep_pid"; then
     # Hide warnings about reused PIDs.
     wait $am_sleep_pid 2>/dev/null
   fi
   AC_MSG_RESULT([done])])
rm -f conftest.file
])

# Copyright (C) 2009-2014 Free Software Foundation, Inc.
#
# This file is free software; the Free Software Foundation
# gives unlimited permission to copy and/or distribute it,
# with or without modifications, as long as this notice is preserved.

# AM_SILENT_RULES([DEFAULT])
# --------------------------
# Enable less verbose build rules; with the default set to DEFAULT
# ("yes" being less verbose, "no" or empty being verbose).
AC_DEFUN([AM_SILENT_RULES],
[AC_ARG_ENABLE([silent-rules], [dnl
AS_HELP_STRING(
  [--enable-silent-rules],
  [less verbose build output (undo: "make V=1")])
AS_HELP_STRING(
  [--disable-silent-rules],
  [verbose build output (undo: "make V=0")])dnl
])
case $enable_silent_rules in @%:@ (((
  yes) AM_DEFAULT_VERBOSITY=0;;
   no) AM_DEFAULT_VERBOSITY=1;;
    *) AM_DEFAULT_VERBOSITY=m4_if([$1], [yes], [0], [1]);;
esac
dnl
dnl A few 'make' implementations (e.g., NonStop OS and NextStep)
dnl do not support nested variable expansions.
dnl See automake bug#9928 and bug#10237.
am_make=${MAKE-make}
AC_CACHE_CHECK([whether $am_make supports nested variables],
   [am_cv_make_support_nested_variables],
   [if AS_ECHO([['TRUE=$(BAR$(V))
BAR0=false
BAR1=true
V=1
am__doit:
	@$(TRUE)
.PHONY: am__doit']]) | $am_make -f - >/dev/null 2>&1; then
  am_cv_make_support_nested_variables=yes
else
  am_cv_make_support_nested_variables=no
fi])
if test $am_cv_make_support_nested_variables = yes; then
  dnl Using '$V' instead of '$(V)' breaks IRIX make.
  AM_V='$(V)'
  AM_DEFAULT_V='$(AM_DEFAULT_VERBOSITY)'
else
  AM_V=$AM_DEFAULT_VERBOSITY
  AM_DEFAULT_V=$AM_DEFAULT_VERBOSITY
fi
AC_SUBST([AM_V])dnl
AM_SUBST_NOTMAKE([AM_V])dnl
AC_SUBST([AM_DEFAULT_V])dnl
AM_SUBST_NOTMAKE([AM_DEFAULT_V])dnl
AC_SUBST([AM_DEFAULT_VERBOSITY])dnl
AM_BACKSLASH='\'
AC_SUBST([AM_BACKSLASH])dnl
_AM_SUBST_NOTMAKE([AM_BACKSLASH])dnl
])

# Copyright (C) 2001-2014 Free Software Foundation, Inc.
#
# This file is free software; the Free Software Foundation
# gives unlimited permission to copy and/or distribute it,
# with or without modifications, as long as this notice is preserved.

# AM_PROG_INSTALL_STRIP
# ---------------------
# One issue with vendor 'install' (even GNU) is that you can't
# specify the program used to strip binaries.  This is especially
# annoying in cross-compiling environments, where the build's strip
# is unlikely to handle the host's binaries.
# Fortunately install-sh will honor a STRIPPROG variable, so we
# always use install-sh in "make install-strip", and initialize
# STRIPPROG with the value of the STRIP variable (set by the user).
AC_DEFUN([AM_PROG_INSTALL_STRIP],
[AC_REQUIRE([AM_PROG_INSTALL_SH])dnl
# Installed binaries are usually stripped using 'strip' when the user
# run "make install-strip".  However 'strip' might not be the right
# tool to use in cross-compilation environments, therefore Automake
# will honor the 'STRIP' environment variable to overrule this program.
dnl Don't test for $cross_compiling = yes, because it might be 'maybe'.
if test "$cross_compiling" != no; then
  AC_CHECK_TOOL([STRIP], [strip], :)
fi
INSTALL_STRIP_PROGRAM="\$(install_sh) -c -s"
AC_SUBST([INSTALL_STRIP_PROGRAM])])

# Copyright (C) 2006-2014 Free Software Foundation, Inc.
#
# This file is free software; the Free Software Foundation
# gives unlimited permission to copy and/or distribute it,
# with or without modifications, as long as this notice is preserved.

# _AM_SUBST_NOTMAKE(VARIABLE)
# ---------------------------
# Prevent Automake from outputting VARIABLE = @VARIABLE@ in Makefile.in.
# This macro is traced by Automake.
AC_DEFUN([_AM_SUBST_NOTMAKE])

# AM_SUBST_NOTMAKE(VARIABLE)
# --------------------------
# Public sister of _AM_SUBST_NOTMAKE.
AC_DEFUN([AM_SUBST_NOTMAKE], [_AM_SUBST_NOTMAKE($@)])

# Check how to create a tarball.                            -*- Autoconf -*-

# Copyright (C) 2004-2014 Free Software Foundation, Inc.
#
# This file is free software; the Free Software Foundation
# gives unlimited permission to copy and/or distribute it,
# with or without modifications, as long as this notice is preserved.

# _AM_PROG_TAR(FORMAT)
# --------------------
# Check how to create a tarball in format FORMAT.
# FORMAT should be one of 'v7', 'ustar', or 'pax'.
#
# Substitute a variable $(am__tar) that is a command
# writing to stdout a FORMAT-tarball containing the directory
# $tardir.
#     tardir=directory && $(am__tar) > result.tar
#
# Substitute a variable $(am__untar) that extract such
# a tarball read from stdin.
#     $(am__untar) < result.tar
#
AC_DEFUN([_AM_PROG_TAR],
[# Always define AMTAR for backward compatibility.  Yes, it's still used
# in the wild :-(  We should find a proper way to deprecate it ...
AC_SUBST([AMTAR], ['$${TAR-tar}'])

# We'll loop over all known methods to create a tar archive until one works.
_am_tools='gnutar m4_if([$1], [ustar], [plaintar]) pax cpio none'

m4_if([$1], [v7],
  [am__tar='$${TAR-tar} chof - "$$tardir"' am__untar='$${TAR-tar} xf -'],

  [m4_case([$1],
    [ustar],
     [# The POSIX 1988 'ustar' format is defined with fixed-size fields.
      # There is notably a 21 bits limit for the UID and the GID.  In fact,
      # the 'pax' utility can hang on bigger UID/GID (see automake bug#8343
      # and bug#13588).
      am_max_uid=2097151 # 2^21 - 1
      am_max_gid=$am_max_uid
      # The $UID and $GID variables are not portable, so we need to resort
      # to the POSIX-mandated id(1) utility.  Errors in the 'id' calls
      # below are definitely unexpected, so allow the users to see them
      # (that is, avoid stderr redirection).
      am_uid=`id -u || echo unknown`
      am_gid=`id -g || echo unknown`
      AC_MSG_CHECKING([whether UID '$am_uid' is supported by ustar format])
      if test $am_uid -le $am_max_uid; then
         AC_MSG_RESULT([yes])
      else
         AC_MSG_RESULT([no])
         _am_tools=none
      fi
      AC_MSG_CHECKING([whether GID '$am_gid' is supported by ustar format])
      if test $am_gid -le $am_max_gid; then
         AC_MSG_RESULT([yes])
      else
        AC_MSG_RESULT([no])
        _am_tools=none
      fi],

  [pax],
    [],

  [m4_fatal([Unknown tar format])])

  AC_MSG_CHECKING([how to create a $1 tar archive])

  # Go ahead even if we have the value already cached.  We do so because we
  # need to set the values for the 'am__tar' and 'am__untar' variables.
  _am_tools=${am_cv_prog_tar_$1-$_am_tools}

  for _am_tool in $_am_tools; do
    case $_am_tool in
    gnutar)
      for _am_tar in tar gnutar gtar; do
        AM_RUN_LOG([$_am_tar --version]) && break
      done
      am__tar="$_am_tar --format=m4_if([$1], [pax], [posix], [$1]) -chf - "'"$$tardir"'
      am__tar_="$_am_tar --format=m4_if([$1], [pax], [posix], [$1]) -chf - "'"$tardir"'
      am__untar="$_am_tar -xf -"
      ;;
    plaintar)
      # Must skip GNU tar: if it does not support --format= it doesn't create
      # ustar tarball either.
      (tar --version) >/dev/null 2>&1 && continue
      am__tar='tar chf - "$$tardir"'
      am__tar_='tar chf - "$tardir"'
      am__untar='tar xf -'
      ;;
    pax)
      am__tar='pax -L -x $1 -w "$$tardir"'
      am__tar_='pax -L -x $1 -w "$tardir"'
      am__untar='pax -r'
      ;;
    cpio)
      am__tar='find "$$tardir" -print | cpio -o -H $1 -L'
      am__tar_='find "$tardir" -print | cpio -o -H $1 -L'
      am__untar='cpio -i -H $1 -d'
      ;;
    none)
      am__tar=false
      am__tar_=false
      am__untar=false
      ;;
    esac

    # If the value was cached, stop now.  We just wanted to have am__tar
    # and am__untar set.
    test -n "${am_cv_prog_tar_$1}" && break

    # tar/untar a dummy directory, and stop if the command works.
    rm -rf conftest.dir
    mkdir conftest.dir
    echo GrepMe > conftest.dir/file
    AM_RUN_LOG([tardir=conftest.dir && eval $am__tar_ >conftest.tar])
    rm -rf conftest.dir
    if test -s conftest.tar; then
      AM_RUN_LOG([$am__untar <conftest.tar])
      AM_RUN_LOG([cat conftest.dir/file])
      grep GrepMe conftest.dir/file >/dev/null 2>&1 && break
    fi
  done
  rm -rf conftest.dir

  AC_CACHE_VAL([am_cv_prog_tar_$1], [am_cv_prog_tar_$1=$_am_tool])
  AC_MSG_RESULT([$am_cv_prog_tar_$1])])

AC_SUBST([am__tar])
AC_SUBST([am__untar])
]) # _AM_PROG_TAR

# LB_CHECK_FILE
#
# Check for file existance even when cross compiling
#
AC_DEFUN([LB_CHECK_FILE],
[AS_VAR_PUSHDEF([lb_File], [lb_cv_file_$1])dnl
AC_CACHE_CHECK([for $1], lb_File,
[if test -r "$1"; then
    AS_VAR_SET(lb_File, yes)
else
    AS_VAR_SET(lb_File, no)
fi])
AS_IF([test AS_VAR_GET(lb_File) = yes], [$2], [$3])[]dnl
AS_VAR_POPDEF([lb_File])dnl
])# LB_CHECK_FILE


#
# Support XEN
#
AC_DEFUN([SET_XEN_INCLUDES],
[
XEN_INCLUDES=
LB_LINUX_CONFIG([XEN],[XEN_INCLUDES="-I$LINUX/arch/x86/include/mach-xen"],[])
LB_LINUX_CONFIG_VALUE([XEN_INTERFACE_VERSION],[XEN_INCLUDES="$XEN_INCLUDES -D__XEN_INTERFACE_VERSION__=$res"],[XEN_INCLUDES="$XEN_INCLUDES -D__XEN_INTERFACE_VERSION__=$res"])
])

#
# LB_LINUX_VERSION
#
# Set things accordingly for a linux kernel
#
AC_DEFUN([LB_LINUX_VERSION],[
KMODEXT=".ko"

MODULE_TARGET="SUBDIRS"
makerule="$PWD/build"
AC_MSG_CHECKING([for external module build support])
rm -f build/conftest.i
LB_LINUX_TRY_MAKE([],[],
	[$makerule MLNX_KERNEL_TEST=conftest.i],
	[test -s build/conftest.i],
	[
		AC_MSG_RESULT([no])
	],[
		makerule="_module_$makerule"
		MODULE_TARGET="M"
		LB_LINUX_TRY_MAKE([],[],
			[$makerule MLNX_KERNEL_TEST=conftest.i],
			[test -s build/conftest.i],
			[
				AC_MSG_RESULT([yes])
			],[
				AC_MSG_ERROR([unknown; check config.log for details])
			])
	])

AC_SUBST(MODULE_TARGET)
AC_SUBST(KMODEXT)
])

#
# LB_LINUX_RELEASE
#
# get the release version of linux
#
AC_DEFUN([LB_LINUX_RELEASE],
[LINUXRELEASE=
rm -f build/conftest.i
AC_MSG_CHECKING([for Linux release])
if test -s $LINUX_OBJ/include/$AUTOCONF_HDIR/utsrelease.h ; then
	LINUXRELEASEHEADER=$AUTOCONF_HDIR/utsrelease.h
else
	LINUXRELEASEHEADER=linux/version.h
fi
LB_LINUX_TRY_MAKE([
	#include <$LINUXRELEASEHEADER>
],[
	char *LINUXRELEASE;
	LINUXRELEASE=UTS_RELEASE;
],[
	$makerule MLNX_KERNEL_TEST=conftest.i
],[
	test -s build/conftest.i
],[
	# LINUXRELEASE="UTS_RELEASE"
	eval $(grep "LINUXRELEASE=" build/conftest.i)
],[
	AC_MSG_RESULT([unknown])
	AC_MSG_ERROR([Could not preprocess test program.  Consult config.log for details.])
])
rm -f build/conftest.i
if test x$LINUXRELEASE = x ; then
	AC_MSG_RESULT([unknown])
	AC_MSG_ERROR([Could not determine Linux release version from linux/version.h.])
fi
AC_MSG_RESULT([$LINUXRELEASE])
AC_SUBST(LINUXRELEASE)

moduledir='/lib/modules/'$LINUXRELEASE/updates/kernel
AC_SUBST(moduledir)

modulefsdir='$(moduledir)/fs/$(PACKAGE)'
AC_SUBST(modulefsdir)

modulenetdir='$(moduledir)/net/$(PACKAGE)'
AC_SUBST(modulenetdir)

# ------------ RELEASE --------------------------------
AC_MSG_CHECKING([for MLNX release])
AC_ARG_WITH([release],
	AC_HELP_STRING([--with-release=string],
		       [set the release string (default=$kvers_YYYYMMDDhhmm)]),
	[RELEASE=$withval],
	RELEASE=""
	if test -n "$DOWNSTREAM_RELEASE"; then
		RELEASE="${DOWNSTREAM_RELEASE}_"
	fi
	RELEASE="$RELEASE`echo ${LINUXRELEASE} | tr '-' '_'`_$BUILDID")
AC_MSG_RESULT($RELEASE)
AC_SUBST(RELEASE)

# check is redhat/suse kernels
AC_MSG_CHECKING([that RedHat kernel])
LB_LINUX_TRY_COMPILE([
		#include <linux/version.h>
	],[
		#ifndef RHEL_RELEASE_CODE
		#error "not redhat kernel"
		#endif
	],[
		RHEL_KERNEL="yes"
		AC_MSG_RESULT([yes])
	],[
	        AC_MSG_RESULT([no])
])

LB_LINUX_CONFIG([SUSE_KERNEL],[SUSE_KERNEL="yes"],[])

])

# LB_ARG_REPLACE_PATH(PACKAGE, PATH)
AC_DEFUN([LB_ARG_REPLACE_PATH],[
	new_configure_args=
	eval "set x $ac_configure_args"
	shift
	for arg; do
		case $arg in
			--with-[$1]=*)
				arg=--with-[$1]=[$2]
				;;
			*\'*)
				arg=$(printf %s\n ["$arg"] | \
				      sed "s/'/'\\\\\\\\''/g")
				;;
		esac
		dnl AS_VAR_APPEND([new_configure_args], [" '$arg'"])
		new_configure_args="$new_configure_args \"$arg\""
	done
	ac_configure_args=$new_configure_args
])

# this is the work-horse of the next function
AC_DEFUN([__LB_ARG_CANON_PATH], [
	[$3]=$(readlink -f $with_$2)
	LB_ARG_REPLACE_PATH([$1], $[$3])
])

# a front-end for the above function that transforms - and . in the
# PACKAGE portion of --with-PACKAGE into _ suitable for variable names
AC_DEFUN([LB_ARG_CANON_PATH], [
	__LB_ARG_CANON_PATH([$1], m4_translit([$1], [-.], [__]), [$2])
])

#
#
# LB_LINUX_PATH
#
# Find paths for linux, handling kernel-source rpms
#
AC_DEFUN([LB_LINUX_PATH],
[# prep some default values
for DEFAULT_LINUX in /lib/modules/$(uname -r)/{source,build} /usr/src/linux; do
	if readlink -q -e $DEFAULT_LINUX; then
		break
	fi
done
if test "$DEFAULT_LINUX" = "/lib/modules/$(uname -r)/source"; then
	PATHS="/lib/modules/$(uname -r)/build"
fi
PATHS="$PATHS $DEFAULT_LINUX"
for DEFAULT_LINUX_OBJ in $PATHS; do
	if readlink -q -e $DEFAULT_LINUX_OBJ; then
		break
	fi
done
AC_MSG_CHECKING([for Linux sources])
AC_ARG_WITH([linux],
	AC_HELP_STRING([--with-linux=path],
		       [set path to Linux source (default=/lib/modules/$(uname -r)/{source,build},/usr/src/linux)]),
	[LB_ARG_CANON_PATH([linux], [LINUX])
	DEFAULT_LINUX_OBJ=$LINUX],
	[LINUX=$DEFAULT_LINUX])
AC_MSG_RESULT([$LINUX])
AC_SUBST(LINUX)

# -------- check for linux --------
LB_CHECK_FILE([$LINUX],[],
	[AC_MSG_ERROR([Kernel source $LINUX could not be found.])])

# -------- linux objects (for 2.6) --
AC_MSG_CHECKING([for Linux objects dir])
AC_ARG_WITH([linux-obj],
	AC_HELP_STRING([--with-linux-obj=path],
			[set path to Linux objects dir (default=/lib/modules/$(uname -r)/build,/usr/src/linux)]),
	[LB_ARG_CANON_PATH([linux-obj], [LINUX_OBJ])],
	[LINUX_OBJ=$DEFAULT_LINUX_OBJ])

AC_MSG_RESULT([$LINUX_OBJ])
AC_SUBST(LINUX_OBJ)

# -------- check for .config --------
AC_ARG_WITH([linux-config],
	[AC_HELP_STRING([--with-linux-config=path],
			[set path to Linux .conf (default=$LINUX_OBJ/.config)])],
	[LB_ARG_CANON_PATH([linux-config], [LINUX_CONFIG])],
	[LINUX_CONFIG=$LINUX_OBJ/.config])
AC_SUBST(LINUX_CONFIG)

LB_CHECK_FILE([/boot/kernel.h],
	[KERNEL_SOURCE_HEADER='/boot/kernel.h'],
	[LB_CHECK_FILE([/var/adm/running-kernel.h],
		[KERNEL_SOURCE_HEADER='/var/adm/running-kernel.h'])])

AC_ARG_WITH([kernel-source-header],
	AC_HELP_STRING([--with-kernel-source-header=path],
			[Use a different kernel version header.  Consult build/README.kernel-source for details.]),
	[LB_ARG_CANON_PATH([kernel-source-header], [KERNEL_SOURCE_HEADER])])

# ------------ .config exists ----------------
LB_CHECK_FILE([$LINUX_CONFIG],[],
	[AC_MSG_ERROR([Kernel config could not be found.  If you are building from a kernel-source rpm consult build/README.kernel-source])])

# ----------- make dep run? ------------------
# at 2.6.19 # $LINUX/include/linux/config.h is removed
# and at more old has only one line
# include <autoconf.h>
LB_CHECK_FILE([$LINUX_OBJ/include/generated/autoconf.h],[AUTOCONF_HDIR=generated],
        [LB_CHECK_FILE([$LINUX_OBJ/include/linux/autoconf.h],[AUTOCONF_HDIR=linux],
	[AC_MSG_ERROR([Run make config in $LINUX.])])])
        AC_SUBST(AUTOCONF_HDIR)

# ----------- kconfig.h exists ---------------
# kernel 3.1, $LINUX/include/linux/kconfig.h is added
# see kernel commit 2a11c8ea20bf850b3a2c60db8c2e7497d28aba99
LB_CHECK_FILE([$LINUX/include/linux/kconfig.h],
              [CONFIG_INCLUDE=$LINUX/include/linux/kconfig.h],
              [CONFIG_INCLUDE=$LINUX/include/$AUTOCONF_HDIR/kconfig.h])
	AC_SUBST(CONFIG_INCLUDE)

if test -e $CONFIG_INCLUDE; then
	CONFIG_INCLUDE_FLAG="-include $CONFIG_INCLUDE"
fi

# ------------ rhconfig.h includes runtime-generated bits --
# red hat kernel-source checks

# we know this exists after the check above.  if the user
# tarred up the tree and ran make dep etc. in it, then
# version.h gets overwritten with a standard linux one.
#
if (grep -q rhconfig $LINUX_OBJ/include/linux/version.h 2>/dev/null) ||
   (grep -q rhconfig $LINUX_OBJ/include/generated/uapi/linux/version.h 2>/dev/null) ; then
	# This is a clean kernel-source tree, we need to
	# enable extensive workarounds to get this to build
	# modules
	LB_CHECK_FILE([$KERNEL_SOURCE_HEADER],
		[if test $KERNEL_SOURCE_HEADER = '/boot/kernel.h' ; then
			AC_MSG_WARN([Using /boot/kernel.h from RUNNING kernel.])
			AC_MSG_WARN([If this is not what you want, use --with-kernel-source-header.])
			AC_MSG_WARN([Consult build/README.kernel-source for details.])
		fi],
		[AC_MSG_ERROR([$KERNEL_SOURCE_HEADER not found.  Consult build/README.kernel-source for details.])])
	EXTRA_KCFLAGS="-include $KERNEL_SOURCE_HEADER $EXTRA_KCFLAGS"
fi

# this is needed before we can build modules
SET_BUILD_ARCH
LB_LINUX_CROSS
LB_LINUX_VERSION
SET_XEN_INCLUDES

# --- check that we can build modules at all
AC_MSG_CHECKING([that modules can be built at all])
LB_LINUX_TRY_COMPILE([],[],[
	AC_MSG_RESULT([yes])
],[
	AC_MSG_RESULT([no])
	AC_MSG_WARN([Consult config.log for details.])
	AC_MSG_WARN([If you are trying to build with a kernel-source rpm, consult build/README.kernel-source])
	AC_MSG_ERROR([Kernel modules cannot be built.])
])

LB_LINUX_RELEASE
]) # end of LB_LINUX_PATH

# LB_LINUX_SYMVERFILE
# SLES 9 uses a different name for this file - unsure about vanilla kernels
# around this version, but it matters for servers only.
AC_DEFUN([LB_LINUX_SYMVERFILE],
	[AC_MSG_CHECKING([name of module symbol version file])
	if grep -q Modules.symvers $LINUX/scripts/Makefile.modpost ; then
		SYMVERFILE=Modules.symvers
	else
		SYMVERFILE=Module.symvers
	fi
	AC_MSG_RESULT($SYMVERFILE)
	AC_SUBST(SYMVERFILE)
])

#
# LB_LINUX_CROSS
#
# check for cross compilation
#
AC_DEFUN([LB_LINUX_CROSS],
	[AC_MSG_CHECKING([for cross compilation])
CROSS_VARS=
case $target_vendor in
	# The K1OM architecture is an extension of the x86 architecture.
	# So, the $target_arch is x86_64.
	k1om)
		AC_MSG_RESULT([Intel(R) Xeon Phi(TM)])
		CC_TARGET_ARCH=`$CC -v 2>&1 | grep Target: | sed -e 's/Target: //'`
		if test $CC_TARGET_ARCH != x86_64-$target_vendor-linux ; then
			AC_MSG_ERROR([Cross compiler not found in PATH.])
		fi
		CROSS_VARS="ARCH=$target_vendor CROSS_COMPILE=x86_64-$target_vendor-linux-"
		CCAS=$CC
		if test x$enable_server = xyes ; then
			AC_MSG_WARN([Disabling server (not supported for x86_64-$target_vendor-linux).])
			enable_server='no'
		fi
		;;
	*)
		CROSS_VARS="CROSS_COMPILE=$CROSS_COMPILE"
		AC_MSG_RESULT([no])
		;;
esac
AC_SUBST(CROSS_VARS)
])

# these are like AC_TRY_COMPILE, but try to build modules against the
# kernel, inside the build directory

# LB_LANG_PROGRAM(C)([PROLOGUE], [BODY])
# --------------------------------------
m4_define([LB_LANG_PROGRAM],
[
#include <linux/kernel.h>
$1
int
main (void)
{
dnl Do *not* indent the following line: there may be CPP directives.
dnl Don't move the `;' right after for the same reason.
$2
  ;
  return 0;
}])

#
# LB_LINUX_COMPILE_IFELSE
#
# like AC_COMPILE_IFELSE
#
AC_DEFUN([LB_LINUX_COMPILE_IFELSE],
[m4_ifvaln([$1], [AC_LANG_CONFTEST([$1])])dnl
MAKE=${MAKE:-make}
rm -f build/conftest.o build/conftest.mod.c build/conftest.ko build/output.log
AS_IF([AC_TRY_COMMAND(cp conftest.c build && env $CROSS_VARS $MAKE -d [$2] ${LD:+"LD=$CROSS_COMPILE$LD"} CC="$CROSS_COMPILE$CC" -f $PWD/build/Makefile MLNX_LINUX_CONFIG=$LINUX_CONFIG CONFIG_CC_STACKPROTECTOR_STRONG= LINUXINCLUDE="-include $AUTOCONF_HDIR/autoconf.h $XEN_INCLUDES $EXTRA_MLNX_INCLUDE -I$LINUX/arch/$SRCARCH/include -Iarch/$SRCARCH/include/generated -Iinclude -I$LINUX/arch/$SRCARCH/include/uapi -Iarch/$SRCARCH/include/generated/uapi -I$LINUX/include -I$LINUX/include/uapi -Iinclude/generated/uapi  -I$LINUX/arch/$SRCARCH/include -Iarch/$SRCARCH/include/generated -I$LINUX/arch/$SRCARCH/include -I$LINUX/arch/$SRCARCH/include/generated -I$LINUX_OBJ/include -I$LINUX/include -I$LINUX_OBJ/include2 $CONFIG_INCLUDE_FLAG" -o tmp_include_depends -o scripts -o include/config/MARKER -C $LINUX_OBJ EXTRA_CFLAGS="-Werror-implicit-function-declaration -Wno-unused-variable -Wno-uninitialized $EXTRA_KCFLAGS" $CROSS_VARS $MODULE_TARGET=$PWD/build >/dev/null 2>build/output.log; [[[ $? -ne 0 ]]] && cat build/output.log 1>&2 && false || config/warning_filter.sh build/output.log) >/dev/null && AC_TRY_COMMAND([$3])],
	[$4],
	[_AC_MSG_LOG_CONFTEST
m4_ifvaln([$5],[$5])dnl])
rm -f build/conftest.o build/conftest.mod.c build/conftest.mod.o build/conftest.ko m4_ifval([$1], [build/conftest.c conftest.c])[]dnl
])

#
# LB_LINUX_ARCH
#
# Determine the kernel's idea of the current architecture
#
AC_DEFUN([LB_LINUX_ARCH],
         [AC_MSG_CHECKING([Linux kernel architecture])
          AS_IF([rm -f $PWD/build/arch
                 make -s --no-print-directory echoarch -f $PWD/build/Makefile \
                     MLNX_LINUX_CONFIG=$LINUX_CONFIG -C $LINUX $CROSS_VARS  \
                     ARCHFILE=$PWD/build/arch && LINUX_ARCH=`cat $PWD/build/arch`],
                [AC_MSG_RESULT([$LINUX_ARCH])],
                [AC_MSG_ERROR([Could not determine the kernel architecture.])])
          rm -f build/arch])

#
# LB_LINUX_TRY_COMPILE
#
# like AC_TRY_COMPILE
#
AC_DEFUN([LB_LINUX_TRY_COMPILE],
[LB_LINUX_COMPILE_IFELSE(
	[AC_LANG_SOURCE([LB_LANG_PROGRAM([[$1]], [[$2]])])],
	[modules],
	[test -s build/conftest.o],
	[$3], [$4])])

#
# LB_LINUX_CONFIG
#
# check if a given config option is defined
#
AC_DEFUN([LB_LINUX_CONFIG],[
	AC_MSG_CHECKING([if Linux was built with CONFIG_$1])
	LB_LINUX_TRY_COMPILE([
		#include <$AUTOCONF_HDIR/autoconf.h>
	],[
		#ifndef CONFIG_$1
		#error CONFIG_$1 not #defined
		#endif
	],[
		AC_MSG_RESULT([yes])
		$2
	],[
		AC_MSG_RESULT([no])
		$3
	])
])

#
# LB_LINUX_CONFIG_IM
#
# check if a given config option is builtin or as module
#
AC_DEFUN([LB_LINUX_CONFIG_IM],[
	AC_MSG_CHECKING([if Linux was built with CONFIG_$1 in or as module])
	LB_LINUX_TRY_COMPILE([
		#include <$AUTOCONF_HDIR/autoconf.h>
	],[
		#if !(defined(CONFIG_$1) || defined(CONFIG_$1_MODULE))
		#error CONFIG_$1 and CONFIG_$1_MODULE not #defined
		#endif
	],[
		AC_MSG_RESULT([yes])
		$2
	],[
		AC_MSG_RESULT([no])
		$3
	])
])

#
# LB_LINUX_TRY_MAKE
#
# like LB_LINUX_TRY_COMPILE, but with different arguments
#
AC_DEFUN([LB_LINUX_TRY_MAKE],
	[LB_LINUX_COMPILE_IFELSE(
		[AC_LANG_SOURCE([LB_LANG_PROGRAM([[$1]], [[$2]])])],
		[$3], [$4], [$5], [$6]
	)]
)

#
# LB_CONFIG_COMPAT_RDMA
#
AC_DEFUN([LB_CONFIG_COMPAT_RDMA],
[AC_MSG_CHECKING([whether to use Compat RDMA])
# set default
AC_ARG_WITH([o2ib],
	AC_HELP_STRING([--with-o2ib=path],
		       [build o2iblnd against path]),
	[
		case $with_o2ib in
		yes)    O2IBPATHS="$LINUX $LINUX/drivers/infiniband"
			ENABLEO2IB=2
			;;
		no)     ENABLEO2IB=0
			;;
		*)      O2IBPATHS=$with_o2ib
			ENABLEO2IB=3
			;;
		esac
	],[
		O2IBPATHS="$LINUX $LINUX/drivers/infiniband"
		ENABLEO2IB=1
	])
if test $ENABLEO2IB -eq 0; then
	AC_MSG_RESULT([no])
else
	o2ib_found=false
	for O2IBPATH in $O2IBPATHS; do
		if test \( -f ${O2IBPATH}/include/rdma/rdma_cm.h -a \
			   -f ${O2IBPATH}/include/rdma/ib_cm.h -a \
			   -f ${O2IBPATH}/include/rdma/ib_verbs.h -a \
			   -f ${O2IBPATH}/include/rdma/ib_fmr_pool.h \); then
			o2ib_found=true
			break
		fi
	done
	compatrdma_found=false
	if $o2ib_found; then
		if test \( -f ${O2IBPATH}/include/linux/compat-2.6.h \); then
			compatrdma_found=true
			AC_MSG_RESULT([yes])
			AC_DEFINE(HAVE_COMPAT_RDMA, 1, [compat rdma found])
		else
			AC_MSG_RESULT([no])
		fi
	fi
fi
])

#
# LB_CONFIG_OFED_BACKPORTS
#
# include any OFED backport headers in all compile commands
# NOTE: this does only include the backport paths, not the OFED headers
#       adding the OFED headers is done in the lnet portion
AC_DEFUN([LB_CONFIG_OFED_BACKPORTS],
[AC_MSG_CHECKING([whether to use any OFED backport headers])
if test $ENABLEO2IB -eq 0; then
	AC_MSG_RESULT([no])
else
	if ! $o2ib_found; then
		AC_MSG_RESULT([no])
		case $ENABLEO2IB in
			1) ;;
			2) AC_MSG_ERROR([kernel OpenIB gen2 headers not present]);;
			3) AC_MSG_ERROR([bad --with-o2ib path]);;
			*) AC_MSG_ERROR([internal error]);;
		esac
	else
		if ! $compatrdma_found; then
                	if test -f $O2IBPATH/config.mk; then
				. $O2IBPATH/config.mk
			elif test -f $O2IBPATH/ofed_patch.mk; then
				. $O2IBPATH/ofed_patch.mk
			fi
		fi
		if test -n "$BACKPORT_INCLUDES"; then
			OFED_BACKPORT_PATH="$O2IBPATH/${BACKPORT_INCLUDES/*\/kernel_addons/kernel_addons}/"
			EXTRA_LNET_INCLUDE="-I$OFED_BACKPORT_PATH $EXTRA_LNET_INCLUDE"
			AC_MSG_RESULT([yes])
		else
			AC_MSG_RESULT([no])
		fi
	fi
fi
])

# LC_MODULE_LOADING
# after 2.6.28 CONFIG_KMOD is removed, and only CONFIG_MODULES remains
# so we test if request_module is implemented or not
AC_DEFUN([LC_MODULE_LOADING],
[AC_MSG_CHECKING([if kernel module loading is possible])
LB_LINUX_TRY_MAKE([
	#include <linux/kmod.h>
],[
	int myretval=ENOSYS ;
	return myretval;
],[
	$makerule MLNX_KERNEL_TEST=conftest.i
],[dnl
	grep request_module build/conftest.i |dnl
		grep -v `grep "int myretval=" build/conftest.i |dnl
			cut -d= -f2 | cut -d" "  -f1`dnl
		>/dev/null dnl
],[
	AC_MSG_RESULT(yes)
	AC_DEFINE(HAVE_MODULE_LOADING_SUPPORT, 1,
		  [kernel module loading is possible])
],[
	AC_MSG_RESULT(no)
	AC_MSG_WARN([])
	AC_MSG_WARN([Kernel module loading support is highly recommended.])
	AC_MSG_WARN([])
])
])

#
# LB_PROG_LINUX
#
# linux tests
#
AC_DEFUN([LB_PROG_LINUX],
[LB_LINUX_PATH
LB_LINUX_ARCH
LB_LINUX_SYMVERFILE


LB_LINUX_CONFIG([MODULES],[],[
	AC_MSG_ERROR([module support is required to build MLNX kernel modules.])
])

LB_LINUX_CONFIG([MODVERSIONS])

LB_LINUX_CONFIG([KALLSYMS],[],[
	AC_MSG_ERROR([compat_mlnx requires that CONFIG_KALLSYMS is enabled in your kernel.])
])

# 2.6.28
LC_MODULE_LOADING

LB_CONFIG_COMPAT_RDMA

# it's ugly to be doing anything with OFED outside of the lnet module, but
# this has to be done here so that the backports path is set before all of
# the LN_PROG_LINUX checks are done
LB_CONFIG_OFED_BACKPORTS
])

#
# LB_CHECK_SYMBOL_EXPORT
# check symbol exported or not
# $1 - symbol
# $2 - file(s) for find.
# $3 - do 'yes'
# $4 - do 'no'
#
# 2.6 based kernels - put modversion info into $LINUX_OBJ/Module.modvers
# or check
AC_DEFUN([LB_CHECK_SYMBOL_EXPORT],
[AC_MSG_CHECKING([if Linux was built with symbol $1 exported])
grep -q -E '[[[:space:]]]$1[[[:space:]]]' $LINUX_OBJ/$SYMVERFILE 2>/dev/null
rc=$?
if test $rc -ne 0; then
	export=0
	for file in $2; do
		grep -q -E "EXPORT_SYMBOL.*\($1\)" "$LINUX/$file" 2>/dev/null
		rc=$?
		if test $rc -eq 0; then
			export=1
			break;
		fi
	done
	if test $export -eq 0; then
		AC_MSG_RESULT([no])
		$4
	else
		AC_MSG_RESULT([yes])
		$3
	fi
else
	AC_MSG_RESULT([yes])
	$3
fi
])

#
# Like AC_CHECK_HEADER but checks for a kernel-space header
#
m4_define([LB_CHECK_LINUX_HEADER],
[AS_VAR_PUSHDEF([ac_Header], [ac_cv_header_$1])dnl
AC_CACHE_CHECK([for $1], ac_Header,
	       [LB_LINUX_COMPILE_IFELSE([LB_LANG_PROGRAM([@%:@include <$1>])],
				  [modules],
				  [test -s build/conftest.o],
				  [AS_VAR_SET(ac_Header, [yes])],
				  [AS_VAR_SET(ac_Header, [no])])])
AS_IF([test AS_VAR_GET(ac_Header) = yes], [$2], [$3])[]dnl
AS_VAR_POPDEF([ac_Header])dnl
])

#
# LB_USES_DPKG
#
# Determine if the target is a dpkg system or rpm
#
AC_DEFUN([LB_USES_DPKG],
[
AC_MSG_CHECKING([if this distro uses dpkg])
case `lsb_release -i -s 2>/dev/null` in
        Ubuntu | Debian)
                AC_MSG_RESULT([yes])
                uses_dpkg=yes
                ;;
        *)
                AC_MSG_RESULT([no])
                uses_dpkg=no
                ;;
esac
])

#
# LB_PROG_CC
#
# checks on the C compiler
#
AC_DEFUN([LB_PROG_CC],
[AC_PROG_RANLIB
AC_CHECK_TOOL(LD, ld, [no])
AC_CHECK_TOOL(OBJDUMP, objdump, [no])
AC_CHECK_TOOL(STRIP, strip, [no])

# ---------  unsigned long long sane? -------
AC_CHECK_SIZEOF(unsigned long long, 0)
echo "---> size SIZEOF $SIZEOF_unsigned_long_long"
echo "---> size SIZEOF $ac_cv_sizeof_unsigned_long_long"
if test $ac_cv_sizeof_unsigned_long_long != 8 ; then
	AC_MSG_ERROR([** we assume that sizeof(long long) == 8.])
fi

if test $target_cpu == "powerpc64"; then
	AC_MSG_WARN([set compiler with -m64])
	CFLAGS="$CFLAGS -m64"
	CC="$CC -m64"
fi
])

# LB_CONTITIONALS
#
AC_DEFUN([LB_CONDITIONALS],
[
AM_CONDITIONAL(ARCH_x86, test x$target_cpu = "xx86_64" -o x$target_cpu = "xi686")

AC_OUTPUT

cat <<_ACEOF

CC:            $CC
LD:            $LD
CFLAGS:        $CFLAGS
EXTRA_KCFLAGS: $EXTRA_KCFLAGS

Type 'make' to build kernel modules.
_ACEOF
])

#
# SET_BUILD_ARCH
#
AC_DEFUN([SET_BUILD_ARCH],
[
AC_MSG_CHECKING([for build ARCH])
SRCARCH=${ARCH:-$(uname -m)}
SRCARCH=$(echo $SRCARCH | sed -e s/i.86/x86/ \
			-e s/x86_64/x86/ \
			-e s/ppc.*/powerpc/ \
			-e 's/powerpc64/powerpc/' \
			-e s/aarch64.*/arm64/ \
			-e s/sparc32.*/sparc/ \
			-e s/sparc64.*/sparc/ \
			-e s/s390x/s390/)

# very old kernels had different strucure under arch dir
if [[ "X$SRCARCH" == "Xx86" ]] && ! [[ -d "$LINUX/arch/x86" ]]; then
	SRCARCH=x86_64
fi

AC_MSG_RESULT([ARCH=$ARCH, SRCARCH=$SRCARCH])
])

#
# LB_LINUX_CONFIG_VALUE
#
#  get a given config's option value
#
AC_DEFUN([LB_LINUX_CONFIG_VALUE],[
	AC_MSG_CHECKING([get value of CONFIG_$1])
	if (grep -q "^#define CONFIG_$1 " $LINUX_OBJ/include/$AUTOCONF_HDIR/autoconf.h 2>/dev/null); then
		res=$(grep "^#define CONFIG_$1 " $LINUX_OBJ/include/$AUTOCONF_HDIR/autoconf.h 2>/dev/null | cut -d' ' -f'3')
		AC_MSG_RESULT([$1 value is '$res'])
		$2
	else
		AC_MSG_RESULT([$1 in not defined in autoconf.h])
		$3
	fi
])

#
# This file defines macros used to manage and support running
# build tests in parallel.
#

#
# Prepare stuff for parralel build jobs process
#
AC_DEFUN([MLNX_PARALLEL_INIT_ONCE],
[
if [[ "X${RAN_MLNX_PARALLEL_INIT_ONCE}" != "X1" ]]; then
	MAX_JOBS=${NJOBS:-1}
	RAN_MLNX_PARALLEL_INIT_ONCE=1
	/bin/rm -rf CONFDEFS_H_DIR
	/bin/mkdir -p CONFDEFS_H_DIR
	declare -i CONFDEFS_H_INDEX=0
	declare -i RUNNING_JOBS=0
fi
])

#
# MLNX_AC_DEFINE(VARIABLE, [VALUE], [DESCRIPTION])
# -------------------------------------------
# Set VARIABLE to VALUE, verbatim, or 1.  Remember the value
# and if VARIABLE is affected the same VALUE, do nothing, else
# die.  The third argument is used by autoheader.
m4_define([MLNX_AC_DEFINE], [_MLNX_AC_DEFINE_Q([\], $@)])


# _MLNX_AC_DEFINE_Q(QUOTE, VARIABLE, [VALUE], [DESCRIPTION])
# -----------------------------------------------------
# Internal function that performs common elements of AC_DEFINE{,_UNQUOTED}.
#
# m4_index is roughly 5 to 8 times faster than m4_bpatsubst, so only
# use the regex when necessary.  AC_name is defined with over-quotation,
# so that we can avoid m4_defn.
m4_define([_MLNX_AC_DEFINE_Q],
[m4_pushdef([AC_name], m4_if(m4_index([$2], [(]), [-1], [[[$2]]],
			     [m4_bpatsubst([[[$2]]], [(.*)])]))dnl
AC_DEFINE_TRACE(AC_name)dnl
m4_cond([m4_index([$3], [
])], [-1], [],
	[AS_LITERAL_IF([$3], [m4_bregexp([[$3]], [[^\\]
], [-])])], [], [],
	[m4_warn([syntax], [AC_DEFINE]m4_ifval([$1], [], [[_UNQUOTED]])dnl
[: `$3' is not a valid preprocessor define value])])dnl
m4_ifval([$4], [AH_TEMPLATE(AC_name, [$4])])dnl
cat >>CONFDEFS_H_DIR/confdefs.h.${CONFDEFS_H_INDEX} <<$1_ACEOF
[@%:@define] $2 m4_if([$#], 2, 1, [$3], [], [/**/], [$3])
_ACEOF
])

# MLNX_AC_LANG_SOURCE(C)(BODY)
# -----------------------
# We can't use '#line $LINENO "configure"' here, since
# Sun c89 (Sun WorkShop 6 update 2 C 5.3 Patch 111679-08 2002/05/09)
# rejects $LINENO greater than 32767, and some configure scripts
# are longer than 32767 lines.
m4_define([MLNX_AC_LANG_SOURCE(C)],
[/* confdefs.h.  */
_ACEOF
cat confdefs.h >>$tmpbuild/conftest.$ac_ext
cat >>$tmpbuild/conftest.$ac_ext <<_ACEOF
/* end confdefs.h.  */
$1])

# MLNX_AC_LANG_SOURCE(BODY)
# --------------------
# Produce a valid source for the current language, which includes the
# BODY, and as much as possible `confdefs.h'.
AC_DEFUN([MLNX_AC_LANG_SOURCE],
[_AC_LANG_DISPATCH([$0], _AC_LANG, $@)])


# MLNX_AC_LANG_CONFTEST(BODY)
# ----------------------
# Save the BODY in `conftest.$ac_ext'.  Add a trailing new line.
AC_DEFUN([MLNX_AC_LANG_CONFTEST],
[cat >$tmpbuild/conftest.$ac_ext <<_ACEOF
$1
_ACEOF])

# _MLNX_AC_MSG_LOG_CONFTEST
# --------------------
m4_define([_MLNX_AC_MSG_LOG_CONFTEST],
[AS_ECHO(["$as_me: failed program was:"]) >&AS_MESSAGE_LOG_FD
sed 's/^/| /' $tmpbuild/conftest.$ac_ext >&AS_MESSAGE_LOG_FD
])


#
# MLNX_LB_LINUX_COMPILE_IFELSE
#
# like AC_COMPILE_IFELSE.
# runs in a temp dir
#
AC_DEFUN([MLNX_LB_LINUX_COMPILE_IFELSE],
[
{
MAKE=${MAKE:-make}
tmpbuild=$(/bin/mktemp -d $PWD/build/build_XXXXX)
/bin/cp build/Makefile $tmpbuild/
m4_ifvaln([$1], [MLNX_AC_LANG_CONFTEST([$1])])dnl
AS_IF([AC_TRY_COMMAND(env $CROSS_VARS $MAKE -d [$2] ${LD:+"LD=$CROSS_COMPILE$LD"} CC="$CROSS_COMPILE$CC" -f $tmpbuild/Makefile MLNX_LINUX_CONFIG=$LINUX_CONFIG CONFIG_CC_STACKPROTECTOR_STRONG= LINUXINCLUDE="-include $AUTOCONF_HDIR/autoconf.h $XEN_INCLUDES $EXTRA_MLNX_INCLUDE -I$LINUX/arch/$SRCARCH/include -Iarch/$SRCARCH/include/generated -Iinclude -I$LINUX/arch/$SRCARCH/include/uapi -Iarch/$SRCARCH/include/generated/uapi -I$LINUX/include -I$LINUX/include/uapi -Iinclude/generated/uapi  -I$LINUX/arch/$SRCARCH/include -Iarch/$SRCARCH/include/generated -I$LINUX/arch/$SRCARCH/include -I$LINUX/arch/$SRCARCH/include/generated -I$LINUX_OBJ/include -I$LINUX/include -I$LINUX_OBJ/include2 $CONFIG_INCLUDE_FLAG" -o tmp_include_depends -o scripts -o include/config/MARKER -C $LINUX_OBJ EXTRA_CFLAGS="-Werror-implicit-function-declaration -Wno-unused-variable -Wno-uninitialized $EXTRA_KCFLAGS" $CROSS_VARS $MODULE_TARGET=$tmpbuild >/dev/null 2>$tmpbuild/output.log; [[[ $? -ne 0 ]]] && cat $tmpbuild/output.log 1>&2 && false || config/warning_filter.sh $tmpbuild/output.log) >/dev/null && AC_TRY_COMMAND([$3])],
	[$4],
	[_MLNX_AC_MSG_LOG_CONFTEST
m4_ifvaln([$5],[$5])dnl])
/bin/rm -rf $tmpbuild
}
])

#
# MLNX_LB_LINUX_TRY_COMPILE
#
# like AC_TRY_COMPILE
#
AC_DEFUN([MLNX_LB_LINUX_TRY_COMPILE],
[MLNX_LB_LINUX_COMPILE_IFELSE(
	[MLNX_AC_LANG_SOURCE([LB_LANG_PROGRAM([[$1]], [[$2]])])],
	[modules],
	[test -s $tmpbuild/conftest.o],
	[$3], [$4])])

# MLNX_BG_LB_LINUX_COMPILE_IFELSE
#
# Do fork and call LB_LINUX_COMPILE_IFELSE
# to run the build test in background
#
AC_DEFUN([MLNX_BG_LB_LINUX_TRY_COMPILE],
[
# init stuff
MLNX_PARALLEL_INIT_ONCE

# wait if there are MAX_JOBS tests running
if [[ $RUNNING_JOBS -eq $MAX_JOBS ]]; then
	wait
	RUNNING_JOBS=0
else
	let RUNNING_JOBS++
fi

# inc header index
let CONFDEFS_H_INDEX++

# run test in background if MAX_JOBS > 1
if [[ $MAX_JOBS -eq 1 ]]; then
MLNX_LB_LINUX_TRY_COMPILE([$1], [$2], [$3], [$4])
else
{
MLNX_LB_LINUX_TRY_COMPILE([$1], [$2], [$3], [$4])
}&
fi
])


dnl Examine kernel functionality
AC_DEFUN([LINUX_CONFIG_COMPAT],
[
	AC_MSG_CHECKING([if has netdev_notifier_info_to_dev])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
	#include <linux/netdevice.h>
	],[
		return netdev_notifier_info_to_dev(NULL) ? 1 : 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_NETDEV_NOTIFIER_INFO_TO_DEV, 1,
			[netdev_notifier_info_to_dev is defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if mm has register_netdevice_notifier_rh])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
	#include <linux/netdevice.h>
	],[
		return register_netdevice_notifier_rh(NULL);
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_REGISTER_NETDEVICE_NOTIFIER_RH, 1,
			[register_netdevice_notifier_rh is defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if linux/mm.h has get_user_pages_longterm])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/mm.h>
	],[
		get_user_pages_longterm(0, 0, 0, NULL, NULL);

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_GET_USER_PAGES_LONGTERM, 1,
			[get_user_pages_longterm is defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if get_user_pages uses gup flags])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/mm.h>
	],[
		unsigned long start;
		unsigned long nr_pages;
		unsigned int gup_flags;
		struct page **page_list;
		struct vm_area_struct **vmas;
		int ret;

		ret = get_user_pages(start, nr_pages, gup_flags, page_list,
					vmas);
		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_GET_USER_PAGES_GUP_FLAGS, 1,
			[get_user_pages uses gup_flags])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if string.h has memchr_inv])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
	#include <linux/string.h>
	],[
		memchr_inv(NULL, 0, 0);

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_MEMCHR_INV, 1,
		[memchr_inv is defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if string.h has memcpy_and_pad])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
	#include <linux/string.h>
	],
	[
		memcpy_and_pad(NULL, 0, NULL, 0, ' ');

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_MEMCPY_AND_PAD, 1,
		[memcpy_and_pad is defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if ip6_fib.h has ip6_rt_put])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
	#include <uapi/linux/in6.h>
	#include <net/ip6_fib.h>
	],[
		ip6_rt_put(NULL);

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_IP6_RT_PUT, 1,
		[ip6_rt_put is defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if net_namespace.h has pernet_operations_id])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
	#include <net/net_namespace.h>
	],[
		int cma_pernet_id = 0;
		int ret;

		struct pernet_operations test = {
			.id = &cma_pernet_id,
		};

		ret = register_pernet_subsys(&test);
		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_PERENT_OPERATIONS_ID, 1,
		[pernet_operations_id is defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if rtble has direct dst])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
	#include <net/route.h>
	],[
		struct rtable *rt;
		struct dst_entry *dst = NULL;

                rt = container_of(dst, struct rtable, dst);
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_RT_DIRECT_DST, 1,
		[rtble has direct dst])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if mm has get_user_pages_remote with 7 parameters])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
	#include <linux/mm.h>
	],[
		get_user_pages_remote(NULL, NULL, 0, 0, 0, NULL, NULL);

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_GET_USER_PAGES_REMOTE_7_PARAMS, 1,
			[get_user_pages_remote is defined with 7 parameters])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if mm has get_user_pages_remote with 8 parameters])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
	#include <linux/mm.h>
	],[
		get_user_pages_remote(NULL, NULL, 0, 0, 0, 0, NULL, NULL);

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_GET_USER_PAGES_REMOTE_8_PARAMS, 1,
			[get_user_pages_remote is defined with 8 parameters])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if mm has get_user_pages_remote with 8 parameters with locked])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
	#include <linux/mm.h>
	],[
		get_user_pages_remote(NULL, NULL, 0, 0, 0, NULL, NULL, NULL);

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_GET_USER_PAGES_REMOTE_8_PARAMS_W_LOCKED, 1,
			[get_user_pages_remote is defined with 8 parameters with locked])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if kernel has ktime_get_ns])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/ktime.h>
	],[
		unsigned long long ns;

		ns = ktime_get_ns();
		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_KTIME_GET_NS, 1,
			  [ktime_get_ns defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if if_vlan.h has __vlan_get_protocol])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/if_vlan.h>
	],[
		__vlan_get_protocol(NULL, 0, NULL);

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_VLAN_GET_PROTOCOL, 1,
			  [__vlan_get_protocol defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if page_ref.h has page_ref_count/add/sub/inc])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/page_ref.h>
	],[
		page_ref_count(NULL);
		page_ref_add(NULL, 0);
		page_ref_sub(NULL, 0);
		page_ref_inc(NULL);

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_PAGE_REF_COUNT_ADD_SUB_INC, 1,
			  [page_ref_count/add/sub/inc defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if struct ifla_vf_info exists])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/if_link.h>
	],[
		struct ifla_vf_info ivf;

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_IFLA_VF_INFO, 1,
			  [struct ifla_vf_info is defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if struct ifla_vf_info has tx_rate])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/if_link.h>
	],[
		struct ifla_vf_info *ivf;

		ivf->max_tx_rate = 0;
		ivf->min_tx_rate = 0;

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_TX_RATE_LIMIT, 1,
			  [max_tx_rate is defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if struct net_device_ops has ndo_set_vf_tx_rate])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/netdevice.h>
	],[
		struct net_device_ops ndops = {
			.ndo_set_vf_tx_rate = NULL,
		};

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_VF_TX_RATE, 1,
			  [ndo_set_vf_tx_rate is defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if struct net_device_ops has ndo_get_phys_port_name])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/netdevice.h>
	],[
		struct net_device_ops ndops = {
			.ndo_get_phys_port_name = NULL,
		};

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_NDO_GET_PHYS_PORT_NAME, 1,
			  [ndo_get_phys_port_name is defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if struct devlink_ops has eswitch_mode_get/set])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <net/devlink.h>
	],[
		struct devlink_ops dlops = {
			.eswitch_mode_get = NULL,
			.eswitch_mode_set = NULL,
		};

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_DEVLINK_HAS_ESWITCH_MODE_GET_SET, 1,
			  [eswitch_mode_get/set is defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if struct devlink_ops has eswitch_encap_mode_set/get])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <net/devlink.h>
	],[
		struct devlink_ops dlops = {
			.eswitch_encap_mode_set = NULL,
			.eswitch_encap_mode_get = NULL,
		};

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_DEVLINK_HAS_ESWITCH_ENCAP_MODE_SET, 1,
			  [eswitch_encap_mode_set/get is defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if struct devlink_ops has eswitch_inline_mode_get/set])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <net/devlink.h>
	],[
		struct devlink_ops dlops = {
			.eswitch_inline_mode_get = NULL,
			.eswitch_inline_mode_set = NULL,
		};

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_DEVLINK_HAS_ESWITCH_INLINE_MODE_GET_SET, 1,
			  [eswitch_inline_mode_get/set is defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if struct ifla_vf_info has vlan_proto])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/if_link.h>
	],[
		struct ifla_vf_info *ivf;

		ivf->vlan_proto = 0;

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_VF_VLAN_PROTO, 1,
			  [vlan_proto is defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if napi_gro_flush has 2 parameters])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/netdevice.h>
	],[
		napi_gro_flush(NULL, 0);

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(NAPI_GRO_FLUSH_2_PARAMS, 1,
			  [napi_gro_flush has 2 parameters])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if netdev_master_upper_dev_link gets 4 parameters])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/netdevice.h>
	],[
		netdev_master_upper_dev_link(NULL, NULL, NULL, NULL);

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(NETDEV_MASTER_UPPER_DEV_LINK_4_PARAMS, 1,
			  [netdev_master_upper_dev_link gets 4 parameters])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if struct ethtool_ops has get/set_rxfh])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/ethtool.h>
	],[
		const struct ethtool_ops en_ethtool_ops = {
			.get_rxfh_key_size = NULL,
			.get_rxfh = NULL,
			.set_rxfh = NULL,
		};

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_GET_SET_RXFH, 1,
			  [get/set_rxfh is defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if struct ethtool_ops has get_rxfh_indir_size])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/ethtool.h>
	],[
		const struct ethtool_ops en_ethtool_ops = {
			.get_rxfh_indir_size = NULL,
		};

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_RXFH_INDIR_SIZE, 1,
			[get_rxfh_indir_size is defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if struct ethtool_ops_ext has get_rxfh_indir_size])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/ethtool.h>
	],[
		const struct ethtool_ops_ext en_ethtool_ops_ext = {
			.get_rxfh_indir_size = NULL,
		};

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_RXFH_INDIR_SIZE_EXT, 1,
			[get_rxfh_indir_size is defined in ethtool_ops_ext])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if struct ethtool_ops has get/set_rxfh_indir])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/ethtool.h>

		int mlx4_en_get_rxfh_indir(struct net_device *d, u32 *r)
		{
			return 0;
		}
	],[
		struct ethtool_ops en_ethtool_ops;
		en_ethtool_ops.get_rxfh_indir = mlx4_en_get_rxfh_indir;

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_GET_SET_RXFH_INDIR, 1,
			[get/set_rxfh_indir is defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if ethtool has set_phys_id])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/ethtool.h>
	],[
		const struct ethtool_ops en_ethtool_ops = {
			.set_phys_id = NULL,
		};

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_SET_PHYS_ID, 1,
			  [set_phys_id is defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if struct ethtool_ops has get/set_tunable])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/ethtool.h>
	],[
		const struct ethtool_ops en_ethtool_ops = {
			.get_tunable = NULL,
			.set_tunable = NULL,
		};

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_GET_SET_TUNABLE, 1,
			  [get/set_tunable is defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if exist struct ethtool_ops_ext])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/ethtool.h>
	],[
		const struct ethtool_ops_ext en_ethtool_ops_ext = {
			.size = sizeof(struct ethtool_ops_ext),
		};

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_ETHTOOL_OPS_EXT, 1,
			  [struct ethtool_ops_ext is defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if exist struct ethtool_flow_ext])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/ethtool.h>
	],[
		struct ethtool_flow_ext en_ethtool_flow_ext;

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_ETHTOOL_FLOW_EXT, 1,
			  [struct ethtool_flow_ext is defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if exist union ethtool_flow_union])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/ethtool.h>
	],[
		union ethtool_flow_union test_ethtool_flow_union;

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_ETHTOOL_FLOW_UNION, 1,
			  [union ethtool_flow_union is defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if struct ethtool_ops_ext has get/set_rxfh_indir])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/ethtool.h>
	],[
		const struct ethtool_ops_ext en_ethtool_ops_ext = {
			.get_rxfh_indir = NULL,
			.set_rxfh_indir = NULL,
		};

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_GET_SET_RXFH_INDIR_EXT, 1,
			  [get/set_rxfh_indir is defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if ethtool.h has __ethtool_get_link_ksettings])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/ethtool.h>
	],[
		 __ethtool_get_link_ksettings(NULL, NULL);

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE___ETHTOOL_GET_LINK_KSETTINGS, 1,
			  [__ethtool_get_link_ksettings is defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if struct net_device has neigh_priv_len])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/netdevice.h>
	],[
		struct net_device *dev = NULL;

		dev->neigh_priv_len = 0;

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_NET_DEVICE_NEIGH_PRIV_LEN, 1,
			  [neigh_priv_len is defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if struct net_device has dev_port])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/netdevice.h>
	],[
		struct net_device *dev = NULL;

		dev->dev_port = 0;

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_NET_DEVICE_DEV_PORT, 1,
			  [dev_port is defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if struct net_device has min/max])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/netdevice.h>
	],[
		struct net_device *dev = NULL;

		dev->min_mtu = 0;
		dev->max_mtu = 0;

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_NET_DEVICE_MIN_MAX_MTU, 1,
			  [net_device min/max is defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if struct net_device has needs_free_netdev])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/netdevice.h>
	],[
		struct net_device *dev = NULL;

		dev->needs_free_netdev = true;
		dev->priv_destructor = NULL;
		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_NET_DEVICE_NEEDS_FREE_NETDEV, 1,
			  [net_device needs_free_netdev is defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if cleanup_srcu_struct_quiesced exists])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/srcu.h>
	],[
		cleanup_srcu_struct_quiesced(NULL);

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_CLEANUP_SRCU_STRUCT_QUIESCED, 1,
			  [linux/srcu.h cleanup_srcu_struct_quiesced is defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if struct netdev_xdp exists])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/netdevice.h>
	],[
		struct netdev_xdp xdp;
		xdp = xdp;

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_NETDEV_XDP, 1,
			  [struct netdev_xdp is defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if struct net_device_ops_extended has ndo_xdp])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/netdevice.h>
	],[
		struct net_device_ops_extended netdev_ops_extended = {
			.ndo_xdp = NULL,
		};

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_NDO_XDP_EXTENDED, 1,
			  [extended ndo_xdp is defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if struct netdev_bpf exists])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/netdevice.h>
	],[
		struct netdev_bpf nbpf;
		nbpf = nbpf;

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_NETDEV_BPF, 1,
			  [struct netdev_bpf is defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if struct tc_cls_flower_offload exists])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <net/pkt_cls.h>
	],[
		struct tc_cls_flower_offload x;
		x = x;

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_TC_FLOWER_OFFLOAD, 1,
			  [struct tc_cls_flower_offload is defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if struct tc_block_offload exists])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <net/pkt_cls.h>
	],[
		struct tc_block_offload x;
		x = x;

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_TC_BLOCK_OFFLOAD, 1,
			  [struct tc_block_offload is defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if  struct rhltable exists])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/rhashtable.h>
	],[
		struct rhltable x;
		x = x;

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_RHLTABLE, 1,
			  [struct rhltable is defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if struct ptp_clock_info exists])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/ptp_clock_kernel.h>
	],[
		struct ptp_clock_info info;

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_PTP_CLOCK_INFO, 1,
			  [ptp_clock_info is defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if struct ptp_clock_info has n_pins])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/ptp_clock_kernel.h>
	],[
		struct ptp_clock_info *info;
		info->n_pins = 0;

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_PTP_CLOCK_INFO_N_PINS, 1,
			  [n_pins is defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if struct ptp_clock_info has gettime])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/ptp_clock_kernel.h>
	],[
		struct ptp_clock_info info = {
			.gettime = NULL,
		};

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_PTP_CLOCK_INFO_GETTIME_32BIT, 1,
			  [gettime 32bit is defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if pci.h pci_enable_msix_range])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/pci.h>
	],[
		int x = pci_enable_msix_range(NULL, 0, 0, 0);

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_PCI_ENABLE_MSIX_RANGE, 1,
			  [pci_enable_msix_range is defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if pci.h pci_bus_addr_t])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/pci.h>
	],[
		pci_bus_addr_t x = 0;

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_PCI_BUS_ADDR_T, 1,
			  [pci_bus_addr_t is defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if pci.h pci_sriov_get_totalvfs])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/pci.h>
	],[
		int x = pci_sriov_get_totalvfs(NULL);

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_PCI_SRIOV_GET_TOTALVFS, 1,
			[pci_sriov_get_totalvfs is defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if mm.h has page_is_pfmemalloc])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/mm.h>
	],[
		bool x = page_is_pfmemalloc(NULL);

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_PAGE_IS_PFMEMALLOC, 1,
			[page_is_pfmemalloc is defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if netdevice.h has select_queue_fallback_t])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/netdevice.h>
	],[
		select_queue_fallback_t fallback;

		fallback = NULL;

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_SELECT_QUEUE_FALLBACK_T, 1,
			  [select_queue_fallback_t is defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if skbuff.h has skb_set_hash])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/skbuff.h>
	],[
		skb_set_hash(NULL, 0, PKT_HASH_TYPE_L3);

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_SKB_SET_HASH, 1,
			  [skb_set_hash is defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if skbuff.h has napi_alloc_skb])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/skbuff.h>
	],[
		napi_alloc_skb(NULL, 0);

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_NAPI_ALLOC_SKB, 1,
			  [napi_alloc_skb is defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if skbuff.h has skb_transport_header_was_set])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/skbuff.h>
	],[
		skb_transport_header_was_set(NULL);

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_SKB_TRANSPORT_HEADER_WAS_SET, 1,
			  [skb_transport_header_was_set is defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if struct request_queue has request_fn_active])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/blkdev.h>
	],[
		struct request_queue rq = {
			.request_fn_active = 0,
		};

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_REQUEST_QUEUE_REQUEST_FN_ACTIVE, 1,
			  [struct request_queue has request_fn_active])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if skbuff.h has build_skb])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/skbuff.h>
	],[
		 build_skb(NULL, 0);

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_BUILD_SKB, 1,
			  [build_skb is defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if skbuff.h has dev_alloc_pages])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/skbuff.h>
	],[
		dev_alloc_pages(0);

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_DEV_ALLOC_PAGES, 1,
			  [dev_alloc_pages is defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if skbuff.h has dev_alloc_page])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/skbuff.h>
	],[
		dev_alloc_page();

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_DEV_ALLOC_PAGE, 1,
			  [dev_alloc_page is defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if gfp.h has __alloc_pages_node])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/gfp.h>
	],[
		__alloc_pages_node(0, 0, 0);

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAS_ALLOC_PAGES_NODE, 1,
			  [__alloc_pages_node is defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if gfp.h has __GFP_DIRECT_RECLAIM])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/gfp.h>
	],[
		gfp_t gfp_mask = __GFP_DIRECT_RECLAIM;

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAS_GFP_DIRECT_RECLAIM, 1,
			  [__GFP_DIRECT_RECLAIM is defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if skbuff.h has skb_vlan_pop])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/skbuff.h>
	],[
		skb_vlan_pop(NULL);

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_SKB_VLAN_POP, 1,
			  [skb_vlan_pop is defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if skbuff.h has skb_pull_inline])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/skbuff.h>
	],[
		struct sk_buff skb;
		skb_pull_inline(&skb, 0);

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_SKB_PULL_INLINE, 1,
			  [skb_pull_inline is defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if sockios.h has SIOCGHWTSTAMP])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/sockios.h>
	],[
		int x = SIOCGHWTSTAMP;

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_SIOCGHWTSTAMP, 1,
			  [SIOCGHWTSTAMP is defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if ipv6_chk_addr accepts a const second parameter])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <net/addrconf.h>
	],[
		const struct sockaddr *addr;
		ipv6_chk_addr(NULL,
					  &((const struct sockaddr_in6 *)addr)->sin6_addr,
					  NULL,
					  0);

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_IPV6_CHK_ADDR_TAKES_CONST, 1,
			  [ipv6_chk_addr accepts a const second parameter])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if skbuff.h skb_flow_dissect_flow_keys has 3 parameters])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/skbuff.h>
	],[
		skb_flow_dissect_flow_keys(NULL, NULL, 0);

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_SKB_FLOW_DISSECT_FLOW_KEYS_HAS_3_PARAMS, 1,
			  [skb_flow_dissect_flow_keys has 3 parameters])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if ip.h inet_get_local_port_range has 3 parameters])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <net/ip.h>
	],[
		inet_get_local_port_range(NULL, NULL, NULL);

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_INET_GET_LOCAL_PORT_RANGE_3_PARAMS, 1,
			  [inet_get_local_port_range has 3 parameters])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if pci.h has enum pcie_link_width])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/pci.h>
	],[
		enum pcie_link_width width = PCIE_LNK_WIDTH_UNKNOWN;

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_PCIE_LINK_WIDTH, 1,
			  [pcie_link_width is defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if pci.h has enum pci_bus_speed])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/pci.h>
	],[
		enum pci_bus_speed speed = PCI_SPEED_UNKNOWN;

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_PCI_BUS_SPEED, 1,
			  [pci_bus_speed is defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if struct ifla_vf_info has linkstate])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/if_link.h>
	],[
		struct ifla_vf_info *x;
		x->linkstate = 0;

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_LINKSTATE, 1,
			  [linkstate is defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if pci.h enum pci_dev_flags has PCI_DEV_FLAGS_ASSIGNED])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/pci.h>
	],[
		enum pci_dev_flags x = PCI_DEV_FLAGS_ASSIGNED;

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_PCI_DEV_FLAGS_ASSIGNED, 1,
			  [PCI_DEV_FLAGS_ASSIGNED is defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if switchdev.h enum switchdev_attr_id has SWITCHDEV_ATTR_ID_PORT_PARENT_ID])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <net/switchdev.h>
	],[
		enum switchdev_attr_id x = SWITCHDEV_ATTR_ID_PORT_PARENT_ID;

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_SWITCHDEV_ATTR_ID_PORT_PARENT_ID, 1,
			  [SWITCHDEV_ATTR_ID_PORT_PARENT_ID is defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if switchdev.h has struct switchdev_ops])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <net/switchdev.h>
	],[
		struct switchdev_ops x;

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_SWITCHDEV_OPS, 1,
			  [HAVE_SWITCHDEV_OPS is defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if switchdev.h has switchdev_port_same_parent_id])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <net/switchdev.h>
	],[
		switchdev_port_same_parent_id(NULL, NULL);

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_SWITCHDEV_PORT_SAME_PARENT_ID, 1,
			  [switchdev_port_same_parent_id is defined])
	],[
		AC_MSG_RESULT(no)
	])

        AC_MSG_CHECKING([if netdevice.h has netif_keep_dst])
        MLNX_BG_LB_LINUX_TRY_COMPILE([
	#include <linux/netdevice.h>
	        ],[
                netif_keep_dst(NULL);

                return 0;
        ],[
                AC_MSG_RESULT(yes)
                MLNX_AC_DEFINE(HAVE_NETIF_KEEP_DST, 1,
                          [netif_keep_dst is defined])
        ],[
                AC_MSG_RESULT(no)
        ])

	AC_MSG_CHECKING([if netdevice.h has netdev_txq_bql_complete_prefetchw])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/netdevice.h>
	],[
		netdev_txq_bql_complete_prefetchw(NULL);
		netdev_txq_bql_enqueue_prefetchw(NULL);

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_NETDEV_TXQ_BQL_PREFETCHW, 1,
			  [netdev_txq_bql_complete_prefetchw is defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if struct sk_buff has xmit_more])
	case $LINUXRELEASE in
	3\.1[[0-7]]*fbk*|2*fbk*)
	AC_MSG_RESULT(Not checking xmit_more support for fbk kernel: $LINUXRELEASE)
	;;
	*)
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/skbuff.h>
	],[
		struct sk_buff *skb;
		skb->xmit_more = 0;

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_SK_BUFF_XMIT_MORE, 1,
			  [xmit_more is defined])
	],[
		AC_MSG_RESULT(no)
	])
	;;
	esac

	AC_MSG_CHECKING([if struct sk_buff has encapsulation])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/skbuff.h>
	],[
		struct sk_buff *skb;
		skb->encapsulation = 0;

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_SK_BUFF_ENCAPSULATION, 1,
			  [encapsulation is defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if etherdevice.h has eth_get_headlen])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/etherdevice.h>
	],[
		eth_get_headlen(NULL, 0);

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_ETH_GET_HEADLEN, 1,
			  [eth_get_headlen is defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if struct sk_buff has csum_level])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/skbuff.h>
	],[
		struct sk_buff *skb;
		skb->csum_level = 0;

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_SK_BUFF_CSUM_LEVEL, 1,
			  [csum_level is defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if struct skbuff.h has skb_inner_transport_header])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/skbuff.h>
	],[
		skb_inner_transport_header(NULL);

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_SKB_INNER_TRANSPORT_HEADER, 1,
			  [skb_inner_transport_header is defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if struct skbuff.h has napi_consume_skb])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/skbuff.h>
	],[
		napi_consume_skb(NULL, 0);

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_NAPI_CONSUME_SKB, 1,
			  [napi_consume_skb is defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if struct skbuff.h has skb_inner_transport_offset])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/skbuff.h>
	],[
		skb_inner_transport_offset(NULL);

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_SKB_INNER_TRANSPORT_OFFSET, 1,
			  [skb_inner_transport_offset is defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if struct skbuff.h has skb_inner_network_header])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/skbuff.h>
	],[
		skb_inner_network_header(NULL);

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_SKB_INNER_NETWORK_HEADER, 1,
			  [skb_inner_network_header is defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if if_vlan.h has vlan_dev_get_egress_qos_mask])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/if_vlan.h>
	],[
		vlan_dev_get_egress_qos_mask(NULL, 0);

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_VLAN_DEV_GET_EGRESS_QOS_MASK, 1,
			  [vlan_dev_get_egress_qos_mask is defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if netdevice.h has netdev_set_num_tc])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/netdevice.h>
	],[
		netdev_set_num_tc(NULL, 0);

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_NETDEV_SET_NUM_TC, 1,
			  [netdev_set_num_tc is defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if netdevice.h has netdev_get_num_tc])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/netdevice.h>
	],[
		netdev_get_num_tc(NULL);

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_NETDEV_GET_NUM_TC, 1,
			  [netdev_get_num_tc is defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if netdevice.h has netdev_rx_handler_register])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/netdevice.h>
	],[
		netdev_rx_handler_register(NULL, NULL, NULL);
		struct net_device x = {
			.rx_handler_data = NULL,
		};

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_NETDEV_RX_HANDLER_REGISTER, 1,
			  [netdev_rx_handler_register is defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if ndo_select_queue has accel_priv])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/netdevice.h>

		static u16 select_queue(struct net_device *dev, struct sk_buff *skb,
				        void *accel_priv)
		{
			return 0;
		}
	],[
		struct net_device_ops ndops = {
			.ndo_select_queue = select_queue,
		};

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(NDO_SELECT_QUEUE_HAS_ACCEL_PRIV, 1,
			  [ndo_select_queue has accel_priv])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if setapp returns int])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/netdevice.h>
		#include <net/dcbnl.h>

		static int mlx4_en_dcbnl_setapp(struct net_device *netdev, u8 idtype,
						u16 id, u8 up)
		{
			return 0;
		}

	],[
		struct dcbnl_rtnl_ops mlx4_en_dcbnl_ops = {
			.setapp		= mlx4_en_dcbnl_setapp,
		};

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(NDO_SETAPP_RETURNS_INT, 1,
			  [if setapp returns int])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if getapp returns int])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/netdevice.h>
		#include <net/dcbnl.h>

		static int mlx4_en_dcbnl_getapp(struct net_device *netdev, u8 idtype,
						u16 id)
		{
			return 0;
		}
	],[
		struct dcbnl_rtnl_ops mlx4_en_dcbnl_ops = {
			.getapp		= mlx4_en_dcbnl_getapp,
		};

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(NDO_GETAPP_RETURNS_INT, 1,
			  [if getapp returns int])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if getnumtcs returns int])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/netdevice.h>
		#include <net/dcbnl.h>

		static int mlx4_en_dcbnl_getnumtcs(struct net_device *netdev, int tcid, u8 *num)

		{
			return 0;
		}

	],[
		struct dcbnl_rtnl_ops mlx4_en_dcbnl_ops = {
			.getnumtcs	= mlx4_en_dcbnl_getnumtcs,
		};

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(NDO_GETNUMTCS_RETURNS_INT, 1,
			  [if getnumtcs returns int])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if include/net/bonding.h exists])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <net/bonding.h>
	],[
		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_BONDING_H, 1,
			  [include/net/bonding.h exists])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if include/generated/utsrelease.h exists])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <generated/utsrelease.h>
	],[
		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_UTSRELEASE_H, 1,
			  [include/generated/utsrelease.h exists])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if include/net/devlink.h exists])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <net/devlink.h>
	],[
		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_DEVLINK_H, 1,
			  [include/net/devlink.h exists])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if include/net/switchdev.h exists])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <net/switchdev.h>
	],[
		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_SWITCHDEV_H, 1,
			  [include/net/switchdev.h exists])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if include/linux/interval_tree_generic.h exists])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/interval_tree_generic.h>
	],[
		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_INTERVAL_TREE_GENERIC_H, 1,
			[include/linux/interval_tree_generic.h exists])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if tc_vlan.h has is_tcf_vlan])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <net/tc_act/tc_vlan.h>
	],[
		is_tcf_vlan(NULL);

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_IS_TCF_VLAN, 1,
			  [is_tcf_vlan is defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if struct net_device_ops has ndo_add_slave])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/netdevice.h>
	],[
		struct net_device_ops netdev_ops = {
			.ndo_add_slave = NULL,
		};

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_NDO_ADD_SLAVE, 1,
			  [ndo_add_slave is defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if tc_vlan.h has tcf_vlan_push_prio])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <net/tc_act/tc_vlan.h>
	],[
		tcf_vlan_push_prio(NULL);

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_TCF_VLAN_PUSH_PRIO, 1,
			  [tcf_vlan_push_prio is defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if flow_dissector.h enum flow_dissector_key_keyid has FLOW_DISSECTOR_KEY_VLAN])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <net/flow_dissector.h>
	],[
		enum flow_dissector_key_id keyid = FLOW_DISSECTOR_KEY_VLAN;

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_FLOW_DISSECTOR_KEY_VLAN, 1,
			  [FLOW_DISSECTOR_KEY_VLAN is defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if flow_dissector.h enum flow_dissector_key_keyid has FLOW_DISSECTOR_KEY_IP])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <net/flow_dissector.h>
	],[
		enum flow_dissector_key_id keyid = FLOW_DISSECTOR_KEY_IP;

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_FLOW_DISSECTOR_KEY_IP, 1,
			  [FLOW_DISSECTOR_KEY_IP is defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if flow_dissector.h enum flow_dissector_key_keyid has FLOW_DISSECTOR_KEY_TCP])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <net/flow_dissector.h>
	],[
		enum flow_dissector_key_id keyid = FLOW_DISSECTOR_KEY_TCP;

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_FLOW_DISSECTOR_KEY_TCP, 1,
			  [FLOW_DISSECTOR_KEY_TCP is defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if etherdevice.h has ether_addr_copy])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/etherdevice.h>
	],[
		ether_addr_copy(NULL, NULL);

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_ETHER_ADDR_COPY, 1,
			  [ether_addr_copy is defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if etherdevice.h has eth_random_addr])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/etherdevice.h>
	],[
		eth_random_addr(NULL);

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_ETH_RANDOM_ADDR, 1,
			  [eth_random_addr is defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if netdev_extended has hw_features])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/netdevice.h>
	],[
		struct net_device *dev = NULL;

		netdev_extended(dev)->hw_features = 0;

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_NETDEV_EXTENDED_HW_FEATURES, 1,
			  [ is defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if netdev_extended has wanted_features])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/netdevice.h>
	],[
		struct net_device *dev = NULL;

		netdev_extended(dev)->wanted_features = 0;

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_NETDEV_EXTENDED_WANTED_FEATURES, 1,
			  [ is defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if net_device_extended has _tx_ext])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/netdevice.h>
	],[
		struct net_device *dev = NULL;

		netdev_extended(dev)->_tx_ext = NULL;

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_NET_DEVICE_EXTENDED_TX_EXT, 1,
			  [ is defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if netdev_extended has dev_port])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/netdevice.h>
	],[
		struct net_device *dev = NULL;

		netdev_extended(dev)->dev_port = 0;

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_NETDEV_EXTENDED_DEV_PORT, 1,
			  [ is defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if struct net_device_ops has *ndo_busy_poll])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/netdevice.h>
	],[
		struct net_device_ops netdev_ops;

		netdev_ops.ndo_busy_poll = NULL;
		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_NDO_BUSY_POLL, 1,
			  [ndo_busy_poll is defined])
	],[
		AC_MSG_RESULT(no)
	])


	AC_MSG_CHECKING([if net_device_extended has ndo_busy_poll])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/netdevice.h>

		int busy_poll(struct napi_struct *napi)
		{
			return 0;
		}
	],[
		struct net_device *dev = NULL;

		netdev_extended(dev)->ndo_busy_poll = busy_poll;

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_NETDEV_EXTENDED_NDO_BUSY_POLL, 1,
			  [ is defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if netdevice.h has set_netdev_hw_features])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/netdevice.h>
	],[
		struct net_device *dev = NULL;

		set_netdev_hw_features(dev, 0);

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_SET_NETDEV_HW_FEATURES, 1,
			  [ is defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if netdevice.h has netif_set_xps_queue])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/netdevice.h>
	],[
		struct net_device *dev = NULL;

		netif_set_xps_queue(dev, NULL, 0);

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_NETIF_SET_XPS_QUEUE, 1,
			  [ is defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if netdev_update_features exists])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/netdevice.h>
	],[
		struct net_device *dev = NULL;

		netdev_update_features(dev);

		return 0;
	],[
	AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_NETDEV_UPDATE_FEATURES, 1,
		  [ is defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if netdevice.h has unregister_netdevice_queue])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/netdevice.h>
	],[
		unregister_netdevice_queue(NULL, NULL);

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_UNREGISTER_NETDEVICE_QUEUE, 1,
			[unregister_netdevice_queue is defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if struct net_device_ops has *ndo_set_features])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/netdevice.h>
	],[
		struct net_device_ops netdev_ops;

		netdev_ops.ndo_set_features = NULL;
		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_NDO_SET_FEATURES, 1,
			  [ndo_set_features is defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if struct net_device_ops has *ndo_set_tx_maxrate])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/netdevice.h>
	],[
		struct net_device_ops x = {
			.ndo_set_tx_maxrate = NULL,
		};

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_NDO_SET_TX_MAXRATE, 1,
			  [ndo_set_tx_maxrate is defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if struct net_device_ops_extended has *ndo_set_tx_maxrate])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/netdevice.h>
	],[
		struct net_device_ops_extended x = {
			.ndo_set_tx_maxrate = NULL,
		};

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_NDO_SET_TX_MAXRATE_EXTENDED, 1,
			  [extended ndo_set_tx_maxrate is defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if struct net_device_ops_extended has *ndo_chane_mtu_extended])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/netdevice.h>
	],[
		struct net_device_ops_extended x = {
			.ndo_change_mtu = NULL,
		};

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_NDO_CHANGE_MTU_EXTENDED, 1,
			  [extended ndo_change_mtu is defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if struct net_device_ops has *ndo_chane_mtu_rh74])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/netdevice.h>
	],[
		struct net_device_ops x = {
			.ndo_change_mtu_rh74 = NULL,
		};

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_NDO_CHANGE_MTU_RH74, 1,
			  [extended ndo_change_mtu_rh74 is defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if struct net_device_extended has min/max_mtu])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/netdevice.h>
	],[
		struct net_device_extended x = {
			.min_mtu = 0,
			.max_mtu = 0,
		};

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_NET_DEVICE_MIN_MAX_MTU_EXTENDED, 1,
			  [extended min/max_mtu is defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if struct net_device_ops has *ndo_setup_tc])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/netdevice.h>
	],[
		struct net_device_ops x = {
			.ndo_setup_tc = NULL,
		};

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_NDO_SETUP_TC, 1,
			  [ndo_setup_tc is defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if struct net_device_ops_extended has  has *ndo_setup_tc_rh])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/netdevice.h>
	],[
		struct net_device_ops_extended x = {
			.ndo_setup_tc_rh = NULL,
		};

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_NDO_SETUP_TC_RH_EXTENDED, 1,
			  [ndo_setup_tc_rh is defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if netdevice.h has netif_tx_napi_add])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/netdevice.h>
	],[
		netif_tx_napi_add(NULL, NULL, NULL, 0);

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_NETIF_TX_NAPI_ADD, 1,
			  [netif_tx_napi_add is defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if ndo_setup_tc takes 4 parameters])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/netdevice.h>

		int mlx4_en_setup_tc(struct net_device *dev, u32 handle,
							 __be16 protocol, struct tc_to_netdev *tc)
		{
			return 0;
		}
	],[
		struct net_device_ops x = {
			.ndo_setup_tc = mlx4_en_setup_tc,
		};

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_NDO_SETUP_TC_4_PARAMS, 1,
			  [ndo_setup_tc takes 4 parameters])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if ndo_setup_tc takes chain_index])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/netdevice.h>

		int mlx_en_setup_tc(struct net_device *dev, u32 handle, u32 chain_index,
							__be16 protocol, struct tc_to_netdev *tc)
		{
			return 0;
		}
	],[
		struct net_device_ops x = {
			.ndo_setup_tc = mlx_en_setup_tc,
		};

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_NDO_SETUP_TC_TAKES_CHAIN_INDEX, 1,
			  [ndo_setup_tc takes chain_index])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if ndo_setup_tc takes tc_setup_type])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/netdevice.h>

		int mlx_en_setup_tc(struct net_device *dev, enum tc_setup_type type,
				    void *type_data)
		{
			return 0;
		}
	],[
		struct net_device_ops x = {
			.ndo_setup_tc = mlx_en_setup_tc,
		};

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_NDO_SETUP_TC_TAKES_TC_SETUP_TYPE, 1,
			  [ndo_setup_tc takes tc_setup_type])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if pkt_cls.h has tcf_exts_to_list])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <net/pkt_cls.h>
	],[
		tcf_exts_to_list(NULL, NULL);

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_TCF_EXTS_TO_LIST, 1,
			  [tcf_exts_to_list is defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if pkt_cls.h has tcf_queue_work])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <net/pkt_cls.h>
	],[
		tcf_queue_work(NULL);

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_TCF_QUEUE_WORK, 1,
			  [tcf_queue_work is defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if pkt_cls.h has tcf_exts_init])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <net/pkt_cls.h>
	],[
		tcf_exts_init(NULL, 0, 0);

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_TCF_EXTS_INIT, 1,
			  [tcf_exts_init is defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if pkt_cls.h has tcf_exts_get_dev])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <net/pkt_cls.h>
	],[
		tcf_exts_get_dev(NULL, NULL, NULL);

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_TCF_EXTS_GET_DEV, 1,
			  [tcf_exts_get_dev is defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if net/tc_act/tc_mirred.h exists])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <net/tc_act/tc_mirred.h>
	],[
		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_NET_TC_ACT_TC_MIRRED_H, 1,
			  [net/tc_act/tc_mirred.h exists])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if tc_mirred.h has is_tcf_mirred_redirect])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <net/tc_act/tc_mirred.h>
	],[
		is_tcf_mirred_redirect(NULL);

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_IS_TCF_MIRRED_REDIRECT, 1,
			  [is_tcf_mirred_redirect is defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if tc_mirred.h has is_tcf_mirred_egress_redirect])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <net/tc_act/tc_mirred.h>
	],[
		is_tcf_mirred_egress_redirect(NULL);

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_IS_TCF_MIRRED_EGRESS_REDIRECT, 1,
			  [is_tcf_mirred_egress_redirect is defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if tc_mirred.h has is_tcf_mirred_mirror])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <net/tc_act/tc_mirred.h>
	],[
		is_tcf_mirred_mirror(NULL);

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_IS_TCF_MIRRED_MIRROR, 1,
			  [is_tcf_mirred_mirror is defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if tc_mirred.h has is_tcf_mirred_egress_mirror])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <net/tc_act/tc_mirred.h>
	],[
		is_tcf_mirred_egress_mirror(NULL);

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_IS_TCF_MIRRED_EGRESS_MIRROR, 1,
			  [is_tcf_mirred_egress_mirror is defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if tc_mirred.h has tcf_mirred_ifindex])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <net/tc_act/tc_mirred.h>
	],[
		tcf_mirred_ifindex(NULL);

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_TCF_MIRRED_IFINDEX, 1,
			  [tcf_mirred_if_index is defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if tc_gact.h exists])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <net/tc_act/tc_gact.h>
	],[
		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_TC_GACT_H, 1,
			  [tc_gact.h exists])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if tc_gact.h has is_tcf_gact_shot])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <net/tc_act/tc_gact.h>
	],[
		is_tcf_gact_shot(NULL);

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_IS_TCF_GACT_SHOT, 1,
			  [is_tcf_gact_shot is defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if tc_skbedit.h has is_tcf_skbedit_mark])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <net/tc_act/tc_skbedit.h>
	],[
		is_tcf_skbedit_mark(NULL);

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_IS_TCF_SKBEDIT_MARK, 1,
			  [is_tcf_skbedit_mark is defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if struct net_device_ops has *ndo_get_iflink])

	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/netdevice.h>
	],[
		struct net_device_ops x = {
			.ndo_get_iflink = NULL,
		};

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_NDO_GET_IFLINK, 1,
			  [ndo_get_iflink is defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if struct net_device_ops has *ndo_fix_features])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/netdevice.h>
	],[
		struct net_device_ops x = {
			.ndo_fix_features = NULL,
		};

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_NDO_FIX_FEATURES, 1,
			  [ndo_fix_features is defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if struct net_device_ops has *ndo_rx_flow_steer])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/netdevice.h>

		int rx_flow_steer(struct net_device *dev,
                                                     const struct sk_buff *skb,
                                                     u16 rxq_index,
                                                     u32 flow_id)
		{
			return 0;
		}
	],[
		struct net_device_ops netdev_ops;

		netdev_ops.ndo_rx_flow_steer = rx_flow_steer;
		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_NDO_RX_FLOW_STEER, 1,
			  [ndo_rx_flow_steer is defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if net_device_ops has *ndo_get_stats64 that returns void])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/netdevice.h>

		void get_stats_64(struct net_device *dev,
						  struct rtnl_link_stats64 *storage)
		{
			return;
		}
	],[
		struct net_device_ops netdev_ops;

		netdev_ops.ndo_get_stats64 = get_stats_64;

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_NDO_GET_STATS64_RET_VOID, 1,
			  [ndo_get_stats64 is defined and returns void])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if napi_complete_done returns value])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/netdevice.h>

	],[
		if (napi_complete_done(NULL, 0))
			return;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_NAPI_COMPLETE_DONE_RET_VALUE, 1,
			  [napi_complete_done returns value])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if struct rtnl_link_stats64 is defined])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/netdevice.h>
	],[
		struct rtnl_link_stats64 x;

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_RTNL_LINK_STATS64, 1,
			  [rtnl_link_stats64 is defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if struct net_device_ops has *ndo_get_stats64])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/netdevice.h>

		struct rtnl_link_stats64* get_stats_64(struct net_device *dev,
                                                     struct rtnl_link_stats64 *storage)
		{
			struct rtnl_link_stats64 stats_64;
			return &stats_64;
		}
	],[
		struct net_device_ops netdev_ops;

		netdev_ops.ndo_get_stats64 = get_stats_64;

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_NDO_GET_STATS64, 1,
			  [ndo_get_stats64 is defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if netdevice.h has netdev_stats_to_stats64])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/netdevice.h>
	],[
		netdev_stats_to_stats64(NULL, NULL);

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_NETDEV_STATS_TO_STATS64, 1,
			[netdev_stats_to_stats64 is defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if struct net_device_ops ndo_vlan_rx_add_vid has 3 parameters ])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/netdevice.h>

		int vlan_rx_add_vid(struct net_device *dev,__be16 proto, u16 vid)
		{
			return 0;
		}
	],[
		struct net_device_ops netdev_ops;

		netdev_ops.ndo_vlan_rx_add_vid = vlan_rx_add_vid;

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_NDO_RX_ADD_VID_HAS_3_PARAMS, 1,
			  [ndo_vlan_rx_add_vid has 3 parameters])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if struct net_device_ops ndo_vlan_rx_add_vid has 2 parameters and returns int])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/netdevice.h>

		int vlan_rx_add_vid(struct net_device *dev, u16 vid)
		{
			return 0;
		}
	],[
		struct net_device_ops netdev_ops = {
			.ndo_vlan_rx_add_vid = vlan_rx_add_vid,
		};

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_NDO_RX_ADD_VID_HAS_2_PARAMS_RET_INT, 1,
			  [ndo_vlan_rx_add_vid has 2 parameters and returns int])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if net_device_ops has ndo_get_phys_port_id])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/netdevice.h>

		int get_phys_port_id(struct net_device *dev,
				     struct netdev_phys_port_id *ppid)
		{
			return 0;
		}
	],[
		struct net_device_ops netdev_ops;

		netdev_ops.ndo_get_phys_port_id = get_phys_port_id;

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_NETDEV_NDO_GET_PHYS_PORT_ID, 1,
			  [ is defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if net_device_ops_extended has ndo_get_phys_port_id])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/netdevice.h>

		int get_phys_port_name(struct net_device *dev,
				       char *name, size_t len)
		{
			return 0;
		}
	],[
		struct net_device_ops_extended netdev_ops;

		netdev_ops.ndo_get_phys_port_name = get_phys_port_name;

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_NDO_GET_PHYS_PORT_NAME_EXTENDED, 1,
			  [ is defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if struct net_device_ops_ext exist])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/netdevice.h>
	],[
		struct net_device_ops_ext netdev_ops_ext = {
			.size = sizeof(struct net_device_ops_ext),
		};

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_NET_DEVICE_OPS_EXT, 1,
			  [struct net_device_ops_ext is defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if struct net_device_ops_extended exist])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/netdevice.h>
	],[
		struct net_device_ops_extended ops_extended;

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_NET_DEVICE_OPS_EXTENDED, 1,
			  [struct net_device_ops_extended is defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if struct struct dcbnl_rtnl_ops_ext exist])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <net/dcbnl.h>
	],[
		struct dcbnl_rtnl_ops_ext ops_extended;

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_DCBNL_RTNL_OPS_EXTENDED, 1,
			  [struct dcbnl_rtnl_ops_ext is defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if net_device_ops_ext has ndo_get_phys_port_id])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/netdevice.h>

		int get_phys_port_id(struct net_device *dev,
				     struct netdev_phys_port_id *ppid)
		{
			return 0;
		}
	],[
		struct net_device_ops_ext netdev_ops_ext;

		netdev_ops_ext.ndo_get_phys_port_id = get_phys_port_id;

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_NETDEV_EXT_NDO_GET_PHYS_PORT_ID, 1,
			  [ndo_get_phys_port_id is defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if net_device_ops has ndo_set_vf_spoofchk])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/netdevice.h>

		int set_vf_spoofchk(struct net_device *dev, int vf, bool setting)
		{
			return 0;
		}
	],[
		struct net_device_ops netdev_ops;

		netdev_ops.ndo_set_vf_spoofchk = set_vf_spoofchk;

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_NETDEV_OPS_NDO_SET_VF_SPOOFCHK, 1,
			  [ndo_set_vf_spoofchk is defined in net_device_ops])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if net_device_ops has ndo_set_vf_trust])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/netdevice.h>

		int set_vf_trust(struct net_device *dev, int vf, bool setting)
		{
			return 0;
		}
	],[
		struct net_device_ops netdev_ops;

		netdev_ops.ndo_set_vf_trust = set_vf_trust;

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_NETDEV_OPS_NDO_SET_VF_TRUST, 1,
			  [ndo_set_vf_trust is defined in net_device_ops])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if net_device_ops_extended has ndo_set_vf_trust])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/netdevice.h>

		int set_vf_trust(struct net_device *dev, int vf, bool setting)
		{
			return 0;
		}
	],[
		struct net_device_ops_extended netdev_ops;

		netdev_ops.ndo_set_vf_trust = set_vf_trust;

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_NETDEV_OPS_NDO_SET_VF_TRUST_EXTENDED, 1,
			  [extended ndo_set_vf_trust is defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if struct net_device_ops has ndo_set_vf_vlan])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/netdevice.h>
	],[
		struct net_device_ops netdev_ops = {
			.ndo_set_vf_vlan = NULL,
		};

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_NDO_SET_VF_VLAN, 1,
			  [ndo_set_vf_vlan is defined in net_device_ops])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if struct net_device_ops_extended has ndo_set_vf_vlan])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/netdevice.h>
	],[
		struct net_device_ops_extended netdev_ops_extended = {
			.ndo_set_vf_vlan = NULL,
		};

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_NDO_SET_VF_VLAN_EXTENDED, 1,
			  [ndo_set_vf_vlan is defined in net_device_ops_extended])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if net_device_ops_ext has ndo_set_features])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/netdevice.h>
	],[
		struct net_device_ops_ext netdev_ops_ext;

		netdev_ops_ext.ndo_set_features = NULL;

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_NETDEV_OPS_EXT_NDO_SET_FEATURES, 1,
			  [ndo_set_features is defined in net_device_ops_ext])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if net_device_ops_ext has ndo_fix_features])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/netdevice.h>
	],[
		struct net_device_ops_ext netdev_ops_ext;

		netdev_ops_ext.ndo_fix_features = NULL;

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_NETDEV_OPS_EXT_NDO_FIX_FEATURES, 1,
			  [ndo_fix_features is defined in net_device_ops_ext])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if net_device_ops_ext has ndo_set_vf_spoofchk])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/netdevice.h>

		int set_vf_spoofchk(struct net_device *dev, int vf, bool setting)
		{
			return 0;
		}
	],[
		struct net_device_ops_ext netdev_ops_ext;

		netdev_ops_ext.ndo_set_vf_spoofchk = set_vf_spoofchk;

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_NETDEV_OPS_EXT_NDO_SET_VF_SPOOFCHK, 1,
			  [ndo_set_vf_spoofchk is defined in net_device_ops_ext])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if net_device_ops has ndo_set_vf_link_state])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/netdevice.h>

		int set_vf_link_state(struct net_device *dev, int vf, int link_state)
		{
			return 0;
		}
	],[
		struct net_device_ops netdev_ops;

		netdev_ops.ndo_set_vf_link_state = set_vf_link_state;

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_NETDEV_OPS_NDO_SET_VF_LINK_STATE, 1,
			  [ndo_set_vf_link_state is defined in net_device_ops])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if net_device_ops_ext has ndo_set_vf_link_state])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/netdevice.h>

		int set_vf_link_state(struct net_device *dev, int vf, int link_state)
		{
			return 0;
		}
	],[
		struct net_device_ops_ext netdev_ops_ext;

		netdev_ops_ext.ndo_set_vf_link_state = set_vf_link_state;

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_NETDEV_OPS_EXT_NDO_SET_VF_LINK_STATE, 1,
			  [ndo_set_vf_link_state is defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if netdevice.h has netif_set_real_num_tx_queues])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/netdevice.h>
	],[
		netif_set_real_num_tx_queues(NULL, 2);

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_NETIF_SET_REAL_NUM_TX_QUEUES, 1,
			  [netif_set_real_num_tx_queues is defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if netif_set_real_num_tx_queues return value exists])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/netdevice.h>
	],[
		int ret;

		ret = netif_set_real_num_tx_queues(NULL, 2);

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_NETIF_SET_REAL_NUM_TX_QUEUES_NOT_VOID, 1,
			  [netif_set_real_num_tx_queues return value exists])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if netdevice.h has enum netdev_lag_tx_type])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/netdevice.h>
	],[
		enum netdev_lag_tx_type x;
		x = 0;

		return x;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_LAG_TX_TYPE, 1,
			  [enum netdev_lag_tx_type is defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if struct netdevice.h has struct xps_map])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/netdevice.h>
	],[
		struct xps_map map;
		map.len = 0;

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_XPS_MAP, 1,
			  [struct xps_map is defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if ethtool_ext has set_phys_id])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/ethtool.h>
	],[
		const struct ethtool_ops_ext en_ethtool_ops_ext = {
			.set_phys_id = NULL,
		};

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_SET_PHYS_ID_EXT, 1,
			  [set_phys_id is defined in ethtool_ops_ext])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if struct ethtool_ops has get/set_channels])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/ethtool.h>
	],[
		const struct ethtool_ops en_ethtool_ops = {
			.get_channels = NULL,
			.set_channels = NULL,
		};

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_GET_SET_CHANNELS, 1,
			  [get/set_channels is defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if struct ethtool_ops has get/set_msglevel])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/ethtool.h>
	],[
		const struct ethtool_ops en_ethtool_ops = {
			.get_msglevel = NULL,
			.set_msglevel = NULL,
		};

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_GET_SET_MSGLEVEL, 1,
			  [get/set_msglevel is defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if struct ethtool_ops has get/set_link_ksettings])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/ethtool.h>
	],[
		const struct ethtool_ops en_ethtool_ops = {
			.get_link_ksettings = NULL,
			.set_link_ksettings = NULL,
		};

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_GET_SET_LINK_KSETTINGS, 1,
			  [get/set_link_ksettings is defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if struct ethtool_ops has get/set_priv_flags])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/ethtool.h>
	],[
		const struct ethtool_ops en_ethtool_ops = {
			.get_priv_flags = NULL,
			.set_priv_flags = NULL,
		};

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_GET_SET_PRIV_FLAGS, 1,
			  [get/set_priv_flags is defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if struct ethtool_ops has get/set_flags])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/ethtool.h>
	],[
		const struct ethtool_ops en_ethtool_ops = {
			.get_flags = NULL,
			.set_flags = NULL,
		};

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_GET_SET_FLAGS, 1,
			  [get/set_flags is defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if struct ethtool_ops has get/set_tso])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/ethtool.h>
	],[
		const struct ethtool_ops en_ethtool_ops = {
			.get_tso = NULL,
			.set_tso = NULL,
		};

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_GET_SET_TSO, 1,
			  [get/set_tso is defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if struct ethtool_ops has get/set_sg])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/ethtool.h>
	],[
		const struct ethtool_ops en_ethtool_ops = {
			.get_sg = NULL,
			.set_sg = NULL,
		};

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_GET_SET_SG, 1,
			  [get/set_sg is defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if struct ethtool_ops has get/set_tx_csum])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/ethtool.h>
	],[
		const struct ethtool_ops en_ethtool_ops = {
			.get_tx_csum = NULL,
			.set_tx_csum = NULL,
		};

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_GET_SET_TX_CSUM, 1,
			  [get/set_tx_csum is defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if struct ethtool_ops has get/set_rx_csum])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/ethtool.h>
	],[
		const struct ethtool_ops en_ethtool_ops = {
			.get_rx_csum = NULL,
			.set_rx_csum = NULL,
		};

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_GET_SET_RX_CSUM, 1,
			  [get/set_rx_csum is defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if struct ethtool_ops_ext has get/set_channels])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/ethtool.h>
	],[
		const struct ethtool_ops_ext en_ethtool_ops_ext = {
			.get_channels = NULL,
			.set_channels = NULL,
		};

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_GET_SET_CHANNELS_EXT, 1,
			  [get/set_channels is defined in ethtool_ops_ext])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if struct ethtool_ops has get_ts_info])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/ethtool.h>
	],[
		const struct ethtool_ops en_ethtool_ops = {
			.get_ts_info = NULL,
		};

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_GET_TS_INFO, 1,
			  [get_ts_info is defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if struct ethtool_ops_ext has get_ts_info])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/ethtool.h>
	],[
		const struct ethtool_ops_ext en_ethtool_ops_ext = {
			.get_ts_info = NULL,
		};

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_GET_TS_INFO_EXT, 1,
			  [get_ts_info is defined in ethtool_ops_ext])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if struct ethtool_flow_ext has h_dest])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/ethtool.h>
	],[
		unsigned char mac[ETH_ALEN];
		struct ethtool_flow_ext h_ext;

		memcpy(&mac, h_ext.h_dest, ETH_ALEN);

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_ETHTOOL_FLOW_EXT_H_DEST, 1,
			  [ethtool_flow_ext has h_dest])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if ETH_P_8021AD exists])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/if_vlan.h>
	],[
		__be16 vlan_proto = htons(ETH_P_8021AD);

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_ETH_P_8021AD, 1,
			  [ETH_P_8021AD exists])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if ETH_P_IBOE exists])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <uapi/linux/if_ether.h>
	],[
		u16 ether_type = ETH_P_IBOE;

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_ETH_P_IBOE, 1,
			  [ETH_P_IBOE exists])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if struct ethtool_ops get_rxnfc gets u32 *rule_locs])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/ethtool.h>
		static int mlx4_en_get_rxnfc(struct net_device *dev, struct ethtool_rxnfc *c,
					     u32 *rule_locs)
		{
			return 0;
		}
	],[
		struct ethtool_ops x = {
			.get_rxnfc = mlx4_en_get_rxnfc,
		};

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_ETHTOOL_OPS_GET_RXNFC_U32_RULE_LOCS, 1,
			  [ethtool_ops get_rxnfc gets u32 *rule_locs])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if pci.h has pci_vfs_assigned])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/pci.h>
	],[
		struct pci_dev pdev;
		pci_vfs_assigned(&pdev);
		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_PCI_VFS_ASSIGNED, 1,
			  [pci_vfs_assigned is defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if pci.h struct pci_driver has sriov_configure])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/pci.h>
	],[
		struct pci_driver x = {
			.sriov_configure = NULL,
		};

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_PCI_DRIVER_SRIOV_CONFIGURE, 1,
			  [pci_driver sriov_configure is defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if __vlan_hwaccel_put_tag has 3 parameters])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/if_vlan.h>
	],[
		struct sk_buff *skb;
		__vlan_hwaccel_put_tag(skb, 0, 0);

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_3_PARAMS_FOR_VLAN_HWACCEL_PUT_TAG, 1,
			  [__vlan_hwaccel_put_tag has 3 parameters])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if struct net_device has real_num_rx_queues])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/netdevice.h>
	],[
		struct net_device dev;
		dev.real_num_rx_queues = 0;

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_NET_DEVICE_REAL_NUM_RX_QUEUES, 1,
			  [net_device real_num_rx_queues is defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if struct net_device has hw_features])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/netdevice.h>
	],[
		struct net_device dev;
		dev.hw_features = 0;

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_NETDEV_HW_FEATURES, 1,
			  [hw_features is defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if struct net_device has wanted_features])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/netdevice.h>
	],[
		struct net_device dev;
		dev.wanted_features = 0;

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_NETDEV_WANTED_FEATURES, 1,
			  [wanted_features is defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if if_vlan.h has vlan_features_check])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/if_vlan.h>
	],[
		vlan_features_check(NULL, 0);

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_VLAN_FEATURES_CHECK, 1,
			  [vlan_features_check is defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if vxlan.h has vxlan_features_check])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <net/vxlan.h>
	],[
		vxlan_features_check(NULL, 0);

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_VXLAN_FEATURES_CHECK, 1,
			  [vxlan_features_check is defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if vxlan.h has vxlan_vni_field])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <net/vxlan.h>
	],[
		vxlan_vni_field(0);

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_VXLAN_VNI_FIELD, 1,
			  [vxlan_vni_field is defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if struct net_device has hw_enc_features])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/netdevice.h>
	],[
		struct net_device dev;
		dev.hw_enc_features = 0;

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_NETDEV_HW_ENC_FEATURES, 1,
			  [hw_enc_features is defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if struct net_device has rx_cpu_rmap])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/netdevice.h>
	],[
		struct net_device dev;
		dev.rx_cpu_rmap = NULL;

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_NETDEV_RX_CPU_RMAP, 1,
			  [rx_cpu_rmap is defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if netdevice.h has IFF_UNICAST_FLT])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/netdevice.h>
	],[
		int x = IFF_UNICAST_FLT;

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_NETDEV_IFF_UNICAST_FLT, 1,
			  [IFF_UNICAST_FLT is defined])
	],[
		AC_MSG_RESULT(no)
	])


	AC_MSG_CHECKING([if netdevice.h has IFF_LIVE_ADDR_CHANGE])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/netdevice.h>
	],[
		int x = IFF_LIVE_ADDR_CHANGE;

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_NETDEV_IFF_LIVE_ADDR_CHANGE, 1,
			  [IFF_LIVE_ADDR_CHANGE is defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if netdevice.h has dev_uc_del])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/netdevice.h>
	],[
		dev_uc_del(NULL, NULL);
		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_DEV_UC_DEL, 1,
			  [dev_uc_del is defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if netdevice.h has dev_mc_del])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/netdevice.h>
	],[
		dev_mc_del(NULL, NULL);
		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_DEV_MC_DEL, 1,
			  [dev_mc_del is defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if netdevice.h has netdev_for_each_mc_addr])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/netdevice.h>
	],[
		struct netdev_hw_addr *ha;
		struct net_device *netdev;
		netdev_for_each_mc_addr(ha, netdev);

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_NETDEV_FOR_EACH_MC_ADDR, 1,
			  [netdev_for_each_mc_addr is defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if irqdesc.h has irq_desc_get_irq_data])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/irq.h>
		#include <linux/irqdesc.h>
	],[
		struct irq_desc desc;
		struct irq_data *data = irq_desc_get_irq_data(&desc);

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_IRQ_DESC_GET_IRQ_DATA, 1,
			  [irq_desc_get_irq_data is defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if irq.h irq_data has member affinity])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/irq.h>
		#include <linux/cpumask.h>
	],[
		struct irq_data y;
		const struct cpumask *x = y.affinity;

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_IRQ_DATA_AFFINITY, 1,
			  [irq_data member affinity is defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if interrupt.h has irq_set_affinity_hint])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/interrupt.h>
	],[
		int x = irq_set_affinity_hint(0, NULL);

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_IRQ_SET_AFFINITY_HINT, 1,
			  [irq_set_affinity_hint is defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if pci_dev has pcie_mpss])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/pci.h>
	],[
		struct pci_dev *pdev;

		pdev->pcie_mpss = 0;
		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_PCI_DEV_PCIE_MPSS, 1,
			  [pcie_mpss is defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if uapi/linux/if_ether.h exist])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <uapi/linux/if_ether.h>
	],[
		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_UAPI_LINUX_IF_ETHER_H, 1,
			  [uapi/linux/if_ether.h exist])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if ifla_vf_info has spoofchk])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/if_link.h>
	],[
		struct ifla_vf_info *ivf;

		ivf->spoofchk = 0;
		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_VF_INFO_SPOOFCHK, 1,
			  [spoofchk is defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if ifla_vf_info has trust])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/if_link.h>
	],[
		struct ifla_vf_info *ivf;

		ivf->trusted = 0;
		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_VF_INFO_TRUST, 1,
			  [trust is defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if if_link.h has IFLA_VF_IB_NODE_PORT_GUID])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/if_link.h>
	],[
		int type = IFLA_VF_IB_NODE_GUID;

		type = IFLA_VF_IB_PORT_GUID;

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_IFLA_VF_IB_NODE_PORT_GUID, 1,
			  [trust is defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if kthread.h has struct kthread_work])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/kthread.h>
	],[
		struct kthread_work x;

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_KTHREAD_WORK, 1,
			  [struct kthread_work is defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if kthread.h has kthread_queue_work])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/kthread.h>
	],[
		kthread_queue_work(NULL, NULL);

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_KTHREAD_QUEUE_WORK, 1,
			  [kthread_queue_work is defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if linux/timecounter.h exists])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/timecounter.h>
	],[
		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_TIMECOUNTER_H, 1,
			  [linux/timecounter.h exists])
	],[
		AC_MSG_RESULT(no)
	])

	# timecounter_adjtime can be in timecounter.h or clocksource.h
	AC_MSG_CHECKING([if linux/timecounter.h has timecounter_adjtime])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/timecounter.h>
	],[
		struct timecounter x;
		s64 y = 0;
		timecounter_adjtime(&x, y);

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_TIMECOUNTER_ADJTIME, 1,
			  [timecounter_adjtime is defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if linux/clocksource.h has timecounter_adjtime])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/clocksource.h>
	],[
		struct timecounter x;
		s64 y = 0;
		timecounter_adjtime(&x, y);

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_TIMECOUNTER_ADJTIME, 1,
			  [timecounter_adjtime is defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if netdevice.h has napi_schedule_irqoff])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/netdevice.h>
	],[
		napi_schedule_irqoff(NULL);

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_NAPI_SCHEDULE_IRQOFF, 1,
			  [napi_schedule_irqoff is defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if ethtool.h enum ethtool_stringset has ETH_SS_RSS_HASH_FUNCS])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/ethtool.h>
	],[
		enum ethtool_stringset x = ETH_SS_RSS_HASH_FUNCS;

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_ETH_SS_RSS_HASH_FUNCS, 1,
			  [ETH_SS_RSS_HASH_FUNCS is defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if pkt_cls.h enum enum tc_fl_command has TC_CLSFLOWER_STATS])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <net/pkt_cls.h>
	],[
		enum tc_fl_command x = TC_CLSFLOWER_STATS;

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_TC_CLSFLOWER_STATS, 1,
			  [HAVE_TC_CLSFLOWER_STATS is defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if netdevice.h has napi_complete_done])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/netdevice.h>
	],[
		napi_complete_done(NULL, 0);

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_NAPI_COMPLETE_DONE, 1,
			  [napi_complete_done is defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if linux/inetdevice.h inet_confirm_addr has 5 parameters])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
	#include <linux/inetdevice.h>
        ],[
               inet_confirm_addr(NULL, NULL, 0, 0, 0);

                return 0;
        ],[
                AC_MSG_RESULT(yes)
                MLNX_AC_DEFINE(HAVE_INET_CONFIRM_ADDR_5_PARAMS, 1,
                          [inet_confirm_addr has 5 parameters])
        ],[
                AC_MSG_RESULT(no)
        ])

	AC_MSG_CHECKING([if netdevice.h has netdev_rss_key_fill])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/netdevice.h>
	],[
		netdev_rss_key_fill(NULL, 0);

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_NETDEV_RSS_KEY_FILL, 1,
			  [netdev_rss_key_fill is defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if netdevice.h has struct netdev_phys_item_id])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/netdevice.h>
	],[
		struct netdev_phys_item_id x;
		x.id_len = 0;

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_NETDEV_PHYS_ITEM_ID, 1,
			  [netdev_phys_item_id is defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if cyclecounter_cyc2ns has 4 parameters])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/timecounter.h>
	],[
		cyclecounter_cyc2ns(NULL, 0, 0, NULL);

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_CYCLECOUNTER_CYC2NS_4_PARAMS, 1,
			  [cyclecounter_cyc2ns has 4 parameters])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if netdevice.h struct net_device_ops has ndo_features_check])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/netdevice.h>
	],[
		static const struct net_device_ops mlx4_netdev_ops = {
			.ndo_features_check	= NULL,
		};

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_NETDEV_FEATURES_T, 1,
			  [netdev_features_t is defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if netdevice.h struct net_device_ops has ndo_gso_check])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/netdevice.h>
	],[
		static const struct net_device_ops netdev_ops = {
			.ndo_gso_check= NULL,
		};

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_NDO_GSO_CHECK, 1,
			  [ndo_gso_check is defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if netdev_features.h has NETIF_F_RXFCS])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/netdev_features.h>
	],[
		netdev_features_t rxfcs = NETIF_F_RXFCS;

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_NETIF_F_RXFCS, 1,
			[NETIF_F_RXFCS is defined in netdev_features.h])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if netdev_features.h has NETIF_F_HW_VLAN_STAG_RX])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/netdev_features.h>
	],[
		netdev_features_t stag = NETIF_F_HW_VLAN_STAG_RX;

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_NETIF_F_HW_VLAN_STAG_RX, 1,
			[NETIF_F_HW_VLAN_STAG_RX is defined in netdev_features.h])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if netdev_features.h has NETIF_F_RXALL])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/netdev_features.h>
	],[
		netdev_features_t rxfcs = NETIF_F_RXALL;

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_NETIF_F_RXALL, 1,
			[NETIF_F_RXALL is defined in netdev_features.h])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if netdev_features.h has NETIF_IS_BOND_MASTER])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/netdevice.h>
	],[
		struct net_device *dev;
		return netif_is_bond_master(dev);

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_NETIF_IS_BOND_MASTER, 1,
			[NETIF_IS_BOND_MASTER is defined in netdev_features.h])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if if_vlan.h has vlan_hwaccel_do_receive with *skb])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/if_vlan.h>
	],[
		struct sk_buff *skb = NULL;
		vlan_hwaccel_do_receive(skb);

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_VLAN_HWACCEL_DO_RECEIVE_SKB_PTR, 1,
			[vlan_hwaccel_do_receive have *skb in if_vlan.h])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if if_vlan.h has vlan_gro_frags])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/if_vlan.h>
	],[
		vlan_gro_frags(NULL, NULL, 0);

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_VLAN_GRO_FRAGS, 1,
			[vlan_gro_frags is defined in if_vlan.h])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if if_vlan.h has vlan_gro_receive])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/if_vlan.h>
	],[
		vlan_gro_receive(NULL, NULL, 0, NULL);

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_VLAN_GRO_RECEIVE, 1,
			[vlan_gro_receive is defined in if_vlan.h])
	],[
		AC_MSG_RESULT(no)
	])

       AC_MSG_CHECKING([if if_vlan.h has vlan_hwaccel_rx])
       MLNX_BG_LB_LINUX_TRY_COMPILE([
               #include <linux/if_vlan.h>
       ],[
               vlan_hwaccel_rx(NULL, NULL, 0);

               return 0;
       ],[
               AC_MSG_RESULT(yes)
               MLNX_AC_DEFINE(HAVE_VLAN_HWACCEL_RX, 1,
                       [vlan_hwaccel_rx is defined in if_vlan.h])
       ],[
               AC_MSG_RESULT(no)
       ])

	AC_MSG_CHECKING([if skbuff.h skb_shared_info has UNION tx_flags])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/skbuff.h>
	],[
		struct skb_shared_info x;
		x.tx_flags.flags = 0;

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_SKB_SHARED_INFO_UNION_TX_FLAGS, 1,
			  [skb_shared_info has union tx_flags])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if vxlan have ndo_add_vxlan_port])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/netdevice.h>

		#if IS_ENABLED(CONFIG_VXLAN)
		void add_vxlan_port(struct net_device *dev, sa_family_t sa_family, __be16 port)
		{
			return;
		}
		#endif
	],[
		struct net_device_ops netdev_ops;
		netdev_ops.ndo_add_vxlan_port = add_vxlan_port;

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_NDO_ADD_VXLAN_PORT, 1,
			[ndo_add_vxlan_port is defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if ndo_add_vxlan_port have udp_tunnel_info])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/netdevice.h>

		#if IS_ENABLED(CONFIG_VXLAN)
		void add_vxlan_port(struct net_device *dev, struct udp_tunnel_info *ti)
		{
			return;
		}
		#endif

	],[
		struct net_device_ops netdev_ops;
		netdev_ops.ndo_udp_tunnel_add = add_vxlan_port;

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_NDO_UDP_TUNNEL_ADD, 1,
			[ndo_add_vxlan_port is defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if struct net_device_ops_extended has ndo_udp_tunnel_add])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/netdevice.h>

		#if IS_ENABLED(CONFIG_VXLAN)
		void add_vxlan_port(struct net_device *dev, struct udp_tunnel_info *ti)
		{
			return;
		}
		#endif

	],[
		struct net_device_ops_extended x = {
			.ndo_udp_tunnel_add = add_vxlan_port,
		};

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_NDO_UDP_TUNNEL_ADD_EXTENDED, 1,
			[extended ndo_add_vxlan_port is defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if vxlan.h has vxlan_gso_check])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <net/vxlan.h>
	],[
		vxlan_gso_check(NULL);

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_VXLAN_GSO_CHECK, 1,
			  [vxlan_gso_check is defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if dst.h has dst_get_neighbour])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <net/dst.h>
	],[
		struct neighbour *neigh = dst_get_neighbour(NULL);

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_DST_GET_NEIGHBOUR, 1,
			  [dst_get_neighbour is defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if dst.h has skb_dst_update_pmtu])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <net/dst.h>
	],[
		struct sk_buff x;
		skb_dst_update_pmtu(&x, 0);

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_SKB_DST_UPDATE_PMTU, 1,
			  [skb_dst_update_pmtu is defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if dst.h has dst_neigh_lookup])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <net/dst.h>
	],[
		struct neighbour *neigh = dst_neigh_lookup(NULL, NULL);

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_DST_NEIGH_LOOKUP, 1,
			  [dst_neigh_lookup is defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if netlink.h netlink_dump_control has dump])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/netlink.h>
	],[
		struct netlink_dump_control c = {
			.dump = NULL,
		};

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_NETLINK_DUMP_CONTROL_DUMP, 1,
			  [netlink_dump_control dump is defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if netlink.h nla_parse takes 6 parameters])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <net/netlink.h>
	],[
		nla_parse(NULL, 0, NULL, 0, NULL, NULL);

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_NLA_PARSE_6_PARAMS, 1,
			  [nla_parse takes 6 parameters])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if net/netlink.h has nla_put_u64_64bit])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <net/netlink.h>
	],[
		nla_put_u64_64bit(NULL, 0, 0, 0);

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_NLA_PUT_U64_64BIT, 1,
			  [nla_put_u64_64bit is defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if netlink.h netlink_skb_parms has sk])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/netlink.h>
	],[
		struct netlink_skb_parms nsp = {
			.sk = NULL,
		};

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_NETLINK_SKB_PARMS_SK, 1,
			  [netlink_skb_params has sk])
	],[
		AC_MSG_RESULT(no)
	])

        AC_MSG_CHECKING([if netlink.h has netlink_capable])
        MLNX_BG_LB_LINUX_TRY_COMPILE([
                #include <linux/netlink.h>
        ],[
                bool b = netlink_capable(NULL, 0);

                return 0;
        ],[
                AC_MSG_RESULT(yes)
                MLNX_AC_DEFINE(HAVE_NETLINK_CAPABLE, 1,
                          [netlink_capable is defined])
        ],[
                AC_MSG_RESULT(no)
        ])

	AC_MSG_CHECKING([if netlink.h netlink_kernel_cfg has input])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/netlink.h>
	],[
		struct netlink_kernel_cfg cfg = {
			.input = NULL,
		};

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_NETLINK_KERNEL_CFG_INPUT, 1,
			  [netlink_kernel_cfg input is defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if netlink_kernel_create has 3 parameters])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/netlink.h>
	],[
		netlink_kernel_create(NULL, 0, NULL);

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_NETLINK_KERNEL_CREATE_3_PARAMS, 1,
			  [netlink_kernel_create has 3 params])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if netlink_dump_start has 5 parameters])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/netlink.h>
	],[
		int ret = netlink_dump_start(NULL, NULL, NULL, NULL, NULL);

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_NETLINK_DUMP_START_5P, 1,
			  [netlink_dump_start has 5 parameters])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if netlink.h has struct netlink_ext_ack])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/netlink.h>
	],[
		struct netlink_ext_ack x;

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_NETLINK_EXT_ACK, 1,
			  [struct netlink_ext_ack is defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if netlink.h struct netlink_skb_parms has portid])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/netlink.h>
	],[
		struct netlink_skb_parms xx = {
			.portid = 0,
		};

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_NETLINK_SKB_PARMS_PORTID, 1,
			  [struct netlink_skb_parms has portid])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if struct dcbnl_rtnl_ops has ieee_getmaxrate/ieee_setmaxrate])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/netdevice.h>
		#include <net/dcbnl.h>
	],[
		const struct dcbnl_rtnl_ops en_dcbnl_ops = {
			.ieee_getmaxrate = NULL,
			.ieee_setmaxrate = NULL,
		};

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_IEEE_GET_SET_MAXRATE, 1,
			  [ieee_getmaxrate/ieee_setmaxrate is defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if dcbnl.h dcbnl_rtnl_ops getnumtcs returns int])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/netdevice.h>
		#include <net/dcbnl.h>
		static int func1(struct net_device * a, int b, u8 * c) {
			return 0;
		}

	],[
		struct dcbnl_rtnl_ops x = {
			.getnumtcs = func1,
		};
			return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_DCBNL_RTNL_OPS_GETNUMTCS_RET_INT, 1,
 			       [getnumtcs returns int])
 	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if ethtool.h has get_module_eeprom])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/ethtool.h>
	],[
		struct ethtool_ops x = {
			.get_module_eeprom = NULL,
		};

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_GET_MODULE_EEPROM, 1,
			  [HAVE_GET_MODULE_EEPROM is defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if ethtool.h has set_dump])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/ethtool.h>
	],[
		struct ethtool_ops x = {
			.set_dump = NULL,
			.get_dump_data = NULL,
			.get_dump_flag = NULL,
		};

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_GET_SET_DUMP, 1,
			[HAVE_GET_SET_DUMP is defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if ethtool.h has get_module_eeprom])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/ethtool.h>
	],[
		struct ethtool_ops_ext x = {
			.get_module_eeprom = NULL,
		};

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_GET_MODULE_EEPROM_EXT, 1,
			[HAVE_GET_MODULE_EEPROM_EXT is defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if skbuff.h skb_add_rx_frag has 5 params])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/skbuff.h>
	],[
		skb_add_rx_frag(NULL, 0, NULL, 0, 0);

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_SKB_ADD_RX_FRAG_5_PARAMS, 1,
			  [skb_add_rx_frag has 5 params])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if skbuff.h has skb_put_zero])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/skbuff.h>
	],[
		skb_put_zero(NULL, 0);

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_SKB_PUT_ZERO, 1,
			  [skb_put_zero is defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if skbuff.h has skb_clear_hash])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/skbuff.h>
	],[
		struct sk_buff x;
		skb_clear_hash(&x);

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_SKB_CLEAR_HASH, 1,
			  [skb_clear_hash is defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if skbuff.h struct sk_buff has member l4_rxhash])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/skbuff.h>
	],[
		struct sk_buff x = {
			.l4_rxhash = 0,
		};

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_SKB_L4_RXHASH, 1,
			  [sk_buff has member l4_rxhash])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if skbuff.h struct sk_buff has member rxhash])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/skbuff.h>
	],[
		struct sk_buff x = {
			.rxhash = 0,
		};

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_SKB_RXHASH, 1,
			  [sk_buff has member rxhash])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if skbuff.h struct sk_buff has member sw_hash])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/skbuff.h>
	],[
		struct sk_buff x = {
			.sw_hash = 0,
		};

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_SKB_SWHASH, 1,
			  [sk_buff has member sw_hash])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if addrconf.h has addrconf_ifid_eui48])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <net/addrconf.h>
	],[
		int x = addrconf_ifid_eui48(NULL, NULL);

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_ADDRCONF_IFID_EUI48, 1,
			  [addrconf_ifid_eui48 is defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if addrconf.h has addrconf_addr_eui48])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <net/addrconf.h>
	],[
		addrconf_addr_eui48(NULL, NULL);

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_ADDRCONF_ADDR_EUI48, 1,
			  [addrconf_addr_eui48 is defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if addrconf.h has ipv6_stub])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <net/addrconf.h>
	],[
		struct ipv6_stub x;

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_IPV6_STUB, 1,
			  [ipv6_stub is defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if addrconf.h ipv6_dst_lookup takes net])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <net/addrconf.h>
	],[
		int x = ipv6_stub->ipv6_dst_lookup(NULL, NULL, NULL, NULL);

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_IPV6_DST_LOOKUP_TAKES_NET, 1,
			  [ipv6_dst_lookup takes net])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if netdevice.h has struct netdev_bonding_info])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/netdevice.h>
	],[
		struct netdev_bonding_info x;
		x.master.num_slaves = 0;

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_NETDEV_BONDING_INFO, 1,
			  [netdev_bonding_info is defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if include/net/dcbnl.h struct dcbnl_rtnl_ops has *ieee_getqcn])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/netdevice.h>
		#include <net/dcbnl.h>
	],[
		struct dcbnl_rtnl_ops x = {
			.ieee_getqcn = NULL,
		};

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_IEEE_GETQCN, 1,
			  [ieee_getqcn is defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if dcbnl.h has struct ieee_qcn])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/netdevice.h>
		#include <net/dcbnl.h>
	],[
		struct ieee_qcn x;

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_STRUCT_IEEE_QCN, 1,
			  [ieee_qcn is defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if dcbnl.h has struct ieee_pfc])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/netdevice.h>
		#include <net/dcbnl.h>
	],[
		struct ieee_pfc x;

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_STRUCT_IEEE_PFC, 1,
			  [ieee_pfc is defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if netdevice.h dev_mc_add has 2 parameters])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/netdevice.h>
	],[
		dev_mc_add(NULL,NULL);

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_DEV_MC_ADD_2_PARAMS, 1,
			  [dev_mc_add has 2 parameters])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if netdevice.h has netdev_master_upper_dev_get])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/netdevice.h>
	],[
		netdev_master_upper_dev_get(NULL);

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_NETDEV_MASTER_UPPER_DEV_GET, 1,
			  [netdev_master_upper_dev_get is defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if netdevice.h has netdev_master_upper_dev_get_rcu])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/netdevice.h>
	],[
		netdev_master_upper_dev_get_rcu(NULL);

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_NETDEV_MASTER_UPPER_DEV_GET_RCU, 1,
			  [netdev_master_upper_dev_get_rcu is defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if netdevice.h has netdev_for_each_all_upper_dev_rcu])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/netdevice.h>
	],[
		struct net_device *dev;
		struct net_device *upper;
		struct list_head *list;

		netdev_for_each_all_upper_dev_rcu(dev, upper, list);
		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_NETDEV_FOR_EACH_ALL_UPPER_DEV_RCU, 1,
			  [netdev_master_upper_dev_get_rcu is defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if netdevice.h has netdev_walk_all_upper_dev_rcu])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/netdevice.h>

		struct upper_list {
			struct list_head list;
			struct net_device *upper;
		};

		static int netdev_upper_walk(struct net_device *upper, void *data) {
			return 0;
		}
	],[
		struct net_device *ndev;
		struct list_head upper_list;

		netdev_walk_all_upper_dev_rcu(ndev, netdev_upper_walk, &upper_list);
		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_NETDEV_WALK_ALL_UPPER_DEV_RCU, 1,
			  [netdev_walk_all_upper_dev_rcu is defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if netdevice.h has netdev_has_upper_dev_all_rcu])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/netdevice.h>
	],[
		struct net_device *dev;
		struct net_device *upper;

		netdev_has_upper_dev_all_rcu(dev, upper);
		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_NETDEV_HAS_UPPER_DEV_ALL_RCU, 1,
			  [netdev_has_upper_dev_all_rcu is defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if netdevice.h has netdev_notifier_changeupper_info])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/netdevice.h>
	],[
		struct netdev_notifier_changeupper_info info;

		info.master = 1;
		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_NETDEV_NOTIFIER_CHANGEUPPER_INFO, 1,
			  [netdev_notifier_changeupper_info is defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if ip_fib.h fib_res_put exists])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/bug.h>
		#include <linux/string.h>
		#include <net/ip_fib.h>
	],[
		fib_res_put(NULL);

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_FIB_RES_PUT, 1,
			[fib_res_put])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if ip_fib.h fib_lookup has 4 params])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/bug.h>
		#include <linux/string.h>
		#include <net/ip_fib.h>
	],[
		fib_lookup(NULL, NULL, NULL, 0);

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_FIB_LOOKUP_4_PARAMS, 1,
			[fib_lookup has 4 params])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if struct inet6_ifaddr has member if_list])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <net/if_inet6.h>
	],[
		struct inet6_ifaddr x;
		struct list_head xlist;
		x.if_list = xlist;

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_INET6_IF_LIST, 1,
			  [if_list is defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if workqueue.h has __cancel_delayed_work])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/workqueue.h>
	],[
		__cancel_delayed_work(NULL);

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE___CANCEL_DELAYED_WORK, 1,
			  [__cancel_delayed_work is defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if workqueue.h has WQ_SYSFS])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/workqueue.h>
	],[
		struct workqueue_struct *my_wq = alloc_workqueue("my_wq", WQ_SYSFS, 0);

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_WQ_SYSFS, 1,
			  [WQ_SYSFS is defined])
	],[
		AC_MSG_RESULT(no)
	])
	AC_MSG_CHECKING([if workqueue.h has WQ_NON_REENTRANT])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/workqueue.h>
	],[
		struct workqueue_struct *my_wq = alloc_workqueue("my_wq", WQ_NON_REENTRANT, 0);

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_WQ_NON_REENTRANT, 1,
			  [WQ_NON_REENTRANT is defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if workqueue.h has alloc_workqueue])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/workqueue.h>
	],[
		struct workqueue_struct *my_wq = alloc_workqueue("my_wq", 0, 0);

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_ALLOC_WORKQUEUE, 1,
			  [alloc_workqueue is defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if workqueue.h has WQ_HIGHPRI])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/workqueue.h>
	],[
		struct workqueue_struct *my_wq = alloc_workqueue("my_wq", WQ_HIGHPRI, 0);

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_WQ_HIGHPRI, 1,
			  [WQ_HIGHPRI is defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if workqueue.h has WQ_MEM_RECLAIM])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/workqueue.h>
	],[
		struct workqueue_struct *my_wq = alloc_workqueue("my_wq", WQ_MEM_RECLAIM, 0);

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_WQ_MEM_RECLAIM, 1,
			  [WQ_MEM_RECLAIM is defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if struct mm_struct has member pinned_vm])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/mm_types.h>
	],[
		struct mm_struct x;
		x.pinned_vm = 0;

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_PINNED_VM, 1,
			  [pinned_vm is defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if uapi/linux/if_bonding.h exists])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <uapi/linux/if_bonding.h>
	],[
		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_UAPI_IF_BONDING_H, 1,
			  [uapi/linux/if_bonding.h exists])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if sock.h has sk_clone_lock])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <net/sock.h>
	],[
		struct sock sk;
		sk_clone_lock(&sk, 0);

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_SK_CLONE_LOCK, 1,
			  [sk_clone_lock is defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if sock.h sk_wait_data has 3 parameters])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <net/sock.h>
	],[
		sk_wait_data(NULL, NULL, NULL);

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_SK_WAIT_DATA_3_PARAMS, 1,
			  [sk_wait_data has 3 params])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if proc_fs.h has PDE_DATA])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/proc_fs.h>
	],[
		PDE_DATA(NULL);

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_PDE_DATA, 1,
			  [PDE_DATA is defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if route.h struct rtable has member rt_uses_gateway])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <net/route.h>
	],[
		struct rtable x = {
			.rt_uses_gateway = 0,
		};

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_RT_USES_GATEWAY, 1,
			  [rt_uses_gateway is defined])
	],[
		AC_MSG_RESULT(no)
	])

	LB_CHECK_SYMBOL_EXPORT([split_page],
		[mm/page_alloc.c],
		[AC_DEFINE(HAVE_SPLIT_PAGE_EXPORTED, 1,
			[split_page is exported by the kernel])],
	[])

	LB_CHECK_SYMBOL_EXPORT([ip6_dst_hoplimit],
                [net/ipv6/output_core.c],
                [AC_DEFINE(HAVE_IP6_DST_HOPLIMIT, 1,
                        [ip6_dst_hoplimit is exported by the kernel])],
        [])

	LB_CHECK_SYMBOL_EXPORT([udp4_hwcsum],
		[net/ipv4/udp.c],
		[AC_DEFINE(HAVE_UDP4_HWCSUM, 1,
			[udp4_hwcsum is exported by the kernel])],
	[])

	LB_CHECK_SYMBOL_EXPORT([inet_confirm_addr],
		[net/ipv4/devinet.c],
		[AC_DEFINE(HAVE_INET_CONFIRM_ADDR_EXPORTED, 1,
			[inet_confirm_addr is exported by the kernel])],
	[])

	AC_MSG_CHECKING([if route.h has ip4_dst_hoplimit])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <net/route.h>
	],[
		ip4_dst_hoplimit(NULL);

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_IP4_DST_HOPLIMIT, 1,
		[ip4_dst_hoplimit is defined])
	],[
		AC_MSG_RESULT(no)
	])

	LB_CHECK_SYMBOL_EXPORT([irq_to_desc],
		[kernel/irq/irqdesc.c],
		[AC_DEFINE(HAVE_IRQ_TO_DESC_EXPORTED, 1,
			[irq_to_desc is exported by the kernel])],
	[])

	LB_CHECK_SYMBOL_EXPORT([dev_pm_qos_update_user_latency_tolerance],
		[drivers/base/power/qos.c],
		[AC_DEFINE(HAVE_PM_QOS_UPDATE_USER_LATENCY_TOLERANCE_EXPORTED, 1,
			[dev_pm_qos_update_user_latency_tolerance is exported by the kernel])],
	[])

	AC_MSG_CHECKING([if pm_qos.h has DEV_PM_QOS_RESUME_LATENCY])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/pm_qos.h>
	],[
		enum dev_pm_qos_req_type type = DEV_PM_QOS_RESUME_LATENCY;

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_DEV_PM_QOS_RESUME_LATENCY, 1,
			  [DEV_PM_QOS_RESUME_LATENCY is defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if pm_qos.h has DEV_PM_QOS_LATENCY_TOLERANCE])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/pm_qos.h>
	],[
		enum dev_pm_qos_req_type type = DEV_PM_QOS_LATENCY_TOLERANCE;

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_DEV_PM_QOS_LATENCY_TOLERANCE, 1,
			  [DEV_PM_QOS_LATENCY_TOLERANCE is defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if pm_qos.h has PM_QOS_LATENCY_TOLERANCE_NO_CONSTRAINT])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/pm_qos.h>
	],[
		int x = PM_QOS_LATENCY_TOLERANCE_NO_CONSTRAINT;

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_PM_QOS_LATENCY_TOLERANCE_NO_CONSTRAINT, 1,
			  [PM_QOS_LATENCY_TOLERANCE_NO_CONSTRAINT is defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if ptp_clock_kernel.h ptp_clock_register has 2 params])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/ptp_clock_kernel.h>
	],[
		ptp_clock_register(NULL, NULL);

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_PTP_CLOCK_REGISTER_2_PARAMS, 1,
			  [ptp_clock_register has 2 params is defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if sock.h has skwq_has_sleeper])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/net.h>
		#include <net/sock.h>
	],[
		struct socket_wq wq;
		skwq_has_sleeper(&wq);

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_SKWQ_HAS_SLEEPER, 1,
			  [skwq_has_sleeper is defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if pci.h pci_physfn])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/pci.h>
	],[
		struct pci_dev x;
		pci_physfn(&x);

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_PCI_PHYSFN, 1,
			  [pci_physfn is defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if pci.h has pci_pool_zalloc])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/pci.h>
	],[
		pci_pool_zalloc(NULL, 0, NULL);

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_PCI_POOL_ZALLOC, 1,
			  [pci_pool_zalloc is defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if linux/printk.h exists])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/printk.h>
	],[
		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_LINUX_PRINTK_H, 1,
			  [linux/printk.h is defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if printk.h has struct va_format])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/printk.h>
	],[
		struct va_format x;

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_VA_FORMAT, 1,
			  [va_format is defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if printk.h has print_hex_dump_debug])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/printk.h>
	],[
		print_hex_dump_debug(" TEST ", 0, 0, 0, NULL, 0, true);
		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_PRINT_HEX_DUMP_DEBUG, 1,
			  [print_hex_dump_debug is defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if struct netdevice.h has NETIF_F_RXHASH])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/netdevice.h>
	],[
		int x = NETIF_F_RXHASH;

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_NETIF_F_RXHASH, 1,
			  [NETIF_F_RXHASH is defined in netdevice.h])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if struct netdev_features.h has NETIF_F_RXHASH])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/netdev_features.h>
	],[
		int x = NETIF_F_RXHASH;

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_NETIF_F_RXHASH, 1,
			  [NETIF_F_RXHASH is defined in netdev_features.h])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if struct netdev_features.h has NETIF_F_GSO_UDP_TUNNEL])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/netdev_features.h>
	],[
		int x = NETIF_F_GSO_UDP_TUNNEL;

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_NETIF_F_GSO_UDP_TUNNEL, 1,
			  [NETIF_F_GSO_UDP_TUNNEL is defined in netdev_features.h])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if struct netdev_features.h has NETIF_F_GSO_UDP_TUNNEL_CSUM])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/netdev_features.h>
	],[
		int x = NETIF_F_GSO_UDP_TUNNEL_CSUM;

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_NETIF_F_GSO_UDP_TUNNEL_CSUM, 1,
			  [NETIF_F_GSO_UDP_TUNNEL_CSUM is defined in netdev_features.h])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if struct netdev_features.h has NETIF_F_GSO_GRE_CSUM])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/netdev_features.h>
	],[
		int x = NETIF_F_GSO_GRE_CSUM;

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_NETIF_F_GSO_GRE_CSUM, 1,
			  [NETIF_F_GSO_GRE_CSUM is defined in netdev_features.h])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if struct netdev_features.h has NETIF_F_GSO_PARTIAL])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/netdev_features.h>
	],[
		int x = NETIF_F_GSO_PARTIAL;

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_NETIF_F_GSO_PARTIAL, 1,
			  [NETIF_F_GSO_PARTIAL is defined in netdev_features.h])
	],[
		AC_MSG_RESULT(no)
	])

	# this checker will test if the function exist
	# it may get:  warning: ?*((void *)&dev+548)? is used uninitialized in this function [-Wuninitialized]
	# but wont fail compilaton
	AC_MSG_CHECKING([if if_vlan.h has is_vlan_dev])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/netdevice.h>
		#include <linux/if_vlan.h>
	],[
		struct net_device dev;
		is_vlan_dev(&dev);

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_IS_VLAN_DEV, 1,
			  [is_vlan_dev is defined])
	],[
		AC_MSG_RESULT(no)
	])

	# this checker will test if the function exist AND gets const
	# otherwise it will fail.
	AC_MSG_CHECKING([if if_vlan.h has is_vlan_dev get const])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/netdevice.h>
		#include <linux/if_vlan.h>
	],[
		const struct net_device *dev;
		is_vlan_dev(dev);

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_IS_VLAN_DEV_CONST, 1,
			  [is_vlan_dev get const])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if struct net_device_ops has *ndo_set_vf_mac])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/netdevice.h>

		int set_vf_mac(struct net_device *dev, int queue, u8 *mac)
		{
			return 0;
		}
	],[
		struct net_device_ops netdev_ops;
		netdev_ops.ndo_set_vf_mac = set_vf_mac;

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_NDO_SET_VF_MAC, 1,
			  [ndo_set_vf_mac is defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if struct net_device_ops has *ndo_get_vf_stats])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/netdevice.h>

		int get_vf_stats(struct net_device *dev, int vf, struct ifla_vf_stats *vf_stats)
		{
			return 0;
		}
	],[
		struct net_device_ops netdev_ops;
		netdev_ops.ndo_get_vf_stats = get_vf_stats;

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_NDO_GET_VF_STATS, 1,
			  [ndo_get_vf_stats is defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if struct net_device_ops has *ndo_set_vf_guid])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/netdevice.h>

		int set_vf_guid(struct net_device *dev, int vf, u64 guid, int guid_type)
		{
			return 0;
		}
	],[
		struct net_device_ops netdev_ops;
		netdev_ops.ndo_set_vf_guid = set_vf_guid;

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_NDO_SET_VF_GUID, 1,
			  [ndo_set_vf_guid is defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if if_link.h struct has struct ifla_vf_stats])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/if_link.h>

	],[
		struct ifla_vf_stats x;
		x = x;

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_IFLA_VF_STATS, 1,
			  [struct ifla_vf_stats is defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if pci.h has pci_num_vf])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/pci.h>
	],[
		struct pci_dev x;
		pci_num_vf(&x);

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_PCI_NUM_VF, 1,
			  [pci_num_vf is defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if pci.h has pci_irq_get_node])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/pci.h>
	],[
		pci_irq_get_node(NULL, 0);

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_PCI_IRQ_GET_NODE, 1,
			  [pci_irq_get_node is defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if pci.h has pci_irq_get_affinity])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/pci.h>
	],[
		pci_irq_get_affinity(NULL, 0);

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_PCI_IRQ_GET_AFFINITY, 1,
			  [pci_irq_get_affinity is defined])
	],[
		AC_MSG_RESULT(no)
	])

	LB_CHECK_SYMBOL_EXPORT([elfcorehdr_addr],
		[kernel/crash_dump.c],
		[AC_DEFINE(HAVE_ELFCOREHDR_ADDR_EXPORTED, 1,
			[elfcorehdr_addr is exported by the kernel])],
	[])

	LB_CHECK_SYMBOL_EXPORT([fib_lookup],
		[net/ipv4/fib_rules.c],
		[AC_DEFINE(HAVE_FIB_LOOKUP_EXPORTED, 1,
			[fib_lookup is exported by the kernel])],
	[])

	AC_MSG_CHECKING([if idr.h has idr_alloc_cyclic])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/idr.h>
	],[
		idr_alloc_cyclic(NULL, NULL, 0, 0, 0);

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_IDR_ALLOC_CYCLIC, 1,
			  [idr_alloc_cyclic is defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if idr.h has idr_alloc])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/idr.h>
	],[
		idr_alloc(NULL, NULL, 0, 0, 0);

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_IDR_ALLOC, 1,
			  [idr_alloc is defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if idr.h has ida_is_empty])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/idr.h>
	],[
		struct ida ida;
		ida_is_empty(&ida);

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_IDA_IS_EMPTY, 1,
			  [ida_is_empty is defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if idr.h has idr_is_empty])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/idr.h>
	],[
		struct ida ida;
		idr_is_empty(&ida.idr);

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_IDR_IS_EMPTY, 1,
			  [idr_is_empty is defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if idr.h has ida_simple_get])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/idr.h>
	],[
		ida_simple_get(NULL, 0, 0, 0);

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_IDA_SIMPLE_GET, 1,
			  [ida_simple_get is defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if random.h has prandom_u32])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/random.h>
	],[
		prandom_u32();

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_PRANDOM_U32, 1,
			  [prandom_u32 is defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if timekeeping.h has ktime_get_real_ns])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/ktime.h>
		#include <linux/timekeeping.h>
	],[
		ktime_get_real_ns();

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_KTIME_GET_REAL_NS, 1,
			  [ktime_get_real_ns is defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if timekeeping.h has ktime_get_boot_ns])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/ktime.h>
		#include <linux/timekeeping.h>
	],[
		ktime_get_boot_ns();

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_KTIME_GET_BOOT_NS, 1,
			  [ktime_get_boot_ns is defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if scsi_transfer_length is defind])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <scsi/scsi_cmnd.h>
	],[
		scsi_transfer_length(NULL);

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_SCSI_TRANSFER_LENGTH, 1,
			  [scsi_transfer_length is defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if string.h has strnicmp])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/string.h>
	],[
		char a[10] = "aaa";
		char b[10] = "bbb";
		strnicmp(a, b, sizeof(a));

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_STRNICMP, 1,
			  [strnicmp is defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if string.h has kfree_const])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/string.h>
	],[
		const char *x;
		kfree_const(x);

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_KFREE_CONST, 1,
			  [kfree_const is defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if alloc_etherdev_mq is defined])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/etherdevice.h>
	],[
		alloc_etherdev_mq(0, 0);

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_ALLOC_ETHERDEV_MQ, 1,
			  [alloc_etherdev_mq is defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if netif_set_real_num_rx_queues is defined])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/netdevice.h>
	],[
		int rc = netif_set_real_num_rx_queues(NULL, 0);

		return rc;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_NETIF_SET_REAL_NUM_RX_QUEUES, 1,
			  [netif_set_real_num_rx_queues is defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if struct dcbnl_rtnl_ops has get/set ets and dcbnl defined])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/netdevice.h>
		#include <net/dcbnl.h>
	],[
		const struct dcbnl_rtnl_ops en_dcbnl_ops = {
			.ieee_getets = NULL,
			.ieee_setets = NULL,
		};

		struct net_device dev = {
			.dcbnl_ops = NULL,
		};

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_IEEE_DCBNL_ETS, 1,
			  [ieee_getets/ieee_setets is defined and dcbnl defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if list.h hlist_for_each_entry has 3 params])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/list.h>

		struct mlx5_l2_addr_node {
			struct hlist_node hlist;
			u8                addr[10];
		};
	],[
		struct mlx5_l2_addr_node *hn;
		struct hlist_head *hash;
		hlist_for_each_entry(hn, hash, hlist);
		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_HLIST_FOR_EACH_ENTRY_3_PARAMS, 1,
			  [hlist_for_each_entry has 3 params])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if device.h class devnode gets umode_t])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/device.h>
		static char *cm_devnode(struct device *dev, umode_t *mode) {
			return NULL;
		}

	],[
		struct class cm_class = {
			.devnode = cm_devnode,
		};

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_CLASS_DEVNODE_UMODE_T, 1,
			  [class devnode gets umode_t])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if device.h CLASS_ATTR_STRING])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/device.h>
		#include <linux/stat.h>
		#include <linux/stringify.h>
	],[
		CLASS_ATTR_STRING(abi_version, S_IRUGO,
			 __stringify(5));

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_CLASS_ATTR_STRING, 1,
			  [CLASS_ATTR_STRING is defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if device.h struct device has dma_ops])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/device.h>
	],[
		struct device devx = {
			.dma_ops = NULL,
		};

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_DEVICE_DMA_OPS, 1,
			  [struct device has dma_ops])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if file.h has fdget])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/file.h>
	],[
		fdget(0);

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_FDGET, 1,
			  [fdget is defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if file.h has get_unused_fd_flags])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/file.h>
		/* Don't use backported get_unused_fd_flags
		** it uses an unexported function
		*/
		#ifdef get_unused_fd_flags
		#undef get_unused_fd_flags
		#endif
	],[
		get_unused_fd_flags(0);

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_GET_UNUSED_FD_FLAGS, 1,
			  [GET_UNUSED_FD_FLAGS is defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if flow.h has flowi4, flowi6 - AF specific instances])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/bug.h>
		#include <net/flow.h>
	],[
		struct flowi4 fl4;
		struct flowi6 fl6;

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_FLOWI_AF_SPECIFIC_INSTANCES, 1,
			  [flowi4, flowi6  is defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if pat.h has pat_enabled as a function])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <asm/pat.h>
	],[
		bool px = pat_enabled();

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_PAT_ENABLED_AS_FUNCTION, 1,
			  [pat.h has pat_enabled as a function])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if icmpv6.h icmpv6_send has 4 parameters])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/icmpv6.h>
	],[
		icmpv6_send(NULL, 0, 0, 0);

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_ICMPV6_SEND_4_PARAMS, 1,
			  [icmpv6_send has 4 parameters])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if dst_ops.h update_pmtu has 4 parameters])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/skbuff.h>
		#include <net/dst_ops.h>

		static void mtu_up (struct dst_entry *dst, struct sock *sk,
				    struct sk_buff *skb, u32 mtu)
		{
			return;
		}
	],[
		struct dst_ops x = {
			.update_pmtu = mtu_up,
		};

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_UPDATE_PMTU_4_PARAMS, 1,
			  [update_pmtu has 4 paramters])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if rtnetlink.h rtnl_link_ops newlink has 4 paramters])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/netdevice.h>
		#include <net/rtnetlink.h>

		static int ipoib_new_child_link(struct net *src_net, struct net_device *dev,
						struct nlattr *tb[], struct nlattr *data[])
		{
			return 0;
		}
	],[
		struct rtnl_link_ops x = {
			.newlink = ipoib_new_child_link,
		};

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_RTNL_LINK_OPS_NEWLINK_4_PARAMS, 1,
			  [newlink has 4 paramters])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if rtnetlink.h rtnl_link_ops newlink has 5 paramters])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/netdevice.h>
		#include <net/rtnetlink.h>

		static int ipoib_new_child_link(struct net *src_net, struct net_device *dev,
										struct nlattr *tb[], struct nlattr *data[],
										struct netlink_ext_ack *extack)
		{
			return 0;
		}
	],[
		struct rtnl_link_ops x = {
			.newlink = ipoib_new_child_link,
		};

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_RTNL_LINK_OPS_NEWLINK_5_PARAMS, 1,
			  [newlink has 5 paramters])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if rtnetlink.h rtnl_link_ops dellink newlink has 2 paramters])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/netdevice.h>
		#include <net/rtnetlink.h>

		static void ipoib_unregister_child_dev(struct net_device *dev, struct list_head *head)
		{
			return;
		}
	],[
		struct rtnl_link_ops x = {
			.dellink = ipoib_unregister_child_dev,
		};

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_RTNL_LINK_OPS_DELLINK_2_PARAMS, 1,
			  [dellink has 2 paramters])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if ipv6.h has ipv6_addr_copy])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <net/ipv6.h>
	],[

		struct in6_addr x1;
		const struct in6_addr x2;
		ipv6_addr_copy(&x1, &x2);

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_IPV6_ADDR_COPY, 1,
			  [ipv6_addr_copy is defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if net/flow_keys.h exists])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/skbuff.h>
		#include <net/flow_keys.h>
	],[
		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_NET_FLOW_KEYS_H, 1,
			  [net/flow_keys.h exists])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if netdevice.h has netif_tx_queue_stopped])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/netdevice.h>
	],[
		netif_tx_queue_stopped(NULL);

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_NETIF_TX_QUEUE_STOPPED, 1,
			  [netif_tx_queue_stopped is defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if netdevice.h has netif_trans_update])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/netdevice.h>
	],[
		netif_trans_update(NULL);

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_NETIF_TRANS_UPDATE, 1,
			  [netif_trans_update is defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if include/linux/inet_lro.h exists])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/inet_lro.h>
	],[
		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_INET_LRO_H, 1,
			  [include/linux/inet_lro.h exists])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if netdevice.h has netif_xmit_stopped])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/netdevice.h>
	],[
		netif_xmit_stopped(NULL);

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_NETIF_XMIT_STOPPED, 1,
			  [netif_xmit_stopped is defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if netdevice.h has netdev_get_tx_queue])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/netdevice.h>
	],[
		netdev_get_tx_queue(NULL, 0);

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_NETDEV_GET_TX_QUEUE, 1,
			  [netdev_get_tx_queue is defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if netdevice.h alloc_netdev_mqs has 5 params])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/netdevice.h>
	],[
		alloc_netdev_mqs(0, NULL, NULL, 0, 0);

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_ALLOC_NETDEV_MQS_5_PARAMS, 1,
			  [alloc_netdev_mqs has 5 params])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if netdevice.h alloc_netdev_mq has 4 params])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/netdevice.h>
	],[
		alloc_netdev_mq(0, NULL, NULL, 0);

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_ALLOC_NETDEV_MQ_4_PARAMS, 1,
			  [alloc_netdev_mq has 4 params])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if mm.h get_user_pages has 8 params])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/mm.h>
	],[
		get_user_pages(NULL, NULL, 0, 0, 0, 0, NULL, NULL);

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_GET_USER_PAGES_8_PARAMS, 1,
			[get_user_pages has 8 params])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if mm.h has kvzalloc])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/mm.h>
	],[
		kvzalloc(0, 0);

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_KVZALLOC, 1,
			[kvzalloc is defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if mm.h has kvmalloc_array])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/mm.h>
	],[
		kvmalloc_array(0, 0, 0);

		return 0;
	],[
		AC_MSG_RESULT(yes)
	MLNX_AC_DEFINE(HAVE_KVMALLOC_ARRAY, 1,
			[kvmalloc_array is defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if mm.h has kvmalloc_node])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/mm.h>
	],[
		kvmalloc_node(0, 0, 0);

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_KVMALLOC_NODE, 1,
			[kvmalloc_node is defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if mm.h has kvzalloc_node])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/mm.h>
	],[
		kvzalloc_node(0, 0, 0);

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_KVZALLOC_NODE, 1,
			[kvzalloc_node is defined])
	],[
		AC_MSG_RESULT(no)
	])


	AC_MSG_CHECKING([if mm_types.h struct page has _count])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/mm.h>
		#include <linux/mm_types.h>
	],[
		struct page p;
		p._count.counter = 0;

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_MM_PAGE__COUNT, 1,
			  [struct page has _count])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if linux/ethtool.h has ETHTOOL_xLINKSETTINGS API])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/ethtool.h>
	],[
		enum ethtool_link_mode_bit_indices x = ETHTOOL_LINK_MODE_TP_BIT;

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_ETHTOOL_xLINKSETTINGS, 1,
			  [ETHTOOL_xLINKSETTINGS API is defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if configfs.h default_groups is list_head])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/configfs.h>
	],[
		struct config_group x = {
			.group_entry = NULL,
		};

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_CONFIGFS_DEFAULT_GROUPS_LIST, 1,
			  [default_groups is list_head])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if include/linux/irq_poll.h exists])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/irq_poll.h>
	],[
		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_IRQ_POLL_H, 1,
			  [include/linux/irq_poll.h exists])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if slab.h has kmalloc_array])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/slab.h>
	],[
		kmalloc_array(0, 0, 0);

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_KMALLOC_ARRAY, 1,
			  [kmalloc_array is defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if kernel.h has reciprocal_scale])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/kernel.h>
	],[
		reciprocal_scale(0, 0);

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_RECIPROCAL_SCALE, 1,
			  [reciprocal_scale is defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if io_mapping_map_wc has 3 params])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/io-mapping.h>
	],[
		io_mapping_map_wc(NULL, 0, 0);

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_IO_MAPPING_MAP_WC_3_PARAMS, 1,
			  [io_mapping_map_wc has 3 params])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if linux/dma-mapping.h has struct dma_attrs])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/dma-mapping.h>
	],[
		struct dma_attrs *attrs;
		int ret;

		ret = dma_get_attr(DMA_ATTR_WRITE_BARRIER, attrs);

		return ret;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_STRUCT_DMA_ATTRS, 1,
			  [struct dma_attrs is defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if struct blk_mq_ops has map_queue])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/blk-mq.h>
	],[
		struct blk_mq_ops ops = {
			.map_queue = NULL,
		};

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_BLK_MQ_OPS_MAP_QUEUE, 1,
			  [struct blk_mq_ops has map_queue])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if linux/blk-mq.h has blk_mq_freeze_queue_wait_timeout])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/blk-mq.h>
	],[
		blk_mq_freeze_queue_wait_timeout(NULL, 0);

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_BLK_MQ_FREEZE_QUEUE_WAIT_TIMEOUT, 1,
			  [blk_mq_freeze_queue_wait_timeout is defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if linux/blk-mq.h has blk_mq_freeze_queue_wait])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/blk-mq.h>
	],[
		blk_mq_freeze_queue_wait(NULL);

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_BLK_MQ_FREEZE_QUEUE_WAIT, 1,
			  [blk_mq_freeze_queue_wait is defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if struct blk_mq_ops has map_queues])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/blk-mq.h>
	],[
		struct blk_mq_ops ops = {
			.map_queues = NULL,
		};

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_BLK_MQ_OPS_MAP_QUEUES, 1,
			  [struct blk_mq_ops has map_queues])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if include/linux/blk-mq-pci.h exists])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/blk-mq-pci.h>
	],[
		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_BLK_MQ_PCI_H, 1,
			  [include/linux/blk-mq-pci.h exists])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if dma-mapping.h has DMA_ATTR_NO_WARN])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/dma-mapping.h>
	],[
		int x = DMA_ATTR_NO_WARN;

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_DMA_ATTR_NO_WARN, 1,
			  [DMA_ATTR_NO_WARN is defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if dma-mapping.h has dma_alloc_attrs takes unsigned long attrs])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/dma-mapping.h>
	],[
		dma_alloc_attrs(NULL, 0, NULL, GFP_KERNEL, DMA_ATTR_NO_KERNEL_MAPPING);

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_DMA_SET_ATTR_TAKES_UNSIGNED_LONG_ATTRS, 1,
			  [dma_alloc_attrs takes unsigned long attrs])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if lightnvm.h struct nvm_dev has member dev])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/lightnvm.h>
	],[
		struct device devx = {0};
		struct nvm_dev d = {
			.dev = devx,
		};

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_LIGHTNVM_NVM_DEV, 1,
			  [nvm_dev dev is defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if filter.h has struct xdp_buff])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/filter.h>
	],[
		struct xdp_buff d = {
			.data = NULL,
			.data_end = NULL,
		};

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_XDP_BUFF, 1,
			  [xdp is defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if filter.h struct xdp_buff has data_hard_start])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/filter.h>
	],[
		struct xdp_buff d = {
			.data_hard_start = NULL,
		};

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_XDP_BUFF_DATA_HARD_START, 1,
			  [xdp_buff data_hard_start is defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if filter.h has xdp_set_data_meta_invalid])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/filter.h>
	],[
		struct xdp_buff d;
		xdp_set_data_meta_invalid(&d);

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_XDP_SET_DATA_META_INVALID, 1,
			  [xdp_set_data_meta_invalid is defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if scsi.h has SG_MAX_SEGMENTS])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <scsi/scsi.h>
	],[
		int x = SG_MAX_SEGMENTS;

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_SG_MAX_SEGMENTS, 1,
			  [SG_MAX_SEGMENTS is defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if scsi_device.h has SCSI_SCAN_INITIAL])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <scsi/scsi_device.h>
	],[
		int x = SCSI_SCAN_INITIAL;

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_SCSI_SCAN_INITIAL, 1,
			  [SCSI_SCAN_INITIAL is defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if scsi_device.h has enum scsi_scan_mode])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <scsi/scsi_device.h>
	],[
		enum scsi_scan_mode xx = SCSI_SCAN_INITIAL;

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_ENUM_SCSI_SCAN_MODE, 1,
			  [enum scsi_scan_mode is defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if scsi_device.h has blist_flags_t])
       	MLNX_BG_LB_LINUX_TRY_COMPILE([
               	#include <scsi/scsi_device.h>
        ],[
               blist_flags_t x = 0;

               return 0;
        ],[
               AC_MSG_RESULT(yes)
               MLNX_AC_DEFINE(HAVE_BLIST_FLAGS_T, 1,
                         [blist_flags_t is defined])
        ],[
               AC_MSG_RESULT(no)
        ])

	AC_MSG_CHECKING([if iscsi_transport.h struct iscsit_transport has member rdma_shutdown])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <target/iscsi/iscsi_transport.h>
	],[
		struct iscsit_transport it = {
			.rdma_shutdown = 0,
		};

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_ISCSIT_TRANSPORT_RDMA_SHUTDOWN, 1,
			  [rdma_shutdown is defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if iscsi_transport.h struct iscsit_transport has member iscsit_get_rx_pdu])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <target/iscsi/iscsi_transport.h>

		static void isert_get_rx_pdu(struct iscsi_conn *conn)
		{
			return;
		}
	],[
		struct iscsit_transport it = {
			.iscsit_get_rx_pdu = isert_get_rx_pdu,
		};

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_ISCSIT_TRANSPORT_ISCSIT_GET_RX_PDU, 1,
			  [iscsit_get_rx_pdu is defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if iscsi_target_core.h struct iscsi_conn has member login_sockaddr])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <target/iscsi/iscsi_target_core.h>
	],[
		struct iscsi_conn c = {
			.login_sockaddr = {0},
		};

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_ISCSI_CONN_LOGIN_SOCKADDR, 1,
			  [iscsi_conn has member login_sockaddr])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if iscsi_target_core.h struct iscsi_conn has member local_sockaddr])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <target/iscsi/iscsi_target_core.h>
	],[
		struct iscsi_conn c = {
			.local_sockaddr = {0},
		};

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_ISCSI_CONN_LOCAL_SOCKADDR, 1,
			  [iscsi_conn has members local_sockaddr])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if blk_queue_virt_boundary exist])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/blkdev.h>
	],[
		blk_queue_virt_boundary(NULL, 0);
		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_BLK_QUEUE_VIRT_BOUNDARY, 1,
				[blk_queue_virt_boundary exist])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if linux/blkdev.h has blk_rq_is_passthrough])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/blkdev.h>
	],[
		blk_rq_is_passthrough(NULL);
		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_BLK_RQ_IS_PASSTHROUGH, 1,
				[blk_rq_is_passthrough is defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if target_put_sess_cmd has 1 parameter])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <target/target_core_base.h>
		#include <target/target_core_fabric.h>
	],[
		target_put_sess_cmd(NULL);

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_TARGET_PUT_SESS_CMD_HAS_1_PARAM, 1,
			  [target_put_sess_cmd in target_core_fabric.h has 1 parameter])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if scsi_device.h has scsi_change_queue_depth])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <scsi/scsi_device.h>
	],[
		scsi_change_queue_depth(NULL, 0);
		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_SCSI_CHANGE_QUEUE_DEPTH, 1,
			[scsi_change_queue_depth exist])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if scsi_host.h struct scsi_host_template has member track_queue_depth])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <scsi/scsi_host.h>
	],[
		struct scsi_host_template sh = {
			.track_queue_depth = 0,
		};
		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_SCSI_HOST_TEMPLATE_TRACK_QUEUE_DEPTH, 1,
			[scsi_host_template has members track_queue_depth])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if blk-mq.h has blk_mq_unique_tag])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/blk-mq.h>
	],[
		blk_mq_unique_tag(NULL);

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_BLK_MQ_UNIQUE_TAG, 1,
				[blk_mq_unique_tag exist])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if scsi_host.h struct Scsi_Host has member nr_hw_queues])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <scsi/scsi_host.h>
	],[
		struct Scsi_Host sh = {
			.nr_hw_queues = 0,
		};

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_SCSI_HOST_NR_HW_QUEUES, 1,
				[Scsi_Host has members nr_hw_queues])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if iscsi_target_core and iscsi_target_stat.h are under include/])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <target/iscsi/iscsi_target_core.h>
	],[
		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_ISCSI_TARGET_CORE_ISCSI_TARGET_STAT_H, 1,
			  [iscsi_target_core.h and iscsi_target_stat.h are under include/])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if iscsi_target_core.h has iscsit_find_cmd_from_itt])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <target/iscsi/iscsi_target_core.h>
	],[
		iscsit_find_cmd_from_itt(NULL, 0);

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_ISCSIT_FIND_CMD_FROM_ITT, 1,
		[iscsit_find_cmd_from_itt is defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if scsi_cmnd.h struct scsi_cmnd  has member prot_flags])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <scsi/scsi_cmnd.h>
	],[
		struct scsi_cmnd sc = {
			.prot_flags = 0,
		};
		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_SCSI_CMND_PROT_FLAGS, 1,
			[scsi_cmnd has members prot_flags])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if scsi_transport_iscsi.h struct iscsi_transport has member check_protection])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <scsi/scsi_transport_iscsi.h>
	],[
		struct iscsi_transport iscsi_iser_transport = {
			.check_protection = NULL,
		};

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_ISCSI_TRANSPORT_CHECK_PROTECTION, 1,
			  [check_protection is defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if struct iscsi_transport attr_is_visible returns umode_t])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <scsi/scsi_transport_iscsi.h>
		static umode_t iser_attr_is_visible(int param_type, int param)
		{
			return 0;
		}

	],[
		struct iscsi_transport iscsi_iser_transport = {
			.attr_is_visible = iser_attr_is_visible,
		};

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_ATTR_IS_VISIBLE_RET_UMODE_T, 1,
			  [attr_is_visible returns umode_t])
	],[
		AC_MSG_RESULT(no)
	])

    AC_MSG_CHECKING([if iscsi_transport.h struct iscsit_transport has member iscsit_get_sup_prot_ops])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <target/iscsi/iscsi_transport.h>

		enum target_prot_op get_sup_prot_ops(struct iscsi_conn *conn)
		{
			return 0;
		}

	],[
		struct iscsit_transport it = {
			.iscsit_get_sup_prot_ops = get_sup_prot_ops,
		};

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_ISCSIT_TRANSPORT_HAS_GET_SUP_PROT_OPS, 1,
			[iscsit_transport has member iscsit_get_sup_prot_ops])
	],[
		AC_MSG_RESULT(no)
	])

    AC_MSG_CHECKING([if target_core_base.h struct se_cmd has member prot_checks])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <target/target_core_base.h>

	],[
		struct se_cmd se = {
			.prot_checks = 0,
		};

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_SE_CMD_HAS_PROT_CHECKS, 1,
			[struct se_cmd has member prot_checks])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if target_core_fabric.h has target_reverse_dma_direction function])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <target/target_core_base.h>
		#include <target/target_core_fabric.h>
	],[
		target_reverse_dma_direction(NULL);

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_TARGET_FABRIC_HAS_TARGET_REVERSE_DMA_DIRECTION, 1,
			  [target_core_fabric.h has target_reverse_dma_direction function])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if mm_types.h struct mm_struct has free_area_cache ])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/mm_types.h>
	],[
		struct mm_struct x;
		x.free_area_cache = NULL;
		x.cached_hole_size = NULL;

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_MM_STRUCT_FREE_AREA_CACHE, 1,
			[mm_types.h struct mm_struct has free_area_cache])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if types.h has cycle_t])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/types.h>
	],[
		cycle_t x = 0;

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_TYPE_CYCLE_T, 1,
			[type cycle_t is defined in linux/types.h])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if linux/clocksource.h has cycle_t])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/clocksource.h>
	],[
		cycle_t x = 0;

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_CLOCKSOURCE_CYCLE_T, 1,
			  [cycle_t is defined in linux/clocksource.h])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if highmem.h has kmap_atomic function with km_type])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/highmem.h>
	],[
		kmap_atomic(NULL, KM_USER0);

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_KM_TYPE, 1,
			  [highmem.h has kmap_atomic function with km_type])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if iscsi_proto.h has structure iscsi_cmd])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <scsi/iscsi_proto.h>
	],[
		struct iscsi_cmd hdr;

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_ISCSI_CMD, 1,
			  [iscsi_proto.h has structure iscsi_cmd])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if scsi_device.h struct scsi_device has u64 lun])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <scsi/scsi_device.h>
	],[
		struct scsi_device sdev = {
			.lun = 0,
		};

		pr_err("lun %llu", sdev.lun);

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_SCSI_DEVICE_U64_LUN, 1,
			  [scsi_device.h struct scsi_device has u64 lun])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if scsi_device.h struct scsi_device has member state_mutex])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/mutex.h>
		#include <scsi/scsi_device.h>
	],[
		struct scsi_device sdev;
		mutex_init(&sdev.state_mutex);

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_SCSI_DEVICE_STATE_MUTEX, 1,
			  [scsi_device.h struct scsi_device has member state_mutex])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if net_namespace.h has register_net_sysctl])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <net/net_namespace.h>
	],[
		register_net_sysctl(NULL, NULL, NULL);

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_REGISTER_NET_SYSCTL, 1,
			  [register_net_sysctl is defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if scsi_host.h struct scsi_host_template has member use_blk_tags])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <scsi/scsi_host.h>
	],[
		struct scsi_host_template sh = {
			.use_blk_tags = 0,
		};
		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_SCSI_HOST_TEMPLATE_USE_BLK_TAGS, 1,
			[scsi_host_template has members use_blk_tags])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if scsi_host.h struct scsi_host_template has member change_queue_type])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <scsi/scsi_host.h>
	],[
		struct scsi_host_template sh = {
			.change_queue_type = 0,
		};
		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_SCSI_HOST_TEMPLATE_CHANGE_QUEUE_TYPE, 1,
			[scsi_host_template has members change_queue_type])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if scsi_tcq.h has function scsi_change_queue_type])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <scsi/scsi_tcq.h>
	],[
		scsi_change_queue_type(NULL, 0);

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_SCSI_TCQ_SCSI_CHANGE_QUEUE_TYPE, 1,
			[scsi_tcq.h has function scsi_change_queue_type])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if scsi_host.h struct scsi_host_template has member use_host_wide_tags])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <scsi/scsi_host.h>
	],[
		struct scsi_host_template sh = {
			.use_host_wide_tags = 0,
		};
		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_SCSI_HOST_TEMPLATE_USE_HOST_WIDE_TAGS, 1,
			[scsi_host_template has members use_host_wide_tags])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if target_core_base.h se_cmd transport_complete_callback has three params])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <target/target_core_base.h>

		sense_reason_t transport_complete_callback(struct se_cmd *se, bool b, int *i) {
			  return 0;
		}
	],[
		struct se_cmd se = {
			  .transport_complete_callback = transport_complete_callback,
		};

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_SE_CMD_TRANSPORT_COMPLETE_CALLBACK_HAS_THREE_PARAM, 1,
			  [target_core_base.h se_cmd transport_complete_callback has three params])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if target_core_base.h se_cmd supports compare_and_write])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <target/target_core_base.h>
	],[
		uint64_t flag = SCF_COMPARE_AND_WRITE;
		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_TARGET_SUPPORT_COMPARE_AND_WRITE, 1,
			  [target_core_base.h se_cmd supports compare_and_write])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if lightnvm.h struct nvmm_type has part_to_tgt])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/lightnvm.h>
	],[
		struct nvmm_type n = { .part_to_tgt = NULL, };

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_NVMM_TYPE_HAS_PART_TO_TGT, 1,
			[lightnvm.h struct nvmm_type has part_to_tgt])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if lightnvm.h has struct nvm_geo])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/lightnvm.h>
	],[
		struct nvm_geo x;

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_NVM_GEO, 1,
			  [HAVE_NVME_GEO is defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if lightnvm.h struct nvm_id has grp])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/lightnvm.h>
	],[
		struct nvm_id_group grpxx;
		struct nvm_id x = {
			.grp = grpxx,
		};

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_LIGHTNVM_NVM_ID_GRP, 1,
			  [struct nvm_id has grp])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if lightnvm.h nvm_end_io takes 1 parameter])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/lightnvm.h>
	],[
		nvm_end_io(NULL);

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_NVM_END_IO_1_PARAM, 1,
			  [nvm_end_io takes 1 parameter])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if uapi/linux/lightnvm.h has struct nvm_user_vio])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/genhd.h>
		#include <uapi/linux/lightnvm.h>
	],[
		struct nvm_user_vio vio;

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_NVM_USER_VIO, 1,
			  [struct nvm_user_vio is defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if blkdev.h struct request has rq_flags])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/blkdev.h>
	],[
		struct request rq = { .rq_flags = 0 };
		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_REQUEST_RQ_FLAGS, 1,
			[blkdev.h struct request has rq_flags])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if blk-mq.h blk_mq_requeue_request has 2 parameters])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/blk-mq.h>
	],[
		blk_mq_requeue_request(NULL, false);

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_BLK_MQ_REQUEUE_REQUEST_2_PARAMS, 1,
			  [blk-mq.h blk_mq_requeue_request has 2 parameters])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if blkdev.h has blk_mq_quiesce_queue])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/blkdev.h>
		#include <linux/blk-mq.h>
	],[
		blk_mq_quiesce_queue(NULL);

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_BLK_MQ_QUIESCE_QUEUE, 1,
				[blk_mq_quiesce_queue exist])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if blk-mq.h has BLK_MQ_F_NO_SCHED])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/blk-mq.h>
	],[
		int x = BLK_MQ_F_NO_SCHED;

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_BLK_MQ_F_NO_SCHED, 1,
				[BLK_MQ_F_NO_SCHED is defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if blkdev.h has blk_rq_nr_phys_segments])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/blkdev.h>
	],[
		blk_rq_nr_phys_segments(NULL);

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_BLK_RQ_NR_PHYS_SEGMENTS, 1,
			[blk_rq_nr_phys_segments exist])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if blkdev.h has blk_rq_payload_bytes])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/blkdev.h>
	],[
		blk_rq_payload_bytes(NULL);

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_BLK_RQ_NR_PAYLOAD_BYTES, 1,
			[blk_rq_payload_bytes exist])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if blkdev.h has req_op])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/blkdev.h>
	],[
		struct request *req;
		req_op(req);

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_REQ_OP, 1,
			[req_op exist])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if blkdev.h has blk_rq_nr_discard_segments])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/blkdev.h>
	],[
		blk_rq_nr_discard_segments(NULL);

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_BLK_RQ_NR_DISCARD_SEGMENTS, 1,
			[blk_rq_nr_discard_segments is defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if pci_ids.h has PCI_CLASS_STORAGE_EXPRESS])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/pci_ids.h>
	],[
		int x = PCI_CLASS_STORAGE_EXPRESS;

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_PCI_CLASS_STORAGE_EXPRESS, 1,
			  [PCI_CLASS_STORAGE_EXPRESS is defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if linux/blk_types.h has REQ_OP_DRV_OUT])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/blk_types.h>
	],[
		enum req_opf xx = REQ_OP_DRV_OUT;

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_BLK_TYPES_REQ_OP_DRV_OUT, 1,
			  [REQ_OP_DRV_OUT is defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if linux/blk_types.h has blk_mq_req_flags_t])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/blk_types.h>
	],[
		blk_mq_req_flags_t x = 0;

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_BLK_MQ_REQ_FLAGS_T, 1,
			  [blk_mq_req_flags_t is defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if linux/cgroup_rdma.h exists])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/cgroup_rdma.h>
	],[
		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_CGROUP_RDMA_H, 1,
			  [linux/cgroup_rdma exists])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if linux/sched/signal.h exists])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/sched/signal.h>
	],[
		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_SCHED_SIGNAL_H, 1,
			  [linux/sched/signal.h exists])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if linux/sched/mm.h exists])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/sched/mm.h>
	],[
		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_SCHED_MM_H, 1,
			  [linux/sched/mm.h exists])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if memalloc_noio_save defined])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/sched.h>
		#include <linux/sched/mm.h>
	],[
		unsigned int noio_flag = memalloc_noio_save();

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_MEMALLOC_NOIO_SAVE, 1,
			  [memalloc_noio_save is defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if linux/sched/task.h exists])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/sched/task.h>
	],[
		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_SCHED_TASK_H, 1,
			  [linux/sched/task.h exists])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if net/ip_tunnels.h has struct ip_tunnel_info])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/if.h>
		#include <net/ip_tunnels.h>
	],[
		struct ip_tunnel_info ip_tunnel_info_test;

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_IP_TUNNEL_INFO, 1,
			  [struct ip_tunnel_info is defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if linux/hashtable.h exists])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/hashtable.h>
	],[
		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_LINUX_HASHTABLE_H, 1,
			  [linux/hashtable.h exists])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if linux/bpf_trace exists])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/bpf.h>
		#include <linux/bpf_trace.h>
	],[
		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_LINUX_BPF_TRACE_H, 1,
			  [linux/bpf_trace exists])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if linux/bpf_trace has trace_xdp_exception])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/bpf_trace.h>
	],[
		trace_xdp_exception(NULL, NULL, 0);

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_TRACE_XDP_EXCEPTION, 1,
			  [trace_xdp_exception is defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if linux/bpf.h exists])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/bpf.h>
	],[
		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_LINUX_BPF_H, 1,
			  [uapi/bpf.h exists])
	],[
		AC_MSG_RESULT(no)
	])

	LB_CHECK_SYMBOL_EXPORT([bpf_prog_inc],
		[kernel/bpf/syscall.c],
		[AC_DEFINE(HAVE_BPF_PROG_INC_EXPORTED, 1,
			[bpf_prog_inc is exported by the kernel])],
	[])

	LB_CHECK_SYMBOL_EXPORT([__put_task_struct],
		[kernel/fork.c],
		[AC_DEFINE(HAVE_PUT_TASK_STRUCT_EXPORTED, 1,
			[__put_task_struct is exported by the kernel])],
	[])

	LB_CHECK_SYMBOL_EXPORT([get_pid_task],
		[kernel/pid.c],
		[AC_DEFINE(HAVE_GET_PID_TASK_EXPORTED, 1,
			[get_pid_task is exported by the kernel])],
	[])

	LB_CHECK_SYMBOL_EXPORT([get_task_pid],
		[kernel/pid.c],
		[AC_DEFINE(HAVE_GET_TASK_PID_EXPORTED, 1,
			[get_task_pid is exported by the kernel])],
	[])

	AC_MSG_CHECKING([if linux/bpf.h has bpf_prog_sub])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/bpf.h>
	],[
		bpf_prog_sub(NULL, 0);

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_BPF_PROG_SUB, 1,
			  [bpf_prog_sub is defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if linux/bpf.h bpf_prog_aux has feild id])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/bpf.h>
	],[
		struct bpf_prog_aux x = {
			.id = 0,
		};

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_BPF_PROG_AUX_FEILD_ID, 1,
			  [bpf_prog_aux has feild id])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if struct tc_to_netdev has egress_dev])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/netdevice.h>
	],[
		struct tc_to_netdev x = {
			.egress_dev = false,
		};

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_TC_TO_NETDEV_EGRESS_DEV, 1,
			  [struct tc_to_netdev has egress_dev])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if struct tc_to_netdev has tc])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/netdevice.h>
	],[
		struct tc_to_netdev x;
		x.tc = 0;

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_TC_TO_NETDEV_TC, 1,
			  [struct tc_to_netdev has tc])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if ndo_has_offload_stats gets net_device])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/netdevice.h>

		bool mlx5e_has_offload_stats(const struct net_device *dev, int attr_id)
		{
			return true;
		}
	],[
		struct net_device_ops ndops = {
			.ndo_has_offload_stats = mlx5e_has_offload_stats,
		};

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(NDO_HAS_OFFLOAD_STATS_GETS_NET_DEVICE, 1,
			  [ndo_has_offload_stats gets net_device])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if net_device_ops_extended has ndo_has_offload_stats])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/netdevice.h>

		bool mlx5e_has_offload_stats(const struct net_device *dev, int attr_id)
		{
			return true;
		}
	],[
		struct net_device_ops_extended ndops = {
			.ndo_has_offload_stats = mlx5e_has_offload_stats,
		};

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_NDO_HAS_OFFLOAD_STATS_EXTENDED, 1,
			  [ndo_has_offload_stats gets net_device])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if ndo_get_offload_stats defined])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/netdevice.h>

		int mlx5e_get_offload_stats(int attr_id, const struct net_device *dev,
									void *sp)
		{
			return 0;
		}
	],[
		struct net_device_ops ndops = {
			.ndo_get_offload_stats = mlx5e_get_offload_stats,
		};

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_NDO_GET_OFFLOAD_STATS, 1,
			  [ndo_get_offload_stats is defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if struct net_device_ops_extended has ndo_get_offload_stats])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/netdevice.h>

		int mlx5e_get_offload_stats(int attr_id, const struct net_device *dev,
									void *sp)
		{
			return 0;
		}
	],[
		struct net_device_ops_extended ndops = {
			.ndo_get_offload_stats = mlx5e_get_offload_stats,
		};

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_NDO_GET_OFFLOAD_STATS_EXTENDED, 1,
			  [extended ndo_get_offload_stats is defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if netdevice.h has struct netdev_notifier_info])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/netdevice.h>
	],[
		struct netdev_notifier_info x = {
			.dev = NULL,
		};

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_NETDEV_NOTIFIER_INFO, 1,
			  [struct netdev_notifier_info is defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if net/tc_act/tc_tunnel_key.h exists])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <net/tc_act/tc_tunnel_key.h>
	],[
		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_NET_TC_ACT_TC_TUNNEL_KEY_H, 1,
			  [net/tc_act/tc_tunnel_key.h exists])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if net/tc_act/tc_tunnel_key.h has tcf_tunnel_info])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <net/tc_act/tc_tunnel_key.h>
	],[
		const struct tc_action xx;
		tcf_tunnel_info(&xx);

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_TCF_TUNNEL_INFO, 1,
			  [tcf_tunnel_info is defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if net/tc_act/tc_pedit.h has tcf_pedit_nkeys])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <net/tc_act/tc_pedit.h>
	],[
		const struct tc_action xx;
		tcf_pedit_nkeys(&xx);

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_TCF_PEDIT_NKEYS, 1,
			  [tcf_pedit_nkeys is defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if net/tc_act/tc_pedit.h struct tcf_pedit has member tcfp_keys_ex])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <net/tc_act/tc_pedit.h>
	],[
		struct tcf_pedit x = {
			.tcfp_keys_ex = NULL,
		};
		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_TCF_PEDIT_TCFP_KEYS_EX, 1,
			  [struct tcf_pedit has member tcfp_keys_ex])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if scsi_device.h has function scsi_internal_device_block])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <scsi/scsi_device.h>
	],[
		scsi_internal_device_block(NULL, 0);

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_SCSI_DEVICE_SCSI_INTERNAL_DEVICE_BLOCK, 1,
			[scsi_device.h has function scsi_internal_device_block])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if libiscsi.h has iscsi_eh_cmd_timed_out])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/blkdev.h>
		#include <scsi/libiscsi.h>
	],[
		iscsi_eh_cmd_timed_out(NULL);

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_ISCSI_EH_CMD_TIMED_OUT, 1,
			[iscsi_eh_cmd_timed_out is defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if linux/sed-opal.h exists])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/sed-opal.h>
	],[
		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_LINUX_SED_OPAL_H, 1,
			[linux/sed-opal.h exists])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if bio.h bio_init has 3 parameters])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/bio.h>
	],[
		bio_init(NULL, NULL, false);

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_BIO_INIT_3_PARAMS, 1,
			  [bio.h bio_init has 3 parameters])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if blk_types.h has REQ_IDLE])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/blk_types.h>
	],[
		int flags = REQ_IDLE;
		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_REQ_IDLE, 1,
			[blk_types.h has REQ_IDLE])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if blkdev.h has blk_mq_poll])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/blkdev.h>
	],[
		blk_mq_poll(NULL, 0);

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_BLK_MQ_POLL, 1,
			[blk_mq_poll exist])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if blkdev.h has __blkdev_issue_zeroout])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/blkdev.h>
	],[
		__blkdev_issue_zeroout(NULL, 0, 0, 0, NULL, 0);

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_BLKDEV_ISSUE_ZEROOUT, 1,
			[__blkdev_issue_zeroout exist])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if compiler.h has const __read_once_size])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/compiler.h>
	],[
		const unsigned long tmp;
		__read_once_size(&tmp, NULL, 0);

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_CONST_READ_ONCE_SIZE, 1,
			[const __read_once_size exist])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if configfs_item_operations drop_link returns int])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/configfs.h>

		static int my_drop_link(struct config_item *parent, struct config_item *target)

		{
			return 0;
		}

	],[
		static struct configfs_item_operations item_ops = {
			.drop_link	= my_drop_link,
		};

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(CONFIGFS_DROP_LINK_RETURNS_INT, 1,
			  [if configfs_item_operations drop_link returns int])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if argument 3 of config_group_init_type_name should const])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/configfs.h>

		static const struct config_item_type cma_port_group_type = {
			.ct_attrs	= cma_configfs_attributes,
		};

	],[
		config_group_init_type_name(NULL,
					    NULL,
					    &cma_port_group_type);

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(CONFIG_GROUP_INIT_TYPE_NAME_PARAM_3_IS_CONST, 1,
			[argument 3 of config_group_init_type_name should const])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if linux/nvme-fc-driver.h exists])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/scatterlist.h>
		#include <uapi/scsi/fc/fc_fs.h>
		#include <linux/nvme-fc-driver.h>
	],[
		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_LINUX_NVME_FC_DRIVER_H, 1,
			[linux/nvme-fc-driver.h exists])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if moduleparam.h has kernel_param_ops])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/moduleparam.h>
	],[
		static struct kernel_param_ops ops = {0};

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_MODULEPARAM_KERNEL_PARAM_OPS, 1,
			[moduleparam.h has kernel_param_ops])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if scsi_host.h struct scsi_host_template has member lockless])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <scsi/scsi_host.h>
	],[
		struct scsi_host_template sh = {
			.lockless = 0,
		};
		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_SCSI_HOST_TEMPLATE_LOCKLESS, 1,
			[scsi_host_template has members lockless])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if linux/blk-mq.h has blk_freeze_queue_start])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/blk-mq.h>
	],[
		blk_freeze_queue_start(NULL);

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_BLK_FREEZE_QUEUE_START, 1,
			  [blk_freeze_queue_start is defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if linux/blk-mq.h blk_mq_complete_request has 2 parameters])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/blk-mq.h>
	],[
		blk_mq_complete_request(NULL, 0);

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_BLK_MQ_COMPLETE_REQUEST_HAS_2_PARAMS, 1,
			  [linux/blk-mq.h blk_mq_complete_request has 2 parameters])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if linux/blk-mq.h blk_mq_ops init_request has 4 parameters])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/blk-mq.h>

		int init_request(struct blk_mq_tag_set *set, struct request * req,
				 unsigned int i, unsigned int k) {
			return 0;
		}
	],[
		struct blk_mq_ops ops = {
			.init_request = init_request,
		};

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_BLK_MQ_OPS_INIT_REQUEST_HAS_4_PARAMS, 1,
			  [linux/blk-mq.h blk_mq_ops init_request has 4 parameters])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if linux/blk-mq.h blk_mq_ops exit_request has 3 parameters])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/blk-mq.h>

		void exit_request(struct blk_mq_tag_set *set, struct request * req,
				  unsigned int i) {
			return;
		}
	],[
		struct blk_mq_ops ops = {
			.exit_request = exit_request,
		};

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_BLK_MQ_OPS_EXIT_REQUEST_HAS_3_PARAMS, 1,
			  [linux/blk-mq.h blk_mq_ops exit_request has 3 parameters])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if linux/blk-mq.h blk_mq_tag_set member ops is const])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/blk-mq.h>
		static const struct blk_mq_ops xmq = {0};

	],[
		struct blk_mq_tag_set x = {
			.ops = &xmq,
		};

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_BLK_MQ_TAG_SET_HAS_CONST_POS, 1,
			  [ blk_mq_tag_set member ops is const])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if linux/blkdev.h has blk_queue_max_write_zeroes_sectors])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/blkdev.h>
	],[
		blk_queue_max_write_zeroes_sectors(NULL, 0);

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_BLK_QUEUE_MAX_WRITE_ZEROES_SECTORS, 1,
			  [blk_queue_max_write_zeroes_sectors is defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if linux/pci.h has pci_free_irq])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/pci.h>
	],[
		pci_free_irq(NULL, 0, NULL);

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_PCI_FREE_IRQ, 1,
			  [linux/pci.h has pci_free_irq])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if linux/security.h has register_lsm_notifier])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/security.h>
	],[
		register_lsm_notifier(NULL);

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_REGISTER_LSM_NOTIFIER, 1,
			  [linux/security.h has register_lsm_notifier])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if linux/cdev.h has cdev_set_parent])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/cdev.h>
	],[
		cdev_set_parent(NULL, NULL);

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_CDEV_SET_PARENT, 1,
			  [linux/cdev.h has cdev_set_parent])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if linux/atomic.h has __atomic_add_unless])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/highmem.h>
	],[
		atomic_t x;
		__atomic_add_unless(&x, 1, 1);

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE___ATOMIC_ADD_UNLESS, 1,
			  [__atomic_add_unless is defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if linux/net_tstamp.h has HWTSTAMP_FILTER_NTP_ALL])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/net_tstamp.h>
	],[
		int x = HWTSTAMP_FILTER_NTP_ALL;

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_HWTSTAMP_FILTER_NTP_ALL, 1,
			  [HWTSTAMP_FILTER_NTP_ALL is defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if net/pkt_cls.h has tcf_exts_stats_update])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <net/pkt_cls.h>
	],[
		tcf_exts_stats_update(NULL, 0, 0, 0);

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_TCF_EXTS_STATS_UPDATE, 1,
			  [tcf_exts_stats_update is defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if net/pkt_cls.h has tcf_exts_has_actions])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <net/pkt_cls.h>
	],[
		struct tcf_exts exts;
		tcf_exts_has_actions(&exts);

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_TCF_EXTS_HAS_ACTIONS, 1,
			  [tcf_exts_has_actions is defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if net/tc_act/tc_csum.h has TCA_CSUM_UPDATE_FLAG_IPV4HDR])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <net/tc_act/tc_csum.h>
	],[
		int x = TCA_CSUM_UPDATE_FLAG_IPV4HDR;

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_TCA_CSUM_UPDATE_FLAG_IPV4HDR, 1,
			  [TCA_CSUM_UPDATE_FLAG_IPV4HDR is defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if uapi/linux/nvme_ioctl.h has NVME_IOCTL_RESCAN])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/nvme_ioctl.h>
		#include <linux/types.h>
		#include <uapi/asm-generic/ioctl.h>
	],[
		unsigned int x = NVME_IOCTL_RESCAN;
		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_UAPI_LINUX_NVME_IOCTL_RESCAN, 1,
			[uapi/linux/nvme_ioctl.h has NVME_IOCTL_RESCAN])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if refcount.h exists])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/refcount.h>
	],[
		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_REFCOUNT, 1,
			  [refcount.h exists])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if firmware.h has request_firmware_direct])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/firmware.h>
	],[
		request_firmware_direct(NULL, NULL, NULL);

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_REQUEST_FIRMWARE_DIRECT, 1,
			  [request_firmware_direct is defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if nodemask.h has N_MEMORY])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/nodemask.h>
	],[
		enum node_states x = N_MEMORY;

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_N_MEMORY, 1,
			  [N_MEMORY is defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if topology.h has numa_mem_id])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/firmware.h>
	],[
		int x = numa_mem_id();

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_NUMA_MEM_ID, 1,
			  [numa_mem_id is defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if uapi/linux/netlink.h exists])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <uapi/linux/netlink.h>
	],[
		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_UAPI_LINUX_NETLINK_H, 1,
			  [uapi/linux/netlink.h exists])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if linux/xz.h exists])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/xz.h>
	],[
		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_LINUX_XZ_H, 1,
			  [linux/xz.h exists])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if linux/pr.h exists])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/fs.h>
		#include <linux/pr.h>
	],[
		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_PR_H, 1,
			[linux/pr.h exists])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if linux/t10-pi.h exists])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/t10-pi.h>
	],[
		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_T10_PI_H, 1,
			[linux/t10-pi.h exists])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if pm.h struct dev_pm_info has member set_latency_tolerance])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/pm.h>
		#include <asm/device.h>
		#include <linux/types.h>

		static void nvme_set_latency_tolerance(struct device *dev, s32 val)
		{
			return;
		}
	],[
		struct dev_pm_info dpinfo = {
			.set_latency_tolerance = nvme_set_latency_tolerance,
		};

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_DEV_PM_INFO_SET_LATENCY_TOLERANCE, 1,
			[set_latency_tolerance is defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if device.h class_attribute has namespace])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/device.h>
	],[
		struct class_attribute x = {
			.namespace = NULL,
		};

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_CLASS_ATTRIBUTE_NAMESPACE, 1,
			  [class_attribute namespace is defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if linux/blk-mq.h blk_mq_alloc_request has 3 parameters])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/blk-mq.h>
	],[
		blk_mq_alloc_request(NULL, 0, 0);

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_BLK_MQ_ALLOC_REQUEST_HAS_3_PARAMS, 1,
			  [linux/blk-mq.h blk_mq_alloc_request has 3 parameters])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if blkdev.h has REQ_TYPE_DRV_PRIV])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/blkdev.h>
	],[
		enum rq_cmd_type_bits rctb = REQ_TYPE_DRV_PRIV;

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_BLKDEV_REQ_TYPE_DRV_PRIV, 1,
			[REQ_TYPE_DRV_PRIV is defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if blkdev.h blk_add_request_payload has 4 parameters])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/blkdev.h>
	],[
		blk_add_request_payload(NULL, NULL, 0, 0);

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_BLK_ADD_REQUEST_PAYLOAD_HAS_4_PARAMS, 1,
			[blkdev.h blk_add_request_payload has 4 parameters])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if linux/blk_types.h has REQ_OP_FLUSH])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/blk_types.h>
	],[
		int x = REQ_OP_FLUSH;

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_BLK_TYPES_REQ_OP_FLUSH, 1,
			[REQ_OP_FLUSH is defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if linux/blk_types.h has REQ_OP_DISCARD])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/blk_types.h>
	],[
		int x = REQ_OP_DISCARD;

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_BLK_TYPES_REQ_OP_DISCARD, 1,
			[REQ_OP_DISCARD is defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if linux/blk_types.h has blk_status_t])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/blk_types.h>
	],[
		blk_status_t xx;

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_BLK_STATUS_T, 1,
			[blk_status_t is defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if bio.h struct bio_integrity_payload has member bip_iter])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/bio.h>
		#include <linux/bvec.h>
	],[
		struct bvec_iter bip_it = {0};
		struct bio_integrity_payload bip = {
			.bip_iter = bip_it,
		};
		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_BIO_INTEGRITY_PYLD_BIP_ITER, 1,
			[bio_integrity_payload has members bip_iter])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if net_namespace.h struct pernet_operations has id, size])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <net/net_namespace.h>
	],[
		struct pernet_operations x = {
			.id = NULL,
			.size = 0,
		};

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_PERNET_OPERATIONS_ID_AND_SIZE, 1,
			  [struct pernet_operations has id, size is defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if blkdev.h has BLK_INTEGRITY_DEVICE_CAPABLE])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/blkdev.h>
	],[
		enum  blk_integrity_flags bif = BLK_INTEGRITY_DEVICE_CAPABLE;

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_BLK_INTEGRITY_DEVICE_CAPABLE, 1,
			[BLK_INTEGRITY_DEVICE_CAPABLE is defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if blkdev.h has BLK_MAX_WRITE_HINTS])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/blkdev.h>
	],[
		int x = BLK_MAX_WRITE_HINTS;

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_BLK_MAX_WRITE_HINTS, 1,
			[BLK_MAX_WRITE_HINTS is defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if blkdev.h has blk_init_request_from_bio])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/blkdev.h>
	],[
		blk_init_request_from_bio(NULL, NULL);

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_BLK_INIT_REQUEST_FROM_BIO, 1,
			[blk_init_request_from_bio is defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if device.h has device_remove_file_self])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/device.h>
	],[
		device_remove_file_self(NULL, NULL);

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_DEVICE_REMOVE_FILE_SELF, 1,
			[device.h has device_remove_file_self])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if genhd.h has device_add_disk])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/genhd.h>
	],[
		device_add_disk(NULL, NULL);

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_DEVICE_ADD_DISK, 1,
			[genhd.h has device_add_disk])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if linux/blk-mq.h has blk_mq_unquiesce_queue])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/blk-mq.h>
	],[
		blk_mq_unquiesce_queue(NULL);

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_BLK_MQ_UNQUIESCE_QUEUE, 1,
			  [blk_mq_unquiesce_queue is defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if linux/blk-mq.h has blk_mq_alloc_request_hctx])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/blk-mq.h>
	],[
		blk_mq_alloc_request_hctx(NULL, 0, 0, 0);

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_BLK_MQ_ALLOC_REQUEST_HCTX, 1,
			  [linux/blk-mq.h has blk_mq_alloc_request_hctx])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if linux/lightnvm.h exists])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/lightnvm.h>
	],[
		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_LIGHTNVM_H, 1,
			[linux/lightnvm.h exists])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if linux/lightnvm.h nvm_dev_ops has member submit_io_sync])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/lightnvm.h>
	],[
		struct nvm_dev_ops x = {
			.submit_io_sync = NULL,
		};

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_NVM_DEV_OPS_SUBMIT_IO_SYNC, 1,
			[nvm_dev_ops has member submit_io_sync])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if pci.h struct pci_error_handlers has reset_notify])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/pci.h>

		void reset(struct pci_dev *dev, bool prepare) {
			return;
		}
	],[
		struct pci_error_handlers x = {
			.reset_notify = reset,
		};

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_PCI_ERROR_HANDLERS_RESET_NOTIFY, 1,
			  [pci.h struct pci_error_handlers has reset_notify])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if scsi.h has SCSI_MAX_SG_SEGMENTS])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <scsi/scsi.h>
	],[
		int x = SCSI_MAX_SG_SEGMENTS;

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_SCSI_MAX_SG_SEGMENTS, 1,
			  [SCSI_MAX_SG_SEGMENTS is defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if linux/blk-mq.h struct blk_mq_ops has field reinit_request])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/blk-mq.h>

		static int
		nvme_fc_reinit_request(void *data, struct request *rq)
		{
			return 0;
		}
	],[
		static struct blk_mq_ops nvme_fc_mq_ops = {
			.reinit_request = nvme_fc_reinit_request,
		};

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_BLK_MQ_OPS_REINIT_REQUEST, 1,
			[struct blk_mq_ops has field reinit_request])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if linux/scatterlist.h sg_alloc_table_chained has 4 parameters])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/scatterlist.h>
	],[
		gfp_t gfp_mask;
		sg_alloc_table_chained(NULL, 0, gfp_mask, NULL);

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_SG_ALLOC_TABLE_CHAINED_4_PARAMS, 1,
			[sg_alloc_table_chained has 4 parameters])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if linux/scatterlist.h has sgl_free])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/scatterlist.h>
	],[
		sgl_free(NULL);

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_SGL_FREE, 1,
			[sgl_free is defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if linux/scatterlist.h has sgl_alloc])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/scatterlist.h>
	],[
		sgl_alloc(0, 0, NULL);

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_SGL_ALLOC, 1,
			[sgl_alloc is defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if linux/scatterlist.h has sg_zero_buffer])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/scatterlist.h>
	],[
		sg_zero_buffer(NULL, 0, 0, 0);

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_SG_ZERO_BUFFER, 1,
			[sg_zero_buffer is defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if linux/uuid.h has uuid_gen])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/uuid.h>
	],[
		uuid_t id;
		uuid_gen(&id);

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_UUID_GEN, 1,
			[uuid_gen is defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if linux/uuid.h has uuid_is_null])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/uuid.h>
	],[
		uuid_t uuid;
		uuid_is_null(&uuid);

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_UUID_IS_NULL, 1,
			[uuid_is_null is defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if linux/uuid.h has uuid_be_to_bin])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/uuid.h>
	],[
		uuid_be_to_bin(NULL, NULL);

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_UUID_BE_TO_BIN, 1,
			[uuid_be_to_bin is defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if linux/uuid.h has uuid_equal])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/uuid.h>
	],[
		uuid_equal(NULL, NULL);

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_UUID_EQUAL, 1,
			[uuid_equal is defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if linux/inet.h inet_pton_with_scope])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/inet.h>
	],[
		inet_pton_with_scope(NULL, 0, NULL, NULL, NULL);

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_INET_PTON_WITH_SCOPE, 1,
			[inet_pton_with_scope is defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if uapi/linux/nvme_ioctl.h exists])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/nvme_ioctl.h>
	],[
		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_UAPI_LINUX_NVME_IOCTL_H, 1,
			[uapi/linux/nvme_ioctl.h exists])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if blkdev.h has QUEUE_FLAG_WC_FUA])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/blkdev.h>
	],[
		int x = QUEUE_FLAG_WC;
		int y = QUEUE_FLAG_FUA;

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_QUEUE_FLAG_WC_FUA, 1,
			[QUEUE_FLAG_WC_FUA is defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if linux/scatterlist.h sg_alloc_table_chained has 3 parameters])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/scatterlist.h>
	],[
		sg_alloc_table_chained(NULL, 0, NULL);

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_SG_ALLOC_TABLE_CHAINED_3_PARAMS, 1,
			[sg_alloc_table_chained has 3 parameters])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if linux/blk-mq.h has blk_mq_tagset_busy_iter])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/blk-mq.h>

		static void
		nvme_cancel_request(struct request *req, void *data, bool reserved) {
			return;
		}
	],[
		blk_mq_tagset_busy_iter(NULL, nvme_cancel_request, NULL);

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_BLK_MQ_TAGSET_BUSY_ITER, 1,
			  [blk_mq_tagset_busy_iter is defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if struct request_queue has q_usage_counter])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/blkdev.h>
	],[
		struct percpu_ref counter = {0};
		struct request_queue rq = {
			.q_usage_counter = counter,
		};

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_REQUEST_QUEUE_Q_USAGE_COUNTER, 1,
			  [struct request_queue has q_usage_counter])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if string.h has memdup_user_nul])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
	#include <linux/string.h>
	],[
		memdup_user_nul(NULL, 0);

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_MEMDUP_USER_NUL, 1,
		[memdup_user_nul is defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if blkdev.h has blk_queue_write_cache])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/blkdev.h>
	],[
		blk_queue_write_cache(NULL, 0, 0);

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_BLK_QUEUE_WRITE_CACHE, 1,
			[blkdev.h has blk_queue_write_cache])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if linux/blk-mq.h has blk_mq_all_tag_busy_iter])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/blk-mq.h>

		static void
		nvme_cancel_request(struct request *req, void *data, bool reserved) {
			return;
		}
	],[
		blk_mq_all_tag_busy_iter(NULL, nvme_cancel_request, NULL);

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_BLK_MQ_ALL_TAG_BUSY_ITER, 1,
			  [blk_mq_all_tag_busy_iter is defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if linux/blk-mq.h has blk_mq_update_nr_hw_queues])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/blk-mq.h>
	],[
		blk_mq_update_nr_hw_queues(NULL, 0);

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_BLK_MQ_UPDATE_NR_HW_QUEUES, 1,
			  [blk_mq_update_nr_hw_queues is defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if linux/blk-mq.h has blk_mq_tagset_iter])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/blk-mq.h>
	],[
		blk_mq_tagset_iter(NULL, NULL, NULL);

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_BLK_MQ_TAGSET_ITER, 1,
			  [blk_mq_tagset_iter is defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if linux/blk-mq.h blk_mq_reinit_tagset takes 2 params])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/blk-mq.h>
	],[
		blk_mq_reinit_tagset(NULL, NULL);

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_BLK_MQ_REINIT_TAGSET_2_PARAM, 1,
			  [blk_mq_reinit_tagset takes 2 params])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if linux/blk-mq.h has blk_mq_map_queues])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/blk-mq.h>
	],[
		blk_mq_map_queues(NULL);

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_BLK_MQ_MAP_QUEUES, 1,
			  [blk_mq_map_queues is defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if etherdevice.h has alloc_etherdev_mqs, alloc_etherdev_mqs, num_tc])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/etherdevice.h>
		#include <linux/netdevice.h>
	],[
		struct net_device x = {
			.num_tx_queues = 0,
			.num_tc = 0,
		};
		alloc_etherdev_mqs(0, 0, 0);

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_NEW_TX_RING_SCHEME, 1,
			  [alloc_etherdev_mqs, alloc_etherdev_mqs, num_tc is defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if netdevice.h has netdev_set_tc_queue])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/netdevice.h>
	],[
		netdev_set_tc_queue(NULL, 0, 0, 0);

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_NETDEV_SET_TC_QUEUE, 1,
			  [netdev_set_tc_queue is defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if netdevice.h has netdev_reset_tc])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/netdevice.h>
	],[
		netdev_reset_tc(NULL);

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_NETDEV_RESET_TC, 1,
			  [netdev_reset_tc is defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if netdevice.h has netif_is_rxfh_configured])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/netdevice.h>
	],[
		netif_is_rxfh_configured(NULL);

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_NETIF_IS_RXFH_CONFIGURED, 1,
			  [netif_is_rxfh_configured is defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if netdevice.h has TC_SETUP_QDISC_MQPRIO])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/netdevice.h>
	],[
		enum tc_setup_type x = TC_SETUP_QDISC_MQPRIO;

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_TC_SETUP_QDISC_MQPRIO, 1,
			  [TC_SETUP_QDISC_MQPRIO is defined])
	],[
		AC_MSG_RESULT(no)
	])

	# this one has 2 checkers
	AC_MSG_CHECKING([if pr_debug_ratelimited is defined])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/kernel.h>
	],[
		pr_debug_ratelimited("test");

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_PR_DEBUG_RATELIMITED, 1,
			  [pr_debug_ratelimited is defined])
	],[
		AC_MSG_RESULT(no)
	])
	# check in another header that does not exist on all kernels
	AC_MSG_CHECKING([if pr_debug_ratelimited is defined])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/kernel.h>
		#include <linux/ratelimit.h>
		#include <linux/printk.h>
	],[
		pr_debug_ratelimited("test");

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_PR_DEBUG_RATELIMITED, 1,
			  [pr_debug_ratelimited is defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if struct iscsi_transport has attr_is_visible])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <scsi/scsi_transport_iscsi.h>
	],[
		static struct iscsi_transport iscsi_iser_transport = {
			.attr_is_visible = NULL,
		};

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_ISCSI_ATTR_IS_VISIBLE, 1,
			  [attr_is_visible is defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if struct iscsi_transport has get_ep_param])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <scsi/scsi_transport_iscsi.h>
	],[
		static struct iscsi_transport iscsi_iser_transport = {
			.get_ep_param = NULL,
		};

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_ISCSI_GET_EP_PARAM, 1,
			  [get_ep_param is defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if struct mmu_notifier_ops has invalidate_page])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/mmu_notifier.h>
	],[
		static struct mmu_notifier_ops mmu_notifier_ops_xx= {
			.invalidate_page = NULL,
		};

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_INVALIDATE_PAGE, 1,
			  [invalidate_page defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if include/linux/sizes.h exists])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/sizes.h>
	],[
		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_SIZES_H, 1,
			  [include/linux/sizes.h exists])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if blk_mq_end_request accepts blk_status_t as second parameter])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/blk-mq.h>
		#include <linux/blk_types.h>
	],[
		blk_status_t error = BLK_STS_OK;

		blk_mq_end_request(NULL, error);

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_BLK_MQ_END_REQUEST_TAKES_BLK_STATUS_T, 1,
			  [blk_mq_end_request accepts blk_status_t as second parameter])
	],[
		AC_MSG_RESULT(no)
	])


	AC_MSG_CHECKING([if linux/blk_types.h has REQ_INTEGRITY])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/blk_types.h>
	],[
		int x = REQ_INTEGRITY;

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_BLK_TYPES_REQ_INTEGRITY, 1,
			[REQ_INTEGRITY is defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if linux/bio.h bio_endio has 1 parameter])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/bio.h>
	],[
		bio_endio(NULL);

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_BIO_ENDIO_1_PARAM, 1,
			[linux/bio.h bio_endio has 1 parameter])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if blkdev.h has __blkdev_issue_discard])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/blkdev.h>
	],[
		__blkdev_issue_discard(NULL, 0, 0, 0, 0, NULL);

		return 0;
	],[
	        AC_MSG_RESULT(yes)
	        MLNX_AC_DEFINE(HAVE___BLKDEV_ISSUE_DISCARD, 1,
	                [__blkdev_issue_discard is defined])
	],[
	        AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if linux/bio.h submit_bio has 1 parameter])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/bio.h>
		#include <linux/fs.h>
	],[
		submit_bio(NULL);

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_SUBMIT_BIO_1_PARAM, 1,
			[linux/bio.h submit_bio has 1 parameter])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if struct bio has member bi_opf])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/blk_types.h>
	],[
		struct bio b = {
			.bi_opf = 0,
		};
		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_STRUCT_BIO_BI_OPF, 1,
			[struct bio has member bi_opf])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if struct bio has member bi_iter])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/blk_types.h>
	],[
		struct bio b = {
			.bi_iter = 0,
		};
		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_STRUCT_BIO_BI_ITER, 1,
			[struct bio has member bi_iter])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if struct bio has member bi_disk])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/blk_types.h>
	],[
		struct bio b = {
			.bi_disk = NULL,
		};
		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_BIO_BI_DISK, 1,
			[struct bio has member bi_disk])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if struct bio has member bi_error])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/blk_types.h>
	],[
		struct bio b = {
			.bi_error = 0,
		};
		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_STRUCT_BIO_BI_ERROR, 1,
			[struct bio has member bi_error])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if struct ifla_vf_stats has member tx_broadcast])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/if_link.h>
	],[
		struct ifla_vf_stats = {
			.tx_broadcast = 0,
		};
		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_STRUCT_IFLA_VF_STATS_TX_BROADCAST, 1,
			[struct ifla_vf_stats has member tx_broadcast])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if linux/moduleparam.h has member param_ops_ullong])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/moduleparam.h>
	],[
		param_get_ullong(NULL, NULL);

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_PARAM_OPS_ULLONG, 1,
			[param_ops_ullong is defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if linux/blk_types.h has struct bio_aux])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/errno.h>
		#include <linux/blk_types.h>
	],[
		struct bio_aux x;

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_RH7_STRUCT_BIO_AUX, 1,
			[struct bio_aux is defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if blkdev.h has blk_poll])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/blkdev.h>
	],[
		blk_poll(NULL, 0);

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_BLK_POLL, 1,
			[blk_poll exist])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if linux/pci.h has pci_irq_vector, pci_free_irq_vectors, pci_alloc_irq_vectors])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/pci.h>
	],[
		pci_irq_vector(NULL, 0);
		pci_free_irq_vectors(NULL);
		pci_alloc_irq_vectors(NULL, 0, 0, 0);

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_PCI_IRQ_API, 1,
			[linux/pci.h has pci_irq_vector, pci_free_irq_vectors, pci_alloc_irq_vectors])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if pci.h struct pci_error_handlers has reset_prepare])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/pci.h>

		void reset_prepare(struct pci_dev *dev) {
			return;
		}
	],[
		struct pci_error_handlers x = {
			.reset_prepare = reset_prepare,
		};

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_PCI_ERROR_HANDLERS_RESET_PREPARE, 1,
			[pci.h struct pci_error_handlers has reset_prepare])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if pci.h struct pci_error_handlers has reset_done])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/pci.h>

		void reset_done(struct pci_dev *dev) {
			return;
		}
	],[
		struct pci_error_handlers x = {
			.reset_done = reset_done,
		};

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_PCI_ERROR_HANDLERS_RESET_DONE, 1,
		[pci.h struct pci_error_handlers has reset_done])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if linux/io-64-nonatomic-lo-hi.h exists])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/io-64-nonatomic-lo-hi.h>
	],[
		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_IO_64_NONATOMIC_LO_HI_H, 1,
			[linux/io-64-nonatomic-lo-hi.h exists])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if pci.h has pci_request_mem_regions])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/pci.h>
	],[
		pci_request_mem_regions(NULL, NULL);

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_PCI_REQUEST_MEM_REGIONS, 1,
			[pci_request_mem_regions is defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if pci.h has pci_release_mem_regions])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/pci.h>
	],[
		pci_release_mem_regions(NULL);

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_PCI_RELEASE_MEM_REGIONS, 1,
			[pci_release_mem_regions is defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if pnv-pci.h has pnv_pci_set_p2p])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <asm/pnv-pci.h>
	],[
		pnv_pci_set_p2p(NULL, NULL, 0);

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_PNV_PCI_SET_P2P, 1,
			[pnv-pci.h has pnv_pci_set_p2p])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if pnv-pci.h has pnv_pci_enable_tunnel])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <asm/pnv-pci.h>
	],[
		pnv_pci_enable_tunnel(NULL, NULL);
		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_PNV_PCI_AS_NOTIFY, 1,
			[pnv-pci.h has pnv_pci_enable_tunnel])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if switch_to.h has clear_thread_tidr])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <asm/switch_to.h>
	],[
		clear_thread_tidr(NULL);
		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_CLEAR_THREAD_TIDR, 1,
			[switch_to.h has clear_thread_tidr])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if rbtree.h has struct rb_root_cached])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/rbtree.h>
	],[
		struct rb_root_cached rb_root_cached_test;

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_RB_ROOT_CACHED, 1,
			[struct rb_root_cached is defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if INTERVAL_TREE takes rb_root])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/rbtree.h>
		#include <linux/interval_tree_generic.h>

		struct x_node {
			u64 __subtree_last;
			struct rb_node rb;
		};
		static u64 node_last(struct x_node *n)
		{
			return 0;
		}
		static u64 node_start(struct x_node *n)
		{
			return 0;
		}
		INTERVAL_TREE_DEFINE(struct x_node, rb, u64, __subtree_last,
			node_start, node_last, static, rbt_x)
	],[
		struct x_node x_interval_tree;
		struct rb_root x_tree;
		rbt_x_insert(&x_interval_tree, &x_tree);

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_INTERVAL_TREE_TAKES_RB_ROOT, 1,
			[INTERVAL_TREE takes rb_root])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if timer.h has timer_setup])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/timer.h>

		static void activate_timeout_handler_task(struct timer_list *t)
		{
			return;
		}
	],[
		struct timer_list tmr;
		timer_setup(&tmr, activate_timeout_handler_task, 0);

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_TIMER_SETUP, 1,
			[timer_setup is defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if dmapool.h has dma_pool_zalloc])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/dmapool.h>
	],[
		dma_pool_zalloc(NULL, 0, NULL);

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_DMA_POOL_ZALLOC, 1,
			  [dma_pool_zalloc is defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if trace_seq.h has trace_seq_buffer_ptr])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/trace_seq.h>
	],[
		struct trace_seq ts;
		trace_seq_buffer_ptr(&ts);

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_TRACE_SEQ_BUFFER_PTR, 1,
			  [trace_seq_buffer_ptr is defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if act_apt.h tc_setup_cb_egdev_register])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <net/act_api.h>
	],[
		tc_setup_cb_egdev_register(NULL, NULL, NULL);

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_TC_SETUP_CB_EGDEV_REGISTER, 1,
			  [tc_setup_cb_egdev_register is defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if act_api.h has tcf_action_stats_update])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <net/act_api.h>
	],[
		tcf_action_stats_update(NULL, 0, 0, 0);

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_TCF_ACTION_STATS_UPDATE, 1,
			  [tc_action_stats_update is defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if include/linux/once.h exists])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/once.h>
	],[
		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_ONCE_H, 1,
			  [include/linux/once.h exists])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if has mm_context_add_copro])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/mmu_context.h>
	],[
		mm_context_add_copro(NULL);
		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_MM_CONTEXT_ADD_COPRO, 1,
			[mm_context_add_copro is defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if linux/blk_types.h has blk_path_error])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/errno.h>
		#include <linux/blkdev.h>
		#include <linux/blk_types.h>
	],[
		blk_path_error(0);

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_BLK_PATH_ERROR, 1,
			  [blk_path_error is defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if slab.h has kcalloc_node])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/slab.h>
	],[
		kcalloc_node(0, 0, 0, 0);

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_KCALLOC_NODE, 1,
			  [kcalloc_node is defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if slab.h has kmalloc_array_node])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/slab.h>
	],[
		kmalloc_array_node(0, 0, 0, 0);

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_KMALLOC_ARRAY_NODE, 1,
			  [kmalloc_array_node is defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if kref.h has kref_get_unless_zero])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/kref.h>
	],[
		kref_get_unless_zero(NULL);

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_KREF_GET_UNLESS_ZERO, 1,
			  [kref_get_unless_zero is defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if kref.h has kref_read])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/kref.h>
	],[
		kref_read(NULL);

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_KREF_READ, 1,
			  [kref_read is defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if linux/inet.h has inet_addr_is_any])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/inet.h>
	],[
		inet_addr_is_any(NULL);

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_INET_ADDR_IS_ANY, 1,
			[inet_addr_is_any is defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if linux/blkdev.h has bdev_write_zeroes_sectors])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/blkdev.h>
	],[
		bdev_write_zeroes_sectors(NULL);

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_BDEV_WRITE_ZEROES_SECTORS, 1,
			  [bdev_write_zeroes_sectors is defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if linux/blkdev.h has blk_queue_flag_set])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/blkdev.h>
	],[
		blk_queue_flag_set(0, NULL);
		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_BLK_QUEUE_FLAG_SET, 1,
				[blk_queue_flag_set is defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if include/linux/blk-mq-pci.h has blk_mq_pci_map_queues])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/blk-mq-pci.h>
	],[
		blk_mq_pci_map_queues(NULL, NULL, 0);

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_BLK_MQ_PCI_MAP_QUEUES_3_ARGS, 1,
			[blk_mq_pci_map_queues is defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if sysfs_get_dirent gets 2 parameters])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/sysfs.h>
	],[
		sysfs_get_dirent(NULL, NULL);

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_SYSFS_GET_DIRENT_2_PARAMS, 1,
			[sysfs_get_dirent gets 2 parameters])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if sysfs_create_file_ns supported])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/sysfs.h>
	],[
		sysfs_create_file_ns(NULL, NULL, NULL);

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_SYSFS_CREATE_FILE_NS, 1,
			[sysfs_create_file_ns is supported])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if ndo_add_slave has 3 parameters])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/netdevice.h>
	],[
		struct net_device_ops ndops;
		ndops.ndo_add_slave(NULL, NULL, NULL);

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(NDO_ADD_SLAVE_3_PARAMS, 1,
			  [ndo_add_slave has 3 parameters])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if netdev_master_upper_dev_link gets 5 parameters])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/netdevice.h>
	],[
		netdev_master_upper_dev_link(NULL, NULL, NULL, NULL, NULL);

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(NETDEV_MASTER_UPPER_DEV_LINK_5_PARAMS, 1,
			[netdev_master_upper_dev_link gets 5 parameters])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if linux/blkdev.h has BLK_EH_DONE])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/blkdev.h>
	],[
		int x = BLK_EH_DONE;

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_BLK_EH_DONE, 1,
				[BLK_EH_DONE is defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if netdevice.h has dev_get_by_index_rcu])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/netdevice.h>
	],[
		dev_get_by_index_rcu(NULL, 0);

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_NETIF_DEV_GET_BY_INDEX_RCU, 1,
			  [netif_dev_get_by_index_rcu is defined])
	],[
		AC_MSG_RESULT(no)
	])

	AC_MSG_CHECKING([if interrupt.h has irq_calc_affinity_vectors with 3 args])
	MLNX_BG_LB_LINUX_TRY_COMPILE([
		#include <linux/interrupt.h>
	],[
		int x = irq_calc_affinity_vectors(0, 0, NULL);

		return 0;
	],[
		AC_MSG_RESULT(yes)
		MLNX_AC_DEFINE(HAVE_IRQ_CALC_AFFINITY_VECTORS_3_ARGS, 1,
			  [irq_calc_affinity_vectors is defined])
	],[
		AC_MSG_RESULT(no)
	])
])
#
# COMPAT_CONFIG_HEADERS
#
# add -include config.h
#
AC_DEFUN([COMPAT_CONFIG_HEADERS],[
#
#	Wait for remaining build tests running in background
#
	wait
#
#	Append confdefs.h files from CONFDEFS_H_DIR to the main confdefs.h file
#
	/bin/cat CONFDEFS_H_DIR/confdefs.h.* >> confdefs.h
	/bin/rm -rf CONFDEFS_H_DIR
#
#	Generate the config.h header file
#
	AC_CONFIG_HEADERS([config.h])
	EXTRA_KCFLAGS="-include $PWD/config.h $EXTRA_KCFLAGS"
	AC_SUBST(EXTRA_KCFLAGS)
])

AC_DEFUN([MLNX_PROG_LINUX],
[

LB_LINUX_PATH
LB_LINUX_SYMVERFILE
LB_LINUX_CONFIG([MODULES],[],[
    AC_MSG_ERROR([module support is required to build mlnx kernel modules.])
])
LB_LINUX_CONFIG([MODVERSIONS])
LB_LINUX_CONFIG([KALLSYMS],[],[
    AC_MSG_ERROR([compat_mlnx requires that CONFIG_KALLSYMS is enabled in your kernel.])
])

LINUX_CONFIG_COMPAT
COMPAT_CONFIG_HEADERS

])
