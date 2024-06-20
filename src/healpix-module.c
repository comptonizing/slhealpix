#include <stdlib.h>
#include <slang.h>
#include <chealpix.h>

SLANG_MODULE(healpix);

// void ang2pix_nest(long nside, double theta, double phi, long *ipix)
int _ang2pix_nest(void) {
  long nside, ipix;
  double theta, phi;
  if (
      SLang_pop_double(&phi) == -1 ||
      SLang_pop_double(&theta) == -1 ||
      SLang_pop_long(&nside) == -1
      ) {
    return -1;
  }

  ang2pix_nest(nside, theta, phi, &ipix);

  if ( SLang_push_long(ipix) == -1 ) {
    return -1;
  }

  return 0;
}

// void ang2pix_ring(long nside, double theta, double phi, long *ipix)
int _ang2pix_ring(void) {
  long nside, ipix;
  double theta, phi;
  if (
      SLang_pop_double(&phi) == -1 ||
      SLang_pop_double(&theta) == -1 ||
      SLang_pop_long(&nside) == -1
      ) {
    return -1;
  }

  ang2pix_ring(nside, theta, phi, &ipix);

  if ( SLang_push_long(ipix) == -1 ) {
    return -1;
  }

  return 0;
}

// void pix2ang_nest(long nside, long ipix, double *theta, double *phi)
int _pix2ang_nest(void) {
  long nside, ipix;
  double theta, phi;
  if (
      SLang_pop_long(&ipix) == -1 ||
      SLang_pop_long(&nside) == -1
     ) {
    return -1;
  }

  pix2ang_nest(nside, ipix, &theta, &phi);
  if (
      SLang_push_double(theta) == -1 ||
      SLang_push_double(phi) == -1
     ) {
    return -1;
  }

  return 0;
}

// void pix2ang_ring(long nside, long ipix, double *theta, double *phi)
int _pix2ang_ring(void) {
  long nside, ipix;
  double theta, phi;
  if (
      SLang_pop_long(&ipix) == -1 ||
      SLang_pop_long(&nside) == -1
     ) {
    return -1;
  }

  pix2ang_ring(nside, ipix, &theta, &phi);
  if (
      SLang_push_double(theta) == -1 ||
      SLang_push_double(phi) == -1
     ) {
    return -1;
  }

  return 0;
}

// void nest2ring(long nside, long ipnest, long *ipring)
int _nest2ring(void) {
  long nside, ipnest, ipring;
  if (
      SLang_pop_long(&ipnest) == -1 ||
      SLang_pop_long(&nside) == -1
     ) {
    return -1;
  }
  nest2ring(nside, ipnest, &ipring);
  if ( SLang_push_long(ipring) == -1 ) {
    return -1;
  }
  return 0;
}

// void ring2nest(long nside, long ipring, long *ipnest)
int _ring2nest(void) {
  long nside, ipring, ipnest;
  if (
      SLang_pop_long(&ipring) == -1 ||
      SLang_pop_long(&nside) == -1
     ) {
    return -1;
  }
  ring2nest(nside, ipring, &ipnest);
  if ( SLang_push_long(ipnest) == -1 ) {
    return -1;
  }
  return 0;
}

// long nside2npix(long nside)
int _nside2npix(void) {
  long nside, npix;
  if ( SLang_pop_long(&nside) == -1 ) {
    return -1;
  }
  npix = nside2npix(nside);
  if ( SLang_push_long(npix) == -1 ) {
    return -1;
  }
  return 0;
}

// long npix2nside(long npix)
int _npix2nside(void) {
  long npix, nside;
  if ( SLang_pop_long(&npix) == -1 ) {
    return -1;
  }
  nside = npix2nside(npix);
  if ( SLang_push_long(nside) == -1 ) {
    return -1;
  }
  return 0;
}

// void ang2vec(double theta, double phi, double *vec)
int _ang2vec(void) {
  double theta, phi, vec[3];
  SLang_Array_Type *ret;
  if (
      SLang_pop_double(&phi) == -1 ||
      SLang_pop_double(&theta) == -1
     ) {
    return -1;
  }
  ang2vec(theta, phi, vec);
  SLindex_Type three = 3;
  ret = SLang_create_array(SLANG_DOUBLE_TYPE, 0, NULL, &three, 1);
  if ( ret == NULL ) {
    return -1;
  }
  for (int ii=0; ii<3; ii++) {
    if ( SLang_set_array_element(ret, &ii, &vec[ii]) == -1 ) {
      return -1;
    }
  }
  if ( SLang_push_array(ret, 1) == -1 ) {
    return -1;
  }
  return 0;
}

