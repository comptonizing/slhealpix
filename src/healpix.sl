import("healpix");

$1 = path_concat(path_concat(path_dirname(__FILE__), "help"), "healpix.hlp");
if ( NULL != stat_file($1) ) {
  add_doc_file($1);
}

private variable __deg2rad = PI / 180.;
private variable __rad2deg = 180. / PI;

% Functions provided in the C module
%
% _ang2pix_nest
% _ang2pix_ring
% _pix2ang_nest
% _pix2ang_ring
% _nest2ring
% _ring2nest
% _nside2npix
% _npix2nside
% _ang2vec
% _vec2ang
% _vec2pix_nest
% _vec2pix_ring
% _pix2vec_nest
% _pix2vec_ring
%
% Those are the 64 bit versions
%
% _ang2pix_nest64
% _ang2pix_ring64
% _pix2ang_nest64
% _pix2ang_ring64
% _nest2ring64
% _ring2nest64
% _nside2npix64
% _npix2nside64
% _vec2pix_nest64
% _vec2pix_ring64
% _pix2vec_nest64
% _pix2vec_ring
%
% And some IO routines
%
% _read_healpix_map
% _write_healpix_map
% _get_fits_size

%!%+
%\function{_ang2pix_nest}
%\synopsis{Return the pixel number which contains the position theta, phi}
%\usage{Long_Type _ang2pix_nest(nside, theta, phi)}
%\description
%	Renders the pixel number ipix for a pixel which, given the map
%	resolution parameter nside, contains the point on the sphere at angular
%	coordinates theta and phi.
%	The NEST scheme is utilized by this function.
%	Note that theta is the co-latitude in radians and phi the longitude
%	in radians.
%	This is a wrapper around the corresponding C library function.
%\seealso{_ang2pix_ring, _pix2ang_nest, _pix2ang_ring}
%!%-

%!%+
%\function{_ang2pix_ring}
%\synopsis{Return the pixel number which contains the position theta, phi}
%\usage{Long_Type _ang2pix_ring(nside, theta, phi)}
%\description
%	Renders the pixel number ipix for a pixel which, given the map
%	resolution parameter nside, contains the point on the sphere at angular
%	coordinates theta and phi.
%	The RING scheme is utilized by this function.
%	Note that theta is the co-latitude in radians and phi the longitude
%	in radians.
%	This is a wrapper around the corresponding C library function.
%\seealso{_ang2pix_nest, _pix2ang_nest, _pix2ang_ring}
%!%-

%!%+
%\function{_pix2ang_nest}
%\synopsis{Return the coordinates theta, phi at the center of the pixel ipix}
%\usage{Double_Type, Double_Type _pix2ang_nest(nside, ipix)}
%\description
%	Renders theta and phi coordinates of the nominal pixel center given the
%	pixel number ipix and a map resolution parameter nside.
%	The NEST scheme is utilized by this function.
%	Note that theta is the co-latitude in radians and phi the longitude
%	in radians.
%	This is a wrapper around the corresponding C library function.
%\seealso{_ang2pix_nest, _ang2pix_ring, _pix2ang_ring}
%!%-

%!%+
%\function{_pix2ang_ring}
%\synopsis{Return the coordinates theta, phi at the center of the pixel ipix}
%\usage{Double_Type, Double_Type _pix2ang_ring(nside, ipix)}
%\description
%	Renders theta and phi coordinates of the nominal pixel center given the
%	pixel number ipix and a map resolution parameter nside.
%	The RING scheme is utilized by this function.
%	Note that theta is the co-latitude in radians and phi the longitude
%	in radians.
%	This is a wrapper around the corresponding C library function.
%\seealso{_ang2pix_nest, _ang2pix_ring, _pix2ang_nest}
%!%-

