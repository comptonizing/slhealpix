# slhealpix
Providing S-Lang bindings for the HEALPix C library
([https://healpix.sourceforge.io/](https://healpix.sourceforge.io/))

## Dependencies

### 0. Basics
Of course a working C compiler etc. are necessary for the installation.

### 1. S-Lang
The S-Lang interpreter
([https://www.jedsoft.org/slang/](https://www.jedsoft.org/slang/)) can make use
of this module.

### 2. HEALPix
Of course the healpix library is necessary.

### 3. cfitsio
I/O routines of the healpix library depend on the cfitsio library
([https://heasarc.gsfc.nasa.gov/fitsio/](https://heasarc.gsfc.nasa.gov/fitsio/))

### 4. JED
The JED editor ([https://www.jedsoft.org/jed/](https://www.jedsoft.org/jed/))
is required to generate the help for the slhealpix package.

## Installation
An example installation from source could look like this:
```
autoreconf -i
./configure \
  --with-slang=/path/to/slang/installation \
  --with-healpix=/path/to/healpix/installation/ \
  --with-cfitsio=/path/to/cfitsio/installation/ \
  --prefix=/where/to/install/this/module
make
make install
```