// void vec2ang(const double *vec, double *theta, double *phi)
int _vec2ang(void) {
  double theta, phi, vec[3];
  SLang_Array_Type *arr;
  if ( SLang_pop_array_of_type(&arr, SLANG_DOUBLE_TYPE) == -1 ) {
    return -1;
  }
  for (int ii=0; ii<3; ii++) {
    if ( -1 == SLang_get_array_element(arr, &ii, &vec[ii]) ) {
      return -1;
    }
  }
  vec2ang(vec, &theta, &phi);
  if (
      SLang_push_double(theta) == -1 ||
      SLang_push_double(phi) == -1
     ) {
    return -1;
  }
  return 0;
}

// void vec2pix_nest(long nside, const double *vec, long *ipix)
int _vec2pix_nest(void) {
  long nside, ipix;
  double vec[3];
  SLang_Array_Type *arr;
  if (
      SLang_pop_array_of_type(&arr, SLANG_DOUBLE_TYPE) == -1 ||
      SLang_pop_long(&nside)
     ) {
    return -1;
  }
  for (int ii=0; ii<3; ii++) {
    if ( -1 == SLang_get_array_element(arr, &ii, &vec[ii]) ) {
      return -1;
    }
  }
  vec2pix_nest(nside, vec, &ipix);
  if ( SLang_push_long(ipix) == -1 ) {
    return -1;
  }
  return 0;
}

// void vec2pix_ring(long nside, const double *vec, long *ipix)
int _vec2pix_ring(void) {
  long nside, ipix;
  double vec[3];
  SLang_Array_Type *arr;
  if (
      SLang_pop_array_of_type(&arr, SLANG_DOUBLE_TYPE) == -1 ||
      SLang_pop_long(&nside)
     ) {
    return -1;
  }
  for (int ii=0; ii<3; ii++) {
    if ( -1 == SLang_get_array_element(arr, &ii, &vec[ii]) ) {
      return -1;
    }
  }
  vec2pix_ring(nside, vec, &ipix);
  if ( SLang_push_long(ipix) == -1 ) {
    return -1;
  }
  return 0;
}


// void pix2vec_nest(long nside, long ipix, double *vec)
int _pix2vec_nest(void) {
  long nside, ipix;
  double vec[3];
  if (
      SLang_pop_long(&ipix) == -1 ||
      SLang_pop_long(&nside)
     ) {
    return -1;
  }
  pix2vec_nest(nside, ipix, vec);
  SLindex_Type three = 3;
  SLang_Array_Type *ret = SLang_create_array(SLANG_DOUBLE_TYPE, 0, NULL, &three, 1);
  for ( int ii=0; ii<3; ii++) {
    if ( SLang_set_array_element(ret, &ii, &vec[ii]) == -1 ) {
      return -1;
    }
  }
  if ( SLang_push_array(ret, 1) == -1 ) {
    return -1;
  }

  return 0;
}

// void pix2vec_ring(long nside, long ipix, double *vec)
int _pix2vec_ring(void) {
  long nside, ipix;
  double vec[3];
  if (
      SLang_pop_long(&ipix) == -1 ||
      SLang_pop_long(&nside)
     ) {
    return -1;
  }
  pix2vec_ring(nside, ipix, vec);
  SLindex_Type three = 3;
  SLang_Array_Type *ret = SLang_create_array(SLANG_DOUBLE_TYPE, 0, NULL, &three, 1);
  for ( int ii=0; ii<3; ii++) {
    if ( SLang_set_array_element(ret, &ii, &vec[ii]) == -1 ) {
      return -1;
    }
  }
  if ( SLang_push_array(ret, 1) == -1 ) {
    return -1;
  }

  return 0;
}

#if SLANG_SIZEOF_LONG >= 8

// void ang2pix_nest64(int64_t nside, double theta, double phi, int64_t *ipix)
int _ang2pix_nest64(void) {
  int64_t nside, ipix;
  double theta, phi;
  if (
      SLang_pop_double(&phi) == -1 ||
      SLang_pop_double(&theta) == -1 ||
      SLang_pop_long(&nside)
     ) {
    return -1;
  }
  ang2pix_nest64(nside, theta, phi, &ipix);
  if ( SLang_push_long(ipix) == -1 ) {
    return -1;
  }
  return 0;
}