%!%+
%\function{_nest2ring}
%\synopsis{Convert NESTED to RING pixel number}
%\usage{Long_Type _nest2ring(nside, ipnest)}
%\description
%	-1 is returned upon error
%	This is a wrapper around the corresponding C library function.
%\seealso{_ring2nest}
%!%-

%!%+
%\function{_ring2nest}
%\synopsis{Convert RING to NESTED pixel number}
%\usage{Long_Type _ring2nest(nside, ipnest)}
%\description
%	-1 is returned upon error
%	This is a wrapper around the corresponding C library function.
%\seealso{_nest2ring}
%!%-

%!%+
%\function{_nside2npix}
%\synopsis{Calculate the total number of pixels given the resolution nside}
%\usage{Long_Type _nside2npix(nside)}
%\description
%	This is a wrapper around the corresponding C library function.
%\seealso{_npix2nside}
%!%-

%!%+
%\function{_npix2nside}
%\synopsis{Calculate the resolution nside given a total number of pixels npix}
%\usage{Long_Type _npix2nside(npix)}
%\description
%	Upon error -1 is returned
%	This is a wrapper around the corresponding C library function.
%\seealso{_nside2npix}
%!%-

%!%+
%\function{_ang2vec}
%\synopsis{Calculate the cartesian vector in the same direction as theta, phi}
%\usage{Double_Type[3] _ang2vec(theta, phi)}
%\description
%	Note that theta is the co-latitude in radians and phi the longitude
%	in radians.
%	This is a wrapper around the corresponding C library function.
%\seealso{_vec2ang}
%!%-

%!%+
%\function{_vec2ang}
%\synopsis{Calculate the angles theta, phi in the same direction as the vector vec}
%\usage{Double_Type, Double_Type _vec2ang(Double_Type[3] vec)}
%\description
%	Note that theta is the co-latitude in radians and phi the longitude
%	in radians.
%	This is a wrapper around the corresponding C library function.
%\seealso{_ang2vec}
%!%-

%!%+
%\function{_vec2pix_nest}
%\synopsis{Return the number of the pixel which contains the position pointed to by vec}
%\usage{Long_Type _vec2pix_nest(nside, Double_Type[3] vec)}
%\description
%	The NEST scheme is utilized by this function.
%	This is a wrapper around the corresponding C library function.
%\seealso{_vec2pix_ring, _pix2vec_nest, _pix2vec_ring}
%!%-

%!%+
%\function{_vec2pix_ring}
%\synopsis{Return the number of the pixel which contains the position pointed to by vec}
%\usage{Long_Type _vec2pix_ring(nside, Double_Type[3] vec)}
%\description
%	The RING scheme is utilized by this function.
%	This is a wrapper around the corresponding C library function.
%\seealso{_vec2pix_nest, _pix2vec_nest, _pix2vec_ring}
%!%-

%!%+
%\function{_pix2vec_nest}
%\synopsis{Return the vector pointing in the direction of the center of pixel ipix}
%\usage{Double_Type[3] _pix2vec_nest(nside, ipix)}
%\description
%	The NEST scheme is utilized by this function.
%	This is a wrapper around the corresponding C library function.
%\seealso{_vec2pix_ring, _vec2pix_nest, _pix2vec_ring}
%!%-

%!%+
%\function{_pix2vec_ring}
%\synopsis{Return the vector pointing in the direction of the center of pixel ipix}
%\usage{Double_Type[3] _pix2vec_ring(nside, ipix)}
%\description
%	The RING scheme is utilized by this function.
%	This is a wrapper around the corresponding C library function.
%\seealso{_vec2pix_ring, _vec2pix_nest, _pix2vec_nest}
%!%-

%!%+
%\function{_ang2pix_nest64}
%\synopsis{64 bit version of function _ang2pix_nest}
%\usage{Int64_Type _ang2pix_nest(nside, theta, phi)}
%\description
%	On modern machines this function is identical to its non-64 bit version
%	and should not be used.
%	This is a wrapper around the corresponding C library function.
%\seealso{_ang2pix_ring64, _pix2ang_nest64, _pix2ang_ring64}
%!%-

