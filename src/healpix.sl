import("healpix");

$1 = path_concat(path_concat(path_dirname(__FILE__), "help"), "healpix.hlp");
if ( NULL != stat_file($1) ) {
  add_doc_file($1);
}

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
%\seealso{_ang2pix_nest, _ang2pix_ring, _pix2ang_nest}
%!%-

%!%+
%\function{_nest2ring}
%\synopsis{Convert NESTED to RING pixel number}
%\usage{Long_Type _nest2ring(nside, ipnest)}
%\description
%	-1 is returned upon error
%\seealso{_ring2nest}
%!%-

%!%+
%\function{_ring2nest}
%\synopsis{Convert RING to NESTED pixel number}
%\usage{Long_Type _ring2nest(nside, ipnest)}
%\description
%	-1 is returned upon error
%\seealso{_nest2ring}
%!%-

%!%+
%\function{_nside2npix}
%\synopsis{Calculate the total number of pixels given the resolution nside}
%\usage{Long_Type _nside2npix(nside)}
%\seealso{_npix2nside}
%!%-

%!%+
%\function{_npix2nside}
%\synopsis{Calculate the resolution nside given a total number of pixels npix}
%\usage{Long_Type _npix2nside(npix)}
%\description
%	Upon error -1 is returned
%\seealso{_nside2npix}
%!%-

%!%+
%\function{_ang2vec}
%\synopsis{Calculate the cartesian vector in the same direction as theta, phi}
%\usage{Double_Type[3] _ang2vec(theta, phi)}
%\description
%	Note that theta is the co-latitude in radians and phi the longitude
%	in radians.
%\seealso{_vec2ang}
%!%-

%!%+
%\function{_vec2ang}
%\synopsis{Calculate the angles theta, phi in the same direction as the vector vec}
%\usage{Double_Type, Double_Type _vec2ang(Double_Type[3] vec)}
%\description
%	Note that theta is the co-latitude in radians and phi the longitude
%	in radians.
%\seealso{_ang2vec}
%!%-

%!%+
%\function{_vec2pix_nest}
%\synopsis{Return the number of the pixel which contains the position pointed to by vec}
%\usage{Long_Type _vec2pix_nest(nside, Double_Type[3] vec)}
%\description
%	The NEST scheme is utilized by this function.
%\seealso{_vec2pix_ring, _pix2vec_nest, _pix2vec_ring}
%!%-

%!%+
%\function{_vec2pix_ring}
%\synopsis{Return the number of the pixel which contains the position pointed to by vec}
%\usage{Long_Type _vec2pix_ring(nside, Double_Type[3] vec)}
%\description
%	The RING scheme is utilized by this function.
%\seealso{_vec2pix_nest, _pix2vec_nest, _pix2vec_ring}
%!%-

%!%+
%\function{_pix2vec_nest}
%\synopsis{Return the vector pointing in the direction of the center of pixel ipix}
%\usage{Double_Type[3] _pix2vec_nest(nside, ipix)}
%\description
%	The NEST scheme is utilized by this function.
%\seealso{_vec2pix_ring, _vec2pix_nest, _pix2vec_ring}
%!%-

%!%+
%\function{_pix2vec_ring}
%\synopsis{Return the vector pointing in the direction of the center of pixel ipix}
%\usage{Double_Type[3] _pix2vec_ring(nside, ipix)}
%\description
%	The RING scheme is utilized by this function.
%\seealso{_vec2pix_ring, _vec2pix_nest, _pix2vec_nest}
%!%-

%!%+
%\function{_ang2pix_nest64}
%\synopsis{64 bit version of function _ang2pix_nest}
%\usage{Int64_Type _ang2pix_nest(nside, theta, phi)}
%\seealso{_ang2pix_ring64, _pix2ang_nest64, _pix2ang_ring64}
%!%-