// void ang2pix_ring64(int64_t nside, double theta, double phi, int64_t *ipix)
int _ang2pix_ring64(void) {
  int64_t nside, ipix;
  double theta, phi;
  if (
      SLang_pop_double(&phi) == -1 ||
      SLang_pop_double(&theta) == -1 ||
      SLang_pop_long(&nside)
     ) {
    return -1;
  }
  ang2pix_ring64(nside, theta, phi, &ipix);
  if ( SLang_push_long(ipix) == -1 ) {
    return -1;
  }
  return 0;
}

// void pix2ang_nest64(int64_t nside, int64_t ipix, double *theta, double *phi)
int _pix2ang_nest64(void) {
  long nside, ipix;
  double theta, phi;
  if (
      SLang_pop_long(&ipix) == -1 ||
      SLang_pop_long(&nside) == -1
     ) {
    return -1;
  }

  pix2ang_nest64(nside, ipix, &theta, &phi);
  if (
      SLang_push_double(theta) == -1 ||
      SLang_push_double(phi) == -1
     ) {
    return -1;
  }

  return 0;
}


// void pix2ang_ring64(int64_t nside, int64_t ipix, double *theta, double *phi)
int _pix2ang_ring64(void) {
  long nside, ipix;
  double theta, phi;
  if (
      SLang_pop_long(&ipix) == -1 ||
      SLang_pop_long(&nside) == -1
     ) {
    return -1;
  }

  pix2ang_ring64(nside, ipix, &theta, &phi);
  if (
      SLang_push_double(theta) == -1 ||
      SLang_push_double(phi) == -1
     ) {
    return -1;
  }

  return 0;
}

// void nest2ring64(int64_t nside, int64_t ipnest, long *ipring)
int _nest2ring64(void) {
  long nside, ipnest, ipring;
  if (
      SLang_pop_long(&ipnest) == -1 ||
      SLang_pop_long(&nside) == -1
     ) {
    return -1;
  }
  nest2ring64(nside, ipnest, &ipring);
  if ( SLang_push_long(ipring) == -1 ) {
    return -1;
  }
  return 0;
}

// void ring2nest64(int64_t nside, int64_t ipring, long *ipnest)
int _ring2nest64(void) {
  long nside, ipring, ipnest;
  if (
      SLang_pop_long(&ipring) == -1 ||
      SLang_pop_long(&nside) == -1
     ) {
    return -1;
  }
  ring2nest64(nside, ipring, &ipnest);
  if ( SLang_push_long(ipnest) == -1 ) {
    return -1;
  }
  return 0;
}

// int64_t nside2npix64(int64_t nside)
int _nside2npix64(void) {
  long nside, npix;
  if ( SLang_pop_long(&nside) == -1 ) {
    return -1;
  }
  npix = nside2npix64(nside);
  if ( SLang_push_long(npix) == -1 ) {
    return -1;
  }
  return 0;
}

// long npix2nside64(int64_t npix)
int _npix2nside64(void) {
  long npix, nside;
  if ( SLang_pop_long(&npix) == -1 ) {
    return -1;
  }
  nside = npix2nside64(npix);
  if ( SLang_push_long(nside) == -1 ) {
    return -1;
  }
  return 0;
}

// void vec2pix_nest64(int64_t nside, const double *vec, int64_t *ipix)
int _vec2pix_nest64(void) {
  long nside, ipix;
  double vec[3];
  SLang_Array_Type *arr;
  if (
      SLang_pop_array_of_type(&arr, SLANG_DOUBLE_TYPE) == -1 ||
      SLang_pop_long(&nside)
     ) {
    return -1;
  }
  for (int ii=0; ii<3; ii++) {
    if ( -1 == SLang_get_array_element(arr, &ii, &vec[ii]) ) {
      return -1;
    }
  }
  vec2pix_nest64(nside, vec, &ipix);
  if ( SLang_push_long(ipix) == -1 ) {
    return -1;
  }
  return 0;
}

// void vec2pix_ring64(int64_t nside, const double *vec, int64_t *ipix)
int _vec2pix_ring64(void) {
  long nside, ipix;
  double vec[3];
  SLang_Array_Type *arr;
  if (
      SLang_pop_array_of_type(&arr, SLANG_DOUBLE_TYPE) == -1 ||
      SLang_pop_long(&nside)
     ) {
    return -1;
  }
  for (int ii=0; ii<3; ii++) {
    if ( -1 == SLang_get_array_element(arr, &ii, &vec[ii]) ) {
      return -1;
    }
  }
  vec2pix_ring64(nside, vec, &ipix);
  if ( SLang_push_long(ipix) == -1 ) {
    return -1;
  }
  return 0;
}