%!%+
%\function{_ang2pix_ring64}
%\synopsis{64 bit version of function _ang2pix_ring}
%\usage{Int64_Type _ang2pix_ring(nside, theta, phi)}
%\description
%	On modern machines this function is identical to its non-64 bit version
%	and should not be used.
%	This is a wrapper around the corresponding C library function.
%\seealso{_ang2pix_nest64, _pix2ang_nest64, _pix2ang_ring64}
%!%-

%!%+
%\function{_pix2ang_nest64}
%\synopsis{64 bit version of function _pix2ang_nest}
%\usage{Double_Type, Double_Type _pix2ang_nest64(nside, ipix)}
%\description
%	On modern machines this function is identical to its non-64 bit version
%	and should not be used.
%	This is a wrapper around the corresponding C library function.
%\seealso{_ang2pix_nest64, _ang2pix_ring64, _pix2ang_ring64}
%!%-

%!%+
%\function{_pix2ang_ring64}
%\synopsis{64 bit version of function _pix2ang_ring}
%\usage{Double_Type, Double_Type _pix2ang_ring64(nside, ipix)}
%\description
%	On modern machines this function is identical to its non-64 bit version
%	and should not be used.
%	This is a wrapper around the corresponding C library function.
%\seealso{_ang2pix_nest64, _ang2pix_ring64, _pix2ang_nest64}
%!%-

%!%+
%\function{_nest2ring64}
%\synopsis{64 bit version of function _nest2ring}
%\usage{Int64_Type _nest2ring(nside, ipnest)}
%\description
%	On modern machines this function is identical to its non-64 bit version
%	and should not be used.
%	This is a wrapper around the corresponding C library function.
%\seealso{_ring2nest64}
%!%-

%!%+
%\function{_ring2nest64}
%\synopsis{64 bit version of function _ring2nest}
%\usage{Int64_Type _ring2nest(nside, ipnest)}
%\description
%	On modern machines this function is identical to its non-64 bit version
%	and should not be used.
%	This is a wrapper around the corresponding C library function.
%\seealso{_nest2ring64}
%!%-

%!%+
%\function{_nside2npix64}
%\synopsis{64 bit version of function _nside2npix}
%\usage{Int64_Type _nside2npix64(nside)}
%\description
%	On modern machines this function is identical to its non-64 bit version
%	and should not be used.
%	This is a wrapper around the corresponding C library function.
%\seealso{_npix2nside64}
%!%-

%!%+
%\function{_npix2nside64}
%\synopsis{64 bit version of function _npix2nside}
%\usage{Int64_Type _npix2nside64(nside)}
%\description
%	On modern machines this function is identical to its non-64 bit version
%	and should not be used.
%	This is a wrapper around the corresponding C library function.
%\seealso{_nside2npix64}
%!%-

%!%+
%\function{_vec2pix_nest64}
%\synopsis{64 bit version of function _vec2pix_nest}
%\usage{Int64_Type _vec2pix_nest64(nside, Double_Type[3] vec)}
%\description
%	On modern machines this function is identical to its non-64 bit version
%	and should not be used.
%	This is a wrapper around the corresponding C library function.
%\seealso{_vec2pix_ring64, _pix2vec_nest64, _pix2vec_ring64}
%!%-

%!%+
%\function{_vec2pix_ring64}
%\synopsis{64 bit version of function _vec2pix_ring}
%\usage{Int64_Type _vec2pix_ring64(nside, Double_Type[3] vec)}
%\description
%	On modern machines this function is identical to its non-64 bit version
%	and should not be used.
%	This is a wrapper around the corresponding C library function.
%\seealso{_vec2pix_nest64, _pix2vec_nest64, _pix2vec_ring64}
%!%-