%!%+
%\function{_ang2pix_ring64}
%\synopsis{64 bit version of function _ang2pix_ring}
%\usage{Int64_Type _ang2pix_ring(nside, theta, phi)}
%\seealso{_ang2pix_nest64, _pix2ang_nest64, _pix2ang_ring64}
%!%-

%!%+
%\function{_pix2ang_nest64}
%\synopsis{64 bit version of function _pix2ang_nest}
%\usage{Double_Type, Double_Type _pix2ang_nest64(nside, ipix)}
%\seealso{_ang2pix_nest64, _ang2pix_ring64, _pix2ang_ring64}
%!%-

%!%+
%\function{_pix2ang_ring64}
%\synopsis{64 bit version of function _pix2ang_ring}
%\usage{Double_Type, Double_Type _pix2ang_ring64(nside, ipix)}
%\seealso{_ang2pix_nest64, _ang2pix_ring64, _pix2ang_nest64}
%!%-

%!%+
%\function{_nest2ring64}
%\synopsis{64 bit version of function _nest2ring}
%\usage{Int64_Type _nest2ring(nside, ipnest)}
%\seealso{_ring2nest64}
%!%-

%!%+
%\function{_ring2nest64}
%\synopsis{64 bit version of function _ring2nest}
%\usage{Int64_Type _ring2nest(nside, ipnest)}
%\seealso{_nest2ring64}
%!%-

%!%+
%\function{_nside2npix64}
%\synopsis{64 bit version of function _nside2npix}
%\usage{Int64_Type _nside2npix64(nside)}
%\seealso{_npix2nside64}
%!%-

%!%+
%\function{_npix2nside64}
%\synopsis{64 bit version of function _npix2nside}
%\usage{Int64_Type _npix2nside64(nside)}
%\seealso{_nside2npix64}
%!%-

%!%+
%\function{_vec2pix_nest64}
%\synopsis{64 bit version of function _vec2pix_nest}
%\usage{Int64_Type _vec2pix_nest64(nside, Double_Type[3] vec)}
%\seealso{_vec2pix_ring64, _pix2vec_nest64, _pix2vec_ring64}
%!%-

%!%+
%\function{_vec2pix_ring64}
%\synopsis{64 bit version of function _vec2pix_ring}
%\usage{Int64_Type _vec2pix_ring64(nside, Double_Type[3] vec)}
%\seealso{_vec2pix_nest64, _pix2vec_nest64, _pix2vec_ring64}
%!%-

%!%+
%\function{_pix2vec_nest64}
%\synopsis{64 bit version of function _pix2vec_nest}
%\usage{Double_Type[3] _pix2vec_nest64(nside, ipix)}
%\seealso{_vec2pix_nest64, _vec2pix_ring64, _pix2vec_ring64}
%!%-

%!%+
%\function{_pix2vec_ring64}
%\synopsis{64 bit version of function _pix2vec_ring}
%\usage{Double_Type[3] _pix2vec_ring64(nside, ipix)}
%\seealso{_vec2pix_nest64, _vec2pix_ring64, _pix2vec_nest64}
%!%-

%!%+
%\function{_read_healpix_map}
%\synopsis{Read a healpix map from a fits file}
%\usage{Double_Type[] map, Long_Type nside, String_Type coordsys, String_Type ordering = _read_healpix_map(filename)}
%\seealso{_write_healpix_map, _get_fits_size}
%!%-

%!%+
%\function{_write_healpix_map}
%\synopsis{Write a healpix map to a fits file}
%\usage{_write_healpix_map(Double_Type[] map, Long_Type nside, String_Type filename, Char_Type nest, String_Type coordsys)}
%\seealso{_read_healpix_map, _get_fits_size}
%!%-

%!%+
%\function{_get_fits_size}
%\synopsis{}
%\usage{String_Type ordering, Long_Type nside, Long_Type obs_npix _get_fits_size(String_Type filename)}
%\seealso{_read_healpix_map, _write_healpix_map}
%!%-

provide("healpix");