// void pix2vec_nest64(int64_t nside, int64_t ipix, double *vec)
int _pix2vec_nest64(void) {
  long nside, ipix;
  double vec[3];
  if (
      SLang_pop_long(&ipix) == -1 ||
      SLang_pop_long(&nside)
     ) {
    return -1;
  }
  pix2vec_nest64(nside, ipix, vec);
  SLindex_Type three = 3;
  SLang_Array_Type *ret = SLang_create_array(SLANG_DOUBLE_TYPE, 0, NULL, &three, 1);
  for ( int ii=0; ii<3; ii++) {
    if ( SLang_set_array_element(ret, &ii, &vec[ii]) == -1 ) {
      return -1;
    }
  }
  if ( SLang_push_array(ret, 1) == -1 ) {
    return -1;
  }

  return 0;
}

// void pix2vec_ring(int64_t nside, int64_t ipix, double *vec)
int _pix2vec_ring64(void) {
  long nside, ipix;
  double vec[3];
  if (
      SLang_pop_long(&ipix) == -1 ||
      SLang_pop_long(&nside)
     ) {
    return -1;
  }
  pix2vec_ring64(nside, ipix, vec);
  SLindex_Type three = 3;
  SLang_Array_Type *ret = SLang_create_array(SLANG_DOUBLE_TYPE, 0, NULL, &three, 1);
  for ( int ii=0; ii<3; ii++) {
    if ( SLang_set_array_element(ret, &ii, &vec[ii]) == -1 ) {
      return -1;
    }
  }
  if ( SLang_push_array(ret, 1) == -1 ) {
    return -1;
  }

  return 0;
}

#endif

// float *read_healpix_map (const char *infile, long *nside, char *coordsys, char *ordering)
int _read_healpix_map(void) {
  long nside;
  char coordsys[256];
  char ordering[256];
  char *infile;
  if ( SLpop_string(&infile) == -1 ) {
    return -1;
  }
  float *map = read_healpix_map(infile, &nside, coordsys, ordering);
  SLindex_Type n = nside2npix(nside);
  SLang_Array_Type *mapArr = SLang_create_array(SLANG_DOUBLE_TYPE, 0, NULL, &n, 1);
  for (int ii=0; ii<n; ii++) {
    if ( SLang_set_array_element(mapArr, &ii, &map[ii]) == -1 ) {
      return -1;
    }
  }
  free(map);
  if (
      SLang_push_string(ordering) ||
      SLang_push_string(coordsys) == -1 ||
      SLang_push_long(nside) == -1 ||
      SLang_push_array(mapArr, 1) == -1
     ) {
    return -1;
  }

  return 0;
}

// write_healpix_map (const float *signal, long nside, const char *filename, char nest, const char *coordsys)
int _write_healpix_map(void) {
  float *signal;
  long nside;
  char *filename;
  char nest;
  char *coordsys;

  SLang_Array_Type *mapArr;

  if (
      SLpop_string(&coordsys) == -1 ||
      SLang_pop_char(&nest) == -1 ||
      SLpop_string(&filename) == -1 ||
      SLang_pop_long(&nside) == -1 ||
      SLang_pop_array_of_type(&mapArr, SLANG_FLOAT_TYPE) == -1
     ) {
    return -1;
  }

  long npix = nside2npix(nside);
  signal = malloc(npix * sizeof(float));
  if ( signal == NULL ) {
    SLang_verror(SL_Malloc_Error, "Error allocating memory");
    SLfree(coordsys);
    SLfree(filename);
    return -1;
  }

  for (int ii=0; ii<npix; ii++) {
    if ( SLang_get_array_element(mapArr, &ii, &signal[ii]) == -1 ) {
      SLfree(coordsys);
      SLfree(filename);
      return -1;
    }
  }

  write_healpix_map(signal, nside, filename, nest, coordsys);

  SLfree(coordsys);
  SLfree(filename);

  return 0;
}

// long get_fits_size(const char *filename, long *nside, char *ordering)
int _get_fits_size(void) {
  long ret, nside;
  char *filename;
  char ordering[256];
  if ( SLpop_string(&filename) ) {
    return -1;
  }
  ret = get_fits_size(filename, &nside, ordering);
  SLfree(filename);
  if (
      SLang_push_long(ret) == -1 ||
      SLang_push_long(nside) == -1 ||
      SLang_push_string(ordering)
     ) {
    return -1;
  }
  return 0;
}