%!%+
%\function{_pix2vec_nest64}
%\synopsis{64 bit version of function _pix2vec_nest}
%\usage{Double_Type[3] _pix2vec_nest64(nside, ipix)}
%\description
%	On modern machines this function is identical to its non-64 bit version
%	and should not be used.
%	This is a wrapper around the corresponding C library function.
%\seealso{_vec2pix_nest64, _vec2pix_ring64, _pix2vec_ring64}
%!%-

%!%+
%\function{_pix2vec_ring64}
%\synopsis{64 bit version of function _pix2vec_ring}
%\usage{Double_Type[3] _pix2vec_ring64(nside, ipix)}
%\description
%	On modern machines this function is identical to its non-64 bit version
%	and should not be used.
%	This is a wrapper around the corresponding C library function.
%\seealso{_vec2pix_nest64, _vec2pix_ring64, _pix2vec_nest64}
%!%-

%!%+
%\function{_read_healpix_map}
%\synopsis{Read a healpix map from a fits file}
%\usage{Double_Type[] map, Long_Type nside, String_Type coordsys, String_Type ordering = _read_healpix_map(filename)}
%\description
%	This is a wrapper around the corresponding C library function.
%\seealso{_write_healpix_map, _get_fits_size}
%!%-

%!%+
%\function{_write_healpix_map}
%\synopsis{Write a healpix map to a fits file}
%\usage{_write_healpix_map(Double_Type[] map, Long_Type nside, String_Type filename, Char_Type nest, String_Type coordsys)}
%\description
%	This is a wrapper around the corresponding C library function.
%\seealso{_read_healpix_map, _get_fits_size}
%!%-

%!%+
%\function{_get_fits_size}
%\synopsis{}
%\usage{String_Type ordering, Long_Type nside, Long_Type obs_npix _get_fits_size(String_Type filename)}
%\description
%	This is a wrapper around the corresponding C library function.
%\seealso{_read_healpix_map, _write_healpix_map}
%!%-

%!%+
%\function{ang2pix}
%\synopsis{Return the pixel number which contains the position l, b}
%\usage{Long_Type ang2pix(nside, l, b)}
%\qualifiers{
%	\qualifier{deg}{: Interpret l and b as degrees not radians}
%	\qualifier{scheme}{: Healpix scheme to use for the calculation: HP_RING (default) or HP_NEST)}
%}
%\description
%	Renders the pixel number ipix for a pixel which, given the map
%	resolution parameter nside, contains the point on the sphere at
%	longitude l and latitude b.
%	By default l and b are interpeted in units of radians, which can be
%	modified to degrees by the deg qualifier.
%	By default the RING scheme is used, which can be changed by the scheme
%	qualifier.
%	This function is array safe.
%
%	Note that upon error the C-library function aborts the entire program.
%\example
%       % Get the pixel number in which the coordinates 0.1, 0.2 (radian) lie for a
%       % resolution with nside = 8
%       variable ipix = ang2pix(8, 0.1, 0.2);
%
%       % Do the same for three points at once
%       variable ipix = ang2pix(8, [0.1, 0.2, 0.3], [0.4, 0.5, 0.6]);
%
%       % Switch to the NESTED scheme
%       variable ipix = ang2pix(8, [0.1, 0.2, 0.3], [0.4, 0.5, 0.6]; scheme=HP_NEST);
%
%       % Use coordinates with degrees
%       variable ipix = ang2pix(8, [0, 90., 180.], [-45., 0., 45.]; scheme=HP_NEST, deg);
%
%\seealso{pix2ang}
%!%-
define ang2pix(nside, l, b) {
  variable fun, theta, phi;
  variable deg = qualifier_exists("deg");
  variable scheme = qualifier("scheme", HP_RING);
  switch ( scheme )
      {
	case HP_RING:
	  fun = &_ang2pix_ring;
      } {
	case HP_NEST:
	  fun = &_ang2pix_nest;
      } {
	throw UsageError, "Unknown scheme: " + string(scheme);
      }
  if ( deg ) {
    l *= __deg2rad;
    b *= __deg2rad;
  }
  phi = l;
  theta = -b + 0.5 * PI;
  if ( typeof(l) != Array_Type && typeof(b) != Array_Type ) {
    return @fun(nside, theta, phi);
  }
  theta = [theta];
  phi = [phi];
  if ( length(theta) != length(phi) ) {
    throw UsageError, sprintf("Inconsistent array sizes (%d vs %d)", length(theta), length(phi));
  }
  return array_map(Long_Type, fun, nside, theta, phi);
}

%!%+
%\function{pix2ang}
%\synopsis{Return the latitude and longitude at the center of pixel(s) ipix}
%\usage{Double_Type, Double_Type pix2ang(nside, ipix)}
%\qualifiers{
%	\qualifier{deg}{: Return l and b as degrees not radians}
%	\qualifier{scheme}{: Healpix scheme to use for the calculation: HP_RING (default) or HP_NEST)}
%}
%\description
%	Renders the longitude l and latitude b of the nominal pixel center
%	given the pixel number ipix and a map resolution parameter nside.
%	By default l and b are returned in units of radians, which can be
%	modified to degrees by the deg qualifier.
%	By default the RING scheme is used, which can be changed by the scheme
%	qualifier.
%	This function is array safe.
%
%	Note that upon error the C-library function aborts the entire program.
%\example
%       % Get coordinates in rad of pixel 10 for a resolution of 8
%       variable l, b;
%       (l, b) = pix2ang(8, 10);
%
%       % Do the same for three pixels at once
%       (l, b) = pix2ang(8, [11,12,13]);
%
%       % Switch to nested scheme
%       (l, b) = pix2ang(8, [11,12,13]; scheme=HP_NEST);
%
%       % Return coordinates in degrees
%       (l, b) = pix2ang(8, [11,12,13]; scheme=HP_NEST, deg);
%
%\seealso{ang2pix}
%!%-
define pix2ang(nside, ipix) {
  variable fun, theta, phi, l, b;
  variable deg = qualifier_exists("deg");
  variable scheme = qualifier("scheme", HP_RING);
  switch ( scheme )
      {
	case HP_RING:
	  fun = &_pix2ang_ring;
      } {
	case HP_NEST:
	  fun = &_pix2ang_nest;
      } {
	throw UsageError, "Unknown scheme: " + string(scheme);
      }
  if ( typeof(ipix) == Array_Type ) {
    (theta, phi) = array_map(Double_Type, Double_Type, fun, nside, ipix);
  } else {
    (theta, phi) = @fun(nside, ipix);
  }
  l = phi;
  b = -1 * ( theta - 0.5 * PI );
  if ( deg ) {
    l *= __rad2deg;
    b *= __rad2deg;
  }
  return (l, b);
}

%!%+
%\function{nest2ring}
%\synopsis{Convert NESTED to RING pixel number}
%\usage{Long_Type nest2ring(nside, ipnest)}
%\description
%	Upon error the function throws a UsageError
%	This function is array safe.
%\seealso{ring2nest}
%!%-
define nest2ring(nside, ipnest) {
  variable ret, ierror;
  if ( typeof(ipnest) != Array_Type ) {
    ret = _nest2ring(nside, ipnest);
    if ( ret == -1 ) {
      throw UsageError, sprintf("Unknown error converting nested pixel id %d to ring pixel id for nside = %d", ipnest, nside);
    }
    return ret;
  }
  ret = array_map(Long_Type, &_nest2ring, nside, ipnest);
  ierror = where(ret == -1);
  if ( length(ierror) == 0 ) {
    return ret;
  }
  throw UsageError, sprintf("Unknown error converting nested pixel id %d to ring pixel id for nside = %d", ipnest[ierror[0]], nside);
}