static SLang_Intrin_Fun_Type Intrinsics [] = {
  MAKE_INTRINSIC_0("_ang2pix_nest", _ang2pix_nest, SLANG_VOID_TYPE),
  MAKE_INTRINSIC_0("_ang2pix_ring", _ang2pix_ring, SLANG_VOID_TYPE),
  MAKE_INTRINSIC_0("_pix2ang_nest", _pix2ang_nest, SLANG_VOID_TYPE),
  MAKE_INTRINSIC_0("_pix2ang_ring", _pix2ang_ring, SLANG_VOID_TYPE),
  MAKE_INTRINSIC_0("_nest2ring", _nest2ring, SLANG_VOID_TYPE),
  MAKE_INTRINSIC_0("_ring2nest", _ring2nest, SLANG_VOID_TYPE),
  MAKE_INTRINSIC_0("_nside2npix", _nside2npix, SLANG_VOID_TYPE),
  MAKE_INTRINSIC_0("_npix2nside", _npix2nside, SLANG_VOID_TYPE),
  MAKE_INTRINSIC_0("_ang2vec", _ang2vec, SLANG_VOID_TYPE),
  MAKE_INTRINSIC_0("_vec2ang", _vec2ang, SLANG_VOID_TYPE),
  MAKE_INTRINSIC_0("_vec2pix_nest", _vec2pix_nest, SLANG_VOID_TYPE),
  MAKE_INTRINSIC_0("_vec2pix_ring", _vec2pix_ring, SLANG_VOID_TYPE),
  MAKE_INTRINSIC_0("_pix2vec_nest", _pix2vec_nest, SLANG_VOID_TYPE),
  MAKE_INTRINSIC_0("_pix2vec_ring", _pix2vec_ring, SLANG_VOID_TYPE),
#if SLANG_SIZEOF_LONG >= 8
  MAKE_INTRINSIC_0("_ang2pix_nest64", _ang2pix_nest64, SLANG_VOID_TYPE),
  MAKE_INTRINSIC_0("_ang2pix_ring64", _ang2pix_ring64, SLANG_VOID_TYPE),
  MAKE_INTRINSIC_0("_pix2ang_nest64", _pix2ang_nest64, SLANG_VOID_TYPE),
  MAKE_INTRINSIC_0("_pix2ang_ring64", _pix2ang_ring64, SLANG_VOID_TYPE),
  MAKE_INTRINSIC_0("_nest2ring64", _nest2ring64, SLANG_VOID_TYPE),
  MAKE_INTRINSIC_0("_ring2nest64", _ring2nest64, SLANG_VOID_TYPE),
  MAKE_INTRINSIC_0("_nside2npix64", _nside2npix64, SLANG_VOID_TYPE),
  MAKE_INTRINSIC_0("_npix2nside64", _npix2nside64, SLANG_VOID_TYPE),
  MAKE_INTRINSIC_0("_vec2pix_nest64", _vec2pix_nest64, SLANG_VOID_TYPE),
  MAKE_INTRINSIC_0("_vec2pix_ring64", _vec2pix_ring64, SLANG_VOID_TYPE),
  MAKE_INTRINSIC_0("_pix2vec_nest64", _pix2vec_nest64, SLANG_VOID_TYPE),
  MAKE_INTRINSIC_0("_pix2vec_ring64", _pix2vec_nest64, SLANG_VOID_TYPE),
#endif
  MAKE_INTRINSIC_0("_read_healpix_map", _read_healpix_map, SLANG_VOID_TYPE),
  MAKE_INTRINSIC_0("_write_healpix_map", _write_healpix_map, SLANG_VOID_TYPE),
  MAKE_INTRINSIC_0("_get_fits_size", _get_fits_size, SLANG_VOID_TYPE),
  SLANG_END_INTRIN_FUN_TABLE
};

static SLang_DConstant_Type DConst_Table [] =
{
   MAKE_DCONSTANT("HEALPIX_NULLVAL", HEALPIX_NULLVAL),
   SLANG_END_DCONST_TABLE
};

static SLang_IConstant_Type IConst_Table [] =
{
   MAKE_ICONSTANT("HEALPIX_SCHEME_RING", 1),
   MAKE_ICONSTANT("HP_RING", 1),
   MAKE_ICONSTANT("HEALPIX_SCHEME_NEST", 2),
   MAKE_ICONSTANT("HP_NEST", 2),
   SLANG_END_ICONST_TABLE
};

int init_healpix_module_ns(char *ns_name) {
  SLang_NameSpace_Type *ns;
  if ( (ns = SLns_create_namespace (ns_name)) == NULL ) {
    return -1;
  }

  if (
      -1 == SLadd_intrin_fun_table(Intrinsics, NULL) ||
      -1 == SLadd_dconstant_table(DConst_Table, NULL) ||
      -1 == SLadd_iconstant_table(IConst_Table, NULL)
      ) {
    return -1;
  }

  return 0;
}