%!%+
%\function{ring2nest}
%\synopsis{Convert RING to NESTED pixel number}
%\usage{Long_Type ring2nest(nside, ipring)}
%\description
%	Upon error the function throws a UsageError
%	This function is array safe.
%\seealso{nest2ring}
%!%-
define ring2nest(nside, ipring) {
  variable ret, ierror;
  if ( typeof(ipring) != Array_Type ) {
    ret = _ring2nest(nside, ipring);
    if ( ret == -1 ) {
      throw UsageError, sprintf("Unknown error converting ring pixel id %d to nested pixel id for nside = %d", ipring, nside);
    }
    return ret;
  }
  ret = array_map(Long_Type, &_ring2nest, nside, ipring);
  ierror = where(ret == -1);
  if ( length(ierror) == 0 ) {
    return ret;
  }
  throw UsageError, sprintf("Unknown error converting ring pixel id %d to nested pixel id for nside = %d", ipring[ierror[0]], nside);
}

%!%+
%\function{nside2npix}
%\synopsis{Calculate the total number of pixels given the resolution nside}
%\usage{Long_Type nside2npix(nside)}
%\seealso{npix2nside}
%!%-
define nside2npix(nside) {
  return _nside2npix(nside);
}

%!%+
%\function{npix2nside}
%\synopsis{Calculate the resolution nside given a total number of pixels npix1}
%\usage{Long_Type npix2nside(npix)}
%\description
%	Upon error the function throws a UsageError
%\seealso{nside2npix}
%!%-
define npix2nside(npix) {
  variable ret = _npix2nside(npix);
  if ( ret == -1 ) {
    throw UsageError, sprintf("Unknown error converting %d pixels to nside", npix);
  }
  return ret;
}

%!%+
%\function{ang2vec}
%\synopsis{Calculate the cartesian vector in the same direction as l, b}
%\usage{Double_Type[3]|Array_Type[] _ang2vec(l, b)}
%\qualifiers{
%	\qualifier{deg}{: Supply l and b in degrees instead of radians}
%}
%\description
%	l and b are the longitude and latitude in radians. The deg qualifier
%	can be used to supply the coordinates in degrees.
%	This function is array safe.
%\example
%       % Convert coordinates in radian to a vector
%       variable vec = ang2vec(0.1, 0.2);
%
%       % Convert 3 coordinates at once
%       vec = ang2vec([0.1,0.2,0.3], [0.1,0.2,0.3]);
%
%       % Use degrees instead of radian
%       vec = ang2vec([10.,20.,30.], [40.,50.,60.]; deg);
%
%\seealso{vec2ang}
%!%-
define ang2vec(l, b) {
  variable theta, phi;
  if ( qualifier_exists("deg") ) {
    l *= __deg2rad;
    b *= __deg2rad;
  }
  phi = l;
  theta = -b + 0.5 * PI;
  if ( typeof(l) != Array_Type && typeof(b) != Array_Type ) {
    return _ang2vec(theta, phi);
  }
  if ( length(theta) != length(phi) ) {
    throw UsageError, sprintf("Inconsistent array sizes (%d vs %d)", length(theta), length(phi));
  }
  return array_map(Array_Type, &_ang2vec, theta, phi);
}

%!%+
%\function{vec2ang}
%\synopsis{Calculate the coordinates l, b in the same direction as the vector vec}
%\usage{Double_Type[], Double_Type[] vec2ang(vec)}
%\qualifiers{
%	\qualifier{deg}{: Return l and b in degrees instead of radians}
%}
%\description
%	l and b are the longitude and latitude in radians. The deg qualifier
%	can be used to supply the coordinates in degrees.
%	This function is array safe.
%\example
%       % Create a vector in cartesian coordinates
%       variable vec = [1.0, 0.0, 0.0];
%
%       % Convert it to l and b in radian
%       variable l, b;
%       (l, b) = vec2ang(vec);
%
%       % Convert multiple vectors at once
%       variable arr = Array_Type[3];
%       arr[0] = [1.0, 0.0, 0.0];
%       arr[1] = [0.0, 1.0, 0.0];
%       arr[2] = [0.0, 0.0, 1.0];
%       (l, b) = vec2ang(arr);
%
%       % Return the result in degree
%       (l, b) = vec2ang(arr; deg);
%
%\seealso{ang2vec}
%!%-
define vec2ang(vec) {
  variable theta, phi, l, b;
  if ( _typeof(vec) == Array_Type ) {
    (theta, phi) = array_map(Double_Type, Double_Type, &_vec2ang, vec);
  } else {
    (theta, phi) = _vec2ang(vec);
  }
  l = phi;
  b = -1 * ( theta - 0.5 * PI );
  if ( qualifier_exists("deg") ) {
    l *= __rad2deg;
    b *= __rad2deg;
  }
  return (l, b);
}

%!%+
%\function{vec2pix}
%\synopsis{Return the number of the pixel which contains the position pointed to by vec}
%\usage{Long_Type[] vec2pix(nside, vec)}
%\qualifiers{
%	\qualifier{scheme}{: Healpix scheme to use for the calculation: HP_RING (default) or HP_NEST)}
%}
%\description
%	This function is array safe.
%\example
%       % Create a vector in cartesian coordinates
%       variable vec = [1.0, 0.0, 0.0];
%
%       % Get the pixel the vector points to for nside = 8
%       variable ipix = vec2pix(8, vec);
%
%       % Convert multiple vectors at once
%       variable arr = Array_Type[3];
%       arr[0] = [1.0, 0.0, 0.0];
%       arr[1] = [0.0, 1.0, 0.0];
%       arr[2] = [0.0, 0.0, 1.0];
%       ipix = vec2pix(8, arr);
%
%       % Switch to NESTED scheme
%       ipix = vec2pix(8, arr; scheme=HP_NEST);
%
%\seealso{pix2vec}
%!%-
define vec2pix(nside, vec) {
  variable fun, ipix;
  variable scheme = qualifier("scheme", HP_RING);
  switch ( scheme )
      {
	case HP_RING:
	  fun = &_vec2pix_ring;
      } {
	case HP_NEST:
	  fun = &_vec2pix_nest;
      } {
	throw UsageError, "Unknown scheme: " + string(scheme);
      }
  if ( _typeof(vec) == Array_Type ) {
    ipix = array_map(Long_Type, fun, nside, vec);
  } else {
    ipix = @fun(nside, vec);
  }
  return ipix;
}

%!%+
%\function{pix2vec}
%\synopsis{Return the vector pointing in the direction of the center of pixel ipix}
%\usage{Double_Type[3]|Array_Type pix2vec(nside, ipix)}
%\qualifiers{
%	\qualifier{scheme}{: Healpix scheme to use for the calculation: HP_RING (default) or HP_NEST)}
%}
%\description
%	This function is array safe.
%\example
%       % Get vector pointing to pixel 100 for nside = 8
%       variable vec = pix2vec(8, 100);
%
%       % Get vectors to multiple pixels
%       variable arr = pix2vec(8, [1,2,3]);
%
%       % Switch to NESTED scheme
%       arr = pix2vec(8, [1,2,3]; scheme=HP_NEST);
%
%\seealso{vec2pix}
%!%-
define pix2vec(nside, ipix) {
  variable fun, vec;
  variable scheme = qualifier("scheme", HP_RING);
  switch ( scheme )
      {
	case HP_RING:
	  fun = &_pix2vec_ring;
      } {
	case HP_NEST:
	  fun = &_pix2vec_nest;
      } {
	throw UsageError, "Unknown scheme: " + string(scheme);
      }
  if ( typeof(ipix) == Array_Type ) {
    vec = array_map(Array_Type, fun, nside, ipix);
  } else {
    vec = @fun(nside, ipix);
  }
  return vec;
}

provide("healpix");
