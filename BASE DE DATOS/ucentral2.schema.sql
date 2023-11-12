--
-- PostgreSQL database dump
--

-- Started on 2010-05-06 18:48:45

SET client_encoding = 'UTF8';
SET standard_conforming_strings = off;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET escape_string_warning = off;

--
-- TOC entry 1340 (class 2612 OID 16386)
-- Name: plpgsql; Type: PROCEDURAL LANGUAGE; Schema: -; Owner: -
--

CREATE PROCEDURAL LANGUAGE plpgsql;


SET search_path = public, pg_catalog;

--
-- TOC entry 1215 (class 0 OID 0)
-- Name: box2d; Type: SHELL TYPE; Schema: public; Owner: -
--

CREATE TYPE box2d;


--
-- TOC entry 277 (class 1255 OID 17095)
-- Dependencies: 6 1215
-- Name: st_box2d_in(cstring); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_box2d_in(cstring) RETURNS box2d
    AS '$libdir/postgis-1.4', 'BOX2DFLOAT4_in'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 279 (class 1255 OID 17097)
-- Dependencies: 6 1215
-- Name: st_box2d_out(box2d); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_box2d_out(box2d) RETURNS cstring
    AS '$libdir/postgis-1.4', 'BOX2DFLOAT4_out'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 1214 (class 1247 OID 17073)
-- Dependencies: 279 6 277
-- Name: box2d; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE box2d (
    INTERNALLENGTH = 16,
    INPUT = st_box2d_in,
    OUTPUT = st_box2d_out,
    ALIGNMENT = int4,
    STORAGE = plain
);


--
-- TOC entry 1206 (class 0 OID 0)
-- Name: box3d; Type: SHELL TYPE; Schema: public; Owner: -
--

CREATE TYPE box3d;


--
-- TOC entry 253 (class 1255 OID 17065)
-- Dependencies: 6 1206
-- Name: st_box3d_in(cstring); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_box3d_in(cstring) RETURNS box3d
    AS '$libdir/postgis-1.4', 'BOX3D_in'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 254 (class 1255 OID 17066)
-- Dependencies: 6 1206
-- Name: st_box3d_out(box3d); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_box3d_out(box3d) RETURNS cstring
    AS '$libdir/postgis-1.4', 'BOX3D_out'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 1205 (class 1247 OID 17062)
-- Dependencies: 6 253 254
-- Name: box3d; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE box3d (
    INTERNALLENGTH = 48,
    INPUT = st_box3d_in,
    OUTPUT = st_box3d_out,
    ALIGNMENT = double,
    STORAGE = plain
);


--
-- TOC entry 1209 (class 0 OID 0)
-- Name: box3d_extent; Type: SHELL TYPE; Schema: public; Owner: -
--

CREATE TYPE box3d_extent;


--
-- TOC entry 255 (class 1255 OID 17069)
-- Dependencies: 6 1209
-- Name: box3d_extent_in(cstring); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION box3d_extent_in(cstring) RETURNS box3d_extent
    AS '$libdir/postgis-1.4', 'BOX3D_in'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 256 (class 1255 OID 17070)
-- Dependencies: 6 1209
-- Name: box3d_extent_out(box3d_extent); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION box3d_extent_out(box3d_extent) RETURNS cstring
    AS '$libdir/postgis-1.4', 'BOX3D_extent_out'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 1208 (class 1247 OID 17068)
-- Dependencies: 256 6 255
-- Name: box3d_extent; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE box3d_extent (
    INTERNALLENGTH = 48,
    INPUT = box3d_extent_in,
    OUTPUT = box3d_extent_out,
    ALIGNMENT = double,
    STORAGE = plain
);


--
-- TOC entry 1212 (class 0 OID 0)
-- Name: chip; Type: SHELL TYPE; Schema: public; Owner: -
--

CREATE TYPE chip;


--
-- TOC entry 273 (class 1255 OID 17090)
-- Dependencies: 6 1212
-- Name: st_chip_in(cstring); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_chip_in(cstring) RETURNS chip
    AS '$libdir/postgis-1.4', 'CHIP_in'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 275 (class 1255 OID 17092)
-- Dependencies: 6 1212
-- Name: st_chip_out(chip); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_chip_out(chip) RETURNS cstring
    AS '$libdir/postgis-1.4', 'CHIP_out'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 1211 (class 1247 OID 17088)
-- Dependencies: 275 273 6
-- Name: chip; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE chip (
    INTERNALLENGTH = variable,
    INPUT = st_chip_in,
    OUTPUT = st_chip_out,
    ALIGNMENT = double,
    STORAGE = extended
);


--
-- TOC entry 1178 (class 0 OID 0)
-- Name: gbtreekey16; Type: SHELL TYPE; Schema: public; Owner: -
--

CREATE TYPE gbtreekey16;


--
-- TOC entry 24 (class 1255 OID 16412)
-- Dependencies: 6 1178
-- Name: gbtreekey16_in(cstring); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION gbtreekey16_in(cstring) RETURNS gbtreekey16
    AS '$libdir/btree_gist', 'gbtreekey_in'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 25 (class 1255 OID 16413)
-- Dependencies: 6 1178
-- Name: gbtreekey16_out(gbtreekey16); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION gbtreekey16_out(gbtreekey16) RETURNS cstring
    AS '$libdir/btree_gist', 'gbtreekey_out'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 1177 (class 1247 OID 16411)
-- Dependencies: 25 24 6
-- Name: gbtreekey16; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE gbtreekey16 (
    INTERNALLENGTH = 16,
    INPUT = gbtreekey16_in,
    OUTPUT = gbtreekey16_out,
    ALIGNMENT = int4,
    STORAGE = plain
);


--
-- TOC entry 1181 (class 0 OID 0)
-- Name: gbtreekey32; Type: SHELL TYPE; Schema: public; Owner: -
--

CREATE TYPE gbtreekey32;


--
-- TOC entry 26 (class 1255 OID 16416)
-- Dependencies: 6 1181
-- Name: gbtreekey32_in(cstring); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION gbtreekey32_in(cstring) RETURNS gbtreekey32
    AS '$libdir/btree_gist', 'gbtreekey_in'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 27 (class 1255 OID 16417)
-- Dependencies: 6 1181
-- Name: gbtreekey32_out(gbtreekey32); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION gbtreekey32_out(gbtreekey32) RETURNS cstring
    AS '$libdir/btree_gist', 'gbtreekey_out'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 1180 (class 1247 OID 16415)
-- Dependencies: 26 6 27
-- Name: gbtreekey32; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE gbtreekey32 (
    INTERNALLENGTH = 32,
    INPUT = gbtreekey32_in,
    OUTPUT = gbtreekey32_out,
    ALIGNMENT = int4,
    STORAGE = plain
);


--
-- TOC entry 1136 (class 0 OID 0)
-- Name: gbtreekey4; Type: SHELL TYPE; Schema: public; Owner: -
--

CREATE TYPE gbtreekey4;


--
-- TOC entry 20 (class 1255 OID 16404)
-- Dependencies: 6 1136
-- Name: gbtreekey4_in(cstring); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION gbtreekey4_in(cstring) RETURNS gbtreekey4
    AS '$libdir/btree_gist', 'gbtreekey_in'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 21 (class 1255 OID 16405)
-- Dependencies: 6 1136
-- Name: gbtreekey4_out(gbtreekey4); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION gbtreekey4_out(gbtreekey4) RETURNS cstring
    AS '$libdir/btree_gist', 'gbtreekey_out'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 1135 (class 1247 OID 16403)
-- Dependencies: 21 6 20
-- Name: gbtreekey4; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE gbtreekey4 (
    INTERNALLENGTH = 4,
    INPUT = gbtreekey4_in,
    OUTPUT = gbtreekey4_out,
    ALIGNMENT = int4,
    STORAGE = plain
);


--
-- TOC entry 1175 (class 0 OID 0)
-- Name: gbtreekey8; Type: SHELL TYPE; Schema: public; Owner: -
--

CREATE TYPE gbtreekey8;


--
-- TOC entry 22 (class 1255 OID 16408)
-- Dependencies: 6 1175
-- Name: gbtreekey8_in(cstring); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION gbtreekey8_in(cstring) RETURNS gbtreekey8
    AS '$libdir/btree_gist', 'gbtreekey_in'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 23 (class 1255 OID 16409)
-- Dependencies: 6 1175
-- Name: gbtreekey8_out(gbtreekey8); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION gbtreekey8_out(gbtreekey8) RETURNS cstring
    AS '$libdir/btree_gist', 'gbtreekey_out'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 1174 (class 1247 OID 16407)
-- Dependencies: 6 22 23
-- Name: gbtreekey8; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE gbtreekey8 (
    INTERNALLENGTH = 8,
    INPUT = gbtreekey8_in,
    OUTPUT = gbtreekey8_out,
    ALIGNMENT = int4,
    STORAGE = plain
);


--
-- TOC entry 1184 (class 0 OID 0)
-- Name: gbtreekey_var; Type: SHELL TYPE; Schema: public; Owner: -
--

CREATE TYPE gbtreekey_var;


--
-- TOC entry 28 (class 1255 OID 16420)
-- Dependencies: 6 1184
-- Name: gbtreekey_var_in(cstring); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION gbtreekey_var_in(cstring) RETURNS gbtreekey_var
    AS '$libdir/btree_gist', 'gbtreekey_in'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 29 (class 1255 OID 16421)
-- Dependencies: 6 1184
-- Name: gbtreekey_var_out(gbtreekey_var); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION gbtreekey_var_out(gbtreekey_var) RETURNS cstring
    AS '$libdir/btree_gist', 'gbtreekey_out'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 1183 (class 1247 OID 16419)
-- Dependencies: 28 6 29
-- Name: gbtreekey_var; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE gbtreekey_var (
    INTERNALLENGTH = variable,
    INPUT = gbtreekey_var_in,
    OUTPUT = gbtreekey_var_out,
    ALIGNMENT = int4,
    STORAGE = extended
);


--
-- TOC entry 1203 (class 0 OID 0)
-- Name: geometry; Type: SHELL TYPE; Schema: public; Owner: -
--

CREATE TYPE geometry;


--
-- TOC entry 222 (class 1255 OID 17032)
-- Dependencies: 6
-- Name: st_geometry_analyze(internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_geometry_analyze(internal) RETURNS boolean
    AS '$libdir/postgis-1.4', 'LWGEOM_analyze'
    LANGUAGE c STRICT;


--
-- TOC entry 218 (class 1255 OID 17028)
-- Dependencies: 6 1203
-- Name: st_geometry_in(cstring); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_geometry_in(cstring) RETURNS geometry
    AS '$libdir/postgis-1.4', 'LWGEOM_in'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 220 (class 1255 OID 17030)
-- Dependencies: 6 1203
-- Name: st_geometry_out(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_geometry_out(geometry) RETURNS cstring
    AS '$libdir/postgis-1.4', 'LWGEOM_out'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 224 (class 1255 OID 17034)
-- Dependencies: 6 1203
-- Name: st_geometry_recv(internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_geometry_recv(internal) RETURNS geometry
    AS '$libdir/postgis-1.4', 'LWGEOM_recv'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 226 (class 1255 OID 17036)
-- Dependencies: 6 1203
-- Name: st_geometry_send(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_geometry_send(geometry) RETURNS bytea
    AS '$libdir/postgis-1.4', 'LWGEOM_send'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 1202 (class 1247 OID 17026)
-- Dependencies: 6 220 218 226 224 222
-- Name: geometry; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE geometry (
    INTERNALLENGTH = variable,
    INPUT = st_geometry_in,
    OUTPUT = st_geometry_out,
    RECEIVE = st_geometry_recv,
    SEND = st_geometry_send,
    ANALYZE = st_geometry_analyze,
    DELIMITER = ':',
    ALIGNMENT = int4,
    STORAGE = main
);


--
-- TOC entry 1217 (class 1247 OID 17363)
-- Dependencies: 6 2652
-- Name: geometry_dump; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE geometry_dump AS (
	path integer[],
	geom geometry
);


--
-- TOC entry 1186 (class 1247 OID 16842)
-- Dependencies: 6
-- Name: lo; Type: DOMAIN; Schema: public; Owner: -
--

CREATE DOMAIN lo AS oid;


--
-- TOC entry 1191 (class 0 OID 0)
-- Name: lquery; Type: SHELL TYPE; Schema: public; Owner: -
--

CREATE TYPE lquery;


--
-- TOC entry 174 (class 1255 OID 16900)
-- Dependencies: 6 1191
-- Name: lquery_in(cstring); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION lquery_in(cstring) RETURNS lquery
    AS '$libdir/ltree', 'lquery_in'
    LANGUAGE c STRICT;


--
-- TOC entry 175 (class 1255 OID 16901)
-- Dependencies: 6 1191
-- Name: lquery_out(lquery); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION lquery_out(lquery) RETURNS cstring
    AS '$libdir/ltree', 'lquery_out'
    LANGUAGE c STRICT;


--
-- TOC entry 1190 (class 1247 OID 16899)
-- Dependencies: 174 6 175
-- Name: lquery; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE lquery (
    INTERNALLENGTH = variable,
    INPUT = lquery_in,
    OUTPUT = lquery_out,
    ALIGNMENT = int4,
    STORAGE = extended
);


--
-- TOC entry 1188 (class 0 OID 0)
-- Name: ltree; Type: SHELL TYPE; Schema: public; Owner: -
--

CREATE TYPE ltree;


--
-- TOC entry 143 (class 1255 OID 16846)
-- Dependencies: 6 1188
-- Name: ltree_in(cstring); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION ltree_in(cstring) RETURNS ltree
    AS '$libdir/ltree', 'ltree_in'
    LANGUAGE c STRICT;


--
-- TOC entry 144 (class 1255 OID 16847)
-- Dependencies: 6 1188
-- Name: ltree_out(ltree); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION ltree_out(ltree) RETURNS cstring
    AS '$libdir/ltree', 'ltree_out'
    LANGUAGE c STRICT;


--
-- TOC entry 1187 (class 1247 OID 16845)
-- Dependencies: 144 6 143
-- Name: ltree; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE ltree (
    INTERNALLENGTH = variable,
    INPUT = ltree_in,
    OUTPUT = ltree_out,
    ALIGNMENT = int4,
    STORAGE = extended
);


--
-- TOC entry 1197 (class 0 OID 0)
-- Name: ltree_gist; Type: SHELL TYPE; Schema: public; Owner: -
--

CREATE TYPE ltree_gist;


--
-- TOC entry 184 (class 1255 OID 16926)
-- Dependencies: 6 1197
-- Name: ltree_gist_in(cstring); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION ltree_gist_in(cstring) RETURNS ltree_gist
    AS '$libdir/ltree', 'ltree_gist_in'
    LANGUAGE c STRICT;


--
-- TOC entry 185 (class 1255 OID 16927)
-- Dependencies: 6 1197
-- Name: ltree_gist_out(ltree_gist); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION ltree_gist_out(ltree_gist) RETURNS cstring
    AS '$libdir/ltree', 'ltree_gist_out'
    LANGUAGE c STRICT;


--
-- TOC entry 1196 (class 1247 OID 16925)
-- Dependencies: 184 6 185
-- Name: ltree_gist; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE ltree_gist (
    INTERNALLENGTH = variable,
    INPUT = ltree_gist_in,
    OUTPUT = ltree_gist_out,
    ALIGNMENT = int4,
    STORAGE = plain
);


--
-- TOC entry 1194 (class 0 OID 0)
-- Name: ltxtquery; Type: SHELL TYPE; Schema: public; Owner: -
--

CREATE TYPE ltxtquery;


--
-- TOC entry 180 (class 1255 OID 16916)
-- Dependencies: 6 1194
-- Name: ltxtq_in(cstring); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION ltxtq_in(cstring) RETURNS ltxtquery
    AS '$libdir/ltree', 'ltxtq_in'
    LANGUAGE c STRICT;


--
-- TOC entry 181 (class 1255 OID 16917)
-- Dependencies: 6 1194
-- Name: ltxtq_out(ltxtquery); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION ltxtq_out(ltxtquery) RETURNS cstring
    AS '$libdir/ltree', 'ltxtq_out'
    LANGUAGE c STRICT;


--
-- TOC entry 1193 (class 1247 OID 16915)
-- Dependencies: 180 6 181
-- Name: ltxtquery; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE ltxtquery (
    INTERNALLENGTH = variable,
    INPUT = ltxtq_in,
    OUTPUT = ltxtq_out,
    ALIGNMENT = int4,
    STORAGE = extended
);


--
-- TOC entry 1226 (class 0 OID 0)
-- Name: pgis_abs; Type: SHELL TYPE; Schema: public; Owner: -
--

CREATE TYPE pgis_abs;


--
-- TOC entry 626 (class 1255 OID 17537)
-- Dependencies: 6 1226
-- Name: pgis_abs_in(cstring); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION pgis_abs_in(cstring) RETURNS pgis_abs
    AS '$libdir/postgis-1.4', 'pgis_abs_in'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 627 (class 1255 OID 17538)
-- Dependencies: 6 1226
-- Name: pgis_abs_out(pgis_abs); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION pgis_abs_out(pgis_abs) RETURNS cstring
    AS '$libdir/postgis-1.4', 'pgis_abs_out'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 1225 (class 1247 OID 17536)
-- Dependencies: 627 626 6
-- Name: pgis_abs; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE pgis_abs (
    INTERNALLENGTH = 8,
    INPUT = pgis_abs_in,
    OUTPUT = pgis_abs_out,
    ALIGNMENT = double,
    STORAGE = plain
);


--
-- TOC entry 1200 (class 0 OID 0)
-- Name: spheroid; Type: SHELL TYPE; Schema: public; Owner: -
--

CREATE TYPE spheroid;


--
-- TOC entry 214 (class 1255 OID 17022)
-- Dependencies: 6 1200
-- Name: st_spheroid_in(cstring); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_spheroid_in(cstring) RETURNS spheroid
    AS '$libdir/postgis-1.4', 'ellipsoid_in'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 216 (class 1255 OID 17024)
-- Dependencies: 6 1200
-- Name: st_spheroid_out(spheroid); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_spheroid_out(spheroid) RETURNS cstring
    AS '$libdir/postgis-1.4', 'ellipsoid_out'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 1199 (class 1247 OID 17020)
-- Dependencies: 216 214 6
-- Name: spheroid; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE spheroid (
    INTERNALLENGTH = 65,
    INPUT = st_spheroid_in,
    OUTPUT = st_spheroid_out,
    ALIGNMENT = double,
    STORAGE = plain
);


--
-- TOC entry 199 (class 1255 OID 16964)
-- Dependencies: 1192 6 1189
-- Name: _lt_q_regex(ltree[], lquery[]); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION _lt_q_regex(ltree[], lquery[]) RETURNS boolean
    AS '$libdir/ltree', '_lt_q_regex'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 200 (class 1255 OID 16965)
-- Dependencies: 1189 6 1192
-- Name: _lt_q_rregex(lquery[], ltree[]); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION _lt_q_rregex(lquery[], ltree[]) RETURNS boolean
    AS '$libdir/ltree', '_lt_q_rregex'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 205 (class 1255 OID 16992)
-- Dependencies: 1187 1189 1190 6
-- Name: _ltq_extract_regex(ltree[], lquery); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION _ltq_extract_regex(ltree[], lquery) RETURNS ltree
    AS '$libdir/ltree', '_ltq_extract_regex'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 197 (class 1255 OID 16962)
-- Dependencies: 1190 1189 6
-- Name: _ltq_regex(ltree[], lquery); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION _ltq_regex(ltree[], lquery) RETURNS boolean
    AS '$libdir/ltree', '_ltq_regex'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 198 (class 1255 OID 16963)
-- Dependencies: 6 1190 1189
-- Name: _ltq_rregex(lquery, ltree[]); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION _ltq_rregex(lquery, ltree[]) RETURNS boolean
    AS '$libdir/ltree', '_ltq_rregex'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 208 (class 1255 OID 16997)
-- Dependencies: 6
-- Name: _ltree_compress(internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION _ltree_compress(internal) RETURNS internal
    AS '$libdir/ltree', '_ltree_compress'
    LANGUAGE c IMMUTABLE;


--
-- TOC entry 207 (class 1255 OID 16996)
-- Dependencies: 6
-- Name: _ltree_consistent(internal, internal, smallint); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION _ltree_consistent(internal, internal, smallint) RETURNS boolean
    AS '$libdir/ltree', '_ltree_consistent'
    LANGUAGE c IMMUTABLE;


--
-- TOC entry 203 (class 1255 OID 16988)
-- Dependencies: 6 1187 1187 1189
-- Name: _ltree_extract_isparent(ltree[], ltree); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION _ltree_extract_isparent(ltree[], ltree) RETURNS ltree
    AS '$libdir/ltree', '_ltree_extract_isparent'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 204 (class 1255 OID 16990)
-- Dependencies: 1187 1189 1187 6
-- Name: _ltree_extract_risparent(ltree[], ltree); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION _ltree_extract_risparent(ltree[], ltree) RETURNS ltree
    AS '$libdir/ltree', '_ltree_extract_risparent'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 193 (class 1255 OID 16958)
-- Dependencies: 1189 6 1187
-- Name: _ltree_isparent(ltree[], ltree); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION _ltree_isparent(ltree[], ltree) RETURNS boolean
    AS '$libdir/ltree', '_ltree_isparent'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 209 (class 1255 OID 16998)
-- Dependencies: 6
-- Name: _ltree_penalty(internal, internal, internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION _ltree_penalty(internal, internal, internal) RETURNS internal
    AS '$libdir/ltree', '_ltree_penalty'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 210 (class 1255 OID 16999)
-- Dependencies: 6
-- Name: _ltree_picksplit(internal, internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION _ltree_picksplit(internal, internal) RETURNS internal
    AS '$libdir/ltree', '_ltree_picksplit'
    LANGUAGE c IMMUTABLE;


--
-- TOC entry 194 (class 1255 OID 16959)
-- Dependencies: 1187 6 1189
-- Name: _ltree_r_isparent(ltree, ltree[]); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION _ltree_r_isparent(ltree, ltree[]) RETURNS boolean
    AS '$libdir/ltree', '_ltree_r_isparent'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 196 (class 1255 OID 16961)
-- Dependencies: 1187 6 1189
-- Name: _ltree_r_risparent(ltree, ltree[]); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION _ltree_r_risparent(ltree, ltree[]) RETURNS boolean
    AS '$libdir/ltree', '_ltree_r_risparent'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 195 (class 1255 OID 16960)
-- Dependencies: 1189 6 1187
-- Name: _ltree_risparent(ltree[], ltree); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION _ltree_risparent(ltree[], ltree) RETURNS boolean
    AS '$libdir/ltree', '_ltree_risparent'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 212 (class 1255 OID 17001)
-- Dependencies: 6
-- Name: _ltree_same(internal, internal, internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION _ltree_same(internal, internal, internal) RETURNS internal
    AS '$libdir/ltree', '_ltree_same'
    LANGUAGE c IMMUTABLE;


--
-- TOC entry 211 (class 1255 OID 17000)
-- Dependencies: 6
-- Name: _ltree_union(internal, internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION _ltree_union(internal, internal) RETURNS integer
    AS '$libdir/ltree', '_ltree_union'
    LANGUAGE c IMMUTABLE;


--
-- TOC entry 201 (class 1255 OID 16966)
-- Dependencies: 6 1193 1189
-- Name: _ltxtq_exec(ltree[], ltxtquery); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION _ltxtq_exec(ltree[], ltxtquery) RETURNS boolean
    AS '$libdir/ltree', '_ltxtq_exec'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 206 (class 1255 OID 16994)
-- Dependencies: 1193 1187 6 1189
-- Name: _ltxtq_extract_exec(ltree[], ltxtquery); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION _ltxtq_extract_exec(ltree[], ltxtquery) RETURNS ltree
    AS '$libdir/ltree', '_ltxtq_extract_exec'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 202 (class 1255 OID 16967)
-- Dependencies: 1193 6 1189
-- Name: _ltxtq_rexec(ltxtquery, ltree[]); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION _ltxtq_rexec(ltxtquery, ltree[]) RETURNS boolean
    AS '$libdir/ltree', '_ltxtq_rexec'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 705 (class 1255 OID 17628)
-- Dependencies: 1202 6
-- Name: _st_asgeojson(integer, geometry, integer, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION _st_asgeojson(integer, geometry, integer, integer) RETURNS text
    AS '$libdir/postgis-1.4', 'LWGEOM_asGeoJson'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 688 (class 1255 OID 17611)
-- Dependencies: 1202 6
-- Name: _st_asgml(integer, geometry, integer, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION _st_asgml(integer, geometry, integer, integer) RETURNS text
    AS '$libdir/postgis-1.4', 'LWGEOM_asGML'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 697 (class 1255 OID 17620)
-- Dependencies: 6 1202
-- Name: _st_askml(integer, geometry, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION _st_askml(integer, geometry, integer) RETURNS text
    AS '$libdir/postgis-1.4', 'LWGEOM_asKML'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 658 (class 1255 OID 17581)
-- Dependencies: 6 1202 1202
-- Name: _st_contains(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION _st_contains(geometry, geometry) RETURNS boolean
    AS '$libdir/postgis-1.4', 'contains'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 664 (class 1255 OID 17587)
-- Dependencies: 6 1202 1202
-- Name: _st_containsproperly(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION _st_containsproperly(geometry, geometry) RETURNS boolean
    AS '$libdir/postgis-1.4', 'containsproperly'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 660 (class 1255 OID 17583)
-- Dependencies: 6 1202 1202
-- Name: _st_coveredby(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION _st_coveredby(geometry, geometry) RETURNS boolean
    AS '$libdir/postgis-1.4', 'coveredby'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 662 (class 1255 OID 17585)
-- Dependencies: 6 1202 1202
-- Name: _st_covers(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION _st_covers(geometry, geometry) RETURNS boolean
    AS '$libdir/postgis-1.4', 'covers'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 652 (class 1255 OID 17575)
-- Dependencies: 1202 6 1202
-- Name: _st_crosses(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION _st_crosses(geometry, geometry) RETURNS boolean
    AS '$libdir/postgis-1.4', 'crosses'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 646 (class 1255 OID 17569)
-- Dependencies: 6 1202 1202
-- Name: _st_dwithin(geometry, geometry, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION _st_dwithin(geometry, geometry, double precision) RETURNS boolean
    AS '$libdir/postgis-1.4', 'LWGEOM_dwithin'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 649 (class 1255 OID 17572)
-- Dependencies: 6 1202 1202
-- Name: _st_intersects(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION _st_intersects(geometry, geometry) RETURNS boolean
    AS '$libdir/postgis-1.4', 'intersects'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 602 (class 1255 OID 17508)
-- Dependencies: 6 1202 1202
-- Name: _st_linecrossingdirection(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION _st_linecrossingdirection(geometry, geometry) RETURNS integer
    AS '$libdir/postgis-1.4', 'ST_LineCrossingDirection'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 667 (class 1255 OID 17590)
-- Dependencies: 1202 6 1202
-- Name: _st_overlaps(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION _st_overlaps(geometry, geometry) RETURNS boolean
    AS '$libdir/postgis-1.4', 'overlaps'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 644 (class 1255 OID 17567)
-- Dependencies: 6 1202 1202
-- Name: _st_touches(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION _st_touches(geometry, geometry) RETURNS boolean
    AS '$libdir/postgis-1.4', 'touches'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 655 (class 1255 OID 17578)
-- Dependencies: 1202 1202 6
-- Name: _st_within(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION _st_within(geometry, geometry) RETURNS boolean
    AS '$libdir/postgis-1.4', 'within'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 873 (class 1255 OID 17796)
-- Dependencies: 1340 6
-- Name: addauth(text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION addauth(text) RETURNS boolean
    AS $_$ 
DECLARE
	lockid alias for $1;
	okay boolean;
	myrec record;
BEGIN
	-- check to see if table exists
	--  if not, CREATE TEMP TABLE mylock (transid xid, lockcode text)
	okay := 'f';
	FOR myrec IN SELECT * FROM pg_class WHERE relname = 'temp_lock_have_table' LOOP
		okay := 't';
	END LOOP; 
	IF (okay <> 't') THEN 
		CREATE TEMP TABLE temp_lock_have_table (transid xid, lockcode text);
			-- this will only work from pgsql7.4 up
			-- ON COMMIT DELETE ROWS;
	END IF;

	--  INSERT INTO mylock VALUES ( $1)
--	EXECUTE 'INSERT INTO temp_lock_have_table VALUES ( '||
--		quote_literal(getTransactionID()) || ',' ||
--		quote_literal(lockid) ||')';

	INSERT INTO temp_lock_have_table VALUES (getTransactionID(), lockid);

	RETURN true::boolean;
END;
$_$
    LANGUAGE plpgsql;


--
-- TOC entry 3125 (class 0 OID 0)
-- Dependencies: 873
-- Name: FUNCTION addauth(text); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION addauth(text) IS 'args: auth_token - Add an authorization token to be used in current transaction.';


--
-- TOC entry 345 (class 1255 OID 17210)
-- Dependencies: 6 1202 1202
-- Name: addbbox(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION addbbox(geometry) RETURNS geometry
    AS '$libdir/postgis-1.4', 'LWGEOM_addBBOX'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 518 (class 1255 OID 17408)
-- Dependencies: 6 1340
-- Name: addgeometrycolumn(character varying, character varying, character varying, character varying, integer, character varying, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION addgeometrycolumn(character varying, character varying, character varying, character varying, integer, character varying, integer) RETURNS text
    AS $_$
DECLARE
	catalog_name alias for $1;
	schema_name alias for $2;
	table_name alias for $3;
	column_name alias for $4;
	new_srid alias for $5;
	new_type alias for $6;
	new_dim alias for $7;
	rec RECORD;
	sr varchar;
	real_schema name;
	sql text;

BEGIN

	-- Verify geometry type
	IF ( NOT ( (new_type = 'GEOMETRY') OR
			   (new_type = 'GEOMETRYCOLLECTION') OR
			   (new_type = 'POINT') OR
			   (new_type = 'MULTIPOINT') OR
			   (new_type = 'POLYGON') OR
			   (new_type = 'MULTIPOLYGON') OR
			   (new_type = 'LINESTRING') OR
			   (new_type = 'MULTILINESTRING') OR
			   (new_type = 'GEOMETRYCOLLECTIONM') OR
			   (new_type = 'POINTM') OR
			   (new_type = 'MULTIPOINTM') OR
			   (new_type = 'POLYGONM') OR
			   (new_type = 'MULTIPOLYGONM') OR
			   (new_type = 'LINESTRINGM') OR
			   (new_type = 'MULTILINESTRINGM') OR
			   (new_type = 'CIRCULARSTRING') OR
			   (new_type = 'CIRCULARSTRINGM') OR
			   (new_type = 'COMPOUNDCURVE') OR
			   (new_type = 'COMPOUNDCURVEM') OR
			   (new_type = 'CURVEPOLYGON') OR
			   (new_type = 'CURVEPOLYGONM') OR
			   (new_type = 'MULTICURVE') OR
			   (new_type = 'MULTICURVEM') OR
			   (new_type = 'MULTISURFACE') OR
			   (new_type = 'MULTISURFACEM')) )
	THEN
		RAISE EXCEPTION 'Invalid type name - valid ones are:
	POINT, MULTIPOINT,
	LINESTRING, MULTILINESTRING,
	POLYGON, MULTIPOLYGON,
	CIRCULARSTRING, COMPOUNDCURVE, MULTICURVE,
	CURVEPOLYGON, MULTISURFACE,
	GEOMETRY, GEOMETRYCOLLECTION,
	POINTM, MULTIPOINTM,
	LINESTRINGM, MULTILINESTRINGM,
	POLYGONM, MULTIPOLYGONM,
	CIRCULARSTRINGM, COMPOUNDCURVEM, MULTICURVEM
	CURVEPOLYGONM, MULTISURFACEM,
	or GEOMETRYCOLLECTIONM';
		RETURN 'fail';
	END IF;


	-- Verify dimension
	IF ( (new_dim >4) OR (new_dim <0) ) THEN
		RAISE EXCEPTION 'invalid dimension';
		RETURN 'fail';
	END IF;

	IF ( (new_type LIKE '%M') AND (new_dim!=3) ) THEN
		RAISE EXCEPTION 'TypeM needs 3 dimensions';
		RETURN 'fail';
	END IF;


	-- Verify SRID
	IF ( new_srid != -1 ) THEN
		SELECT SRID INTO sr FROM spatial_ref_sys WHERE SRID = new_srid;
		IF NOT FOUND THEN
			RAISE EXCEPTION 'AddGeometryColumns() - invalid SRID';
			RETURN 'fail';
		END IF;
	END IF;


	-- Verify schema
	IF ( schema_name IS NOT NULL AND schema_name != '' ) THEN
		sql := 'SELECT nspname FROM pg_namespace ' ||
			'WHERE text(nspname) = ' || quote_literal(schema_name) ||
			'LIMIT 1';
		RAISE DEBUG '%', sql;
		EXECUTE sql INTO real_schema;

		IF ( real_schema IS NULL ) THEN
			RAISE EXCEPTION 'Schema % is not a valid schemaname', quote_literal(schema_name);
			RETURN 'fail';
		END IF;
	END IF;

	IF ( real_schema IS NULL ) THEN
		RAISE DEBUG 'Detecting schema';
		sql := 'SELECT n.nspname AS schemaname ' ||
			'FROM pg_catalog.pg_class c ' ||
			  'JOIN pg_catalog.pg_namespace n ON n.oid = c.relnamespace ' ||
			'WHERE c.relkind = ' || quote_literal('r') ||
			' AND n.nspname NOT IN (' || quote_literal('pg_catalog') || ', ' || quote_literal('pg_toast') || ')' ||
			' AND pg_catalog.pg_table_is_visible(c.oid)' ||
			' AND c.relname = ' || quote_literal(table_name);
		RAISE DEBUG '%', sql;
		EXECUTE sql INTO real_schema;

		IF ( real_schema IS NULL ) THEN
			RAISE EXCEPTION 'Table % does not occur in the search_path', quote_literal(table_name);
			RETURN 'fail';
		END IF;
	END IF;
	

	-- Add geometry column to table
	sql := 'ALTER TABLE ' ||
		quote_ident(real_schema) || '.' || quote_ident(table_name)
		|| ' ADD COLUMN ' || quote_ident(column_name) ||
		' geometry ';
	RAISE DEBUG '%', sql;
	EXECUTE sql;


	-- Delete stale record in geometry_columns (if any)
	sql := 'DELETE FROM geometry_columns WHERE
		f_table_catalog = ' || quote_literal('') ||
		' AND f_table_schema = ' ||
		quote_literal(real_schema) ||
		' AND f_table_name = ' || quote_literal(table_name) ||
		' AND f_geometry_column = ' || quote_literal(column_name);
	RAISE DEBUG '%', sql;
	EXECUTE sql;


	-- Add record in geometry_columns
	sql := 'INSERT INTO geometry_columns (f_table_catalog,f_table_schema,f_table_name,' ||
										  'f_geometry_column,coord_dimension,srid,type)' ||
		' VALUES (' ||
		quote_literal('') || ',' ||
		quote_literal(real_schema) || ',' ||
		quote_literal(table_name) || ',' ||
		quote_literal(column_name) || ',' ||
		new_dim::text || ',' ||
		new_srid::text || ',' ||
		quote_literal(new_type) || ')';
	RAISE DEBUG '%', sql;
	EXECUTE sql;


	-- Add table CHECKs
	sql := 'ALTER TABLE ' ||
		quote_ident(real_schema) || '.' || quote_ident(table_name)
		|| ' ADD CONSTRAINT '
		|| quote_ident('enforce_srid_' || column_name)
		|| ' CHECK (ST_SRID(' || quote_ident(column_name) ||
		') = ' || new_srid::text || ')' ;
	RAISE DEBUG '%', sql;
	EXECUTE sql;

	sql := 'ALTER TABLE ' ||
		quote_ident(real_schema) || '.' || quote_ident(table_name)
		|| ' ADD CONSTRAINT '
		|| quote_ident('enforce_dims_' || column_name)
		|| ' CHECK (ST_NDims(' || quote_ident(column_name) ||
		') = ' || new_dim::text || ')' ;
	RAISE DEBUG '%', sql;
	EXECUTE sql;

	IF ( NOT (new_type = 'GEOMETRY')) THEN
		sql := 'ALTER TABLE ' ||
			quote_ident(real_schema) || '.' || quote_ident(table_name) || ' ADD CONSTRAINT ' ||
			quote_ident('enforce_geotype_' || column_name) ||
			' CHECK (GeometryType(' ||
			quote_ident(column_name) || ')=' ||
			quote_literal(new_type) || ' OR (' ||
			quote_ident(column_name) || ') is null)';
		RAISE DEBUG '%', sql;
		EXECUTE sql;
	END IF;

	RETURN
		real_schema || '.' ||
		table_name || '.' || column_name ||
		' SRID:' || new_srid::text ||
		' TYPE:' || new_type ||
		' DIMS:' || new_dim::text || ' ';
END;
$_$
    LANGUAGE plpgsql STRICT;


--
-- TOC entry 3126 (class 0 OID 0)
-- Dependencies: 518
-- Name: FUNCTION addgeometrycolumn(character varying, character varying, character varying, character varying, integer, character varying, integer); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION addgeometrycolumn(character varying, character varying, character varying, character varying, integer, character varying, integer) IS 'args: catalog_name, schema_name, table_name, column_name, srid, type, dimension - Adds a geometry column to an existing table of attributes.';


--
-- TOC entry 519 (class 1255 OID 17409)
-- Dependencies: 6 1340
-- Name: addgeometrycolumn(character varying, character varying, character varying, integer, character varying, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION addgeometrycolumn(character varying, character varying, character varying, integer, character varying, integer) RETURNS text
    AS $_$ 
DECLARE
	ret  text;
BEGIN
	SELECT AddGeometryColumn('',$1,$2,$3,$4,$5,$6) into ret;
	RETURN ret;
END;
$_$
    LANGUAGE plpgsql STABLE STRICT;


--
-- TOC entry 3127 (class 0 OID 0)
-- Dependencies: 519
-- Name: FUNCTION addgeometrycolumn(character varying, character varying, character varying, integer, character varying, integer); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION addgeometrycolumn(character varying, character varying, character varying, integer, character varying, integer) IS 'args: schema_name, table_name, column_name, srid, type, dimension - Adds a geometry column to an existing table of attributes.';


--
-- TOC entry 520 (class 1255 OID 17410)
-- Dependencies: 6 1340
-- Name: addgeometrycolumn(character varying, character varying, integer, character varying, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION addgeometrycolumn(character varying, character varying, integer, character varying, integer) RETURNS text
    AS $_$ 
DECLARE
	ret  text;
BEGIN
	SELECT AddGeometryColumn('','',$1,$2,$3,$4,$5) into ret;
	RETURN ret;
END;
$_$
    LANGUAGE plpgsql STRICT;


--
-- TOC entry 3128 (class 0 OID 0)
-- Dependencies: 520
-- Name: FUNCTION addgeometrycolumn(character varying, character varying, integer, character varying, integer); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION addgeometrycolumn(character varying, character varying, integer, character varying, integer) IS 'args: table_name, column_name, srid, type, dimension - Adds a geometry column to an existing table of attributes.';


--
-- TOC entry 477 (class 1255 OID 17342)
-- Dependencies: 6 1202 1202 1202
-- Name: addpoint(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION addpoint(geometry, geometry) RETURNS geometry
    AS '$libdir/postgis-1.4', 'LWGEOM_addpoint'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 479 (class 1255 OID 17344)
-- Dependencies: 6 1202 1202 1202
-- Name: addpoint(geometry, geometry, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION addpoint(geometry, geometry, integer) RETURNS geometry
    AS '$libdir/postgis-1.4', 'LWGEOM_addpoint'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 227 (class 1255 OID 17038)
-- Dependencies: 1202 6 1202
-- Name: affine(geometry, double precision, double precision, double precision, double precision, double precision, double precision, double precision, double precision, double precision, double precision, double precision, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION affine(geometry, double precision, double precision, double precision, double precision, double precision, double precision, double precision, double precision, double precision, double precision, double precision, double precision) RETURNS geometry
    AS '$libdir/postgis-1.4', 'LWGEOM_affine'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 229 (class 1255 OID 17040)
-- Dependencies: 1202 6 1202
-- Name: affine(geometry, double precision, double precision, double precision, double precision, double precision, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION affine(geometry, double precision, double precision, double precision, double precision, double precision, double precision) RETURNS geometry
    AS $_$SELECT affine($1,  $2, $3, 0,  $4, $5, 0,  0, 0, 1,  $6, $7, 0)$_$
    LANGUAGE sql IMMUTABLE STRICT;


--
-- TOC entry 394 (class 1255 OID 17259)
-- Dependencies: 6 1202
-- Name: area(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION area(geometry) RETURNS double precision
    AS '$libdir/postgis-1.4', 'LWGEOM_area_polygon'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 392 (class 1255 OID 17257)
-- Dependencies: 6 1202
-- Name: area2d(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION area2d(geometry) RETURNS double precision
    AS '$libdir/postgis-1.4', 'LWGEOM_area_polygon'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 754 (class 1255 OID 17677)
-- Dependencies: 1202 6
-- Name: asbinary(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION asbinary(geometry) RETURNS bytea
    AS '$libdir/postgis-1.4', 'LWGEOM_asBinary'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 756 (class 1255 OID 17679)
-- Dependencies: 6 1202
-- Name: asbinary(geometry, text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION asbinary(geometry, text) RETURNS bytea
    AS '$libdir/postgis-1.4', 'LWGEOM_asBinary'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 444 (class 1255 OID 17309)
-- Dependencies: 1202 6
-- Name: asewkb(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION asewkb(geometry) RETURNS bytea
    AS '$libdir/postgis-1.4', 'WKBFromLWGEOM'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 450 (class 1255 OID 17315)
-- Dependencies: 1202 6
-- Name: asewkb(geometry, text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION asewkb(geometry, text) RETURNS bytea
    AS '$libdir/postgis-1.4', 'WKBFromLWGEOM'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 442 (class 1255 OID 17307)
-- Dependencies: 1202 6
-- Name: asewkt(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION asewkt(geometry) RETURNS text
    AS '$libdir/postgis-1.4', 'LWGEOM_asEWKT'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 689 (class 1255 OID 17612)
-- Dependencies: 6 1202
-- Name: asgml(geometry, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION asgml(geometry, integer) RETURNS text
    AS $_$SELECT _ST_AsGML(2, $1, $2, 0)$_$
    LANGUAGE sql IMMUTABLE STRICT;


--
-- TOC entry 691 (class 1255 OID 17614)
-- Dependencies: 6 1202
-- Name: asgml(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION asgml(geometry) RETURNS text
    AS $_$SELECT _ST_AsGML(2, $1, 15, 0)$_$
    LANGUAGE sql IMMUTABLE STRICT;


--
-- TOC entry 446 (class 1255 OID 17311)
-- Dependencies: 1202 6
-- Name: ashexewkb(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION ashexewkb(geometry) RETURNS text
    AS '$libdir/postgis-1.4', 'LWGEOM_asHEXEWKB'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 448 (class 1255 OID 17313)
-- Dependencies: 1202 6
-- Name: ashexewkb(geometry, text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION ashexewkb(geometry, text) RETURNS text
    AS '$libdir/postgis-1.4', 'LWGEOM_asHEXEWKB'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 698 (class 1255 OID 17621)
-- Dependencies: 1202 6
-- Name: askml(geometry, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION askml(geometry, integer) RETURNS text
    AS $_$SELECT _ST_AsKML(2, transform($1,4326), $2)$_$
    LANGUAGE sql IMMUTABLE STRICT;


--
-- TOC entry 700 (class 1255 OID 17623)
-- Dependencies: 1202 6
-- Name: askml(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION askml(geometry) RETURNS text
    AS $_$SELECT _ST_AsKML(2, transform($1,4326), 15)$_$
    LANGUAGE sql IMMUTABLE STRICT;


--
-- TOC entry 701 (class 1255 OID 17624)
-- Dependencies: 6 1202
-- Name: askml(integer, geometry, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION askml(integer, geometry, integer) RETURNS text
    AS $_$SELECT _ST_AsKML($1, transform($2,4326), $3)$_$
    LANGUAGE sql IMMUTABLE STRICT;


--
-- TOC entry 682 (class 1255 OID 17605)
-- Dependencies: 6 1202
-- Name: assvg(geometry, integer, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION assvg(geometry, integer, integer) RETURNS text
    AS '$libdir/postgis-1.4', 'assvg_geometry'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 684 (class 1255 OID 17607)
-- Dependencies: 1202 6
-- Name: assvg(geometry, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION assvg(geometry, integer) RETURNS text
    AS '$libdir/postgis-1.4', 'assvg_geometry'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 686 (class 1255 OID 17609)
-- Dependencies: 1202 6
-- Name: assvg(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION assvg(geometry) RETURNS text
    AS '$libdir/postgis-1.4', 'assvg_geometry'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 758 (class 1255 OID 17681)
-- Dependencies: 6 1202
-- Name: astext(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION astext(geometry) RETURNS text
    AS '$libdir/postgis-1.4', 'LWGEOM_asText'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 406 (class 1255 OID 17271)
-- Dependencies: 6 1202 1202
-- Name: azimuth(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION azimuth(geometry, geometry) RETURNS double precision
    AS '$libdir/postgis-1.4', 'LWGEOM_azimuth'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 866 (class 1255 OID 17789)
-- Dependencies: 1202 6 1340
-- Name: bdmpolyfromtext(text, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION bdmpolyfromtext(text, integer) RETURNS geometry
    AS $_$ 
DECLARE
	geomtext alias for $1;
	srid alias for $2;
	mline geometry;
	geom geometry;
BEGIN
	mline := MultiLineStringFromText(geomtext, srid);

	IF mline IS NULL
	THEN
		RAISE EXCEPTION 'Input is not a MultiLinestring';
	END IF;

	geom := multi(BuildArea(mline));

	RETURN geom;
END;
$_$
    LANGUAGE plpgsql IMMUTABLE STRICT;


--
-- TOC entry 864 (class 1255 OID 17787)
-- Dependencies: 1202 6 1340
-- Name: bdpolyfromtext(text, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION bdpolyfromtext(text, integer) RETURNS geometry
    AS $_$ 
DECLARE
	geomtext alias for $1;
	srid alias for $2;
	mline geometry;
	geom geometry;
BEGIN
	mline := MultiLineStringFromText(geomtext, srid);

	IF mline IS NULL
	THEN
		RAISE EXCEPTION 'Input is not a MultiLinestring';
	END IF;

	geom := BuildArea(mline);

	IF GeometryType(geom) != 'POLYGON'
	THEN
		RAISE EXCEPTION 'Input returns more then a single polygon, try using BdMPolyFromText instead';
	END IF;

	RETURN geom;
END;
$_$
    LANGUAGE plpgsql IMMUTABLE STRICT;


--
-- TOC entry 609 (class 1255 OID 17515)
-- Dependencies: 6 1202 1202
-- Name: boundary(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION boundary(geometry) RETURNS geometry
    AS '$libdir/postgis-1.4', 'boundary'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 549 (class 1255 OID 17439)
-- Dependencies: 6 1202
-- Name: box(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION box(geometry) RETURNS box
    AS '$libdir/postgis-1.4', 'LWGEOM_to_BOX'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 555 (class 1255 OID 17445)
-- Dependencies: 6 1205
-- Name: box(box3d); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION box(box3d) RETURNS box
    AS '$libdir/postgis-1.4', 'BOX3D_to_BOX'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 545 (class 1255 OID 17435)
-- Dependencies: 6 1214 1202
-- Name: box2d(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION box2d(geometry) RETURNS box2d
    AS '$libdir/postgis-1.4', 'LWGEOM_to_BOX2DFLOAT4'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 551 (class 1255 OID 17441)
-- Dependencies: 6 1214 1205
-- Name: box2d(box3d); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION box2d(box3d) RETURNS box2d
    AS '$libdir/postgis-1.4', 'BOX3D_to_BOX2DFLOAT4'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 288 (class 1255 OID 17107)
-- Dependencies: 6 1214 1214
-- Name: box2d_contain(box2d, box2d); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION box2d_contain(box2d, box2d) RETURNS boolean
    AS '$libdir/postgis-1.4', 'BOX2D_contain'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 290 (class 1255 OID 17109)
-- Dependencies: 6 1214 1214
-- Name: box2d_contained(box2d, box2d); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION box2d_contained(box2d, box2d) RETURNS boolean
    AS '$libdir/postgis-1.4', 'BOX2D_contained'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 276 (class 1255 OID 17094)
-- Dependencies: 1214 6
-- Name: box2d_in(cstring); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION box2d_in(cstring) RETURNS box2d
    AS '$libdir/postgis-1.4', 'BOX2DFLOAT4_in'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 296 (class 1255 OID 17115)
-- Dependencies: 6 1214 1214
-- Name: box2d_intersects(box2d, box2d); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION box2d_intersects(box2d, box2d) RETURNS boolean
    AS '$libdir/postgis-1.4', 'BOX2D_intersects'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 284 (class 1255 OID 17103)
-- Dependencies: 6 1214 1214
-- Name: box2d_left(box2d, box2d); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION box2d_left(box2d, box2d) RETURNS boolean
    AS '$libdir/postgis-1.4', 'BOX2D_left'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 278 (class 1255 OID 17096)
-- Dependencies: 6 1214
-- Name: box2d_out(box2d); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION box2d_out(box2d) RETURNS cstring
    AS '$libdir/postgis-1.4', 'BOX2DFLOAT4_out'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 292 (class 1255 OID 17111)
-- Dependencies: 6 1214 1214
-- Name: box2d_overlap(box2d, box2d); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION box2d_overlap(box2d, box2d) RETURNS boolean
    AS '$libdir/postgis-1.4', 'BOX2D_overlap'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 280 (class 1255 OID 17099)
-- Dependencies: 6 1214 1214
-- Name: box2d_overleft(box2d, box2d); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION box2d_overleft(box2d, box2d) RETURNS boolean
    AS '$libdir/postgis-1.4', 'BOX2D_overleft'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 282 (class 1255 OID 17101)
-- Dependencies: 6 1214 1214
-- Name: box2d_overright(box2d, box2d); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION box2d_overright(box2d, box2d) RETURNS boolean
    AS '$libdir/postgis-1.4', 'BOX2D_overright'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 286 (class 1255 OID 17105)
-- Dependencies: 6 1214 1214
-- Name: box2d_right(box2d, box2d); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION box2d_right(box2d, box2d) RETURNS boolean
    AS '$libdir/postgis-1.4', 'BOX2D_right'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 294 (class 1255 OID 17113)
-- Dependencies: 6 1214 1214
-- Name: box2d_same(box2d, box2d); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION box2d_same(box2d, box2d) RETURNS boolean
    AS '$libdir/postgis-1.4', 'BOX2D_same'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 547 (class 1255 OID 17437)
-- Dependencies: 6 1205 1202
-- Name: box3d(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION box3d(geometry) RETURNS box3d
    AS '$libdir/postgis-1.4', 'LWGEOM_to_BOX3D'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 553 (class 1255 OID 17443)
-- Dependencies: 6 1205 1214
-- Name: box3d(box2d); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION box3d(box2d) RETURNS box3d
    AS '$libdir/postgis-1.4', 'BOX2DFLOAT4_to_BOX3D'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 251 (class 1255 OID 17063)
-- Dependencies: 1205 6
-- Name: box3d_in(cstring); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION box3d_in(cstring) RETURNS box3d
    AS '$libdir/postgis-1.4', 'BOX3D_in'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 252 (class 1255 OID 17064)
-- Dependencies: 1205 6
-- Name: box3d_out(box3d); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION box3d_out(box3d) RETURNS cstring
    AS '$libdir/postgis-1.4', 'BOX3D_out'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 559 (class 1255 OID 17449)
-- Dependencies: 6 1205
-- Name: box3dtobox(box3d); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION box3dtobox(box3d) RETURNS box
    AS $_$SELECT box($1)$_$
    LANGUAGE sql IMMUTABLE STRICT;


--
-- TOC entry 596 (class 1255 OID 17502)
-- Dependencies: 6 1202 1202
-- Name: buffer(geometry, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION buffer(geometry, double precision) RETURNS geometry
    AS '$libdir/postgis-1.4', 'buffer'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 598 (class 1255 OID 17504)
-- Dependencies: 6 1202 1202
-- Name: buffer(geometry, double precision, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION buffer(geometry, double precision, integer) RETURNS geometry
    AS '$libdir/postgis-1.4', 'buffer'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 489 (class 1255 OID 17354)
-- Dependencies: 6 1202 1202
-- Name: buildarea(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION buildarea(geometry) RETURNS geometry
    AS '$libdir/postgis-1.4', 'LWGEOM_buildarea'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 570 (class 1255 OID 17460)
-- Dependencies: 6 1202
-- Name: bytea(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION bytea(geometry) RETURNS bytea
    AS '$libdir/postgis-1.4', 'LWGEOM_to_bytea'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 456 (class 1255 OID 17321)
-- Dependencies: 6
-- Name: cache_bbox(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION cache_bbox() RETURNS trigger
    AS '$libdir/postgis-1.4', 'cache_bbox'
    LANGUAGE c;


--
-- TOC entry 672 (class 1255 OID 17595)
-- Dependencies: 1202 6 1202
-- Name: centroid(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION centroid(geometry) RETURNS geometry
    AS '$libdir/postgis-1.4', 'centroid'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 874 (class 1255 OID 17797)
-- Dependencies: 1340 6
-- Name: checkauth(text, text, text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION checkauth(text, text, text) RETURNS integer
    AS $_$ 
DECLARE
	schema text;
BEGIN
	IF NOT LongTransactionsEnabled() THEN
		RAISE EXCEPTION 'Long transaction support disabled, use EnableLongTransaction() to enable.';
	END IF;

	if ( $1 != '' ) THEN
		schema = $1;
	ELSE
		SELECT current_schema() into schema;
	END IF;

	-- TODO: check for an already existing trigger ?

	EXECUTE 'CREATE TRIGGER check_auth BEFORE UPDATE OR DELETE ON ' 
		|| quote_ident(schema) || '.' || quote_ident($2)
		||' FOR EACH ROW EXECUTE PROCEDURE CheckAuthTrigger('
		|| quote_literal($3) || ')';

	RETURN 0;
END;
$_$
    LANGUAGE plpgsql;


--
-- TOC entry 3129 (class 0 OID 0)
-- Dependencies: 874
-- Name: FUNCTION checkauth(text, text, text); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION checkauth(text, text, text) IS 'args: a_schema_name, a_table_name, a_key_column_name - Creates trigger on a table to prevent/allow updates and deletes of rows based on authorization token.';


--
-- TOC entry 875 (class 1255 OID 17798)
-- Dependencies: 6
-- Name: checkauth(text, text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION checkauth(text, text) RETURNS integer
    AS $_$ SELECT CheckAuth('', $1, $2) $_$
    LANGUAGE sql;


--
-- TOC entry 3130 (class 0 OID 0)
-- Dependencies: 875
-- Name: FUNCTION checkauth(text, text); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION checkauth(text, text) IS 'args: a_table_name, a_key_column_name - Creates trigger on a table to prevent/allow updates and deletes of rows based on authorization token.';


--
-- TOC entry 876 (class 1255 OID 17799)
-- Dependencies: 6
-- Name: checkauthtrigger(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION checkauthtrigger() RETURNS trigger
    AS '$libdir/postgis-1.4', 'check_authorization'
    LANGUAGE c;


--
-- TOC entry 272 (class 1255 OID 17089)
-- Dependencies: 1211 6
-- Name: chip_in(cstring); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION chip_in(cstring) RETURNS chip
    AS '$libdir/postgis-1.4', 'CHIP_in'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 274 (class 1255 OID 17091)
-- Dependencies: 6 1211
-- Name: chip_out(chip); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION chip_out(chip) RETURNS cstring
    AS '$libdir/postgis-1.4', 'CHIP_out'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 619 (class 1255 OID 17525)
-- Dependencies: 6 1202 1202 1202
-- Name: collect(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION collect(geometry, geometry) RETURNS geometry
    AS '$libdir/postgis-1.4', 'LWGEOM_collect'
    LANGUAGE c IMMUTABLE;


--
-- TOC entry 623 (class 1255 OID 17531)
-- Dependencies: 6 1202 1204
-- Name: collect_garray(geometry[]); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION collect_garray(geometry[]) RETURNS geometry
    AS '$libdir/postgis-1.4', 'LWGEOM_collect_garray'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 617 (class 1255 OID 17523)
-- Dependencies: 6 1202 1202 1202
-- Name: collector(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION collector(geometry, geometry) RETURNS geometry
    AS '$libdir/postgis-1.4', 'LWGEOM_collect'
    LANGUAGE c IMMUTABLE;


--
-- TOC entry 499 (class 1255 OID 17368)
-- Dependencies: 6 1214 1214 1202
-- Name: combine_bbox(box2d, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION combine_bbox(box2d, geometry) RETURNS box2d
    AS '$libdir/postgis-1.4', 'BOX2DFLOAT4_combine'
    LANGUAGE c IMMUTABLE;


--
-- TOC entry 501 (class 1255 OID 17370)
-- Dependencies: 6 1208 1208 1202
-- Name: combine_bbox(box3d_extent, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION combine_bbox(box3d_extent, geometry) RETURNS box3d_extent
    AS '$libdir/postgis-1.4', 'BOX3D_combine'
    LANGUAGE c IMMUTABLE;


--
-- TOC entry 503 (class 1255 OID 17374)
-- Dependencies: 6 1205 1205 1202
-- Name: combine_bbox(box3d, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION combine_bbox(box3d, geometry) RETURNS box3d
    AS '$libdir/postgis-1.4', 'BOX3D_combine'
    LANGUAGE c IMMUTABLE;


--
-- TOC entry 361 (class 1255 OID 17226)
-- Dependencies: 6 1211
-- Name: compression(chip); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION compression(chip) RETURNS integer
    AS '$libdir/postgis-1.4', 'CHIP_getCompression'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 657 (class 1255 OID 17580)
-- Dependencies: 1202 6 1202
-- Name: contains(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION contains(geometry, geometry) RETURNS boolean
    AS '$libdir/postgis-1.4', 'contains'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 600 (class 1255 OID 17506)
-- Dependencies: 6 1202 1202
-- Name: convexhull(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION convexhull(geometry) RETURNS geometry
    AS '$libdir/postgis-1.4', 'convexhull'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 651 (class 1255 OID 17574)
-- Dependencies: 1202 1202 6
-- Name: crosses(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION crosses(geometry, geometry) RETURNS boolean
    AS '$libdir/postgis-1.4', 'crosses'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 359 (class 1255 OID 17224)
-- Dependencies: 6 1211
-- Name: datatype(chip); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION datatype(chip) RETURNS integer
    AS '$libdir/postgis-1.4', 'CHIP_getDatatype'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 607 (class 1255 OID 17513)
-- Dependencies: 6 1202 1202 1202
-- Name: difference(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION difference(geometry, geometry) RETURNS geometry
    AS '$libdir/postgis-1.4', 'difference'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 720 (class 1255 OID 17643)
-- Dependencies: 1202 6
-- Name: dimension(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION dimension(geometry) RETURNS integer
    AS '$libdir/postgis-1.4', 'LWGEOM_dimension'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 880 (class 1255 OID 17803)
-- Dependencies: 1340 6
-- Name: disablelongtransactions(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION disablelongtransactions() RETURNS text
    AS $$ 
DECLARE
	rec RECORD;

BEGIN

	--
	-- Drop all triggers applied by CheckAuth()
	--
	FOR rec IN
		SELECT c.relname, t.tgname, t.tgargs FROM pg_trigger t, pg_class c, pg_proc p
		WHERE p.proname = 'checkauthtrigger' and t.tgfoid = p.oid and t.tgrelid = c.oid
	LOOP
		EXECUTE 'DROP TRIGGER ' || quote_ident(rec.tgname) ||
			' ON ' || quote_ident(rec.relname);
	END LOOP;

	--
	-- Drop the authorization_table table
	--
	FOR rec IN SELECT * FROM pg_class WHERE relname = 'authorization_table' LOOP
		DROP TABLE authorization_table;
	END LOOP;

	--
	-- Drop the authorized_tables view
	--
	FOR rec IN SELECT * FROM pg_class WHERE relname = 'authorized_tables' LOOP
		DROP VIEW authorized_tables;
	END LOOP;

	RETURN 'Long transactions support disabled';
END;
$$
    LANGUAGE plpgsql;


--
-- TOC entry 3131 (class 0 OID 0)
-- Dependencies: 880
-- Name: FUNCTION disablelongtransactions(); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION disablelongtransactions() IS 'Disable long transaction support. This function removes the long transaction support metadata tables, and drops all triggers attached to lock-checked tables.';


--
-- TOC entry 641 (class 1255 OID 17564)
-- Dependencies: 6 1202 1202
-- Name: disjoint(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION disjoint(geometry, geometry) RETURNS boolean
    AS '$libdir/postgis-1.4', 'disjoint'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 400 (class 1255 OID 17265)
-- Dependencies: 6 1202 1202
-- Name: distance(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION distance(geometry, geometry) RETURNS double precision
    AS '$libdir/postgis-1.4', 'LWGEOM_mindistance2d'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 398 (class 1255 OID 17263)
-- Dependencies: 6 1202 1202
-- Name: distance_sphere(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION distance_sphere(geometry, geometry) RETURNS double precision
    AS '$libdir/postgis-1.4', 'LWGEOM_distance_sphere'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 396 (class 1255 OID 17261)
-- Dependencies: 6 1202 1202 1199
-- Name: distance_spheroid(geometry, geometry, spheroid); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION distance_spheroid(geometry, geometry, spheroid) RETURNS double precision
    AS '$libdir/postgis-1.4', 'LWGEOM_distance_ellipsoid_point'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 347 (class 1255 OID 17212)
-- Dependencies: 6 1202 1202
-- Name: dropbbox(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION dropbbox(geometry) RETURNS geometry
    AS '$libdir/postgis-1.4', 'LWGEOM_dropBBOX'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 521 (class 1255 OID 17411)
-- Dependencies: 6 1340
-- Name: dropgeometrycolumn(character varying, character varying, character varying, character varying); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION dropgeometrycolumn(character varying, character varying, character varying, character varying) RETURNS text
    AS $_$
DECLARE
	catalog_name alias for $1; 
	schema_name alias for $2;
	table_name alias for $3;
	column_name alias for $4;
	myrec RECORD;
	okay boolean;
	real_schema name;

BEGIN


	-- Find, check or fix schema_name
	IF ( schema_name != '' ) THEN
		okay = 'f';

		FOR myrec IN SELECT nspname FROM pg_namespace WHERE text(nspname) = schema_name LOOP
			okay := 't';
		END LOOP;

		IF ( okay <> 't' ) THEN
			RAISE NOTICE 'Invalid schema name - using current_schema()';
			SELECT current_schema() into real_schema;
		ELSE
			real_schema = schema_name;
		END IF;
	ELSE
		SELECT current_schema() into real_schema;
	END IF;

 	-- Find out if the column is in the geometry_columns table
	okay = 'f';
	FOR myrec IN SELECT * from geometry_columns where f_table_schema = text(real_schema) and f_table_name = table_name and f_geometry_column = column_name LOOP
		okay := 't';
	END LOOP; 
	IF (okay <> 't') THEN 
		RAISE EXCEPTION 'column not found in geometry_columns table';
		RETURN 'f';
	END IF;

	-- Remove ref from geometry_columns table
	EXECUTE 'delete from geometry_columns where f_table_schema = ' ||
		quote_literal(real_schema) || ' and f_table_name = ' ||
		quote_literal(table_name)  || ' and f_geometry_column = ' ||
		quote_literal(column_name);
	
	-- Remove table column
	EXECUTE 'ALTER TABLE ' || quote_ident(real_schema) || '.' ||
		quote_ident(table_name) || ' DROP COLUMN ' ||
		quote_ident(column_name);

	RETURN real_schema || '.' || table_name || '.' || column_name ||' effectively removed.';
	
END;
$_$
    LANGUAGE plpgsql STRICT;


--
-- TOC entry 3132 (class 0 OID 0)
-- Dependencies: 521
-- Name: FUNCTION dropgeometrycolumn(character varying, character varying, character varying, character varying); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION dropgeometrycolumn(character varying, character varying, character varying, character varying) IS 'args: catalog_name, schema_name, table_name, column_name - Removes a geometry column from a spatial table.';


--
-- TOC entry 522 (class 1255 OID 17412)
-- Dependencies: 6 1340
-- Name: dropgeometrycolumn(character varying, character varying, character varying); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION dropgeometrycolumn(character varying, character varying, character varying) RETURNS text
    AS $_$
DECLARE
	ret text;
BEGIN
	SELECT DropGeometryColumn('',$1,$2,$3) into ret;
	RETURN ret;
END;
$_$
    LANGUAGE plpgsql STRICT;


--
-- TOC entry 3133 (class 0 OID 0)
-- Dependencies: 522
-- Name: FUNCTION dropgeometrycolumn(character varying, character varying, character varying); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION dropgeometrycolumn(character varying, character varying, character varying) IS 'args: schema_name, table_name, column_name - Removes a geometry column from a spatial table.';


--
-- TOC entry 523 (class 1255 OID 17413)
-- Dependencies: 6 1340
-- Name: dropgeometrycolumn(character varying, character varying); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION dropgeometrycolumn(character varying, character varying) RETURNS text
    AS $_$
DECLARE
	ret text;
BEGIN
	SELECT DropGeometryColumn('','',$1,$2) into ret;
	RETURN ret;
END;
$_$
    LANGUAGE plpgsql STRICT;


--
-- TOC entry 3134 (class 0 OID 0)
-- Dependencies: 523
-- Name: FUNCTION dropgeometrycolumn(character varying, character varying); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION dropgeometrycolumn(character varying, character varying) IS 'args: table_name, column_name - Removes a geometry column from a spatial table.';


--
-- TOC entry 524 (class 1255 OID 17414)
-- Dependencies: 6 1340
-- Name: dropgeometrytable(character varying, character varying, character varying); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION dropgeometrytable(character varying, character varying, character varying) RETURNS text
    AS $_$
DECLARE
	catalog_name alias for $1; 
	schema_name alias for $2;
	table_name alias for $3;
	real_schema name;

BEGIN

	IF ( schema_name = '' ) THEN
		SELECT current_schema() into real_schema;
	ELSE
		real_schema = schema_name;
	END IF;

	-- Remove refs from geometry_columns table
	EXECUTE 'DELETE FROM geometry_columns WHERE ' ||
		'f_table_schema = ' || quote_literal(real_schema) ||
		' AND ' ||
		' f_table_name = ' || quote_literal(table_name);
	
	-- Remove table 
	EXECUTE 'DROP TABLE '
		|| quote_ident(real_schema) || '.' ||
		quote_ident(table_name);

	RETURN
		real_schema || '.' ||
		table_name ||' dropped.';
	
END;
$_$
    LANGUAGE plpgsql STRICT;


--
-- TOC entry 3135 (class 0 OID 0)
-- Dependencies: 524
-- Name: FUNCTION dropgeometrytable(character varying, character varying, character varying); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION dropgeometrytable(character varying, character varying, character varying) IS 'args: catalog_name, schema_name, table_name - Drops a table and all its references in geometry_columns.';


--
-- TOC entry 525 (class 1255 OID 17415)
-- Dependencies: 6
-- Name: dropgeometrytable(character varying, character varying); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION dropgeometrytable(character varying, character varying) RETURNS text
    AS $_$ SELECT DropGeometryTable('',$1,$2) $_$
    LANGUAGE sql STRICT;


--
-- TOC entry 3136 (class 0 OID 0)
-- Dependencies: 525
-- Name: FUNCTION dropgeometrytable(character varying, character varying); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION dropgeometrytable(character varying, character varying) IS 'args: schema_name, table_name - Drops a table and all its references in geometry_columns.';


--
-- TOC entry 526 (class 1255 OID 17416)
-- Dependencies: 6
-- Name: dropgeometrytable(character varying); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION dropgeometrytable(character varying) RETURNS text
    AS $_$ SELECT DropGeometryTable('','',$1) $_$
    LANGUAGE sql STRICT;


--
-- TOC entry 3137 (class 0 OID 0)
-- Dependencies: 526
-- Name: FUNCTION dropgeometrytable(character varying); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION dropgeometrytable(character varying) IS 'args: table_name - Drops a table and all its references in geometry_columns.';


--
-- TOC entry 497 (class 1255 OID 17366)
-- Dependencies: 6 1217 1202
-- Name: dumprings(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION dumprings(geometry) RETURNS SETOF geometry_dump
    AS '$libdir/postgis-1.4', 'LWGEOM_dump_rings'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 878 (class 1255 OID 17801)
-- Dependencies: 1340 6
-- Name: enablelongtransactions(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION enablelongtransactions() RETURNS text
    AS $$ 
DECLARE
	"query" text;
	exists bool;
	rec RECORD;

BEGIN

	exists = 'f';
	FOR rec IN SELECT * FROM pg_class WHERE relname = 'authorization_table'
	LOOP
		exists = 't';
	END LOOP;

	IF NOT exists
	THEN
		"query" = 'CREATE TABLE authorization_table (
			toid oid, -- table oid
			rid text, -- row id
			expires timestamp,
			authid text
		)';
		EXECUTE "query";
	END IF;

	exists = 'f';
	FOR rec IN SELECT * FROM pg_class WHERE relname = 'authorized_tables'
	LOOP
		exists = 't';
	END LOOP;

	IF NOT exists THEN
		"query" = 'CREATE VIEW authorized_tables AS ' ||
			'SELECT ' ||
			'n.nspname as schema, ' ||
			'c.relname as table, trim(' ||
			quote_literal(chr(92) || '000') ||
			' from t.tgargs) as id_column ' ||
			'FROM pg_trigger t, pg_class c, pg_proc p ' ||
			', pg_namespace n ' ||
			'WHERE p.proname = ' || quote_literal('checkauthtrigger') ||
			' AND c.relnamespace = n.oid' ||
			' AND t.tgfoid = p.oid and t.tgrelid = c.oid';
		EXECUTE "query";
	END IF;

	RETURN 'Long transactions support enabled';
END;
$$
    LANGUAGE plpgsql;


--
-- TOC entry 3138 (class 0 OID 0)
-- Dependencies: 878
-- Name: FUNCTION enablelongtransactions(); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION enablelongtransactions() IS 'Enable long transaction support. This function creates the required metadata tables, needs to be called once before using the other functions in this section. Calling it twice is harmless.';


--
-- TOC entry 744 (class 1255 OID 17667)
-- Dependencies: 6 1202 1202
-- Name: endpoint(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION endpoint(geometry) RETURNS geometry
    AS '$libdir/postgis-1.4', 'LWGEOM_endpoint_linestring'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 428 (class 1255 OID 17293)
-- Dependencies: 6 1202 1202
-- Name: envelope(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION envelope(geometry) RETURNS geometry
    AS '$libdir/postgis-1.4', 'LWGEOM_envelope'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 680 (class 1255 OID 17603)
-- Dependencies: 1202 6 1202
-- Name: equals(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION equals(geometry, geometry) RETURNS boolean
    AS '$libdir/postgis-1.4', 'geomequals'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 505 (class 1255 OID 17378)
-- Dependencies: 6 1214
-- Name: estimated_extent(text, text, text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION estimated_extent(text, text, text) RETURNS box2d
    AS '$libdir/postgis-1.4', 'LWGEOM_estimated_extent'
    LANGUAGE c IMMUTABLE STRICT SECURITY DEFINER;


--
-- TOC entry 507 (class 1255 OID 17380)
-- Dependencies: 6 1214
-- Name: estimated_extent(text, text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION estimated_extent(text, text) RETURNS box2d
    AS '$libdir/postgis-1.4', 'LWGEOM_estimated_extent'
    LANGUAGE c IMMUTABLE STRICT SECURITY DEFINER;


--
-- TOC entry 422 (class 1255 OID 17287)
-- Dependencies: 6 1205 1205
-- Name: expand(box3d, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION expand(box3d, double precision) RETURNS box3d
    AS '$libdir/postgis-1.4', 'BOX3D_expand'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 424 (class 1255 OID 17289)
-- Dependencies: 6 1214 1214
-- Name: expand(box2d, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION expand(box2d, double precision) RETURNS box2d
    AS '$libdir/postgis-1.4', 'BOX2DFLOAT4_expand'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 426 (class 1255 OID 17291)
-- Dependencies: 6 1202 1202
-- Name: expand(geometry, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION expand(geometry, double precision) RETURNS geometry
    AS '$libdir/postgis-1.4', 'LWGEOM_expand'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 722 (class 1255 OID 17645)
-- Dependencies: 1202 1202 6
-- Name: exteriorring(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION exteriorring(geometry) RETURNS geometry
    AS '$libdir/postgis-1.4', 'LWGEOM_exteriorring_polygon'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 355 (class 1255 OID 17220)
-- Dependencies: 6 1211
-- Name: factor(chip); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION factor(chip) RETURNS real
    AS '$libdir/postgis-1.4', 'CHIP_getFactor'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 509 (class 1255 OID 17382)
-- Dependencies: 6 1340 1214
-- Name: find_extent(text, text, text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION find_extent(text, text, text) RETURNS box2d
    AS $_$
DECLARE
	schemaname alias for $1;
	tablename alias for $2;
	columnname alias for $3;
	myrec RECORD;

BEGIN
	FOR myrec IN EXECUTE 'SELECT extent("' || columnname || '") FROM "' || schemaname || '"."' || tablename || '"' LOOP
		return myrec.extent;
	END LOOP; 
END;
$_$
    LANGUAGE plpgsql IMMUTABLE STRICT;


--
-- TOC entry 511 (class 1255 OID 17384)
-- Dependencies: 6 1340 1214
-- Name: find_extent(text, text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION find_extent(text, text) RETURNS box2d
    AS $_$
DECLARE
	tablename alias for $1;
	columnname alias for $2;
	myrec RECORD;

BEGIN
	FOR myrec IN EXECUTE 'SELECT extent("' || columnname || '") FROM "' || tablename || '"' LOOP
		return myrec.extent;
	END LOOP; 
END;
$_$
    LANGUAGE plpgsql IMMUTABLE STRICT;


--
-- TOC entry 530 (class 1255 OID 17420)
-- Dependencies: 6 1340
-- Name: find_srid(character varying, character varying, character varying); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION find_srid(character varying, character varying, character varying) RETURNS integer
    AS $_$
DECLARE
	schem text;
	tabl text;
	sr int4;
BEGIN
	IF $1 IS NULL THEN
	  RAISE EXCEPTION 'find_srid() - schema is NULL!';
	END IF;
	IF $2 IS NULL THEN
	  RAISE EXCEPTION 'find_srid() - table name is NULL!';
	END IF;
	IF $3 IS NULL THEN
	  RAISE EXCEPTION 'find_srid() - column name is NULL!';
	END IF;
	schem = $1;
	tabl = $2;
-- if the table contains a . and the schema is empty
-- split the table into a schema and a table
-- otherwise drop through to default behavior
	IF ( schem = '' and tabl LIKE '%.%' ) THEN
	 schem = substr(tabl,1,strpos(tabl,'.')-1);
	 tabl = substr(tabl,length(schem)+2);
	ELSE
	 schem = schem || '%';
	END IF;

	select SRID into sr from geometry_columns where f_table_schema like schem and f_table_name = tabl and f_geometry_column = $3;
	IF NOT FOUND THEN
	   RAISE EXCEPTION 'find_srid() - couldnt find the corresponding SRID - is the geometry registered in the GEOMETRY_COLUMNS table?  Is there an uppercase/lowercase missmatch?';
	END IF;
	return sr;
END;
$_$
    LANGUAGE plpgsql IMMUTABLE STRICT;


--
-- TOC entry 3139 (class 0 OID 0)
-- Dependencies: 530
-- Name: FUNCTION find_srid(character varying, character varying, character varying); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION find_srid(character varying, character varying, character varying) IS 'args: a_schema_name, a_table_name, a_geomfield_name - The syntax is find_srid(<db/schema>, <table>, <column>) and the function returns the integer SRID of the specified column by searching through the GEOMETRY_COLUMNS table.';


--
-- TOC entry 514 (class 1255 OID 17403)
-- Dependencies: 6 1340
-- Name: fix_geometry_columns(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION fix_geometry_columns() RETURNS text
    AS $$
DECLARE
	mislinked record;
	result text;
	linked integer;
	deleted integer;
	foundschema integer;
BEGIN

	-- Since 7.3 schema support has been added.
	-- Previous postgis versions used to put the database name in
	-- the schema column. This needs to be fixed, so we try to 
	-- set the correct schema for each geometry_colums record
	-- looking at table, column, type and srid.
	UPDATE geometry_columns SET f_table_schema = n.nspname
		FROM pg_namespace n, pg_class c, pg_attribute a,
			pg_constraint sridcheck, pg_constraint typecheck
	        WHERE ( f_table_schema is NULL
		OR f_table_schema = ''
	        OR f_table_schema NOT IN (
	                SELECT nspname::varchar
	                FROM pg_namespace nn, pg_class cc, pg_attribute aa
	                WHERE cc.relnamespace = nn.oid
	                AND cc.relname = f_table_name::name
	                AND aa.attrelid = cc.oid
	                AND aa.attname = f_geometry_column::name))
	        AND f_table_name::name = c.relname
	        AND c.oid = a.attrelid
	        AND c.relnamespace = n.oid
	        AND f_geometry_column::name = a.attname

	        AND sridcheck.conrelid = c.oid
		AND sridcheck.consrc LIKE '(srid(% = %)'
	        AND sridcheck.consrc ~ textcat(' = ', srid::text)

	        AND typecheck.conrelid = c.oid
		AND typecheck.consrc LIKE
		'((geometrytype(%) = ''%''::text) OR (% IS NULL))'
	        AND typecheck.consrc ~ textcat(' = ''', type::text)

	        AND NOT EXISTS (
	                SELECT oid FROM geometry_columns gc
	                WHERE c.relname::varchar = gc.f_table_name
	                AND n.nspname::varchar = gc.f_table_schema
	                AND a.attname::varchar = gc.f_geometry_column
	        );

	GET DIAGNOSTICS foundschema = ROW_COUNT;

	-- no linkage to system table needed
	return 'fixed:'||foundschema::text;

END;
$$
    LANGUAGE plpgsql;


--
-- TOC entry 408 (class 1255 OID 17273)
-- Dependencies: 6 1202 1202
-- Name: force_2d(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION force_2d(geometry) RETURNS geometry
    AS '$libdir/postgis-1.4', 'LWGEOM_force_2d'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 412 (class 1255 OID 17277)
-- Dependencies: 6 1202 1202
-- Name: force_3d(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION force_3d(geometry) RETURNS geometry
    AS '$libdir/postgis-1.4', 'LWGEOM_force_3dz'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 414 (class 1255 OID 17279)
-- Dependencies: 6 1202 1202
-- Name: force_3dm(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION force_3dm(geometry) RETURNS geometry
    AS '$libdir/postgis-1.4', 'LWGEOM_force_3dm'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 410 (class 1255 OID 17275)
-- Dependencies: 6 1202 1202
-- Name: force_3dz(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION force_3dz(geometry) RETURNS geometry
    AS '$libdir/postgis-1.4', 'LWGEOM_force_3dz'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 416 (class 1255 OID 17281)
-- Dependencies: 6 1202 1202
-- Name: force_4d(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION force_4d(geometry) RETURNS geometry
    AS '$libdir/postgis-1.4', 'LWGEOM_force_4d'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 418 (class 1255 OID 17283)
-- Dependencies: 6 1202 1202
-- Name: force_collection(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION force_collection(geometry) RETURNS geometry
    AS '$libdir/postgis-1.4', 'LWGEOM_force_collection'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 432 (class 1255 OID 17297)
-- Dependencies: 6 1202 1202
-- Name: forcerhr(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION forcerhr(geometry) RETURNS geometry
    AS '$libdir/postgis-1.4', 'LWGEOM_forceRHR_poly'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 130 (class 1255 OID 16775)
-- Dependencies: 6
-- Name: gbt_bit_compress(internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION gbt_bit_compress(internal) RETURNS internal
    AS '$libdir/btree_gist', 'gbt_bit_compress'
    LANGUAGE c IMMUTABLE;


--
-- TOC entry 129 (class 1255 OID 16774)
-- Dependencies: 6
-- Name: gbt_bit_consistent(internal, bit, smallint); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION gbt_bit_consistent(internal, bit, smallint) RETURNS boolean
    AS '$libdir/btree_gist', 'gbt_bit_consistent'
    LANGUAGE c IMMUTABLE;


--
-- TOC entry 131 (class 1255 OID 16776)
-- Dependencies: 6
-- Name: gbt_bit_penalty(internal, internal, internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION gbt_bit_penalty(internal, internal, internal) RETURNS internal
    AS '$libdir/btree_gist', 'gbt_bit_penalty'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 132 (class 1255 OID 16777)
-- Dependencies: 6
-- Name: gbt_bit_picksplit(internal, internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION gbt_bit_picksplit(internal, internal) RETURNS internal
    AS '$libdir/btree_gist', 'gbt_bit_picksplit'
    LANGUAGE c IMMUTABLE;


--
-- TOC entry 134 (class 1255 OID 16779)
-- Dependencies: 6
-- Name: gbt_bit_same(internal, internal, internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION gbt_bit_same(internal, internal, internal) RETURNS internal
    AS '$libdir/btree_gist', 'gbt_bit_same'
    LANGUAGE c IMMUTABLE;


--
-- TOC entry 133 (class 1255 OID 16778)
-- Dependencies: 6 1183
-- Name: gbt_bit_union(bytea, internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION gbt_bit_union(bytea, internal) RETURNS gbtreekey_var
    AS '$libdir/btree_gist', 'gbt_bit_union'
    LANGUAGE c IMMUTABLE;


--
-- TOC entry 112 (class 1255 OID 16701)
-- Dependencies: 6
-- Name: gbt_bpchar_compress(internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION gbt_bpchar_compress(internal) RETURNS internal
    AS '$libdir/btree_gist', 'gbt_bpchar_compress'
    LANGUAGE c IMMUTABLE;


--
-- TOC entry 110 (class 1255 OID 16699)
-- Dependencies: 6
-- Name: gbt_bpchar_consistent(internal, character, smallint); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION gbt_bpchar_consistent(internal, character, smallint) RETURNS boolean
    AS '$libdir/btree_gist', 'gbt_bpchar_consistent'
    LANGUAGE c IMMUTABLE;


--
-- TOC entry 118 (class 1255 OID 16735)
-- Dependencies: 6
-- Name: gbt_bytea_compress(internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION gbt_bytea_compress(internal) RETURNS internal
    AS '$libdir/btree_gist', 'gbt_bytea_compress'
    LANGUAGE c IMMUTABLE;


--
-- TOC entry 117 (class 1255 OID 16734)
-- Dependencies: 6
-- Name: gbt_bytea_consistent(internal, bytea, smallint); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION gbt_bytea_consistent(internal, bytea, smallint) RETURNS boolean
    AS '$libdir/btree_gist', 'gbt_bytea_consistent'
    LANGUAGE c IMMUTABLE;


--
-- TOC entry 119 (class 1255 OID 16736)
-- Dependencies: 6
-- Name: gbt_bytea_penalty(internal, internal, internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION gbt_bytea_penalty(internal, internal, internal) RETURNS internal
    AS '$libdir/btree_gist', 'gbt_bytea_penalty'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 120 (class 1255 OID 16737)
-- Dependencies: 6
-- Name: gbt_bytea_picksplit(internal, internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION gbt_bytea_picksplit(internal, internal) RETURNS internal
    AS '$libdir/btree_gist', 'gbt_bytea_picksplit'
    LANGUAGE c IMMUTABLE;


--
-- TOC entry 122 (class 1255 OID 16739)
-- Dependencies: 6
-- Name: gbt_bytea_same(internal, internal, internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION gbt_bytea_same(internal, internal, internal) RETURNS internal
    AS '$libdir/btree_gist', 'gbt_bytea_same'
    LANGUAGE c IMMUTABLE;


--
-- TOC entry 121 (class 1255 OID 16738)
-- Dependencies: 6 1183
-- Name: gbt_bytea_union(bytea, internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION gbt_bytea_union(bytea, internal) RETURNS gbtreekey_var
    AS '$libdir/btree_gist', 'gbt_bytea_union'
    LANGUAGE c IMMUTABLE;


--
-- TOC entry 98 (class 1255 OID 16659)
-- Dependencies: 6
-- Name: gbt_cash_compress(internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION gbt_cash_compress(internal) RETURNS internal
    AS '$libdir/btree_gist', 'gbt_cash_compress'
    LANGUAGE c IMMUTABLE;


--
-- TOC entry 97 (class 1255 OID 16658)
-- Dependencies: 6
-- Name: gbt_cash_consistent(internal, money, smallint); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION gbt_cash_consistent(internal, money, smallint) RETURNS boolean
    AS '$libdir/btree_gist', 'gbt_cash_consistent'
    LANGUAGE c IMMUTABLE;


--
-- TOC entry 99 (class 1255 OID 16660)
-- Dependencies: 6
-- Name: gbt_cash_penalty(internal, internal, internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION gbt_cash_penalty(internal, internal, internal) RETURNS internal
    AS '$libdir/btree_gist', 'gbt_cash_penalty'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 100 (class 1255 OID 16661)
-- Dependencies: 6
-- Name: gbt_cash_picksplit(internal, internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION gbt_cash_picksplit(internal, internal) RETURNS internal
    AS '$libdir/btree_gist', 'gbt_cash_picksplit'
    LANGUAGE c IMMUTABLE;


--
-- TOC entry 102 (class 1255 OID 16663)
-- Dependencies: 6
-- Name: gbt_cash_same(internal, internal, internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION gbt_cash_same(internal, internal, internal) RETURNS internal
    AS '$libdir/btree_gist', 'gbt_cash_same'
    LANGUAGE c IMMUTABLE;


--
-- TOC entry 101 (class 1255 OID 16662)
-- Dependencies: 1174 6
-- Name: gbt_cash_union(bytea, internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION gbt_cash_union(bytea, internal) RETURNS gbtreekey8
    AS '$libdir/btree_gist', 'gbt_cash_union'
    LANGUAGE c IMMUTABLE;


--
-- TOC entry 85 (class 1255 OID 16618)
-- Dependencies: 6
-- Name: gbt_date_compress(internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION gbt_date_compress(internal) RETURNS internal
    AS '$libdir/btree_gist', 'gbt_date_compress'
    LANGUAGE c IMMUTABLE;


--
-- TOC entry 84 (class 1255 OID 16617)
-- Dependencies: 6
-- Name: gbt_date_consistent(internal, date, smallint); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION gbt_date_consistent(internal, date, smallint) RETURNS boolean
    AS '$libdir/btree_gist', 'gbt_date_consistent'
    LANGUAGE c IMMUTABLE;


--
-- TOC entry 86 (class 1255 OID 16619)
-- Dependencies: 6
-- Name: gbt_date_penalty(internal, internal, internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION gbt_date_penalty(internal, internal, internal) RETURNS internal
    AS '$libdir/btree_gist', 'gbt_date_penalty'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 87 (class 1255 OID 16620)
-- Dependencies: 6
-- Name: gbt_date_picksplit(internal, internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION gbt_date_picksplit(internal, internal) RETURNS internal
    AS '$libdir/btree_gist', 'gbt_date_picksplit'
    LANGUAGE c IMMUTABLE;


--
-- TOC entry 89 (class 1255 OID 16622)
-- Dependencies: 6
-- Name: gbt_date_same(internal, internal, internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION gbt_date_same(internal, internal, internal) RETURNS internal
    AS '$libdir/btree_gist', 'gbt_date_same'
    LANGUAGE c IMMUTABLE;


--
-- TOC entry 88 (class 1255 OID 16621)
-- Dependencies: 6 1174
-- Name: gbt_date_union(bytea, internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION gbt_date_union(bytea, internal) RETURNS gbtreekey8
    AS '$libdir/btree_gist', 'gbt_date_union'
    LANGUAGE c IMMUTABLE;


--
-- TOC entry 32 (class 1255 OID 16425)
-- Dependencies: 6
-- Name: gbt_decompress(internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION gbt_decompress(internal) RETURNS internal
    AS '$libdir/btree_gist', 'gbt_decompress'
    LANGUAGE c IMMUTABLE;


--
-- TOC entry 57 (class 1255 OID 16506)
-- Dependencies: 6
-- Name: gbt_float4_compress(internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION gbt_float4_compress(internal) RETURNS internal
    AS '$libdir/btree_gist', 'gbt_float4_compress'
    LANGUAGE c IMMUTABLE;


--
-- TOC entry 56 (class 1255 OID 16505)
-- Dependencies: 6
-- Name: gbt_float4_consistent(internal, real, smallint); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION gbt_float4_consistent(internal, real, smallint) RETURNS boolean
    AS '$libdir/btree_gist', 'gbt_float4_consistent'
    LANGUAGE c IMMUTABLE;


--
-- TOC entry 58 (class 1255 OID 16507)
-- Dependencies: 6
-- Name: gbt_float4_penalty(internal, internal, internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION gbt_float4_penalty(internal, internal, internal) RETURNS internal
    AS '$libdir/btree_gist', 'gbt_float4_penalty'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 59 (class 1255 OID 16508)
-- Dependencies: 6
-- Name: gbt_float4_picksplit(internal, internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION gbt_float4_picksplit(internal, internal) RETURNS internal
    AS '$libdir/btree_gist', 'gbt_float4_picksplit'
    LANGUAGE c IMMUTABLE;


--
-- TOC entry 61 (class 1255 OID 16510)
-- Dependencies: 6
-- Name: gbt_float4_same(internal, internal, internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION gbt_float4_same(internal, internal, internal) RETURNS internal
    AS '$libdir/btree_gist', 'gbt_float4_same'
    LANGUAGE c IMMUTABLE;


--
-- TOC entry 60 (class 1255 OID 16509)
-- Dependencies: 1174 6
-- Name: gbt_float4_union(bytea, internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION gbt_float4_union(bytea, internal) RETURNS gbtreekey8
    AS '$libdir/btree_gist', 'gbt_float4_union'
    LANGUAGE c IMMUTABLE;


--
-- TOC entry 63 (class 1255 OID 16526)
-- Dependencies: 6
-- Name: gbt_float8_compress(internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION gbt_float8_compress(internal) RETURNS internal
    AS '$libdir/btree_gist', 'gbt_float8_compress'
    LANGUAGE c IMMUTABLE;


--
-- TOC entry 62 (class 1255 OID 16525)
-- Dependencies: 6
-- Name: gbt_float8_consistent(internal, double precision, smallint); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION gbt_float8_consistent(internal, double precision, smallint) RETURNS boolean
    AS '$libdir/btree_gist', 'gbt_float8_consistent'
    LANGUAGE c IMMUTABLE;


--
-- TOC entry 64 (class 1255 OID 16527)
-- Dependencies: 6
-- Name: gbt_float8_penalty(internal, internal, internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION gbt_float8_penalty(internal, internal, internal) RETURNS internal
    AS '$libdir/btree_gist', 'gbt_float8_penalty'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 65 (class 1255 OID 16528)
-- Dependencies: 6
-- Name: gbt_float8_picksplit(internal, internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION gbt_float8_picksplit(internal, internal) RETURNS internal
    AS '$libdir/btree_gist', 'gbt_float8_picksplit'
    LANGUAGE c IMMUTABLE;


--
-- TOC entry 67 (class 1255 OID 16530)
-- Dependencies: 6
-- Name: gbt_float8_same(internal, internal, internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION gbt_float8_same(internal, internal, internal) RETURNS internal
    AS '$libdir/btree_gist', 'gbt_float8_same'
    LANGUAGE c IMMUTABLE;


--
-- TOC entry 66 (class 1255 OID 16529)
-- Dependencies: 1177 6
-- Name: gbt_float8_union(bytea, internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION gbt_float8_union(bytea, internal) RETURNS gbtreekey16
    AS '$libdir/btree_gist', 'gbt_float8_union'
    LANGUAGE c IMMUTABLE;


--
-- TOC entry 136 (class 1255 OID 16809)
-- Dependencies: 6
-- Name: gbt_inet_compress(internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION gbt_inet_compress(internal) RETURNS internal
    AS '$libdir/btree_gist', 'gbt_inet_compress'
    LANGUAGE c IMMUTABLE;


--
-- TOC entry 135 (class 1255 OID 16808)
-- Dependencies: 6
-- Name: gbt_inet_consistent(internal, inet, smallint); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION gbt_inet_consistent(internal, inet, smallint) RETURNS boolean
    AS '$libdir/btree_gist', 'gbt_inet_consistent'
    LANGUAGE c IMMUTABLE;


--
-- TOC entry 137 (class 1255 OID 16810)
-- Dependencies: 6
-- Name: gbt_inet_penalty(internal, internal, internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION gbt_inet_penalty(internal, internal, internal) RETURNS internal
    AS '$libdir/btree_gist', 'gbt_inet_penalty'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 138 (class 1255 OID 16811)
-- Dependencies: 6
-- Name: gbt_inet_picksplit(internal, internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION gbt_inet_picksplit(internal, internal) RETURNS internal
    AS '$libdir/btree_gist', 'gbt_inet_picksplit'
    LANGUAGE c IMMUTABLE;


--
-- TOC entry 140 (class 1255 OID 16813)
-- Dependencies: 6
-- Name: gbt_inet_same(internal, internal, internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION gbt_inet_same(internal, internal, internal) RETURNS internal
    AS '$libdir/btree_gist', 'gbt_inet_same'
    LANGUAGE c IMMUTABLE;


--
-- TOC entry 139 (class 1255 OID 16812)
-- Dependencies: 6 1177
-- Name: gbt_inet_union(bytea, internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION gbt_inet_union(bytea, internal) RETURNS gbtreekey16
    AS '$libdir/btree_gist', 'gbt_inet_union'
    LANGUAGE c IMMUTABLE;


--
-- TOC entry 39 (class 1255 OID 16446)
-- Dependencies: 6
-- Name: gbt_int2_compress(internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION gbt_int2_compress(internal) RETURNS internal
    AS '$libdir/btree_gist', 'gbt_int2_compress'
    LANGUAGE c IMMUTABLE;


--
-- TOC entry 38 (class 1255 OID 16445)
-- Dependencies: 6
-- Name: gbt_int2_consistent(internal, smallint, smallint); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION gbt_int2_consistent(internal, smallint, smallint) RETURNS boolean
    AS '$libdir/btree_gist', 'gbt_int2_consistent'
    LANGUAGE c IMMUTABLE;


--
-- TOC entry 40 (class 1255 OID 16447)
-- Dependencies: 6
-- Name: gbt_int2_penalty(internal, internal, internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION gbt_int2_penalty(internal, internal, internal) RETURNS internal
    AS '$libdir/btree_gist', 'gbt_int2_penalty'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 41 (class 1255 OID 16448)
-- Dependencies: 6
-- Name: gbt_int2_picksplit(internal, internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION gbt_int2_picksplit(internal, internal) RETURNS internal
    AS '$libdir/btree_gist', 'gbt_int2_picksplit'
    LANGUAGE c IMMUTABLE;


--
-- TOC entry 43 (class 1255 OID 16450)
-- Dependencies: 6
-- Name: gbt_int2_same(internal, internal, internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION gbt_int2_same(internal, internal, internal) RETURNS internal
    AS '$libdir/btree_gist', 'gbt_int2_same'
    LANGUAGE c IMMUTABLE;


--
-- TOC entry 42 (class 1255 OID 16449)
-- Dependencies: 6 1135
-- Name: gbt_int2_union(bytea, internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION gbt_int2_union(bytea, internal) RETURNS gbtreekey4
    AS '$libdir/btree_gist', 'gbt_int2_union'
    LANGUAGE c IMMUTABLE;


--
-- TOC entry 45 (class 1255 OID 16466)
-- Dependencies: 6
-- Name: gbt_int4_compress(internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION gbt_int4_compress(internal) RETURNS internal
    AS '$libdir/btree_gist', 'gbt_int4_compress'
    LANGUAGE c IMMUTABLE;


--
-- TOC entry 44 (class 1255 OID 16465)
-- Dependencies: 6
-- Name: gbt_int4_consistent(internal, integer, smallint); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION gbt_int4_consistent(internal, integer, smallint) RETURNS boolean
    AS '$libdir/btree_gist', 'gbt_int4_consistent'
    LANGUAGE c IMMUTABLE;


--
-- TOC entry 46 (class 1255 OID 16467)
-- Dependencies: 6
-- Name: gbt_int4_penalty(internal, internal, internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION gbt_int4_penalty(internal, internal, internal) RETURNS internal
    AS '$libdir/btree_gist', 'gbt_int4_penalty'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 47 (class 1255 OID 16468)
-- Dependencies: 6
-- Name: gbt_int4_picksplit(internal, internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION gbt_int4_picksplit(internal, internal) RETURNS internal
    AS '$libdir/btree_gist', 'gbt_int4_picksplit'
    LANGUAGE c IMMUTABLE;


--
-- TOC entry 49 (class 1255 OID 16470)
-- Dependencies: 6
-- Name: gbt_int4_same(internal, internal, internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION gbt_int4_same(internal, internal, internal) RETURNS internal
    AS '$libdir/btree_gist', 'gbt_int4_same'
    LANGUAGE c IMMUTABLE;


--
-- TOC entry 48 (class 1255 OID 16469)
-- Dependencies: 1174 6
-- Name: gbt_int4_union(bytea, internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION gbt_int4_union(bytea, internal) RETURNS gbtreekey8
    AS '$libdir/btree_gist', 'gbt_int4_union'
    LANGUAGE c IMMUTABLE;


--
-- TOC entry 51 (class 1255 OID 16486)
-- Dependencies: 6
-- Name: gbt_int8_compress(internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION gbt_int8_compress(internal) RETURNS internal
    AS '$libdir/btree_gist', 'gbt_int8_compress'
    LANGUAGE c IMMUTABLE;


--
-- TOC entry 50 (class 1255 OID 16485)
-- Dependencies: 6
-- Name: gbt_int8_consistent(internal, bigint, smallint); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION gbt_int8_consistent(internal, bigint, smallint) RETURNS boolean
    AS '$libdir/btree_gist', 'gbt_int8_consistent'
    LANGUAGE c IMMUTABLE;


--
-- TOC entry 52 (class 1255 OID 16487)
-- Dependencies: 6
-- Name: gbt_int8_penalty(internal, internal, internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION gbt_int8_penalty(internal, internal, internal) RETURNS internal
    AS '$libdir/btree_gist', 'gbt_int8_penalty'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 53 (class 1255 OID 16488)
-- Dependencies: 6
-- Name: gbt_int8_picksplit(internal, internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION gbt_int8_picksplit(internal, internal) RETURNS internal
    AS '$libdir/btree_gist', 'gbt_int8_picksplit'
    LANGUAGE c IMMUTABLE;


--
-- TOC entry 55 (class 1255 OID 16490)
-- Dependencies: 6
-- Name: gbt_int8_same(internal, internal, internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION gbt_int8_same(internal, internal, internal) RETURNS internal
    AS '$libdir/btree_gist', 'gbt_int8_same'
    LANGUAGE c IMMUTABLE;


--
-- TOC entry 54 (class 1255 OID 16489)
-- Dependencies: 1177 6
-- Name: gbt_int8_union(bytea, internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION gbt_int8_union(bytea, internal) RETURNS gbtreekey16
    AS '$libdir/btree_gist', 'gbt_int8_union'
    LANGUAGE c IMMUTABLE;


--
-- TOC entry 91 (class 1255 OID 16638)
-- Dependencies: 6
-- Name: gbt_intv_compress(internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION gbt_intv_compress(internal) RETURNS internal
    AS '$libdir/btree_gist', 'gbt_intv_compress'
    LANGUAGE c IMMUTABLE;


--
-- TOC entry 90 (class 1255 OID 16637)
-- Dependencies: 6
-- Name: gbt_intv_consistent(internal, interval, smallint); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION gbt_intv_consistent(internal, interval, smallint) RETURNS boolean
    AS '$libdir/btree_gist', 'gbt_intv_consistent'
    LANGUAGE c IMMUTABLE;


--
-- TOC entry 92 (class 1255 OID 16639)
-- Dependencies: 6
-- Name: gbt_intv_decompress(internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION gbt_intv_decompress(internal) RETURNS internal
    AS '$libdir/btree_gist', 'gbt_intv_decompress'
    LANGUAGE c IMMUTABLE;


--
-- TOC entry 93 (class 1255 OID 16640)
-- Dependencies: 6
-- Name: gbt_intv_penalty(internal, internal, internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION gbt_intv_penalty(internal, internal, internal) RETURNS internal
    AS '$libdir/btree_gist', 'gbt_intv_penalty'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 94 (class 1255 OID 16641)
-- Dependencies: 6
-- Name: gbt_intv_picksplit(internal, internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION gbt_intv_picksplit(internal, internal) RETURNS internal
    AS '$libdir/btree_gist', 'gbt_intv_picksplit'
    LANGUAGE c IMMUTABLE;


--
-- TOC entry 96 (class 1255 OID 16643)
-- Dependencies: 6
-- Name: gbt_intv_same(internal, internal, internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION gbt_intv_same(internal, internal, internal) RETURNS internal
    AS '$libdir/btree_gist', 'gbt_intv_same'
    LANGUAGE c IMMUTABLE;


--
-- TOC entry 95 (class 1255 OID 16642)
-- Dependencies: 1180 6
-- Name: gbt_intv_union(bytea, internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION gbt_intv_union(bytea, internal) RETURNS gbtreekey32
    AS '$libdir/btree_gist', 'gbt_intv_union'
    LANGUAGE c IMMUTABLE;


--
-- TOC entry 104 (class 1255 OID 16679)
-- Dependencies: 6
-- Name: gbt_macad_compress(internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION gbt_macad_compress(internal) RETURNS internal
    AS '$libdir/btree_gist', 'gbt_macad_compress'
    LANGUAGE c IMMUTABLE;


--
-- TOC entry 103 (class 1255 OID 16678)
-- Dependencies: 6
-- Name: gbt_macad_consistent(internal, macaddr, smallint); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION gbt_macad_consistent(internal, macaddr, smallint) RETURNS boolean
    AS '$libdir/btree_gist', 'gbt_macad_consistent'
    LANGUAGE c IMMUTABLE;


--
-- TOC entry 105 (class 1255 OID 16680)
-- Dependencies: 6
-- Name: gbt_macad_penalty(internal, internal, internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION gbt_macad_penalty(internal, internal, internal) RETURNS internal
    AS '$libdir/btree_gist', 'gbt_macad_penalty'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 106 (class 1255 OID 16681)
-- Dependencies: 6
-- Name: gbt_macad_picksplit(internal, internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION gbt_macad_picksplit(internal, internal) RETURNS internal
    AS '$libdir/btree_gist', 'gbt_macad_picksplit'
    LANGUAGE c IMMUTABLE;


--
-- TOC entry 108 (class 1255 OID 16683)
-- Dependencies: 6
-- Name: gbt_macad_same(internal, internal, internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION gbt_macad_same(internal, internal, internal) RETURNS internal
    AS '$libdir/btree_gist', 'gbt_macad_same'
    LANGUAGE c IMMUTABLE;


--
-- TOC entry 107 (class 1255 OID 16682)
-- Dependencies: 6 1177
-- Name: gbt_macad_union(bytea, internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION gbt_macad_union(bytea, internal) RETURNS gbtreekey16
    AS '$libdir/btree_gist', 'gbt_macad_union'
    LANGUAGE c IMMUTABLE;


--
-- TOC entry 124 (class 1255 OID 16755)
-- Dependencies: 6
-- Name: gbt_numeric_compress(internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION gbt_numeric_compress(internal) RETURNS internal
    AS '$libdir/btree_gist', 'gbt_numeric_compress'
    LANGUAGE c IMMUTABLE;


--
-- TOC entry 123 (class 1255 OID 16754)
-- Dependencies: 6
-- Name: gbt_numeric_consistent(internal, numeric, smallint); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION gbt_numeric_consistent(internal, numeric, smallint) RETURNS boolean
    AS '$libdir/btree_gist', 'gbt_numeric_consistent'
    LANGUAGE c IMMUTABLE;


--
-- TOC entry 125 (class 1255 OID 16756)
-- Dependencies: 6
-- Name: gbt_numeric_penalty(internal, internal, internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION gbt_numeric_penalty(internal, internal, internal) RETURNS internal
    AS '$libdir/btree_gist', 'gbt_numeric_penalty'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 126 (class 1255 OID 16757)
-- Dependencies: 6
-- Name: gbt_numeric_picksplit(internal, internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION gbt_numeric_picksplit(internal, internal) RETURNS internal
    AS '$libdir/btree_gist', 'gbt_numeric_picksplit'
    LANGUAGE c IMMUTABLE;


--
-- TOC entry 128 (class 1255 OID 16759)
-- Dependencies: 6
-- Name: gbt_numeric_same(internal, internal, internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION gbt_numeric_same(internal, internal, internal) RETURNS internal
    AS '$libdir/btree_gist', 'gbt_numeric_same'
    LANGUAGE c IMMUTABLE;


--
-- TOC entry 127 (class 1255 OID 16758)
-- Dependencies: 1183 6
-- Name: gbt_numeric_union(bytea, internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION gbt_numeric_union(bytea, internal) RETURNS gbtreekey_var
    AS '$libdir/btree_gist', 'gbt_numeric_union'
    LANGUAGE c IMMUTABLE;


--
-- TOC entry 31 (class 1255 OID 16424)
-- Dependencies: 6
-- Name: gbt_oid_compress(internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION gbt_oid_compress(internal) RETURNS internal
    AS '$libdir/btree_gist', 'gbt_oid_compress'
    LANGUAGE c IMMUTABLE;


--
-- TOC entry 30 (class 1255 OID 16423)
-- Dependencies: 6
-- Name: gbt_oid_consistent(internal, oid, smallint); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION gbt_oid_consistent(internal, oid, smallint) RETURNS boolean
    AS '$libdir/btree_gist', 'gbt_oid_consistent'
    LANGUAGE c IMMUTABLE;


--
-- TOC entry 34 (class 1255 OID 16427)
-- Dependencies: 6
-- Name: gbt_oid_penalty(internal, internal, internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION gbt_oid_penalty(internal, internal, internal) RETURNS internal
    AS '$libdir/btree_gist', 'gbt_oid_penalty'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 35 (class 1255 OID 16428)
-- Dependencies: 6
-- Name: gbt_oid_picksplit(internal, internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION gbt_oid_picksplit(internal, internal) RETURNS internal
    AS '$libdir/btree_gist', 'gbt_oid_picksplit'
    LANGUAGE c IMMUTABLE;


--
-- TOC entry 37 (class 1255 OID 16430)
-- Dependencies: 6
-- Name: gbt_oid_same(internal, internal, internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION gbt_oid_same(internal, internal, internal) RETURNS internal
    AS '$libdir/btree_gist', 'gbt_oid_same'
    LANGUAGE c IMMUTABLE;


--
-- TOC entry 36 (class 1255 OID 16429)
-- Dependencies: 6 1174
-- Name: gbt_oid_union(bytea, internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION gbt_oid_union(bytea, internal) RETURNS gbtreekey8
    AS '$libdir/btree_gist', 'gbt_oid_union'
    LANGUAGE c IMMUTABLE;


--
-- TOC entry 111 (class 1255 OID 16700)
-- Dependencies: 6
-- Name: gbt_text_compress(internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION gbt_text_compress(internal) RETURNS internal
    AS '$libdir/btree_gist', 'gbt_text_compress'
    LANGUAGE c IMMUTABLE;


--
-- TOC entry 109 (class 1255 OID 16698)
-- Dependencies: 6
-- Name: gbt_text_consistent(internal, text, smallint); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION gbt_text_consistent(internal, text, smallint) RETURNS boolean
    AS '$libdir/btree_gist', 'gbt_text_consistent'
    LANGUAGE c IMMUTABLE;


--
-- TOC entry 113 (class 1255 OID 16702)
-- Dependencies: 6
-- Name: gbt_text_penalty(internal, internal, internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION gbt_text_penalty(internal, internal, internal) RETURNS internal
    AS '$libdir/btree_gist', 'gbt_text_penalty'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 114 (class 1255 OID 16703)
-- Dependencies: 6
-- Name: gbt_text_picksplit(internal, internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION gbt_text_picksplit(internal, internal) RETURNS internal
    AS '$libdir/btree_gist', 'gbt_text_picksplit'
    LANGUAGE c IMMUTABLE;


--
-- TOC entry 116 (class 1255 OID 16705)
-- Dependencies: 6
-- Name: gbt_text_same(internal, internal, internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION gbt_text_same(internal, internal, internal) RETURNS internal
    AS '$libdir/btree_gist', 'gbt_text_same'
    LANGUAGE c IMMUTABLE;


--
-- TOC entry 115 (class 1255 OID 16704)
-- Dependencies: 1183 6
-- Name: gbt_text_union(bytea, internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION gbt_text_union(bytea, internal) RETURNS gbtreekey_var
    AS '$libdir/btree_gist', 'gbt_text_union'
    LANGUAGE c IMMUTABLE;


--
-- TOC entry 78 (class 1255 OID 16583)
-- Dependencies: 6
-- Name: gbt_time_compress(internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION gbt_time_compress(internal) RETURNS internal
    AS '$libdir/btree_gist', 'gbt_time_compress'
    LANGUAGE c IMMUTABLE;


--
-- TOC entry 76 (class 1255 OID 16581)
-- Dependencies: 6
-- Name: gbt_time_consistent(internal, time without time zone, smallint); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION gbt_time_consistent(internal, time without time zone, smallint) RETURNS boolean
    AS '$libdir/btree_gist', 'gbt_time_consistent'
    LANGUAGE c IMMUTABLE;


--
-- TOC entry 80 (class 1255 OID 16585)
-- Dependencies: 6
-- Name: gbt_time_penalty(internal, internal, internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION gbt_time_penalty(internal, internal, internal) RETURNS internal
    AS '$libdir/btree_gist', 'gbt_time_penalty'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 81 (class 1255 OID 16586)
-- Dependencies: 6
-- Name: gbt_time_picksplit(internal, internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION gbt_time_picksplit(internal, internal) RETURNS internal
    AS '$libdir/btree_gist', 'gbt_time_picksplit'
    LANGUAGE c IMMUTABLE;


--
-- TOC entry 83 (class 1255 OID 16588)
-- Dependencies: 6
-- Name: gbt_time_same(internal, internal, internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION gbt_time_same(internal, internal, internal) RETURNS internal
    AS '$libdir/btree_gist', 'gbt_time_same'
    LANGUAGE c IMMUTABLE;


--
-- TOC entry 82 (class 1255 OID 16587)
-- Dependencies: 1177 6
-- Name: gbt_time_union(bytea, internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION gbt_time_union(bytea, internal) RETURNS gbtreekey16
    AS '$libdir/btree_gist', 'gbt_time_union'
    LANGUAGE c IMMUTABLE;


--
-- TOC entry 79 (class 1255 OID 16584)
-- Dependencies: 6
-- Name: gbt_timetz_compress(internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION gbt_timetz_compress(internal) RETURNS internal
    AS '$libdir/btree_gist', 'gbt_timetz_compress'
    LANGUAGE c IMMUTABLE;


--
-- TOC entry 77 (class 1255 OID 16582)
-- Dependencies: 6
-- Name: gbt_timetz_consistent(internal, time with time zone, smallint); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION gbt_timetz_consistent(internal, time with time zone, smallint) RETURNS boolean
    AS '$libdir/btree_gist', 'gbt_timetz_consistent'
    LANGUAGE c IMMUTABLE;


--
-- TOC entry 70 (class 1255 OID 16547)
-- Dependencies: 6
-- Name: gbt_ts_compress(internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION gbt_ts_compress(internal) RETURNS internal
    AS '$libdir/btree_gist', 'gbt_ts_compress'
    LANGUAGE c IMMUTABLE;


--
-- TOC entry 68 (class 1255 OID 16545)
-- Dependencies: 6
-- Name: gbt_ts_consistent(internal, timestamp without time zone, smallint); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION gbt_ts_consistent(internal, timestamp without time zone, smallint) RETURNS boolean
    AS '$libdir/btree_gist', 'gbt_ts_consistent'
    LANGUAGE c IMMUTABLE;


--
-- TOC entry 72 (class 1255 OID 16549)
-- Dependencies: 6
-- Name: gbt_ts_penalty(internal, internal, internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION gbt_ts_penalty(internal, internal, internal) RETURNS internal
    AS '$libdir/btree_gist', 'gbt_ts_penalty'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 73 (class 1255 OID 16550)
-- Dependencies: 6
-- Name: gbt_ts_picksplit(internal, internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION gbt_ts_picksplit(internal, internal) RETURNS internal
    AS '$libdir/btree_gist', 'gbt_ts_picksplit'
    LANGUAGE c IMMUTABLE;


--
-- TOC entry 75 (class 1255 OID 16552)
-- Dependencies: 6
-- Name: gbt_ts_same(internal, internal, internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION gbt_ts_same(internal, internal, internal) RETURNS internal
    AS '$libdir/btree_gist', 'gbt_ts_same'
    LANGUAGE c IMMUTABLE;


--
-- TOC entry 74 (class 1255 OID 16551)
-- Dependencies: 6 1177
-- Name: gbt_ts_union(bytea, internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION gbt_ts_union(bytea, internal) RETURNS gbtreekey16
    AS '$libdir/btree_gist', 'gbt_ts_union'
    LANGUAGE c IMMUTABLE;


--
-- TOC entry 71 (class 1255 OID 16548)
-- Dependencies: 6
-- Name: gbt_tstz_compress(internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION gbt_tstz_compress(internal) RETURNS internal
    AS '$libdir/btree_gist', 'gbt_tstz_compress'
    LANGUAGE c IMMUTABLE;


--
-- TOC entry 69 (class 1255 OID 16546)
-- Dependencies: 6
-- Name: gbt_tstz_consistent(internal, timestamp with time zone, smallint); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION gbt_tstz_consistent(internal, timestamp with time zone, smallint) RETURNS boolean
    AS '$libdir/btree_gist', 'gbt_tstz_consistent'
    LANGUAGE c IMMUTABLE;


--
-- TOC entry 33 (class 1255 OID 16426)
-- Dependencies: 6
-- Name: gbt_var_decompress(internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION gbt_var_decompress(internal) RETURNS internal
    AS '$libdir/btree_gist', 'gbt_var_decompress'
    LANGUAGE c IMMUTABLE;


--
-- TOC entry 621 (class 1255 OID 17529)
-- Dependencies: 6 1204 1204 1202
-- Name: geom_accum(geometry[], geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION geom_accum(geometry[], geometry) RETURNS geometry[]
    AS '$libdir/postgis-1.4', 'LWGEOM_accum'
    LANGUAGE c IMMUTABLE;


--
-- TOC entry 809 (class 1255 OID 17732)
-- Dependencies: 1202 6
-- Name: geomcollfromtext(text, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION geomcollfromtext(text, integer) RETURNS geometry
    AS $_$
	SELECT CASE
	WHEN geometrytype(GeomFromText($1, $2)) = 'GEOMETRYCOLLECTION'
	THEN GeomFromText($1,$2)
	ELSE NULL END
	$_$
    LANGUAGE sql IMMUTABLE STRICT;


--
-- TOC entry 811 (class 1255 OID 17734)
-- Dependencies: 1202 6
-- Name: geomcollfromtext(text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION geomcollfromtext(text) RETURNS geometry
    AS $_$
	SELECT CASE
	WHEN geometrytype(GeomFromText($1)) = 'GEOMETRYCOLLECTION'
	THEN GeomFromText($1)
	ELSE NULL END
	$_$
    LANGUAGE sql IMMUTABLE STRICT;


--
-- TOC entry 860 (class 1255 OID 17783)
-- Dependencies: 6 1202
-- Name: geomcollfromwkb(bytea, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION geomcollfromwkb(bytea, integer) RETURNS geometry
    AS $_$
	SELECT CASE
	WHEN geometrytype(GeomFromWKB($1, $2)) = 'GEOMETRYCOLLECTION'
	THEN GeomFromWKB($1, $2)
	ELSE NULL END
	$_$
    LANGUAGE sql IMMUTABLE STRICT;


--
-- TOC entry 862 (class 1255 OID 17785)
-- Dependencies: 1202 6
-- Name: geomcollfromwkb(bytea); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION geomcollfromwkb(bytea) RETURNS geometry
    AS $_$
	SELECT CASE
	WHEN geometrytype(GeomFromWKB($1)) = 'GEOMETRYCOLLECTION'
	THEN GeomFromWKB($1)
	ELSE NULL END
	$_$
    LANGUAGE sql IMMUTABLE STRICT;


--
-- TOC entry 560 (class 1255 OID 17450)
-- Dependencies: 6 1202 1214
-- Name: geometry(box2d); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION geometry(box2d) RETURNS geometry
    AS '$libdir/postgis-1.4', 'BOX2DFLOAT4_to_LWGEOM'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 562 (class 1255 OID 17452)
-- Dependencies: 6 1202 1205
-- Name: geometry(box3d); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION geometry(box3d) RETURNS geometry
    AS '$libdir/postgis-1.4', 'BOX3D_to_LWGEOM'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 564 (class 1255 OID 17454)
-- Dependencies: 6 1202
-- Name: geometry(text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION geometry(text) RETURNS geometry
    AS '$libdir/postgis-1.4', 'parse_WKT_lwgeom'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 566 (class 1255 OID 17456)
-- Dependencies: 6 1202 1211
-- Name: geometry(chip); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION geometry(chip) RETURNS geometry
    AS '$libdir/postgis-1.4', 'CHIP_to_LWGEOM'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 568 (class 1255 OID 17458)
-- Dependencies: 6 1202
-- Name: geometry(bytea); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION geometry(bytea) RETURNS geometry
    AS '$libdir/postgis-1.4', 'LWGEOM_from_bytea'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 326 (class 1255 OID 17158)
-- Dependencies: 6 1202 1202
-- Name: geometry_above(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION geometry_above(geometry, geometry) RETURNS boolean
    AS '$libdir/postgis-1.4', 'LWGEOM_above'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 221 (class 1255 OID 17031)
-- Dependencies: 6
-- Name: geometry_analyze(internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION geometry_analyze(internal) RETURNS boolean
    AS '$libdir/postgis-1.4', 'LWGEOM_analyze'
    LANGUAGE c STRICT;


--
-- TOC entry 328 (class 1255 OID 17160)
-- Dependencies: 6 1202 1202
-- Name: geometry_below(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION geometry_below(geometry, geometry) RETURNS boolean
    AS '$libdir/postgis-1.4', 'LWGEOM_below'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 308 (class 1255 OID 17127)
-- Dependencies: 6 1202 1202
-- Name: geometry_cmp(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION geometry_cmp(geometry, geometry) RETURNS integer
    AS '$libdir/postgis-1.4', 'lwgeom_cmp'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 330 (class 1255 OID 17162)
-- Dependencies: 6 1202 1202
-- Name: geometry_contain(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION geometry_contain(geometry, geometry) RETURNS boolean
    AS '$libdir/postgis-1.4', 'LWGEOM_contain'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 332 (class 1255 OID 17164)
-- Dependencies: 6 1202 1202
-- Name: geometry_contained(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION geometry_contained(geometry, geometry) RETURNS boolean
    AS '$libdir/postgis-1.4', 'LWGEOM_contained'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 306 (class 1255 OID 17125)
-- Dependencies: 6 1202 1202
-- Name: geometry_eq(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION geometry_eq(geometry, geometry) RETURNS boolean
    AS '$libdir/postgis-1.4', 'lwgeom_eq'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 304 (class 1255 OID 17123)
-- Dependencies: 6 1202 1202
-- Name: geometry_ge(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION geometry_ge(geometry, geometry) RETURNS boolean
    AS '$libdir/postgis-1.4', 'lwgeom_ge'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 302 (class 1255 OID 17121)
-- Dependencies: 6 1202 1202
-- Name: geometry_gt(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION geometry_gt(geometry, geometry) RETURNS boolean
    AS '$libdir/postgis-1.4', 'lwgeom_gt'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 217 (class 1255 OID 17027)
-- Dependencies: 6 1202
-- Name: geometry_in(cstring); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION geometry_in(cstring) RETURNS geometry
    AS '$libdir/postgis-1.4', 'LWGEOM_in'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 300 (class 1255 OID 17119)
-- Dependencies: 6 1202 1202
-- Name: geometry_le(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION geometry_le(geometry, geometry) RETURNS boolean
    AS '$libdir/postgis-1.4', 'lwgeom_le'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 322 (class 1255 OID 17154)
-- Dependencies: 6 1202 1202
-- Name: geometry_left(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION geometry_left(geometry, geometry) RETURNS boolean
    AS '$libdir/postgis-1.4', 'LWGEOM_left'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 298 (class 1255 OID 17117)
-- Dependencies: 6 1202 1202
-- Name: geometry_lt(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION geometry_lt(geometry, geometry) RETURNS boolean
    AS '$libdir/postgis-1.4', 'lwgeom_lt'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 219 (class 1255 OID 17029)
-- Dependencies: 6 1202
-- Name: geometry_out(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION geometry_out(geometry) RETURNS cstring
    AS '$libdir/postgis-1.4', 'LWGEOM_out'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 318 (class 1255 OID 17150)
-- Dependencies: 6 1202 1202
-- Name: geometry_overabove(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION geometry_overabove(geometry, geometry) RETURNS boolean
    AS '$libdir/postgis-1.4', 'LWGEOM_overabove'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 320 (class 1255 OID 17152)
-- Dependencies: 6 1202 1202
-- Name: geometry_overbelow(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION geometry_overbelow(geometry, geometry) RETURNS boolean
    AS '$libdir/postgis-1.4', 'LWGEOM_overbelow'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 334 (class 1255 OID 17166)
-- Dependencies: 6 1202 1202
-- Name: geometry_overlap(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION geometry_overlap(geometry, geometry) RETURNS boolean
    AS '$libdir/postgis-1.4', 'LWGEOM_overlap'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 314 (class 1255 OID 17146)
-- Dependencies: 6 1202 1202
-- Name: geometry_overleft(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION geometry_overleft(geometry, geometry) RETURNS boolean
    AS '$libdir/postgis-1.4', 'LWGEOM_overleft'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 316 (class 1255 OID 17148)
-- Dependencies: 6 1202 1202
-- Name: geometry_overright(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION geometry_overright(geometry, geometry) RETURNS boolean
    AS '$libdir/postgis-1.4', 'LWGEOM_overright'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 223 (class 1255 OID 17033)
-- Dependencies: 6 1202
-- Name: geometry_recv(internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION geometry_recv(internal) RETURNS geometry
    AS '$libdir/postgis-1.4', 'LWGEOM_recv'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 324 (class 1255 OID 17156)
-- Dependencies: 6 1202 1202
-- Name: geometry_right(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION geometry_right(geometry, geometry) RETURNS boolean
    AS '$libdir/postgis-1.4', 'LWGEOM_right'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 336 (class 1255 OID 17168)
-- Dependencies: 6 1202 1202
-- Name: geometry_same(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION geometry_same(geometry, geometry) RETURNS boolean
    AS '$libdir/postgis-1.4', 'LWGEOM_same'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 225 (class 1255 OID 17035)
-- Dependencies: 6 1202
-- Name: geometry_send(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION geometry_send(geometry) RETURNS bytea
    AS '$libdir/postgis-1.4', 'LWGEOM_send'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 760 (class 1255 OID 17683)
-- Dependencies: 6 1202
-- Name: geometryfromtext(text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION geometryfromtext(text) RETURNS geometry
    AS '$libdir/postgis-1.4', 'LWGEOM_from_text'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 762 (class 1255 OID 17685)
-- Dependencies: 6 1202
-- Name: geometryfromtext(text, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION geometryfromtext(text, integer) RETURNS geometry
    AS '$libdir/postgis-1.4', 'LWGEOM_from_text'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 718 (class 1255 OID 17641)
-- Dependencies: 1202 1202 6
-- Name: geometryn(geometry, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION geometryn(geometry, integer) RETURNS geometry
    AS '$libdir/postgis-1.4', 'LWGEOM_geometryn_collection'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 730 (class 1255 OID 17653)
-- Dependencies: 6 1202
-- Name: geometrytype(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION geometrytype(geometry) RETURNS text
    AS '$libdir/postgis-1.4', 'LWGEOM_getTYPE'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 3140 (class 0 OID 0)
-- Dependencies: 730
-- Name: FUNCTION geometrytype(geometry); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION geometrytype(geometry) IS 'args: geomA - Returns the type of the geometry as a string. Eg: LINESTRING, POLYGON, MULTIPOINT, etc.';


--
-- TOC entry 452 (class 1255 OID 17317)
-- Dependencies: 1202 6
-- Name: geomfromewkb(bytea); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION geomfromewkb(bytea) RETURNS geometry
    AS '$libdir/postgis-1.4', 'LWGEOMFromWKB'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 454 (class 1255 OID 17319)
-- Dependencies: 1202 6
-- Name: geomfromewkt(text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION geomfromewkt(text) RETURNS geometry
    AS '$libdir/postgis-1.4', 'parse_WKT_lwgeom'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 764 (class 1255 OID 17687)
-- Dependencies: 6 1202
-- Name: geomfromtext(text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION geomfromtext(text) RETURNS geometry
    AS $_$SELECT geometryfromtext($1)$_$
    LANGUAGE sql IMMUTABLE STRICT;


--
-- TOC entry 766 (class 1255 OID 17689)
-- Dependencies: 6 1202
-- Name: geomfromtext(text, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION geomfromtext(text, integer) RETURNS geometry
    AS $_$SELECT geometryfromtext($1, $2)$_$
    LANGUAGE sql IMMUTABLE STRICT;


--
-- TOC entry 813 (class 1255 OID 17736)
-- Dependencies: 1202 6
-- Name: geomfromwkb(bytea); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION geomfromwkb(bytea) RETURNS geometry
    AS '$libdir/postgis-1.4', 'LWGEOM_from_WKB'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 815 (class 1255 OID 17738)
-- Dependencies: 1202 6
-- Name: geomfromwkb(bytea, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION geomfromwkb(bytea, integer) RETURNS geometry
    AS $_$SELECT setSRID(GeomFromWKB($1), $2)$_$
    LANGUAGE sql IMMUTABLE STRICT;


--
-- TOC entry 615 (class 1255 OID 17521)
-- Dependencies: 6 1202 1202 1202
-- Name: geomunion(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION geomunion(geometry, geometry) RETURNS geometry
    AS '$libdir/postgis-1.4', 'geomunion'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 671 (class 1255 OID 17594)
-- Dependencies: 6 1202 1202
-- Name: geosnoop(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION geosnoop(geometry) RETURNS geometry
    AS '$libdir/postgis-1.4', 'GEOSnoop'
    LANGUAGE c STRICT;


--
-- TOC entry 531 (class 1255 OID 17421)
-- Dependencies: 6 1340
-- Name: get_proj4_from_srid(integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION get_proj4_from_srid(integer) RETURNS text
    AS $_$
BEGIN
	RETURN proj4text::text FROM spatial_ref_sys WHERE srid= $1;
END;
$_$
    LANGUAGE plpgsql IMMUTABLE STRICT;


--
-- TOC entry 350 (class 1255 OID 17215)
-- Dependencies: 6 1214 1202
-- Name: getbbox(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION getbbox(geometry) RETURNS box2d
    AS '$libdir/postgis-1.4', 'LWGEOM_to_BOX2DFLOAT4'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 349 (class 1255 OID 17214)
-- Dependencies: 6 1202
-- Name: getsrid(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION getsrid(geometry) RETURNS integer
    AS '$libdir/postgis-1.4', 'LWGEOM_getSRID'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 877 (class 1255 OID 17800)
-- Dependencies: 6
-- Name: gettransactionid(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION gettransactionid() RETURNS xid
    AS '$libdir/postgis-1.4', 'getTransactionID'
    LANGUAGE c;


--
-- TOC entry 438 (class 1255 OID 17303)
-- Dependencies: 6 1202
-- Name: hasbbox(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION hasbbox(geometry) RETURNS boolean
    AS '$libdir/postgis-1.4', 'LWGEOM_hasBBOX'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 353 (class 1255 OID 17218)
-- Dependencies: 6 1211
-- Name: height(chip); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION height(chip) RETURNS integer
    AS '$libdir/postgis-1.4', 'CHIP_getHeight'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 155 (class 1255 OID 16865)
-- Dependencies: 6 1187 1187
-- Name: index(ltree, ltree); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION index(ltree, ltree) RETURNS integer
    AS '$libdir/ltree', 'ltree_index'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 156 (class 1255 OID 16866)
-- Dependencies: 6 1187 1187
-- Name: index(ltree, ltree, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION index(ltree, ltree, integer) RETURNS integer
    AS '$libdir/ltree', 'ltree_index'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 728 (class 1255 OID 17651)
-- Dependencies: 1202 1202 6
-- Name: interiorringn(geometry, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION interiorringn(geometry, integer) RETURNS geometry
    AS '$libdir/postgis-1.4', 'LWGEOM_interiorringn_polygon'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 594 (class 1255 OID 17500)
-- Dependencies: 6 1202 1202 1202
-- Name: intersection(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION intersection(geometry, geometry) RETURNS geometry
    AS '$libdir/postgis-1.4', 'intersection'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 648 (class 1255 OID 17571)
-- Dependencies: 6 1202 1202
-- Name: intersects(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION intersects(geometry, geometry) RETURNS boolean
    AS '$libdir/postgis-1.4', 'intersects'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 746 (class 1255 OID 17669)
-- Dependencies: 1202 6
-- Name: isclosed(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION isclosed(geometry) RETURNS boolean
    AS '$libdir/postgis-1.4', 'LWGEOM_isclosed_linestring'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 748 (class 1255 OID 17671)
-- Dependencies: 1202 6
-- Name: isempty(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION isempty(geometry) RETURNS boolean
    AS '$libdir/postgis-1.4', 'LWGEOM_isempty'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 674 (class 1255 OID 17597)
-- Dependencies: 6 1202
-- Name: isring(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION isring(geometry) RETURNS boolean
    AS '$libdir/postgis-1.4', 'isring'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 678 (class 1255 OID 17601)
-- Dependencies: 6 1202
-- Name: issimple(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION issimple(geometry) RETURNS boolean
    AS '$libdir/postgis-1.4', 'issimple'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 669 (class 1255 OID 17592)
-- Dependencies: 6 1202
-- Name: isvalid(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION isvalid(geometry) RETURNS boolean
    AS '$libdir/postgis-1.4', 'isvalid'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 160 (class 1255 OID 16870)
-- Dependencies: 1189 6 1187
-- Name: lca(ltree[]); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION lca(ltree[]) RETURNS ltree
    AS '$libdir/ltree', '_lca'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 161 (class 1255 OID 16871)
-- Dependencies: 1187 1187 1187 6
-- Name: lca(ltree, ltree); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION lca(ltree, ltree) RETURNS ltree
    AS '$libdir/ltree', 'lca'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 162 (class 1255 OID 16872)
-- Dependencies: 1187 1187 1187 6 1187
-- Name: lca(ltree, ltree, ltree); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION lca(ltree, ltree, ltree) RETURNS ltree
    AS '$libdir/ltree', 'lca'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 163 (class 1255 OID 16873)
-- Dependencies: 1187 6 1187 1187 1187 1187
-- Name: lca(ltree, ltree, ltree, ltree); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION lca(ltree, ltree, ltree, ltree) RETURNS ltree
    AS '$libdir/ltree', 'lca'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 164 (class 1255 OID 16874)
-- Dependencies: 1187 1187 6 1187 1187 1187 1187
-- Name: lca(ltree, ltree, ltree, ltree, ltree); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION lca(ltree, ltree, ltree, ltree, ltree) RETURNS ltree
    AS '$libdir/ltree', 'lca'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 165 (class 1255 OID 16875)
-- Dependencies: 1187 6 1187 1187 1187 1187 1187 1187
-- Name: lca(ltree, ltree, ltree, ltree, ltree, ltree); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION lca(ltree, ltree, ltree, ltree, ltree, ltree) RETURNS ltree
    AS '$libdir/ltree', 'lca'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 166 (class 1255 OID 16876)
-- Dependencies: 1187 1187 1187 6 1187 1187 1187 1187 1187
-- Name: lca(ltree, ltree, ltree, ltree, ltree, ltree, ltree); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION lca(ltree, ltree, ltree, ltree, ltree, ltree, ltree) RETURNS ltree
    AS '$libdir/ltree', 'lca'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 167 (class 1255 OID 16877)
-- Dependencies: 1187 6 1187 1187 1187 1187 1187 1187 1187 1187
-- Name: lca(ltree, ltree, ltree, ltree, ltree, ltree, ltree, ltree); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION lca(ltree, ltree, ltree, ltree, ltree, ltree, ltree, ltree) RETURNS ltree
    AS '$libdir/ltree', 'lca'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 378 (class 1255 OID 17243)
-- Dependencies: 6 1202
-- Name: length(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION length(geometry) RETURNS double precision
    AS '$libdir/postgis-1.4', 'LWGEOM_length_linestring'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 376 (class 1255 OID 17241)
-- Dependencies: 6 1202
-- Name: length2d(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION length2d(geometry) RETURNS double precision
    AS '$libdir/postgis-1.4', 'LWGEOM_length2d_linestring'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 384 (class 1255 OID 17249)
-- Dependencies: 6 1202 1199
-- Name: length2d_spheroid(geometry, spheroid); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION length2d_spheroid(geometry, spheroid) RETURNS double precision
    AS '$libdir/postgis-1.4', 'LWGEOM_length2d_ellipsoid_linestring'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 374 (class 1255 OID 17239)
-- Dependencies: 6 1202
-- Name: length3d(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION length3d(geometry) RETURNS double precision
    AS '$libdir/postgis-1.4', 'LWGEOM_length_linestring'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 380 (class 1255 OID 17245)
-- Dependencies: 6 1202 1199
-- Name: length3d_spheroid(geometry, spheroid); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION length3d_spheroid(geometry, spheroid) RETURNS double precision
    AS '$libdir/postgis-1.4', 'LWGEOM_length_ellipsoid_linestring'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 382 (class 1255 OID 17247)
-- Dependencies: 6 1202 1199
-- Name: length_spheroid(geometry, spheroid); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION length_spheroid(geometry, spheroid) RETURNS double precision
    AS '$libdir/postgis-1.4', 'LWGEOM_length_ellipsoid_linestring'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 584 (class 1255 OID 17490)
-- Dependencies: 6 1202 1202
-- Name: line_interpolate_point(geometry, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION line_interpolate_point(geometry, double precision) RETURNS geometry
    AS '$libdir/postgis-1.4', 'LWGEOM_line_interpolate_point'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 588 (class 1255 OID 17494)
-- Dependencies: 6 1202 1202
-- Name: line_locate_point(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION line_locate_point(geometry, geometry) RETURNS double precision
    AS '$libdir/postgis-1.4', 'LWGEOM_line_locate_point'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 586 (class 1255 OID 17492)
-- Dependencies: 6 1202 1202
-- Name: line_substring(geometry, double precision, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION line_substring(geometry, double precision, double precision) RETURNS geometry
    AS '$libdir/postgis-1.4', 'LWGEOM_line_substring'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 473 (class 1255 OID 17338)
-- Dependencies: 6 1202 1202
-- Name: linefrommultipoint(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION linefrommultipoint(geometry) RETURNS geometry
    AS '$libdir/postgis-1.4', 'LWGEOM_line_from_mpoint'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 772 (class 1255 OID 17695)
-- Dependencies: 6 1202
-- Name: linefromtext(text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION linefromtext(text) RETURNS geometry
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromText($1)) = 'LINESTRING'
	THEN GeomFromText($1)
	ELSE NULL END
	$_$
    LANGUAGE sql IMMUTABLE STRICT;


--
-- TOC entry 774 (class 1255 OID 17697)
-- Dependencies: 6 1202
-- Name: linefromtext(text, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION linefromtext(text, integer) RETURNS geometry
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromText($1, $2)) = 'LINESTRING'
	THEN GeomFromText($1,$2)
	ELSE NULL END
	$_$
    LANGUAGE sql IMMUTABLE STRICT;


--
-- TOC entry 821 (class 1255 OID 17744)
-- Dependencies: 1202 6
-- Name: linefromwkb(bytea, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION linefromwkb(bytea, integer) RETURNS geometry
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromWKB($1, $2)) = 'LINESTRING'
	THEN GeomFromWKB($1, $2)
	ELSE NULL END
	$_$
    LANGUAGE sql IMMUTABLE STRICT;


--
-- TOC entry 823 (class 1255 OID 17746)
-- Dependencies: 6 1202
-- Name: linefromwkb(bytea); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION linefromwkb(bytea) RETURNS geometry
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromWKB($1)) = 'LINESTRING'
	THEN GeomFromWKB($1)
	ELSE NULL END
	$_$
    LANGUAGE sql IMMUTABLE STRICT;


--
-- TOC entry 494 (class 1255 OID 17359)
-- Dependencies: 6 1202 1202
-- Name: linemerge(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION linemerge(geometry) RETURNS geometry
    AS '$libdir/postgis-1.4', 'linemerge'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 776 (class 1255 OID 17699)
-- Dependencies: 6 1202
-- Name: linestringfromtext(text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION linestringfromtext(text) RETURNS geometry
    AS $_$SELECT LineFromText($1)$_$
    LANGUAGE sql IMMUTABLE STRICT;


--
-- TOC entry 777 (class 1255 OID 17700)
-- Dependencies: 1202 6
-- Name: linestringfromtext(text, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION linestringfromtext(text, integer) RETURNS geometry
    AS $_$SELECT LineFromText($1, $2)$_$
    LANGUAGE sql IMMUTABLE STRICT;


--
-- TOC entry 825 (class 1255 OID 17748)
-- Dependencies: 1202 6
-- Name: linestringfromwkb(bytea, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION linestringfromwkb(bytea, integer) RETURNS geometry
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromWKB($1, $2)) = 'LINESTRING'
	THEN GeomFromWKB($1, $2)
	ELSE NULL END
	$_$
    LANGUAGE sql IMMUTABLE STRICT;


--
-- TOC entry 827 (class 1255 OID 17750)
-- Dependencies: 1202 6
-- Name: linestringfromwkb(bytea); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION linestringfromwkb(bytea) RETURNS geometry
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromWKB($1)) = 'LINESTRING'
	THEN GeomFromWKB($1)
	ELSE NULL END
	$_$
    LANGUAGE sql IMMUTABLE STRICT;


--
-- TOC entry 142 (class 1255 OID 16844)
-- Dependencies: 6
-- Name: lo_manage(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION lo_manage() RETURNS trigger
    AS '$libdir/lo', 'lo_manage'
    LANGUAGE c;


--
-- TOC entry 141 (class 1255 OID 16843)
-- Dependencies: 1186 6
-- Name: lo_oid(lo); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION lo_oid(lo) RETURNS oid
    AS $_$SELECT $1::pg_catalog.oid$_$
    LANGUAGE sql IMMUTABLE STRICT;


--
-- TOC entry 592 (class 1255 OID 17498)
-- Dependencies: 6 1202 1202
-- Name: locate_along_measure(geometry, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION locate_along_measure(geometry, double precision) RETURNS geometry
    AS $_$ SELECT locate_between_measures($1, $2, $2) $_$
    LANGUAGE sql IMMUTABLE STRICT;


--
-- TOC entry 590 (class 1255 OID 17496)
-- Dependencies: 6 1202 1202
-- Name: locate_between_measures(geometry, double precision, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION locate_between_measures(geometry, double precision, double precision) RETURNS geometry
    AS '$libdir/postgis-1.4', 'LWGEOM_locate_between_m'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 869 (class 1255 OID 17792)
-- Dependencies: 1340 6
-- Name: lockrow(text, text, text, text, timestamp without time zone); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION lockrow(text, text, text, text, timestamp without time zone) RETURNS integer
    AS $_$ 
DECLARE
	myschema alias for $1;
	mytable alias for $2;
	myrid   alias for $3;
	authid alias for $4;
	expires alias for $5;
	ret int;
	mytoid oid;
	myrec RECORD;
	
BEGIN

	IF NOT LongTransactionsEnabled() THEN
		RAISE EXCEPTION 'Long transaction support disabled, use EnableLongTransaction() to enable.';
	END IF;

	EXECUTE 'DELETE FROM authorization_table WHERE expires < now()'; 

	SELECT c.oid INTO mytoid FROM pg_class c, pg_namespace n
		WHERE c.relname = mytable
		AND c.relnamespace = n.oid
		AND n.nspname = myschema;

	-- RAISE NOTICE 'toid: %', mytoid;

	FOR myrec IN SELECT * FROM authorization_table WHERE 
		toid = mytoid AND rid = myrid
	LOOP
		IF myrec.authid != authid THEN
			RETURN 0;
		ELSE
			RETURN 1;
		END IF;
	END LOOP;

	EXECUTE 'INSERT INTO authorization_table VALUES ('||
		quote_literal(mytoid::text)||','||quote_literal(myrid)||
		','||quote_literal(expires::text)||
		','||quote_literal(authid) ||')';

	GET DIAGNOSTICS ret = ROW_COUNT;

	RETURN ret;
END;
$_$
    LANGUAGE plpgsql STRICT;


--
-- TOC entry 3141 (class 0 OID 0)
-- Dependencies: 869
-- Name: FUNCTION lockrow(text, text, text, text, timestamp without time zone); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION lockrow(text, text, text, text, timestamp without time zone) IS 'args: a_schema_name, a_table_name, a_row_key, an_auth_token, expire_dt - Set lock/authorization for specific row in table';


--
-- TOC entry 870 (class 1255 OID 17793)
-- Dependencies: 6
-- Name: lockrow(text, text, text, text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION lockrow(text, text, text, text) RETURNS integer
    AS $_$ SELECT LockRow($1, $2, $3, $4, now()::timestamp+'1:00'); $_$
    LANGUAGE sql STRICT;


--
-- TOC entry 871 (class 1255 OID 17794)
-- Dependencies: 6
-- Name: lockrow(text, text, text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION lockrow(text, text, text) RETURNS integer
    AS $_$ SELECT LockRow(current_schema(), $1, $2, $3, now()::timestamp+'1:00'); $_$
    LANGUAGE sql STRICT;


--
-- TOC entry 3142 (class 0 OID 0)
-- Dependencies: 871
-- Name: FUNCTION lockrow(text, text, text); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION lockrow(text, text, text) IS 'args: a_table_name, a_row_key, an_auth_token - Set lock/authorization for specific row in table';


--
-- TOC entry 872 (class 1255 OID 17795)
-- Dependencies: 6
-- Name: lockrow(text, text, text, timestamp without time zone); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION lockrow(text, text, text, timestamp without time zone) RETURNS integer
    AS $_$ SELECT LockRow(current_schema(), $1, $2, $3, $4); $_$
    LANGUAGE sql STRICT;


--
-- TOC entry 3143 (class 0 OID 0)
-- Dependencies: 872
-- Name: FUNCTION lockrow(text, text, text, timestamp without time zone); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION lockrow(text, text, text, timestamp without time zone) IS 'args: a_table_name, a_row_key, an_auth_token, expire_dt - Set lock/authorization for specific row in table';


--
-- TOC entry 879 (class 1255 OID 17802)
-- Dependencies: 1340 6
-- Name: longtransactionsenabled(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION longtransactionsenabled() RETURNS boolean
    AS $$ 
DECLARE
	rec RECORD;
BEGIN
	FOR rec IN SELECT oid FROM pg_class WHERE relname = 'authorized_tables'
	LOOP
		return 't';
	END LOOP;
	return 'f';
END;
$$
    LANGUAGE plpgsql;


--
-- TOC entry 178 (class 1255 OID 16909)
-- Dependencies: 6 1187 1192
-- Name: lt_q_regex(ltree, lquery[]); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION lt_q_regex(ltree, lquery[]) RETURNS boolean
    AS '$libdir/ltree', 'lt_q_regex'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 179 (class 1255 OID 16910)
-- Dependencies: 1192 1187 6
-- Name: lt_q_rregex(lquery[], ltree); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION lt_q_rregex(lquery[], ltree) RETURNS boolean
    AS '$libdir/ltree', 'lt_q_rregex'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 176 (class 1255 OID 16903)
-- Dependencies: 1190 6 1187
-- Name: ltq_regex(ltree, lquery); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION ltq_regex(ltree, lquery) RETURNS boolean
    AS '$libdir/ltree', 'ltq_regex'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 177 (class 1255 OID 16904)
-- Dependencies: 1187 1190 6
-- Name: ltq_rregex(lquery, ltree); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION ltq_rregex(lquery, ltree) RETURNS boolean
    AS '$libdir/ltree', 'ltq_rregex'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 158 (class 1255 OID 16868)
-- Dependencies: 1187 6
-- Name: ltree2text(ltree); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION ltree2text(ltree) RETURNS text
    AS '$libdir/ltree', 'ltree2text'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 170 (class 1255 OID 16880)
-- Dependencies: 6 1187 1187 1187
-- Name: ltree_addltree(ltree, ltree); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION ltree_addltree(ltree, ltree) RETURNS ltree
    AS '$libdir/ltree', 'ltree_addltree'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 171 (class 1255 OID 16881)
-- Dependencies: 6 1187 1187
-- Name: ltree_addtext(ltree, text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION ltree_addtext(ltree, text) RETURNS ltree
    AS '$libdir/ltree', 'ltree_addtext'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 145 (class 1255 OID 16849)
-- Dependencies: 1187 6 1187
-- Name: ltree_cmp(ltree, ltree); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION ltree_cmp(ltree, ltree) RETURNS integer
    AS '$libdir/ltree', 'ltree_cmp'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 187 (class 1255 OID 16930)
-- Dependencies: 6
-- Name: ltree_compress(internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION ltree_compress(internal) RETURNS internal
    AS '$libdir/ltree', 'ltree_compress'
    LANGUAGE c IMMUTABLE;


--
-- TOC entry 186 (class 1255 OID 16929)
-- Dependencies: 6
-- Name: ltree_consistent(internal, internal, smallint); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION ltree_consistent(internal, internal, smallint) RETURNS boolean
    AS '$libdir/ltree', 'ltree_consistent'
    LANGUAGE c IMMUTABLE;


--
-- TOC entry 188 (class 1255 OID 16931)
-- Dependencies: 6
-- Name: ltree_decompress(internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION ltree_decompress(internal) RETURNS internal
    AS '$libdir/ltree', 'ltree_decompress'
    LANGUAGE c IMMUTABLE;


--
-- TOC entry 148 (class 1255 OID 16852)
-- Dependencies: 6 1187 1187
-- Name: ltree_eq(ltree, ltree); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION ltree_eq(ltree, ltree) RETURNS boolean
    AS '$libdir/ltree', 'ltree_eq'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 149 (class 1255 OID 16853)
-- Dependencies: 6 1187 1187
-- Name: ltree_ge(ltree, ltree); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION ltree_ge(ltree, ltree) RETURNS boolean
    AS '$libdir/ltree', 'ltree_ge'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 150 (class 1255 OID 16854)
-- Dependencies: 1187 1187 6
-- Name: ltree_gt(ltree, ltree); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION ltree_gt(ltree, ltree) RETURNS boolean
    AS '$libdir/ltree', 'ltree_gt'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 168 (class 1255 OID 16878)
-- Dependencies: 1187 1187 6
-- Name: ltree_isparent(ltree, ltree); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION ltree_isparent(ltree, ltree) RETURNS boolean
    AS '$libdir/ltree', 'ltree_isparent'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 147 (class 1255 OID 16851)
-- Dependencies: 6 1187 1187
-- Name: ltree_le(ltree, ltree); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION ltree_le(ltree, ltree) RETURNS boolean
    AS '$libdir/ltree', 'ltree_le'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 146 (class 1255 OID 16850)
-- Dependencies: 6 1187 1187
-- Name: ltree_lt(ltree, ltree); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION ltree_lt(ltree, ltree) RETURNS boolean
    AS '$libdir/ltree', 'ltree_lt'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 151 (class 1255 OID 16855)
-- Dependencies: 1187 1187 6
-- Name: ltree_ne(ltree, ltree); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION ltree_ne(ltree, ltree) RETURNS boolean
    AS '$libdir/ltree', 'ltree_ne'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 189 (class 1255 OID 16932)
-- Dependencies: 6
-- Name: ltree_penalty(internal, internal, internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION ltree_penalty(internal, internal, internal) RETURNS internal
    AS '$libdir/ltree', 'ltree_penalty'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 190 (class 1255 OID 16933)
-- Dependencies: 6
-- Name: ltree_picksplit(internal, internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION ltree_picksplit(internal, internal) RETURNS internal
    AS '$libdir/ltree', 'ltree_picksplit'
    LANGUAGE c IMMUTABLE;


--
-- TOC entry 169 (class 1255 OID 16879)
-- Dependencies: 6 1187 1187
-- Name: ltree_risparent(ltree, ltree); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION ltree_risparent(ltree, ltree) RETURNS boolean
    AS '$libdir/ltree', 'ltree_risparent'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 192 (class 1255 OID 16935)
-- Dependencies: 6
-- Name: ltree_same(internal, internal, internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION ltree_same(internal, internal, internal) RETURNS internal
    AS '$libdir/ltree', 'ltree_same'
    LANGUAGE c IMMUTABLE;


--
-- TOC entry 172 (class 1255 OID 16882)
-- Dependencies: 6 1187 1187
-- Name: ltree_textadd(text, ltree); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION ltree_textadd(text, ltree) RETURNS ltree
    AS '$libdir/ltree', 'ltree_textadd'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 191 (class 1255 OID 16934)
-- Dependencies: 6
-- Name: ltree_union(internal, internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION ltree_union(internal, internal) RETURNS integer
    AS '$libdir/ltree', 'ltree_union'
    LANGUAGE c IMMUTABLE;


--
-- TOC entry 173 (class 1255 OID 16883)
-- Dependencies: 6
-- Name: ltreeparentsel(internal, oid, internal, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION ltreeparentsel(internal, oid, internal, integer) RETURNS double precision
    AS '$libdir/ltree', 'ltreeparentsel'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 182 (class 1255 OID 16919)
-- Dependencies: 1193 6 1187
-- Name: ltxtq_exec(ltree, ltxtquery); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION ltxtq_exec(ltree, ltxtquery) RETURNS boolean
    AS '$libdir/ltree', 'ltxtq_exec'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 183 (class 1255 OID 16920)
-- Dependencies: 1193 6 1187
-- Name: ltxtq_rexec(ltxtquery, ltree); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION ltxtq_rexec(ltxtquery, ltree) RETURNS boolean
    AS '$libdir/ltree', 'ltxtq_rexec'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 339 (class 1255 OID 17183)
-- Dependencies: 6
-- Name: lwgeom_gist_compress(internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION lwgeom_gist_compress(internal) RETURNS internal
    AS '$libdir/postgis-1.4', 'LWGEOM_gist_compress'
    LANGUAGE c;


--
-- TOC entry 338 (class 1255 OID 17182)
-- Dependencies: 6 1202
-- Name: lwgeom_gist_consistent(internal, geometry, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION lwgeom_gist_consistent(internal, geometry, integer) RETURNS boolean
    AS '$libdir/postgis-1.4', 'LWGEOM_gist_consistent'
    LANGUAGE c;


--
-- TOC entry 344 (class 1255 OID 17188)
-- Dependencies: 6
-- Name: lwgeom_gist_decompress(internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION lwgeom_gist_decompress(internal) RETURNS internal
    AS '$libdir/postgis-1.4', 'LWGEOM_gist_decompress'
    LANGUAGE c;


--
-- TOC entry 340 (class 1255 OID 17184)
-- Dependencies: 6
-- Name: lwgeom_gist_penalty(internal, internal, internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION lwgeom_gist_penalty(internal, internal, internal) RETURNS internal
    AS '$libdir/postgis-1.4', 'LWGEOM_gist_penalty'
    LANGUAGE c;


--
-- TOC entry 341 (class 1255 OID 17185)
-- Dependencies: 6
-- Name: lwgeom_gist_picksplit(internal, internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION lwgeom_gist_picksplit(internal, internal) RETURNS internal
    AS '$libdir/postgis-1.4', 'LWGEOM_gist_picksplit'
    LANGUAGE c;


--
-- TOC entry 343 (class 1255 OID 17187)
-- Dependencies: 6 1214 1214
-- Name: lwgeom_gist_same(box2d, box2d, internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION lwgeom_gist_same(box2d, box2d, internal) RETURNS internal
    AS '$libdir/postgis-1.4', 'LWGEOM_gist_same'
    LANGUAGE c;


--
-- TOC entry 342 (class 1255 OID 17186)
-- Dependencies: 6
-- Name: lwgeom_gist_union(bytea, internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION lwgeom_gist_union(bytea, internal) RETURNS internal
    AS '$libdir/postgis-1.4', 'LWGEOM_gist_union'
    LANGUAGE c;


--
-- TOC entry 740 (class 1255 OID 17663)
-- Dependencies: 1202 6
-- Name: m(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION m(geometry) RETURNS double precision
    AS '$libdir/postgis-1.4', 'LWGEOM_m_point'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 466 (class 1255 OID 17331)
-- Dependencies: 6 1214 1202 1202
-- Name: makebox2d(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION makebox2d(geometry, geometry) RETURNS box2d
    AS '$libdir/postgis-1.4', 'BOX2DFLOAT4_construct'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 468 (class 1255 OID 17333)
-- Dependencies: 6 1205 1202 1202
-- Name: makebox3d(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION makebox3d(geometry, geometry) RETURNS box3d
    AS '$libdir/postgis-1.4', 'BOX3D_construct'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 475 (class 1255 OID 17340)
-- Dependencies: 1202 6 1202 1202
-- Name: makeline(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION makeline(geometry, geometry) RETURNS geometry
    AS '$libdir/postgis-1.4', 'LWGEOM_makeline'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 470 (class 1255 OID 17335)
-- Dependencies: 6 1202 1204
-- Name: makeline_garray(geometry[]); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION makeline_garray(geometry[]) RETURNS geometry
    AS '$libdir/postgis-1.4', 'LWGEOM_makeline_garray'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 458 (class 1255 OID 17323)
-- Dependencies: 6 1202
-- Name: makepoint(double precision, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION makepoint(double precision, double precision) RETURNS geometry
    AS '$libdir/postgis-1.4', 'LWGEOM_makepoint'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 460 (class 1255 OID 17325)
-- Dependencies: 6 1202
-- Name: makepoint(double precision, double precision, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION makepoint(double precision, double precision, double precision) RETURNS geometry
    AS '$libdir/postgis-1.4', 'LWGEOM_makepoint'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 462 (class 1255 OID 17327)
-- Dependencies: 6 1202
-- Name: makepoint(double precision, double precision, double precision, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION makepoint(double precision, double precision, double precision, double precision) RETURNS geometry
    AS '$libdir/postgis-1.4', 'LWGEOM_makepoint'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 464 (class 1255 OID 17329)
-- Dependencies: 6 1202
-- Name: makepointm(double precision, double precision, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION makepointm(double precision, double precision, double precision) RETURNS geometry
    AS '$libdir/postgis-1.4', 'LWGEOM_makepoint3dm'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 485 (class 1255 OID 17350)
-- Dependencies: 6 1202 1202 1204
-- Name: makepolygon(geometry, geometry[]); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION makepolygon(geometry, geometry[]) RETURNS geometry
    AS '$libdir/postgis-1.4', 'LWGEOM_makepoly'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 487 (class 1255 OID 17352)
-- Dependencies: 6 1202 1202
-- Name: makepolygon(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION makepolygon(geometry) RETURNS geometry
    AS '$libdir/postgis-1.4', 'LWGEOM_makepoly'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 402 (class 1255 OID 17267)
-- Dependencies: 6 1202 1202
-- Name: max_distance(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION max_distance(geometry, geometry) RETURNS double precision
    AS '$libdir/postgis-1.4', 'LWGEOM_maxdistance2d_linestring'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 366 (class 1255 OID 17231)
-- Dependencies: 6 1202
-- Name: mem_size(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION mem_size(geometry) RETURNS integer
    AS '$libdir/postgis-1.4', 'LWGEOM_mem_size'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 786 (class 1255 OID 17709)
-- Dependencies: 6 1202
-- Name: mlinefromtext(text, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION mlinefromtext(text, integer) RETURNS geometry
    AS $_$
	SELECT CASE
	WHEN geometrytype(GeomFromText($1, $2)) = 'MULTILINESTRING'
	THEN GeomFromText($1,$2)
	ELSE NULL END
	$_$
    LANGUAGE sql IMMUTABLE STRICT;


--
-- TOC entry 788 (class 1255 OID 17711)
-- Dependencies: 1202 6
-- Name: mlinefromtext(text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION mlinefromtext(text) RETURNS geometry
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromText($1)) = 'MULTILINESTRING'
	THEN GeomFromText($1)
	ELSE NULL END
	$_$
    LANGUAGE sql IMMUTABLE STRICT;


--
-- TOC entry 848 (class 1255 OID 17771)
-- Dependencies: 6 1202
-- Name: mlinefromwkb(bytea, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION mlinefromwkb(bytea, integer) RETURNS geometry
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromWKB($1, $2)) = 'MULTILINESTRING'
	THEN GeomFromWKB($1, $2)
	ELSE NULL END
	$_$
    LANGUAGE sql IMMUTABLE STRICT;


--
-- TOC entry 850 (class 1255 OID 17773)
-- Dependencies: 1202 6
-- Name: mlinefromwkb(bytea); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION mlinefromwkb(bytea) RETURNS geometry
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromWKB($1)) = 'MULTILINESTRING'
	THEN GeomFromWKB($1)
	ELSE NULL END
	$_$
    LANGUAGE sql IMMUTABLE STRICT;


--
-- TOC entry 794 (class 1255 OID 17717)
-- Dependencies: 6 1202
-- Name: mpointfromtext(text, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION mpointfromtext(text, integer) RETURNS geometry
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromText($1,$2)) = 'MULTIPOINT'
	THEN GeomFromText($1,$2)
	ELSE NULL END
	$_$
    LANGUAGE sql IMMUTABLE STRICT;


--
-- TOC entry 796 (class 1255 OID 17719)
-- Dependencies: 6 1202
-- Name: mpointfromtext(text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION mpointfromtext(text) RETURNS geometry
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromText($1)) = 'MULTIPOINT'
	THEN GeomFromText($1)
	ELSE NULL END
	$_$
    LANGUAGE sql IMMUTABLE STRICT;


--
-- TOC entry 837 (class 1255 OID 17760)
-- Dependencies: 6 1202
-- Name: mpointfromwkb(bytea, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION mpointfromwkb(bytea, integer) RETURNS geometry
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromWKB($1,$2)) = 'MULTIPOINT'
	THEN GeomFromWKB($1, $2)
	ELSE NULL END
	$_$
    LANGUAGE sql IMMUTABLE STRICT;


--
-- TOC entry 839 (class 1255 OID 17762)
-- Dependencies: 6 1202
-- Name: mpointfromwkb(bytea); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION mpointfromwkb(bytea) RETURNS geometry
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromWKB($1)) = 'MULTIPOINT'
	THEN GeomFromWKB($1)
	ELSE NULL END
	$_$
    LANGUAGE sql IMMUTABLE STRICT;


--
-- TOC entry 801 (class 1255 OID 17724)
-- Dependencies: 6 1202
-- Name: mpolyfromtext(text, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION mpolyfromtext(text, integer) RETURNS geometry
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromText($1, $2)) = 'MULTIPOLYGON'
	THEN GeomFromText($1,$2)
	ELSE NULL END
	$_$
    LANGUAGE sql IMMUTABLE STRICT;


--
-- TOC entry 803 (class 1255 OID 17726)
-- Dependencies: 1202 6
-- Name: mpolyfromtext(text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION mpolyfromtext(text) RETURNS geometry
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromText($1)) = 'MULTIPOLYGON'
	THEN GeomFromText($1)
	ELSE NULL END
	$_$
    LANGUAGE sql IMMUTABLE STRICT;


--
-- TOC entry 852 (class 1255 OID 17775)
-- Dependencies: 6 1202
-- Name: mpolyfromwkb(bytea, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION mpolyfromwkb(bytea, integer) RETURNS geometry
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromWKB($1, $2)) = 'MULTIPOLYGON'
	THEN GeomFromWKB($1, $2)
	ELSE NULL END
	$_$
    LANGUAGE sql IMMUTABLE STRICT;


--
-- TOC entry 854 (class 1255 OID 17777)
-- Dependencies: 6 1202
-- Name: mpolyfromwkb(bytea); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION mpolyfromwkb(bytea) RETURNS geometry
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromWKB($1)) = 'MULTIPOLYGON'
	THEN GeomFromWKB($1)
	ELSE NULL END
	$_$
    LANGUAGE sql IMMUTABLE STRICT;


--
-- TOC entry 420 (class 1255 OID 17285)
-- Dependencies: 6 1202 1202
-- Name: multi(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION multi(geometry) RETURNS geometry
    AS '$libdir/postgis-1.4', 'LWGEOM_force_multi'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 845 (class 1255 OID 17768)
-- Dependencies: 6 1202
-- Name: multilinefromwkb(bytea, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION multilinefromwkb(bytea, integer) RETURNS geometry
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromWKB($1, $2)) = 'MULTILINESTRING'
	THEN GeomFromWKB($1, $2)
	ELSE NULL END
	$_$
    LANGUAGE sql IMMUTABLE STRICT;


--
-- TOC entry 846 (class 1255 OID 17769)
-- Dependencies: 1202 6
-- Name: multilinefromwkb(bytea); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION multilinefromwkb(bytea) RETURNS geometry
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromWKB($1)) = 'MULTILINESTRING'
	THEN GeomFromWKB($1)
	ELSE NULL END
	$_$
    LANGUAGE sql IMMUTABLE STRICT;


--
-- TOC entry 790 (class 1255 OID 17713)
-- Dependencies: 6 1202
-- Name: multilinestringfromtext(text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION multilinestringfromtext(text) RETURNS geometry
    AS $_$SELECT ST_MLineFromText($1)$_$
    LANGUAGE sql IMMUTABLE STRICT;


--
-- TOC entry 792 (class 1255 OID 17715)
-- Dependencies: 1202 6
-- Name: multilinestringfromtext(text, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION multilinestringfromtext(text, integer) RETURNS geometry
    AS $_$SELECT MLineFromText($1, $2)$_$
    LANGUAGE sql IMMUTABLE STRICT;


--
-- TOC entry 798 (class 1255 OID 17721)
-- Dependencies: 6 1202
-- Name: multipointfromtext(text, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION multipointfromtext(text, integer) RETURNS geometry
    AS $_$SELECT MPointFromText($1, $2)$_$
    LANGUAGE sql IMMUTABLE STRICT;


--
-- TOC entry 799 (class 1255 OID 17722)
-- Dependencies: 6 1202
-- Name: multipointfromtext(text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION multipointfromtext(text) RETURNS geometry
    AS $_$SELECT MPointFromText($1)$_$
    LANGUAGE sql IMMUTABLE STRICT;


--
-- TOC entry 841 (class 1255 OID 17764)
-- Dependencies: 1202 6
-- Name: multipointfromwkb(bytea, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION multipointfromwkb(bytea, integer) RETURNS geometry
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromWKB($1,$2)) = 'MULTIPOINT'
	THEN GeomFromWKB($1, $2)
	ELSE NULL END
	$_$
    LANGUAGE sql IMMUTABLE STRICT;


--
-- TOC entry 843 (class 1255 OID 17766)
-- Dependencies: 1202 6
-- Name: multipointfromwkb(bytea); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION multipointfromwkb(bytea) RETURNS geometry
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromWKB($1)) = 'MULTIPOINT'
	THEN GeomFromWKB($1)
	ELSE NULL END
	$_$
    LANGUAGE sql IMMUTABLE STRICT;


--
-- TOC entry 856 (class 1255 OID 17779)
-- Dependencies: 6 1202
-- Name: multipolyfromwkb(bytea, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION multipolyfromwkb(bytea, integer) RETURNS geometry
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromWKB($1, $2)) = 'MULTIPOLYGON'
	THEN GeomFromWKB($1, $2)
	ELSE NULL END
	$_$
    LANGUAGE sql IMMUTABLE STRICT;


--
-- TOC entry 858 (class 1255 OID 17781)
-- Dependencies: 6 1202
-- Name: multipolyfromwkb(bytea); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION multipolyfromwkb(bytea) RETURNS geometry
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromWKB($1)) = 'MULTIPOLYGON'
	THEN GeomFromWKB($1)
	ELSE NULL END
	$_$
    LANGUAGE sql IMMUTABLE STRICT;


--
-- TOC entry 805 (class 1255 OID 17728)
-- Dependencies: 1202 6
-- Name: multipolygonfromtext(text, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION multipolygonfromtext(text, integer) RETURNS geometry
    AS $_$SELECT MPolyFromText($1, $2)$_$
    LANGUAGE sql IMMUTABLE STRICT;


--
-- TOC entry 807 (class 1255 OID 17730)
-- Dependencies: 6 1202
-- Name: multipolygonfromtext(text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION multipolygonfromtext(text) RETURNS geometry
    AS $_$SELECT MPolyFromText($1)$_$
    LANGUAGE sql IMMUTABLE STRICT;


--
-- TOC entry 440 (class 1255 OID 17305)
-- Dependencies: 1202 6
-- Name: ndims(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION ndims(geometry) RETURNS smallint
    AS '$libdir/postgis-1.4', 'LWGEOM_ndims'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 157 (class 1255 OID 16867)
-- Dependencies: 1187 6
-- Name: nlevel(ltree); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION nlevel(ltree) RETURNS integer
    AS '$libdir/ltree', 'nlevel'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 434 (class 1255 OID 17299)
-- Dependencies: 6 1202 1202
-- Name: noop(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION noop(geometry) RETURNS geometry
    AS '$libdir/postgis-1.4', 'LWGEOM_noop'
    LANGUAGE c STRICT;


--
-- TOC entry 370 (class 1255 OID 17235)
-- Dependencies: 6 1202
-- Name: npoints(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION npoints(geometry) RETURNS integer
    AS '$libdir/postgis-1.4', 'LWGEOM_npoints'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 372 (class 1255 OID 17237)
-- Dependencies: 6 1202
-- Name: nrings(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION nrings(geometry) RETURNS integer
    AS '$libdir/postgis-1.4', 'LWGEOM_nrings'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 716 (class 1255 OID 17639)
-- Dependencies: 1202 6
-- Name: numgeometries(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION numgeometries(geometry) RETURNS integer
    AS '$libdir/postgis-1.4', 'LWGEOM_numgeometries_collection'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 726 (class 1255 OID 17649)
-- Dependencies: 1202 6
-- Name: numinteriorring(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION numinteriorring(geometry) RETURNS integer
    AS '$libdir/postgis-1.4', 'LWGEOM_numinteriorrings_polygon'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 724 (class 1255 OID 17647)
-- Dependencies: 1202 6
-- Name: numinteriorrings(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION numinteriorrings(geometry) RETURNS integer
    AS '$libdir/postgis-1.4', 'LWGEOM_numinteriorrings_polygon'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 714 (class 1255 OID 17637)
-- Dependencies: 6 1202
-- Name: numpoints(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION numpoints(geometry) RETURNS integer
    AS '$libdir/postgis-1.4', 'LWGEOM_numpoints_linestring'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 666 (class 1255 OID 17589)
-- Dependencies: 6 1202 1202
-- Name: overlaps(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION "overlaps"(geometry, geometry) RETURNS boolean
    AS '$libdir/postgis-1.4', 'overlaps'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 390 (class 1255 OID 17255)
-- Dependencies: 6 1202
-- Name: perimeter(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION perimeter(geometry) RETURNS double precision
    AS '$libdir/postgis-1.4', 'LWGEOM_perimeter_poly'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 388 (class 1255 OID 17253)
-- Dependencies: 6 1202
-- Name: perimeter2d(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION perimeter2d(geometry) RETURNS double precision
    AS '$libdir/postgis-1.4', 'LWGEOM_perimeter2d_poly'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 386 (class 1255 OID 17251)
-- Dependencies: 6 1202
-- Name: perimeter3d(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION perimeter3d(geometry) RETURNS double precision
    AS '$libdir/postgis-1.4', 'LWGEOM_perimeter_poly'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 629 (class 1255 OID 17541)
-- Dependencies: 6 1204 1225
-- Name: pgis_geometry_accum_finalfn(pgis_abs); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION pgis_geometry_accum_finalfn(pgis_abs) RETURNS geometry[]
    AS '$libdir/postgis-1.4', 'pgis_geometry_accum_finalfn'
    LANGUAGE c;


--
-- TOC entry 628 (class 1255 OID 17540)
-- Dependencies: 6 1225 1225 1202
-- Name: pgis_geometry_accum_transfn(pgis_abs, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION pgis_geometry_accum_transfn(pgis_abs, geometry) RETURNS pgis_abs
    AS '$libdir/postgis-1.4', 'pgis_geometry_accum_transfn'
    LANGUAGE c;


--
-- TOC entry 631 (class 1255 OID 17543)
-- Dependencies: 6 1202 1225
-- Name: pgis_geometry_collect_finalfn(pgis_abs); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION pgis_geometry_collect_finalfn(pgis_abs) RETURNS geometry
    AS '$libdir/postgis-1.4', 'pgis_geometry_collect_finalfn'
    LANGUAGE c;


--
-- TOC entry 633 (class 1255 OID 17545)
-- Dependencies: 6 1202 1225
-- Name: pgis_geometry_makeline_finalfn(pgis_abs); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION pgis_geometry_makeline_finalfn(pgis_abs) RETURNS geometry
    AS '$libdir/postgis-1.4', 'pgis_geometry_makeline_finalfn'
    LANGUAGE c;


--
-- TOC entry 632 (class 1255 OID 17544)
-- Dependencies: 6 1202 1225
-- Name: pgis_geometry_polygonize_finalfn(pgis_abs); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION pgis_geometry_polygonize_finalfn(pgis_abs) RETURNS geometry
    AS '$libdir/postgis-1.4', 'pgis_geometry_polygonize_finalfn'
    LANGUAGE c;


--
-- TOC entry 630 (class 1255 OID 17542)
-- Dependencies: 6 1202 1225
-- Name: pgis_geometry_union_finalfn(pgis_abs); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION pgis_geometry_union_finalfn(pgis_abs) RETURNS geometry
    AS '$libdir/postgis-1.4', 'pgis_geometry_union_finalfn'
    LANGUAGE c;


--
-- TOC entry 404 (class 1255 OID 17269)
-- Dependencies: 6 1202
-- Name: point_inside_circle(geometry, double precision, double precision, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION point_inside_circle(geometry, double precision, double precision, double precision) RETURNS boolean
    AS '$libdir/postgis-1.4', 'LWGEOM_inside_circle_point'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 768 (class 1255 OID 17691)
-- Dependencies: 6 1202
-- Name: pointfromtext(text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION pointfromtext(text) RETURNS geometry
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromText($1)) = 'POINT'
	THEN GeomFromText($1)
	ELSE NULL END
	$_$
    LANGUAGE sql IMMUTABLE STRICT;


--
-- TOC entry 770 (class 1255 OID 17693)
-- Dependencies: 6 1202
-- Name: pointfromtext(text, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION pointfromtext(text, integer) RETURNS geometry
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromText($1, $2)) = 'POINT'
	THEN GeomFromText($1,$2)
	ELSE NULL END
	$_$
    LANGUAGE sql IMMUTABLE STRICT;


--
-- TOC entry 817 (class 1255 OID 17740)
-- Dependencies: 6 1202
-- Name: pointfromwkb(bytea, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION pointfromwkb(bytea, integer) RETURNS geometry
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromWKB($1, $2)) = 'POINT'
	THEN GeomFromWKB($1, $2)
	ELSE NULL END
	$_$
    LANGUAGE sql IMMUTABLE STRICT;


--
-- TOC entry 819 (class 1255 OID 17742)
-- Dependencies: 1202 6
-- Name: pointfromwkb(bytea); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION pointfromwkb(bytea) RETURNS geometry
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromWKB($1)) = 'POINT'
	THEN GeomFromWKB($1)
	ELSE NULL END
	$_$
    LANGUAGE sql IMMUTABLE STRICT;


--
-- TOC entry 732 (class 1255 OID 17655)
-- Dependencies: 6 1202 1202
-- Name: pointn(geometry, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION pointn(geometry, integer) RETURNS geometry
    AS '$libdir/postgis-1.4', 'LWGEOM_pointn_linestring'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 676 (class 1255 OID 17599)
-- Dependencies: 6 1202 1202
-- Name: pointonsurface(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION pointonsurface(geometry) RETURNS geometry
    AS '$libdir/postgis-1.4', 'pointonsurface'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 778 (class 1255 OID 17701)
-- Dependencies: 1202 6
-- Name: polyfromtext(text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION polyfromtext(text) RETURNS geometry
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromText($1)) = 'POLYGON'
	THEN GeomFromText($1)
	ELSE NULL END
	$_$
    LANGUAGE sql IMMUTABLE STRICT;


--
-- TOC entry 780 (class 1255 OID 17703)
-- Dependencies: 1202 6
-- Name: polyfromtext(text, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION polyfromtext(text, integer) RETURNS geometry
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromText($1, $2)) = 'POLYGON'
	THEN GeomFromText($1,$2)
	ELSE NULL END
	$_$
    LANGUAGE sql IMMUTABLE STRICT;


--
-- TOC entry 829 (class 1255 OID 17752)
-- Dependencies: 1202 6
-- Name: polyfromwkb(bytea, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION polyfromwkb(bytea, integer) RETURNS geometry
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromWKB($1, $2)) = 'POLYGON'
	THEN GeomFromWKB($1, $2)
	ELSE NULL END
	$_$
    LANGUAGE sql IMMUTABLE STRICT;


--
-- TOC entry 831 (class 1255 OID 17754)
-- Dependencies: 1202 6
-- Name: polyfromwkb(bytea); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION polyfromwkb(bytea) RETURNS geometry
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromWKB($1)) = 'POLYGON'
	THEN GeomFromWKB($1)
	ELSE NULL END
	$_$
    LANGUAGE sql IMMUTABLE STRICT;


--
-- TOC entry 782 (class 1255 OID 17705)
-- Dependencies: 1202 6
-- Name: polygonfromtext(text, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION polygonfromtext(text, integer) RETURNS geometry
    AS $_$SELECT PolyFromText($1, $2)$_$
    LANGUAGE sql IMMUTABLE STRICT;


--
-- TOC entry 784 (class 1255 OID 17707)
-- Dependencies: 1202 6
-- Name: polygonfromtext(text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION polygonfromtext(text) RETURNS geometry
    AS $_$SELECT PolyFromText($1)$_$
    LANGUAGE sql IMMUTABLE STRICT;


--
-- TOC entry 833 (class 1255 OID 17756)
-- Dependencies: 6 1202
-- Name: polygonfromwkb(bytea, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION polygonfromwkb(bytea, integer) RETURNS geometry
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromWKB($1,$2)) = 'POLYGON'
	THEN GeomFromWKB($1, $2)
	ELSE NULL END
	$_$
    LANGUAGE sql IMMUTABLE STRICT;


--
-- TOC entry 835 (class 1255 OID 17758)
-- Dependencies: 1202 6
-- Name: polygonfromwkb(bytea); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION polygonfromwkb(bytea) RETURNS geometry
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromWKB($1)) = 'POLYGON'
	THEN GeomFromWKB($1)
	ELSE NULL END
	$_$
    LANGUAGE sql IMMUTABLE STRICT;


--
-- TOC entry 491 (class 1255 OID 17356)
-- Dependencies: 6 1202 1204
-- Name: polygonize_garray(geometry[]); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION polygonize_garray(geometry[]) RETURNS geometry
    AS '$libdir/postgis-1.4', 'polygonize_garray'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 515 (class 1255 OID 17404)
-- Dependencies: 6 1340
-- Name: populate_geometry_columns(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION populate_geometry_columns() RETURNS text
    AS $$
DECLARE
	inserted    integer;
	oldcount    integer;
	probed      integer;
	stale       integer;
	gcs         RECORD;
	gc          RECORD;
	gsrid       integer;
	gndims      integer;
	gtype       text;
	query       text;
	gc_is_valid boolean;
	
BEGIN
	SELECT count(*) INTO oldcount FROM geometry_columns;
	inserted := 0;

	EXECUTE 'TRUNCATE geometry_columns';

	-- Count the number of geometry columns in all tables and views
	SELECT count(DISTINCT c.oid) INTO probed
	FROM pg_class c, 
	     pg_attribute a, 
	     pg_type t, 
	     pg_namespace n
	WHERE (c.relkind = 'r' OR c.relkind = 'v')
	AND t.typname = 'geometry'
	AND a.attisdropped = false
	AND a.atttypid = t.oid
	AND a.attrelid = c.oid
	AND c.relnamespace = n.oid
	AND n.nspname NOT ILIKE 'pg_temp%';

	-- Iterate through all non-dropped geometry columns
	RAISE DEBUG 'Processing Tables.....';

	FOR gcs IN 
	SELECT DISTINCT ON (c.oid) c.oid, n.nspname, c.relname
	    FROM pg_class c, 
	         pg_attribute a, 
	         pg_type t, 
	         pg_namespace n
	    WHERE c.relkind = 'r'
	    AND t.typname = 'geometry'
	    AND a.attisdropped = false
	    AND a.atttypid = t.oid
	    AND a.attrelid = c.oid
	    AND c.relnamespace = n.oid
	    AND n.nspname NOT ILIKE 'pg_temp%'
	LOOP
	
	inserted := inserted + populate_geometry_columns(gcs.oid);
	END LOOP;
	
	-- Add views to geometry columns table
	RAISE DEBUG 'Processing Views.....';
	FOR gcs IN 
	SELECT DISTINCT ON (c.oid) c.oid, n.nspname, c.relname
	    FROM pg_class c, 
	         pg_attribute a, 
	         pg_type t, 
	         pg_namespace n
	    WHERE c.relkind = 'v'
	    AND t.typname = 'geometry'
	    AND a.attisdropped = false
	    AND a.atttypid = t.oid
	    AND a.attrelid = c.oid
	    AND c.relnamespace = n.oid
	LOOP            
	    
	inserted := inserted + populate_geometry_columns(gcs.oid);
	END LOOP;

	IF oldcount > inserted THEN
	stale = oldcount-inserted;
	ELSE
	stale = 0;
	END IF;

	RETURN 'probed:' ||probed|| ' inserted:'||inserted|| ' conflicts:'||probed-inserted|| ' deleted:'||stale;
END

$$
    LANGUAGE plpgsql;


--
-- TOC entry 3144 (class 0 OID 0)
-- Dependencies: 515
-- Name: FUNCTION populate_geometry_columns(); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION populate_geometry_columns() IS 'Ensures geometry columns have appropriate spatial constraints and exist in the geometry_columns table.';


--
-- TOC entry 516 (class 1255 OID 17405)
-- Dependencies: 6 1340
-- Name: populate_geometry_columns(oid); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION populate_geometry_columns(tbl_oid oid) RETURNS integer
    AS $$
DECLARE
	gcs         RECORD;
	gc          RECORD;
	gsrid       integer;
	gndims      integer;
	gtype       text;
	query       text;
	gc_is_valid boolean;
	inserted    integer;
	
BEGIN
	inserted := 0;
	
	-- Iterate through all geometry columns in this table
	FOR gcs IN 
	SELECT n.nspname, c.relname, a.attname
	    FROM pg_class c, 
	         pg_attribute a, 
	         pg_type t, 
	         pg_namespace n
	    WHERE c.relkind = 'r'
	    AND t.typname = 'geometry'
	    AND a.attisdropped = false
	    AND a.atttypid = t.oid
	    AND a.attrelid = c.oid
	    AND c.relnamespace = n.oid
	    AND n.nspname NOT ILIKE 'pg_temp%'
	    AND c.oid = tbl_oid
	LOOP
	
	RAISE DEBUG 'Processing table %.%.%', gcs.nspname, gcs.relname, gcs.attname;

	DELETE FROM geometry_columns 
	  WHERE f_table_schema = quote_ident(gcs.nspname) 
	  AND f_table_name = quote_ident(gcs.relname)
	  AND f_geometry_column = quote_ident(gcs.attname);
	
	gc_is_valid := true;
	
	-- Try to find srid check from system tables (pg_constraint)
	gsrid := 
	    (SELECT replace(replace(split_part(s.consrc, ' = ', 2), ')', ''), '(', '') 
	     FROM pg_class c, pg_namespace n, pg_attribute a, pg_constraint s 
	     WHERE n.nspname = gcs.nspname 
	     AND c.relname = gcs.relname 
	     AND a.attname = gcs.attname 
	     AND a.attrelid = c.oid
	     AND s.connamespace = n.oid
	     AND s.conrelid = c.oid
	     AND a.attnum = ANY (s.conkey)
	     AND s.consrc LIKE '%srid(% = %');
	IF (gsrid IS NULL) THEN 
	    -- Try to find srid from the geometry itself
	    EXECUTE 'SELECT public.srid(' || quote_ident(gcs.attname) || ') 
	             FROM ONLY ' || quote_ident(gcs.nspname) || '.' || quote_ident(gcs.relname) || ' 
	             WHERE ' || quote_ident(gcs.attname) || ' IS NOT NULL LIMIT 1' 
	        INTO gc;
	    gsrid := gc.srid;
	    
	    -- Try to apply srid check to column
	    IF (gsrid IS NOT NULL) THEN
	        BEGIN
	            EXECUTE 'ALTER TABLE ONLY ' || quote_ident(gcs.nspname) || '.' || quote_ident(gcs.relname) || ' 
	                     ADD CONSTRAINT ' || quote_ident('enforce_srid_' || gcs.attname) || ' 
	                     CHECK (srid(' || quote_ident(gcs.attname) || ') = ' || gsrid || ')';
	        EXCEPTION
	            WHEN check_violation THEN
	                RAISE WARNING 'Not inserting ''%'' in ''%.%'' into geometry_columns: could not apply constraint CHECK (srid(%) = %)', quote_ident(gcs.attname), quote_ident(gcs.nspname), quote_ident(gcs.relname), quote_ident(gcs.attname), gsrid;
	                gc_is_valid := false;
	        END;
	    END IF;
	END IF;
	
	-- Try to find ndims check from system tables (pg_constraint)
	gndims := 
	    (SELECT replace(split_part(s.consrc, ' = ', 2), ')', '') 
	     FROM pg_class c, pg_namespace n, pg_attribute a, pg_constraint s 
	     WHERE n.nspname = gcs.nspname 
	     AND c.relname = gcs.relname 
	     AND a.attname = gcs.attname 
	     AND a.attrelid = c.oid
	     AND s.connamespace = n.oid
	     AND s.conrelid = c.oid
	     AND a.attnum = ANY (s.conkey)
	     AND s.consrc LIKE '%ndims(% = %');
	IF (gndims IS NULL) THEN
	    -- Try to find ndims from the geometry itself
	    EXECUTE 'SELECT public.ndims(' || quote_ident(gcs.attname) || ') 
	             FROM ONLY ' || quote_ident(gcs.nspname) || '.' || quote_ident(gcs.relname) || ' 
	             WHERE ' || quote_ident(gcs.attname) || ' IS NOT NULL LIMIT 1' 
	        INTO gc;
	    gndims := gc.ndims;
	    
	    -- Try to apply ndims check to column
	    IF (gndims IS NOT NULL) THEN
	        BEGIN
	            EXECUTE 'ALTER TABLE ONLY ' || quote_ident(gcs.nspname) || '.' || quote_ident(gcs.relname) || ' 
	                     ADD CONSTRAINT ' || quote_ident('enforce_dims_' || gcs.attname) || ' 
	                     CHECK (ndims(' || quote_ident(gcs.attname) || ') = '||gndims||')';
	        EXCEPTION
	            WHEN check_violation THEN
	                RAISE WARNING 'Not inserting ''%'' in ''%.%'' into geometry_columns: could not apply constraint CHECK (ndims(%) = %)', quote_ident(gcs.attname), quote_ident(gcs.nspname), quote_ident(gcs.relname), quote_ident(gcs.attname), gndims;
	                gc_is_valid := false;
	        END;
	    END IF;
	END IF;
	
	-- Try to find geotype check from system tables (pg_constraint)
	gtype := 
	    (SELECT replace(split_part(s.consrc, '''', 2), ')', '') 
	     FROM pg_class c, pg_namespace n, pg_attribute a, pg_constraint s 
	     WHERE n.nspname = gcs.nspname 
	     AND c.relname = gcs.relname 
	     AND a.attname = gcs.attname 
	     AND a.attrelid = c.oid
	     AND s.connamespace = n.oid
	     AND s.conrelid = c.oid
	     AND a.attnum = ANY (s.conkey)
	     AND s.consrc LIKE '%geometrytype(% = %');
	IF (gtype IS NULL) THEN
	    -- Try to find geotype from the geometry itself
	    EXECUTE 'SELECT public.geometrytype(' || quote_ident(gcs.attname) || ') 
	             FROM ONLY ' || quote_ident(gcs.nspname) || '.' || quote_ident(gcs.relname) || ' 
	             WHERE ' || quote_ident(gcs.attname) || ' IS NOT NULL LIMIT 1' 
	        INTO gc;
	    gtype := gc.geometrytype;
	    --IF (gtype IS NULL) THEN
	    --    gtype := 'GEOMETRY';
	    --END IF;
	    
	    -- Try to apply geometrytype check to column
	    IF (gtype IS NOT NULL) THEN
	        BEGIN
	            EXECUTE 'ALTER TABLE ONLY ' || quote_ident(gcs.nspname) || '.' || quote_ident(gcs.relname) || ' 
	            ADD CONSTRAINT ' || quote_ident('enforce_geotype_' || gcs.attname) || ' 
	            CHECK ((geometrytype(' || quote_ident(gcs.attname) || ') = ' || quote_literal(gtype) || ') OR (' || quote_ident(gcs.attname) || ' IS NULL))';
	        EXCEPTION
	            WHEN check_violation THEN
	                -- No geometry check can be applied. This column contains a number of geometry types.
	                RAISE WARNING 'Could not add geometry type check (%) to table column: %.%.%', gtype, quote_ident(gcs.nspname),quote_ident(gcs.relname),quote_ident(gcs.attname);
	        END;
	    END IF;
	END IF;
	        
	IF (gsrid IS NULL) THEN             
	    RAISE WARNING 'Not inserting ''%'' in ''%.%'' into geometry_columns: could not determine the srid', quote_ident(gcs.attname), quote_ident(gcs.nspname), quote_ident(gcs.relname);
	ELSIF (gndims IS NULL) THEN
	    RAISE WARNING 'Not inserting ''%'' in ''%.%'' into geometry_columns: could not determine the number of dimensions', quote_ident(gcs.attname), quote_ident(gcs.nspname), quote_ident(gcs.relname);
	ELSIF (gtype IS NULL) THEN
	    RAISE WARNING 'Not inserting ''%'' in ''%.%'' into geometry_columns: could not determine the geometry type', quote_ident(gcs.attname), quote_ident(gcs.nspname), quote_ident(gcs.relname);
	ELSE
	    -- Only insert into geometry_columns if table constraints could be applied.
	    IF (gc_is_valid) THEN
	        INSERT INTO geometry_columns (f_table_catalog,f_table_schema, f_table_name, f_geometry_column, coord_dimension, srid, type) 
	        VALUES ('', gcs.nspname, gcs.relname, gcs.attname, gndims, gsrid, gtype);
	        inserted := inserted + 1;
	    END IF;
	END IF;
	END LOOP;

	-- Add views to geometry columns table
	FOR gcs IN 
	SELECT n.nspname, c.relname, a.attname
	    FROM pg_class c, 
	         pg_attribute a, 
	         pg_type t, 
	         pg_namespace n
	    WHERE c.relkind = 'v'
	    AND t.typname = 'geometry'
	    AND a.attisdropped = false
	    AND a.atttypid = t.oid
	    AND a.attrelid = c.oid
	    AND c.relnamespace = n.oid
	    AND n.nspname NOT ILIKE 'pg_temp%'
	    AND c.oid = tbl_oid
	LOOP            
	    RAISE DEBUG 'Processing view %.%.%', gcs.nspname, gcs.relname, gcs.attname;

	    EXECUTE 'SELECT public.ndims(' || quote_ident(gcs.attname) || ') 
	             FROM ' || quote_ident(gcs.nspname) || '.' || quote_ident(gcs.relname) || ' 
	             WHERE ' || quote_ident(gcs.attname) || ' IS NOT NULL LIMIT 1' 
	        INTO gc;
	    gndims := gc.ndims;
	    
	    EXECUTE 'SELECT public.srid(' || quote_ident(gcs.attname) || ') 
	             FROM ' || quote_ident(gcs.nspname) || '.' || quote_ident(gcs.relname) || ' 
	             WHERE ' || quote_ident(gcs.attname) || ' IS NOT NULL LIMIT 1' 
	        INTO gc;
	    gsrid := gc.srid;
	    
	    EXECUTE 'SELECT public.geometrytype(' || quote_ident(gcs.attname) || ') 
	             FROM ' || quote_ident(gcs.nspname) || '.' || quote_ident(gcs.relname) || ' 
	             WHERE ' || quote_ident(gcs.attname) || ' IS NOT NULL LIMIT 1' 
	        INTO gc;
	    gtype := gc.geometrytype;
	    
	    IF (gndims IS NULL) THEN
	        RAISE WARNING 'Not inserting ''%'' in ''%.%'' into geometry_columns: could not determine ndims', quote_ident(gcs.attname), quote_ident(gcs.nspname), quote_ident(gcs.relname);
	    ELSIF (gsrid IS NULL) THEN
	        RAISE WARNING 'Not inserting ''%'' in ''%.%'' into geometry_columns: could not determine srid', quote_ident(gcs.attname), quote_ident(gcs.nspname), quote_ident(gcs.relname);
	    ELSIF (gtype IS NULL) THEN
	        RAISE WARNING 'Not inserting ''%'' in ''%.%'' into geometry_columns: could not determine gtype', quote_ident(gcs.attname), quote_ident(gcs.nspname), quote_ident(gcs.relname);
	    ELSE
	        query := 'INSERT INTO geometry_columns (f_table_catalog,f_table_schema, f_table_name, f_geometry_column, coord_dimension, srid, type) ' ||
	                 'VALUES ('''', ' || quote_literal(gcs.nspname) || ',' || quote_literal(gcs.relname) || ',' || quote_literal(gcs.attname) || ',' || gndims || ',' || gsrid || ',' || quote_literal(gtype) || ')';
	        EXECUTE query;
	        inserted := inserted + 1;
	    END IF;
	END LOOP;
	
	RETURN inserted;
END

$$
    LANGUAGE plpgsql;


--
-- TOC entry 3145 (class 0 OID 0)
-- Dependencies: 516
-- Name: FUNCTION populate_geometry_columns(tbl_oid oid); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION populate_geometry_columns(tbl_oid oid) IS 'args: relation_oid - Ensures geometry columns have appropriate spatial constraints and exist in the geometry_columns table.';


--
-- TOC entry 544 (class 1255 OID 17434)
-- Dependencies: 6 1340
-- Name: postgis_full_version(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION postgis_full_version() RETURNS text
    AS $$ 
DECLARE
	libver text;
	projver text;
	geosver text;
	usestats bool;
	dbproc text;
	relproc text;
	fullver text;
BEGIN
	SELECT postgis_lib_version() INTO libver;
	SELECT postgis_proj_version() INTO projver;
	SELECT postgis_geos_version() INTO geosver;
	SELECT postgis_uses_stats() INTO usestats;
	SELECT postgis_scripts_installed() INTO dbproc;
	SELECT postgis_scripts_released() INTO relproc;

	fullver = 'POSTGIS="' || libver || '"';

	IF  geosver IS NOT NULL THEN
		fullver = fullver || ' GEOS="' || geosver || '"';
	END IF;

	IF  projver IS NOT NULL THEN
		fullver = fullver || ' PROJ="' || projver || '"';
	END IF;

	IF usestats THEN
		fullver = fullver || ' USE_STATS';
	END IF;

	-- fullver = fullver || ' DBPROC="' || dbproc || '"';
	-- fullver = fullver || ' RELPROC="' || relproc || '"';

	IF dbproc != relproc THEN
		fullver = fullver || ' (procs from ' || dbproc || ' need upgrade)';
	END IF;

	RETURN fullver;
END
$$
    LANGUAGE plpgsql IMMUTABLE;


--
-- TOC entry 3146 (class 0 OID 0)
-- Dependencies: 544
-- Name: FUNCTION postgis_full_version(); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION postgis_full_version() IS 'Reports full postgis version and build configuration infos.';


--
-- TOC entry 541 (class 1255 OID 17431)
-- Dependencies: 6
-- Name: postgis_geos_version(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION postgis_geos_version() RETURNS text
    AS '$libdir/postgis-1.4', 'postgis_geos_version'
    LANGUAGE c IMMUTABLE;


--
-- TOC entry 3147 (class 0 OID 0)
-- Dependencies: 541
-- Name: FUNCTION postgis_geos_version(); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION postgis_geos_version() IS 'Returns the version number of the GEOS library.';


--
-- TOC entry 312 (class 1255 OID 17144)
-- Dependencies: 6
-- Name: postgis_gist_joinsel(internal, oid, internal, smallint); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION postgis_gist_joinsel(internal, oid, internal, smallint) RETURNS double precision
    AS '$libdir/postgis-1.4', 'LWGEOM_gist_joinsel'
    LANGUAGE c;


--
-- TOC entry 310 (class 1255 OID 17142)
-- Dependencies: 6
-- Name: postgis_gist_sel(internal, oid, internal, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION postgis_gist_sel(internal, oid, internal, integer) RETURNS double precision
    AS '$libdir/postgis-1.4', 'LWGEOM_gist_sel'
    LANGUAGE c;


--
-- TOC entry 543 (class 1255 OID 17433)
-- Dependencies: 6
-- Name: postgis_lib_build_date(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION postgis_lib_build_date() RETURNS text
    AS '$libdir/postgis-1.4', 'postgis_lib_build_date'
    LANGUAGE c IMMUTABLE;


--
-- TOC entry 3148 (class 0 OID 0)
-- Dependencies: 543
-- Name: FUNCTION postgis_lib_build_date(); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION postgis_lib_build_date() IS 'Returns build date of the PostGIS library.';


--
-- TOC entry 538 (class 1255 OID 17428)
-- Dependencies: 6
-- Name: postgis_lib_version(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION postgis_lib_version() RETURNS text
    AS '$libdir/postgis-1.4', 'postgis_lib_version'
    LANGUAGE c IMMUTABLE;


--
-- TOC entry 3149 (class 0 OID 0)
-- Dependencies: 538
-- Name: FUNCTION postgis_lib_version(); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION postgis_lib_version() IS 'Returns the version number of the PostGIS library.';


--
-- TOC entry 536 (class 1255 OID 17426)
-- Dependencies: 6
-- Name: postgis_proj_version(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION postgis_proj_version() RETURNS text
    AS '$libdir/postgis-1.4', 'postgis_proj_version'
    LANGUAGE c IMMUTABLE;


--
-- TOC entry 3150 (class 0 OID 0)
-- Dependencies: 536
-- Name: FUNCTION postgis_proj_version(); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION postgis_proj_version() IS 'Returns the version number of the PROJ4 library.';


--
-- TOC entry 542 (class 1255 OID 17432)
-- Dependencies: 6
-- Name: postgis_scripts_build_date(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION postgis_scripts_build_date() RETURNS text
    AS $$SELECT '2009-12-28 06:03:36'::text AS version$$
    LANGUAGE sql IMMUTABLE;


--
-- TOC entry 3151 (class 0 OID 0)
-- Dependencies: 542
-- Name: FUNCTION postgis_scripts_build_date(); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION postgis_scripts_build_date() IS 'Returns build date of the PostGIS scripts.';


--
-- TOC entry 537 (class 1255 OID 17427)
-- Dependencies: 6
-- Name: postgis_scripts_installed(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION postgis_scripts_installed() RETURNS text
    AS $$SELECT '1.4.1'::text AS version$$
    LANGUAGE sql IMMUTABLE;


--
-- TOC entry 3152 (class 0 OID 0)
-- Dependencies: 537
-- Name: FUNCTION postgis_scripts_installed(); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION postgis_scripts_installed() IS 'Returns version of the postgis scripts installed in this database.';


--
-- TOC entry 539 (class 1255 OID 17429)
-- Dependencies: 6
-- Name: postgis_scripts_released(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION postgis_scripts_released() RETURNS text
    AS '$libdir/postgis-1.4', 'postgis_scripts_released'
    LANGUAGE c IMMUTABLE;


--
-- TOC entry 3153 (class 0 OID 0)
-- Dependencies: 539
-- Name: FUNCTION postgis_scripts_released(); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION postgis_scripts_released() IS 'Returns the version number of the lwpostgis.sql script released with the installed postgis lib.';


--
-- TOC entry 540 (class 1255 OID 17430)
-- Dependencies: 6
-- Name: postgis_uses_stats(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION postgis_uses_stats() RETURNS boolean
    AS '$libdir/postgis-1.4', 'postgis_uses_stats'
    LANGUAGE c IMMUTABLE;


--
-- TOC entry 3154 (class 0 OID 0)
-- Dependencies: 540
-- Name: FUNCTION postgis_uses_stats(); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION postgis_uses_stats() IS 'Returns TRUE if STATS usage has been enabled.';


--
-- TOC entry 535 (class 1255 OID 17425)
-- Dependencies: 6
-- Name: postgis_version(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION postgis_version() RETURNS text
    AS '$libdir/postgis-1.4', 'postgis_version'
    LANGUAGE c IMMUTABLE;


--
-- TOC entry 3155 (class 0 OID 0)
-- Dependencies: 535
-- Name: FUNCTION postgis_version(); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION postgis_version() IS 'Returns PostGIS version number and compile-time options.';


--
-- TOC entry 517 (class 1255 OID 17407)
-- Dependencies: 6 1340
-- Name: probe_geometry_columns(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION probe_geometry_columns() RETURNS text
    AS $$
DECLARE
	inserted integer;
	oldcount integer;
	probed integer;
	stale integer;
BEGIN

	SELECT count(*) INTO oldcount FROM geometry_columns;

	SELECT count(*) INTO probed
		FROM pg_class c, pg_attribute a, pg_type t, 
			pg_namespace n,
			pg_constraint sridcheck, pg_constraint typecheck

		WHERE t.typname = 'geometry'
		AND a.atttypid = t.oid
		AND a.attrelid = c.oid
		AND c.relnamespace = n.oid
		AND sridcheck.connamespace = n.oid
		AND typecheck.connamespace = n.oid
		AND sridcheck.conrelid = c.oid
		AND sridcheck.consrc LIKE '(srid('||a.attname||') = %)'
		AND typecheck.conrelid = c.oid
		AND typecheck.consrc LIKE
		'((geometrytype('||a.attname||') = ''%''::text) OR (% IS NULL))'
		;

	INSERT INTO geometry_columns SELECT
		''::varchar as f_table_catalogue,
		n.nspname::varchar as f_table_schema,
		c.relname::varchar as f_table_name,
		a.attname::varchar as f_geometry_column,
		2 as coord_dimension,
		trim(both  ' =)' from 
			replace(replace(split_part(
				sridcheck.consrc, ' = ', 2), ')', ''), '(', ''))::integer AS srid,
		trim(both ' =)''' from substr(typecheck.consrc, 
			strpos(typecheck.consrc, '='),
			strpos(typecheck.consrc, '::')-
			strpos(typecheck.consrc, '=')
			))::varchar as type
		FROM pg_class c, pg_attribute a, pg_type t, 
			pg_namespace n,
			pg_constraint sridcheck, pg_constraint typecheck
		WHERE t.typname = 'geometry'
		AND a.atttypid = t.oid
		AND a.attrelid = c.oid
		AND c.relnamespace = n.oid
		AND sridcheck.connamespace = n.oid
		AND typecheck.connamespace = n.oid
		AND sridcheck.conrelid = c.oid
		AND sridcheck.consrc LIKE '(st_srid('||a.attname||') = %)'
		AND typecheck.conrelid = c.oid
		AND typecheck.consrc LIKE
		'((geometrytype('||a.attname||') = ''%''::text) OR (% IS NULL))'

	        AND NOT EXISTS (
	                SELECT oid FROM geometry_columns gc
	                WHERE c.relname::varchar = gc.f_table_name
	                AND n.nspname::varchar = gc.f_table_schema
	                AND a.attname::varchar = gc.f_geometry_column
	        );

	GET DIAGNOSTICS inserted = ROW_COUNT;

	IF oldcount > probed THEN
		stale = oldcount-probed;
	ELSE
		stale = 0;
	END IF;

	RETURN 'probed:'||probed::text||
		' inserted:'||inserted::text||
		' conflicts:'||(probed-inserted)::text||
		' stale:'||stale::text;
END

$$
    LANGUAGE plpgsql;


--
-- TOC entry 3156 (class 0 OID 0)
-- Dependencies: 517
-- Name: FUNCTION probe_geometry_columns(); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION probe_geometry_columns() IS 'Scans all tables with PostGIS geometry constraints and adds them to the geometry_columns table if they are not there.';


--
-- TOC entry 637 (class 1255 OID 17560)
-- Dependencies: 6 1202 1202
-- Name: relate(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION relate(geometry, geometry) RETURNS text
    AS '$libdir/postgis-1.4', 'relate_full'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 639 (class 1255 OID 17562)
-- Dependencies: 6 1202 1202
-- Name: relate(geometry, geometry, text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION relate(geometry, geometry, text) RETURNS boolean
    AS '$libdir/postgis-1.4', 'relate_pattern'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 481 (class 1255 OID 17346)
-- Dependencies: 6 1202 1202
-- Name: removepoint(geometry, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION removepoint(geometry, integer) RETURNS geometry
    AS '$libdir/postgis-1.4', 'LWGEOM_removepoint'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 513 (class 1255 OID 17402)
-- Dependencies: 6
-- Name: rename_geometry_table_constraints(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION rename_geometry_table_constraints() RETURNS text
    AS $$
SELECT 'rename_geometry_table_constraint() is obsoleted'::text
$$
    LANGUAGE sql IMMUTABLE;


--
-- TOC entry 430 (class 1255 OID 17295)
-- Dependencies: 6 1202 1202
-- Name: reverse(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION reverse(geometry) RETURNS geometry
    AS '$libdir/postgis-1.4', 'LWGEOM_reverse'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 233 (class 1255 OID 17044)
-- Dependencies: 1202 6 1202
-- Name: rotate(geometry, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION rotate(geometry, double precision) RETURNS geometry
    AS $_$SELECT rotateZ($1, $2)$_$
    LANGUAGE sql IMMUTABLE STRICT;


--
-- TOC entry 235 (class 1255 OID 17046)
-- Dependencies: 1202 6 1202
-- Name: rotatex(geometry, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION rotatex(geometry, double precision) RETURNS geometry
    AS $_$SELECT affine($1, 1, 0, 0, 0, cos($2), -sin($2), 0, sin($2), cos($2), 0, 0, 0)$_$
    LANGUAGE sql IMMUTABLE STRICT;


--
-- TOC entry 237 (class 1255 OID 17048)
-- Dependencies: 1202 6 1202
-- Name: rotatey(geometry, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION rotatey(geometry, double precision) RETURNS geometry
    AS $_$SELECT affine($1,  cos($2), 0, sin($2),  0, 1, 0,  -sin($2), 0, cos($2), 0,  0, 0)$_$
    LANGUAGE sql IMMUTABLE STRICT;


--
-- TOC entry 231 (class 1255 OID 17042)
-- Dependencies: 1202 6 1202
-- Name: rotatez(geometry, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION rotatez(geometry, double precision) RETURNS geometry
    AS $_$SELECT affine($1,  cos($2), -sin($2), 0,  sin($2), cos($2), 0,  0, 0, 1,  0, 0, 0)$_$
    LANGUAGE sql IMMUTABLE STRICT;


--
-- TOC entry 243 (class 1255 OID 17054)
-- Dependencies: 1202 1202 6
-- Name: scale(geometry, double precision, double precision, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION scale(geometry, double precision, double precision, double precision) RETURNS geometry
    AS $_$SELECT affine($1,  $2, 0, 0,  0, $3, 0,  0, 0, $4,  0, 0, 0)$_$
    LANGUAGE sql IMMUTABLE STRICT;


--
-- TOC entry 245 (class 1255 OID 17056)
-- Dependencies: 1202 6 1202
-- Name: scale(geometry, double precision, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION scale(geometry, double precision, double precision) RETURNS geometry
    AS $_$SELECT scale($1, $2, $3, 1)$_$
    LANGUAGE sql IMMUTABLE STRICT;


--
-- TOC entry 891 (class 1255 OID 17814)
-- Dependencies: 1202 1202 6
-- Name: se_envelopesintersect(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION se_envelopesintersect(geometry, geometry) RETURNS boolean
    AS $_$ 
	SELECT $1 && $2
	$_$
    LANGUAGE sql IMMUTABLE STRICT;


--
-- TOC entry 885 (class 1255 OID 17808)
-- Dependencies: 6 1202
-- Name: se_is3d(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION se_is3d(geometry) RETURNS boolean
    AS $_$ 
	SELECT CASE ST_zmflag($1)
	       WHEN 0 THEN false
	       WHEN 1 THEN false
	       WHEN 2 THEN true
	       WHEN 3 THEN true
	       ELSE false
	   END
	$_$
    LANGUAGE sql IMMUTABLE STRICT;


--
-- TOC entry 886 (class 1255 OID 17809)
-- Dependencies: 1202 6
-- Name: se_ismeasured(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION se_ismeasured(geometry) RETURNS boolean
    AS $_$ 
	SELECT CASE ST_zmflag($1)
	       WHEN 0 THEN false
	       WHEN 1 THEN true
	       WHEN 2 THEN false
	       WHEN 3 THEN true
	       ELSE false
	   END
	$_$
    LANGUAGE sql IMMUTABLE STRICT;


--
-- TOC entry 892 (class 1255 OID 17815)
-- Dependencies: 1202 6 1202
-- Name: se_locatealong(geometry, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION se_locatealong(geometry, double precision) RETURNS geometry
    AS $_$ SELECT locate_between_measures($1, $2, $2) $_$
    LANGUAGE sql IMMUTABLE STRICT;


--
-- TOC entry 893 (class 1255 OID 17816)
-- Dependencies: 1202 6 1202
-- Name: se_locatebetween(geometry, double precision, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION se_locatebetween(geometry, double precision, double precision) RETURNS geometry
    AS '$libdir/postgis-1.4', 'LWGEOM_locate_between_m'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 889 (class 1255 OID 17812)
-- Dependencies: 6 1202
-- Name: se_m(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION se_m(geometry) RETURNS double precision
    AS '$libdir/postgis-1.4', 'LWGEOM_m_point'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 888 (class 1255 OID 17811)
-- Dependencies: 1202 6
-- Name: se_z(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION se_z(geometry) RETURNS double precision
    AS '$libdir/postgis-1.4', 'LWGEOM_z_point'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 582 (class 1255 OID 17488)
-- Dependencies: 6 1202 1202
-- Name: segmentize(geometry, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION segmentize(geometry, double precision) RETURNS geometry
    AS '$libdir/postgis-1.4', 'LWGEOM_segmentize2d'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 364 (class 1255 OID 17229)
-- Dependencies: 6 1211 1211
-- Name: setfactor(chip, real); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION setfactor(chip, real) RETURNS chip
    AS '$libdir/postgis-1.4', 'CHIP_setFactor'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 483 (class 1255 OID 17348)
-- Dependencies: 6 1202 1202 1202
-- Name: setpoint(geometry, integer, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION setpoint(geometry, integer, geometry) RETURNS geometry
    AS '$libdir/postgis-1.4', 'LWGEOM_setpoint_linestring'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 363 (class 1255 OID 17228)
-- Dependencies: 6 1211 1211
-- Name: setsrid(chip, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION setsrid(chip, integer) RETURNS chip
    AS '$libdir/postgis-1.4', 'CHIP_setSRID'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 752 (class 1255 OID 17675)
-- Dependencies: 1202 6 1202
-- Name: setsrid(geometry, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION setsrid(geometry, integer) RETURNS geometry
    AS '$libdir/postgis-1.4', 'LWGEOM_setSRID'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 249 (class 1255 OID 17060)
-- Dependencies: 6 1202 1202
-- Name: shift_longitude(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION shift_longitude(geometry) RETURNS geometry
    AS '$libdir/postgis-1.4', 'LWGEOM_longitude_shift'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 572 (class 1255 OID 17478)
-- Dependencies: 6 1202 1202
-- Name: simplify(geometry, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION simplify(geometry, double precision) RETURNS geometry
    AS '$libdir/postgis-1.4', 'LWGEOM_simplify2d'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 574 (class 1255 OID 17480)
-- Dependencies: 6 1202 1202
-- Name: snaptogrid(geometry, double precision, double precision, double precision, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION snaptogrid(geometry, double precision, double precision, double precision, double precision) RETURNS geometry
    AS '$libdir/postgis-1.4', 'LWGEOM_snaptogrid'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 576 (class 1255 OID 17482)
-- Dependencies: 6 1202 1202
-- Name: snaptogrid(geometry, double precision, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION snaptogrid(geometry, double precision, double precision) RETURNS geometry
    AS $_$SELECT SnapToGrid($1, 0, 0, $2, $3)$_$
    LANGUAGE sql IMMUTABLE STRICT;


--
-- TOC entry 578 (class 1255 OID 17484)
-- Dependencies: 6 1202 1202
-- Name: snaptogrid(geometry, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION snaptogrid(geometry, double precision) RETURNS geometry
    AS $_$SELECT SnapToGrid($1, 0, 0, $2, $2)$_$
    LANGUAGE sql IMMUTABLE STRICT;


--
-- TOC entry 580 (class 1255 OID 17486)
-- Dependencies: 6 1202 1202 1202
-- Name: snaptogrid(geometry, geometry, double precision, double precision, double precision, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION snaptogrid(geometry, geometry, double precision, double precision, double precision, double precision) RETURNS geometry
    AS '$libdir/postgis-1.4', 'LWGEOM_snaptogrid_pointoff'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 213 (class 1255 OID 17021)
-- Dependencies: 6 1199
-- Name: spheroid_in(cstring); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION spheroid_in(cstring) RETURNS spheroid
    AS '$libdir/postgis-1.4', 'ellipsoid_in'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 215 (class 1255 OID 17023)
-- Dependencies: 1199 6
-- Name: spheroid_out(spheroid); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION spheroid_out(spheroid) RETURNS cstring
    AS '$libdir/postgis-1.4', 'ellipsoid_out'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 351 (class 1255 OID 17216)
-- Dependencies: 6 1211
-- Name: srid(chip); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION srid(chip) RETURNS integer
    AS '$libdir/postgis-1.4', 'CHIP_getSRID'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 750 (class 1255 OID 17673)
-- Dependencies: 6 1202
-- Name: srid(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION srid(geometry) RETURNS integer
    AS '$libdir/postgis-1.4', 'LWGEOM_getSRID'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 346 (class 1255 OID 17211)
-- Dependencies: 6 1202 1202
-- Name: st_addbbox(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_addbbox(geometry) RETURNS geometry
    AS '$libdir/postgis-1.4', 'LWGEOM_addBBOX'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 3157 (class 0 OID 0)
-- Dependencies: 346
-- Name: FUNCTION st_addbbox(geometry); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_addbbox(geometry) IS 'args: geomA - Add bounding box to the geometry.';


--
-- TOC entry 478 (class 1255 OID 17343)
-- Dependencies: 6 1202 1202 1202
-- Name: st_addpoint(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_addpoint(geometry, geometry) RETURNS geometry
    AS '$libdir/postgis-1.4', 'LWGEOM_addpoint'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 3158 (class 0 OID 0)
-- Dependencies: 478
-- Name: FUNCTION st_addpoint(geometry, geometry); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_addpoint(geometry, geometry) IS 'args: linestring, point - Adds a point to a LineString before point <position> (0-based index).';


--
-- TOC entry 480 (class 1255 OID 17345)
-- Dependencies: 6 1202 1202 1202
-- Name: st_addpoint(geometry, geometry, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_addpoint(geometry, geometry, integer) RETURNS geometry
    AS '$libdir/postgis-1.4', 'LWGEOM_addpoint'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 3159 (class 0 OID 0)
-- Dependencies: 480
-- Name: FUNCTION st_addpoint(geometry, geometry, integer); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_addpoint(geometry, geometry, integer) IS 'args: linestring, point, position - Adds a point to a LineString before point <position> (0-based index).';


--
-- TOC entry 228 (class 1255 OID 17039)
-- Dependencies: 6 1202 1202
-- Name: st_affine(geometry, double precision, double precision, double precision, double precision, double precision, double precision, double precision, double precision, double precision, double precision, double precision, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_affine(geometry, double precision, double precision, double precision, double precision, double precision, double precision, double precision, double precision, double precision, double precision, double precision, double precision) RETURNS geometry
    AS '$libdir/postgis-1.4', 'LWGEOM_affine'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 3160 (class 0 OID 0)
-- Dependencies: 228
-- Name: FUNCTION st_affine(geometry, double precision, double precision, double precision, double precision, double precision, double precision, double precision, double precision, double precision, double precision, double precision, double precision); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_affine(geometry, double precision, double precision, double precision, double precision, double precision, double precision, double precision, double precision, double precision, double precision, double precision, double precision) IS 'args: geomA, a, b, c, d, e, f, g, h, i, xoff, yoff, zoff - Applies a 3d affine transformation to the geometry to do things like translate, rotate, scale in one step.';


--
-- TOC entry 230 (class 1255 OID 17041)
-- Dependencies: 1202 6 1202
-- Name: st_affine(geometry, double precision, double precision, double precision, double precision, double precision, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_affine(geometry, double precision, double precision, double precision, double precision, double precision, double precision) RETURNS geometry
    AS $_$SELECT affine($1,  $2, $3, 0,  $4, $5, 0,  0, 0, 1,  $6, $7, 0)$_$
    LANGUAGE sql IMMUTABLE STRICT;


--
-- TOC entry 3161 (class 0 OID 0)
-- Dependencies: 230
-- Name: FUNCTION st_affine(geometry, double precision, double precision, double precision, double precision, double precision, double precision); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_affine(geometry, double precision, double precision, double precision, double precision, double precision, double precision) IS 'args: geomA, a, b, d, e, xoff, yoff - Applies a 3d affine transformation to the geometry to do things like translate, rotate, scale in one step.';


--
-- TOC entry 395 (class 1255 OID 17260)
-- Dependencies: 6 1202
-- Name: st_area(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_area(geometry) RETURNS double precision
    AS '$libdir/postgis-1.4', 'LWGEOM_area_polygon'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 3162 (class 0 OID 0)
-- Dependencies: 395
-- Name: FUNCTION st_area(geometry); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_area(geometry) IS 'args: g1 - Returns the area of the geometry if it is a polygon or multi-polygon.';


--
-- TOC entry 393 (class 1255 OID 17258)
-- Dependencies: 6 1202
-- Name: st_area2d(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_area2d(geometry) RETURNS double precision
    AS '$libdir/postgis-1.4', 'LWGEOM_area_polygon'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 755 (class 1255 OID 17678)
-- Dependencies: 1202 6
-- Name: st_asbinary(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_asbinary(geometry) RETURNS bytea
    AS '$libdir/postgis-1.4', 'LWGEOM_asBinary'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 3163 (class 0 OID 0)
-- Dependencies: 755
-- Name: FUNCTION st_asbinary(geometry); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_asbinary(geometry) IS 'args: g1 - Return the Well-Known Binary (WKB) representation of the geometry without SRID meta data.';


--
-- TOC entry 757 (class 1255 OID 17680)
-- Dependencies: 6 1202
-- Name: st_asbinary(geometry, text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_asbinary(geometry, text) RETURNS bytea
    AS '$libdir/postgis-1.4', 'LWGEOM_asBinary'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 3164 (class 0 OID 0)
-- Dependencies: 757
-- Name: FUNCTION st_asbinary(geometry, text); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_asbinary(geometry, text) IS 'args: g1, NDR_or_XDR - Return the Well-Known Binary (WKB) representation of the geometry without SRID meta data.';


--
-- TOC entry 445 (class 1255 OID 17310)
-- Dependencies: 6 1202
-- Name: st_asewkb(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_asewkb(geometry) RETURNS bytea
    AS '$libdir/postgis-1.4', 'WKBFromLWGEOM'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 3165 (class 0 OID 0)
-- Dependencies: 445
-- Name: FUNCTION st_asewkb(geometry); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_asewkb(geometry) IS 'args: g1 - Return the Well-Known Binary (WKB) representation of the geometry with SRID meta data.';


--
-- TOC entry 451 (class 1255 OID 17316)
-- Dependencies: 1202 6
-- Name: st_asewkb(geometry, text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_asewkb(geometry, text) RETURNS bytea
    AS '$libdir/postgis-1.4', 'WKBFromLWGEOM'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 3166 (class 0 OID 0)
-- Dependencies: 451
-- Name: FUNCTION st_asewkb(geometry, text); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_asewkb(geometry, text) IS 'args: g1, NDR_or_XDR - Return the Well-Known Binary (WKB) representation of the geometry with SRID meta data.';


--
-- TOC entry 443 (class 1255 OID 17308)
-- Dependencies: 6 1202
-- Name: st_asewkt(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_asewkt(geometry) RETURNS text
    AS '$libdir/postgis-1.4', 'LWGEOM_asEWKT'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 3167 (class 0 OID 0)
-- Dependencies: 443
-- Name: FUNCTION st_asewkt(geometry); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_asewkt(geometry) IS 'args: g1 - Return the Well-Known Text (WKT) representation of the geometry with SRID meta data.';


--
-- TOC entry 706 (class 1255 OID 17629)
-- Dependencies: 6 1202
-- Name: st_asgeojson(geometry, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_asgeojson(geometry, integer) RETURNS text
    AS $_$SELECT _ST_AsGeoJson(1, $1, $2, 0)$_$
    LANGUAGE sql IMMUTABLE STRICT;


--
-- TOC entry 3168 (class 0 OID 0)
-- Dependencies: 706
-- Name: FUNCTION st_asgeojson(geometry, integer); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_asgeojson(geometry, integer) IS 'args: g1, max_decimal_digits - Return the geometry as a GeoJSON element.';


--
-- TOC entry 707 (class 1255 OID 17630)
-- Dependencies: 6 1202
-- Name: st_asgeojson(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_asgeojson(geometry) RETURNS text
    AS $_$SELECT _ST_AsGeoJson(1, $1, 15, 0)$_$
    LANGUAGE sql IMMUTABLE STRICT;


--
-- TOC entry 3169 (class 0 OID 0)
-- Dependencies: 707
-- Name: FUNCTION st_asgeojson(geometry); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_asgeojson(geometry) IS 'args: g1 - Return the geometry as a GeoJSON element.';


--
-- TOC entry 708 (class 1255 OID 17631)
-- Dependencies: 1202 6
-- Name: st_asgeojson(integer, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_asgeojson(integer, geometry) RETURNS text
    AS $_$SELECT _ST_AsGeoJson($1, $2, 15, 0)$_$
    LANGUAGE sql IMMUTABLE STRICT;


--
-- TOC entry 3170 (class 0 OID 0)
-- Dependencies: 708
-- Name: FUNCTION st_asgeojson(integer, geometry); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_asgeojson(integer, geometry) IS 'args: version, g1 - Return the geometry as a GeoJSON element.';


--
-- TOC entry 709 (class 1255 OID 17632)
-- Dependencies: 1202 6
-- Name: st_asgeojson(integer, geometry, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_asgeojson(integer, geometry, integer) RETURNS text
    AS $_$SELECT _ST_AsGeoJson($1, $2, $3, 0)$_$
    LANGUAGE sql IMMUTABLE STRICT;


--
-- TOC entry 3171 (class 0 OID 0)
-- Dependencies: 709
-- Name: FUNCTION st_asgeojson(integer, geometry, integer); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_asgeojson(integer, geometry, integer) IS 'args: version, g1, max_decimal_digits - Return the geometry as a GeoJSON element.';


--
-- TOC entry 710 (class 1255 OID 17633)
-- Dependencies: 1202 6
-- Name: st_asgeojson(geometry, integer, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_asgeojson(geometry, integer, integer) RETURNS text
    AS $_$SELECT _ST_AsGeoJson(1, $1, $2, $3)$_$
    LANGUAGE sql IMMUTABLE STRICT;


--
-- TOC entry 3172 (class 0 OID 0)
-- Dependencies: 710
-- Name: FUNCTION st_asgeojson(geometry, integer, integer); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_asgeojson(geometry, integer, integer) IS 'args: g1, max_decimal_digits, options - Return the geometry as a GeoJSON element.';


--
-- TOC entry 711 (class 1255 OID 17634)
-- Dependencies: 1202 6
-- Name: st_asgeojson(integer, geometry, integer, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_asgeojson(integer, geometry, integer, integer) RETURNS text
    AS $_$SELECT _ST_AsGeoJson($1, $2, $3, $4)$_$
    LANGUAGE sql IMMUTABLE STRICT;


--
-- TOC entry 3173 (class 0 OID 0)
-- Dependencies: 711
-- Name: FUNCTION st_asgeojson(integer, geometry, integer, integer); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_asgeojson(integer, geometry, integer, integer) IS 'args: version, g1, max_decimal_digits, options - Return the geometry as a GeoJSON element.';


--
-- TOC entry 690 (class 1255 OID 17613)
-- Dependencies: 6 1202
-- Name: st_asgml(geometry, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_asgml(geometry, integer) RETURNS text
    AS $_$SELECT _ST_AsGML(2, $1, $2, 0)$_$
    LANGUAGE sql IMMUTABLE STRICT;


--
-- TOC entry 3174 (class 0 OID 0)
-- Dependencies: 690
-- Name: FUNCTION st_asgml(geometry, integer); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_asgml(geometry, integer) IS 'args: g1, precision - Return the geometry as a GML version 2 or 3 element.';


--
-- TOC entry 692 (class 1255 OID 17615)
-- Dependencies: 6 1202
-- Name: st_asgml(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_asgml(geometry) RETURNS text
    AS $_$SELECT _ST_AsGML(2, $1, 15, 0)$_$
    LANGUAGE sql IMMUTABLE STRICT;


--
-- TOC entry 3175 (class 0 OID 0)
-- Dependencies: 692
-- Name: FUNCTION st_asgml(geometry); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_asgml(geometry) IS 'args: g1 - Return the geometry as a GML version 2 or 3 element.';


--
-- TOC entry 693 (class 1255 OID 17616)
-- Dependencies: 6 1202
-- Name: st_asgml(integer, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_asgml(integer, geometry) RETURNS text
    AS $_$SELECT _ST_AsGML($1, $2, 15, 0)$_$
    LANGUAGE sql IMMUTABLE STRICT;


--
-- TOC entry 3176 (class 0 OID 0)
-- Dependencies: 693
-- Name: FUNCTION st_asgml(integer, geometry); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_asgml(integer, geometry) IS 'args: version, g1 - Return the geometry as a GML version 2 or 3 element.';


--
-- TOC entry 694 (class 1255 OID 17617)
-- Dependencies: 1202 6
-- Name: st_asgml(integer, geometry, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_asgml(integer, geometry, integer) RETURNS text
    AS $_$SELECT _ST_AsGML($1, $2, $3, 0)$_$
    LANGUAGE sql IMMUTABLE STRICT;


--
-- TOC entry 3177 (class 0 OID 0)
-- Dependencies: 694
-- Name: FUNCTION st_asgml(integer, geometry, integer); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_asgml(integer, geometry, integer) IS 'args: version, g1, precision - Return the geometry as a GML version 2 or 3 element.';


--
-- TOC entry 695 (class 1255 OID 17618)
-- Dependencies: 6 1202
-- Name: st_asgml(geometry, integer, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_asgml(geometry, integer, integer) RETURNS text
    AS $_$SELECT _ST_AsGML(2, $1, $2, $3)$_$
    LANGUAGE sql IMMUTABLE STRICT;


--
-- TOC entry 696 (class 1255 OID 17619)
-- Dependencies: 1202 6
-- Name: st_asgml(integer, geometry, integer, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_asgml(integer, geometry, integer, integer) RETURNS text
    AS $_$SELECT _ST_AsGML($1, $2, $3, $4)$_$
    LANGUAGE sql IMMUTABLE STRICT;


--
-- TOC entry 3178 (class 0 OID 0)
-- Dependencies: 696
-- Name: FUNCTION st_asgml(integer, geometry, integer, integer); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_asgml(integer, geometry, integer, integer) IS 'args: version, g1, precision, options - Return the geometry as a GML version 2 or 3 element.';


--
-- TOC entry 447 (class 1255 OID 17312)
-- Dependencies: 6 1202
-- Name: st_ashexewkb(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_ashexewkb(geometry) RETURNS text
    AS '$libdir/postgis-1.4', 'LWGEOM_asHEXEWKB'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 3179 (class 0 OID 0)
-- Dependencies: 447
-- Name: FUNCTION st_ashexewkb(geometry); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_ashexewkb(geometry) IS 'args: g1 - Returns a Geometry in HEXEWKB format (as text) using either little-endian (NDR) or big-endian (XDR) encoding.';


--
-- TOC entry 449 (class 1255 OID 17314)
-- Dependencies: 1202 6
-- Name: st_ashexewkb(geometry, text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_ashexewkb(geometry, text) RETURNS text
    AS '$libdir/postgis-1.4', 'LWGEOM_asHEXEWKB'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 3180 (class 0 OID 0)
-- Dependencies: 449
-- Name: FUNCTION st_ashexewkb(geometry, text); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_ashexewkb(geometry, text) IS 'args: g1, NDRorXDR - Returns a Geometry in HEXEWKB format (as text) using either little-endian (NDR) or big-endian (XDR) encoding.';


--
-- TOC entry 699 (class 1255 OID 17622)
-- Dependencies: 6 1202
-- Name: st_askml(geometry, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_askml(geometry, integer) RETURNS text
    AS $_$SELECT _ST_AsKML(2, ST_Transform($1,4326), $2)$_$
    LANGUAGE sql IMMUTABLE STRICT;


--
-- TOC entry 3181 (class 0 OID 0)
-- Dependencies: 699
-- Name: FUNCTION st_askml(geometry, integer); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_askml(geometry, integer) IS 'args: g1, precision - Return the geometry as a KML element. Several variants. Default version=2, default precision=15';


--
-- TOC entry 702 (class 1255 OID 17625)
-- Dependencies: 1202 6
-- Name: st_askml(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_askml(geometry) RETURNS text
    AS $_$SELECT _ST_AsKML(2, ST_Transform($1,4326), 15)$_$
    LANGUAGE sql IMMUTABLE STRICT;


--
-- TOC entry 3182 (class 0 OID 0)
-- Dependencies: 702
-- Name: FUNCTION st_askml(geometry); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_askml(geometry) IS 'args: g1 - Return the geometry as a KML element. Several variants. Default version=2, default precision=15';


--
-- TOC entry 703 (class 1255 OID 17626)
-- Dependencies: 6 1202
-- Name: st_askml(integer, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_askml(integer, geometry) RETURNS text
    AS $_$SELECT _ST_AsKML($1, ST_Transform($2,4326), 15)$_$
    LANGUAGE sql IMMUTABLE STRICT;


--
-- TOC entry 3183 (class 0 OID 0)
-- Dependencies: 703
-- Name: FUNCTION st_askml(integer, geometry); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_askml(integer, geometry) IS 'args: version, geom1 - Return the geometry as a KML element. Several variants. Default version=2, default precision=15';


--
-- TOC entry 704 (class 1255 OID 17627)
-- Dependencies: 1202 6
-- Name: st_askml(integer, geometry, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_askml(integer, geometry, integer) RETURNS text
    AS $_$SELECT _ST_AsKML($1, ST_Transform($2,4326), $3)$_$
    LANGUAGE sql IMMUTABLE STRICT;


--
-- TOC entry 3184 (class 0 OID 0)
-- Dependencies: 704
-- Name: FUNCTION st_askml(integer, geometry, integer); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_askml(integer, geometry, integer) IS 'args: version, geom1, precision - Return the geometry as a KML element. Several variants. Default version=2, default precision=15';


--
-- TOC entry 683 (class 1255 OID 17606)
-- Dependencies: 1202 6
-- Name: st_assvg(geometry, integer, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_assvg(geometry, integer, integer) RETURNS text
    AS '$libdir/postgis-1.4', 'assvg_geometry'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 3185 (class 0 OID 0)
-- Dependencies: 683
-- Name: FUNCTION st_assvg(geometry, integer, integer); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_assvg(geometry, integer, integer) IS 'args: g1, rel, maxdecimaldigits - Returns a Geometry in SVG path data.';


--
-- TOC entry 685 (class 1255 OID 17608)
-- Dependencies: 6 1202
-- Name: st_assvg(geometry, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_assvg(geometry, integer) RETURNS text
    AS '$libdir/postgis-1.4', 'assvg_geometry'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 3186 (class 0 OID 0)
-- Dependencies: 685
-- Name: FUNCTION st_assvg(geometry, integer); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_assvg(geometry, integer) IS 'args: g1, rel - Returns a Geometry in SVG path data.';


--
-- TOC entry 687 (class 1255 OID 17610)
-- Dependencies: 6 1202
-- Name: st_assvg(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_assvg(geometry) RETURNS text
    AS '$libdir/postgis-1.4', 'assvg_geometry'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 3187 (class 0 OID 0)
-- Dependencies: 687
-- Name: FUNCTION st_assvg(geometry); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_assvg(geometry) IS 'args: g1 - Returns a Geometry in SVG path data.';


--
-- TOC entry 759 (class 1255 OID 17682)
-- Dependencies: 6 1202
-- Name: st_astext(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_astext(geometry) RETURNS text
    AS '$libdir/postgis-1.4', 'LWGEOM_asText'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 3188 (class 0 OID 0)
-- Dependencies: 759
-- Name: FUNCTION st_astext(geometry); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_astext(geometry) IS 'args: g1 - Return the Well-Known Text (WKT) representation of the geometry without SRID metadata.';


--
-- TOC entry 407 (class 1255 OID 17272)
-- Dependencies: 6 1202 1202
-- Name: st_azimuth(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_azimuth(geometry, geometry) RETURNS double precision
    AS '$libdir/postgis-1.4', 'LWGEOM_azimuth'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 3189 (class 0 OID 0)
-- Dependencies: 407
-- Name: FUNCTION st_azimuth(geometry, geometry); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_azimuth(geometry, geometry) IS 'args: pointA, pointB - Returns the angle in radians from the horizontal of the vector defined by pointA and pointB';


--
-- TOC entry 867 (class 1255 OID 17790)
-- Dependencies: 6 1202 1340
-- Name: st_bdmpolyfromtext(text, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_bdmpolyfromtext(text, integer) RETURNS geometry
    AS $_$ 
DECLARE
	geomtext alias for $1;
	srid alias for $2;
	mline geometry;
	geom geometry;
BEGIN
	mline := ST_MultiLineStringFromText(geomtext, srid);

	IF mline IS NULL
	THEN
		RAISE EXCEPTION 'Input is not a MultiLinestring';
	END IF;

	geom := multi(ST_BuildArea(mline));

	RETURN geom;
END;
$_$
    LANGUAGE plpgsql IMMUTABLE STRICT;


--
-- TOC entry 3190 (class 0 OID 0)
-- Dependencies: 867
-- Name: FUNCTION st_bdmpolyfromtext(text, integer); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_bdmpolyfromtext(text, integer) IS 'args: WKT, srid - Construct a MultiPolygon given an arbitrary collection of closed linestrings as a MultiLineString text representation Well-Known text representation.';


--
-- TOC entry 865 (class 1255 OID 17788)
-- Dependencies: 6 1340 1202
-- Name: st_bdpolyfromtext(text, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_bdpolyfromtext(text, integer) RETURNS geometry
    AS $_$ 
DECLARE
	geomtext alias for $1;
	srid alias for $2;
	mline geometry;
	geom geometry;
BEGIN
	mline := ST_MultiLineStringFromText(geomtext, srid);

	IF mline IS NULL
	THEN
		RAISE EXCEPTION 'Input is not a MultiLinestring';
	END IF;

	geom := ST_BuildArea(mline);

	IF GeometryType(geom) != 'POLYGON'
	THEN
		RAISE EXCEPTION 'Input returns more then a single polygon, try using BdMPolyFromText instead';
	END IF;

	RETURN geom;
END;
$_$
    LANGUAGE plpgsql IMMUTABLE STRICT;


--
-- TOC entry 3191 (class 0 OID 0)
-- Dependencies: 865
-- Name: FUNCTION st_bdpolyfromtext(text, integer); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_bdpolyfromtext(text, integer) IS 'args: WKT, srid - Construct a Polygon given an arbitrary collection of closed linestrings as a MultiLineString Well-Known text representation.';


--
-- TOC entry 610 (class 1255 OID 17516)
-- Dependencies: 6 1202 1202
-- Name: st_boundary(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_boundary(geometry) RETURNS geometry
    AS '$libdir/postgis-1.4', 'boundary'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 3192 (class 0 OID 0)
-- Dependencies: 610
-- Name: FUNCTION st_boundary(geometry); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_boundary(geometry) IS 'args: geomA - Returns the closure of the combinatorial boundary of this Geometry.';


--
-- TOC entry 550 (class 1255 OID 17440)
-- Dependencies: 6 1202
-- Name: st_box(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_box(geometry) RETURNS box
    AS '$libdir/postgis-1.4', 'LWGEOM_to_BOX'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 556 (class 1255 OID 17446)
-- Dependencies: 6 1205
-- Name: st_box(box3d); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_box(box3d) RETURNS box
    AS '$libdir/postgis-1.4', 'BOX3D_to_BOX'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 258 (class 1255 OID 17074)
-- Dependencies: 6 1214 1208
-- Name: st_box2d(box3d_extent); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_box2d(box3d_extent) RETURNS box2d
    AS '$libdir/postgis-1.4', 'BOX3D_to_BOX2DFLOAT4'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 546 (class 1255 OID 17436)
-- Dependencies: 6 1214 1202
-- Name: st_box2d(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_box2d(geometry) RETURNS box2d
    AS '$libdir/postgis-1.4', 'LWGEOM_to_BOX2DFLOAT4'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 3193 (class 0 OID 0)
-- Dependencies: 546
-- Name: FUNCTION st_box2d(geometry); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_box2d(geometry) IS 'args: geomA - Returns a BOX2D representing the maximum extents of the geometry.';


--
-- TOC entry 552 (class 1255 OID 17442)
-- Dependencies: 6 1214 1205
-- Name: st_box2d(box3d); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_box2d(box3d) RETURNS box2d
    AS '$libdir/postgis-1.4', 'BOX3D_to_BOX2DFLOAT4'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 289 (class 1255 OID 17108)
-- Dependencies: 6 1214 1214
-- Name: st_box2d_contain(box2d, box2d); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_box2d_contain(box2d, box2d) RETURNS boolean
    AS '$libdir/postgis-1.4', 'BOX2D_contain'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 291 (class 1255 OID 17110)
-- Dependencies: 6 1214 1214
-- Name: st_box2d_contained(box2d, box2d); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_box2d_contained(box2d, box2d) RETURNS boolean
    AS '$libdir/postgis-1.4', 'BOX2D_contained'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 297 (class 1255 OID 17116)
-- Dependencies: 6 1214 1214
-- Name: st_box2d_intersects(box2d, box2d); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_box2d_intersects(box2d, box2d) RETURNS boolean
    AS '$libdir/postgis-1.4', 'BOX2D_intersects'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 285 (class 1255 OID 17104)
-- Dependencies: 6 1214 1214
-- Name: st_box2d_left(box2d, box2d); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_box2d_left(box2d, box2d) RETURNS boolean
    AS '$libdir/postgis-1.4', 'BOX2D_left'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 293 (class 1255 OID 17112)
-- Dependencies: 6 1214 1214
-- Name: st_box2d_overlap(box2d, box2d); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_box2d_overlap(box2d, box2d) RETURNS boolean
    AS '$libdir/postgis-1.4', 'BOX2D_overlap'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 281 (class 1255 OID 17100)
-- Dependencies: 6 1214 1214
-- Name: st_box2d_overleft(box2d, box2d); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_box2d_overleft(box2d, box2d) RETURNS boolean
    AS '$libdir/postgis-1.4', 'BOX2D_overleft'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 283 (class 1255 OID 17102)
-- Dependencies: 6 1214 1214
-- Name: st_box2d_overright(box2d, box2d); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_box2d_overright(box2d, box2d) RETURNS boolean
    AS '$libdir/postgis-1.4', 'BOX2D_overright'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 287 (class 1255 OID 17106)
-- Dependencies: 6 1214 1214
-- Name: st_box2d_right(box2d, box2d); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_box2d_right(box2d, box2d) RETURNS boolean
    AS '$libdir/postgis-1.4', 'BOX2D_right'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 295 (class 1255 OID 17114)
-- Dependencies: 6 1214 1214
-- Name: st_box2d_same(box2d, box2d); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_box2d_same(box2d, box2d) RETURNS boolean
    AS '$libdir/postgis-1.4', 'BOX2D_same'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 548 (class 1255 OID 17438)
-- Dependencies: 6 1205 1202
-- Name: st_box3d(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_box3d(geometry) RETURNS box3d
    AS '$libdir/postgis-1.4', 'LWGEOM_to_BOX3D'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 3194 (class 0 OID 0)
-- Dependencies: 548
-- Name: FUNCTION st_box3d(geometry); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_box3d(geometry) IS 'args: geomA - Returns a BOX3D representing the maximum extents of the geometry.';


--
-- TOC entry 554 (class 1255 OID 17444)
-- Dependencies: 6 1205 1214
-- Name: st_box3d(box2d); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_box3d(box2d) RETURNS box3d
    AS '$libdir/postgis-1.4', 'BOX2DFLOAT4_to_BOX3D'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 257 (class 1255 OID 17072)
-- Dependencies: 1205 6 1208
-- Name: st_box3d_extent(box3d_extent); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_box3d_extent(box3d_extent) RETURNS box3d
    AS '$libdir/postgis-1.4', 'BOX3D_extent_to_BOX3D'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 597 (class 1255 OID 17503)
-- Dependencies: 6 1202 1202
-- Name: st_buffer(geometry, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_buffer(geometry, double precision) RETURNS geometry
    AS '$libdir/postgis-1.4', 'buffer'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 3195 (class 0 OID 0)
-- Dependencies: 597
-- Name: FUNCTION st_buffer(geometry, double precision); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_buffer(geometry, double precision) IS 'args: g1, radius_of_buffer - Returns a geometry that represents all points whose distance from this Geometry is less than or equal to distance. Calculations are in the Spatial Reference System of this Geometry. The optional third parameter sets the number of segments used to approximate a quarter circle (defaults to 8).';


--
-- TOC entry 599 (class 1255 OID 17505)
-- Dependencies: 6 1202 1202
-- Name: st_buffer(geometry, double precision, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_buffer(geometry, double precision, integer) RETURNS geometry
    AS '$libdir/postgis-1.4', 'buffer'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 3196 (class 0 OID 0)
-- Dependencies: 599
-- Name: FUNCTION st_buffer(geometry, double precision, integer); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_buffer(geometry, double precision, integer) IS 'args: g1, radius_of_buffer, num_seg_quarter_circle - Returns a geometry that represents all points whose distance from this Geometry is less than or equal to distance. Calculations are in the Spatial Reference System of this Geometry. The optional third parameter sets the number of segments used to approximate a quarter circle (defaults to 8).';


--
-- TOC entry 490 (class 1255 OID 17355)
-- Dependencies: 6 1202 1202
-- Name: st_buildarea(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_buildarea(geometry) RETURNS geometry
    AS '$libdir/postgis-1.4', 'LWGEOM_buildarea'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 3197 (class 0 OID 0)
-- Dependencies: 490
-- Name: FUNCTION st_buildarea(geometry); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_buildarea(geometry) IS 'args: A - Creates an areal geometry formed by the constituent linework of given geometry';


--
-- TOC entry 571 (class 1255 OID 17461)
-- Dependencies: 6 1202
-- Name: st_bytea(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_bytea(geometry) RETURNS bytea
    AS '$libdir/postgis-1.4', 'LWGEOM_to_bytea'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 457 (class 1255 OID 17322)
-- Dependencies: 6
-- Name: st_cache_bbox(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_cache_bbox() RETURNS trigger
    AS '$libdir/postgis-1.4', 'cache_bbox'
    LANGUAGE c;


--
-- TOC entry 673 (class 1255 OID 17596)
-- Dependencies: 1202 6 1202
-- Name: st_centroid(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_centroid(geometry) RETURNS geometry
    AS '$libdir/postgis-1.4', 'centroid'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 3198 (class 0 OID 0)
-- Dependencies: 673
-- Name: FUNCTION st_centroid(geometry); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_centroid(geometry) IS 'args: g1 - Returns the geometric center of a geometry.';


--
-- TOC entry 620 (class 1255 OID 17526)
-- Dependencies: 6 1202 1202 1202
-- Name: st_collect(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_collect(geometry, geometry) RETURNS geometry
    AS '$libdir/postgis-1.4', 'LWGEOM_collect'
    LANGUAGE c IMMUTABLE;


--
-- TOC entry 3199 (class 0 OID 0)
-- Dependencies: 620
-- Name: FUNCTION st_collect(geometry, geometry); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_collect(geometry, geometry) IS 'args: g1, g2 - Return a specified ST_Geometry value from a collection of other geometries.';


--
-- TOC entry 625 (class 1255 OID 17533)
-- Dependencies: 6 1202 1204
-- Name: st_collect(geometry[]); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_collect(geometry[]) RETURNS geometry
    AS '$libdir/postgis-1.4', 'LWGEOM_collect_garray'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 3200 (class 0 OID 0)
-- Dependencies: 625
-- Name: FUNCTION st_collect(geometry[]); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_collect(geometry[]) IS 'args: g1_array - Return a specified ST_Geometry value from a collection of other geometries.';


--
-- TOC entry 624 (class 1255 OID 17532)
-- Dependencies: 6 1202 1204
-- Name: st_collect_garray(geometry[]); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_collect_garray(geometry[]) RETURNS geometry
    AS '$libdir/postgis-1.4', 'LWGEOM_collect_garray'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 618 (class 1255 OID 17524)
-- Dependencies: 6 1202 1202 1202
-- Name: st_collector(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_collector(geometry, geometry) RETURNS geometry
    AS '$libdir/postgis-1.4', 'LWGEOM_collect'
    LANGUAGE c IMMUTABLE;


--
-- TOC entry 500 (class 1255 OID 17369)
-- Dependencies: 1214 6 1214 1202
-- Name: st_combine_bbox(box2d, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_combine_bbox(box2d, geometry) RETURNS box2d
    AS '$libdir/postgis-1.4', 'BOX2DFLOAT4_combine'
    LANGUAGE c IMMUTABLE;


--
-- TOC entry 502 (class 1255 OID 17371)
-- Dependencies: 6 1208 1208 1202
-- Name: st_combine_bbox(box3d_extent, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_combine_bbox(box3d_extent, geometry) RETURNS box3d_extent
    AS '$libdir/postgis-1.4', 'BOX3D_combine'
    LANGUAGE c IMMUTABLE;


--
-- TOC entry 504 (class 1255 OID 17375)
-- Dependencies: 6 1205 1205 1202
-- Name: st_combine_bbox(box3d, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_combine_bbox(box3d, geometry) RETURNS box3d
    AS '$libdir/postgis-1.4', 'BOX3D_combine'
    LANGUAGE c IMMUTABLE;


--
-- TOC entry 362 (class 1255 OID 17227)
-- Dependencies: 6 1211
-- Name: st_compression(chip); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_compression(chip) RETURNS integer
    AS '$libdir/postgis-1.4', 'CHIP_getCompression'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 659 (class 1255 OID 17582)
-- Dependencies: 6 1202 1202
-- Name: st_contains(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_contains(geometry, geometry) RETURNS boolean
    AS $_$SELECT $1 && $2 AND _ST_Contains($1,$2)$_$
    LANGUAGE sql IMMUTABLE;


--
-- TOC entry 3201 (class 0 OID 0)
-- Dependencies: 659
-- Name: FUNCTION st_contains(geometry, geometry); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_contains(geometry, geometry) IS 'args: geomA, geomB - Returns true if and only if no points of B lie in the exterior of A, and at least one point of the interior of B lies in the interior of A.';


--
-- TOC entry 665 (class 1255 OID 17588)
-- Dependencies: 6 1202 1202
-- Name: st_containsproperly(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_containsproperly(geometry, geometry) RETURNS boolean
    AS $_$SELECT $1 && $2 AND _ST_ContainsProperly($1,$2)$_$
    LANGUAGE sql IMMUTABLE;


--
-- TOC entry 3202 (class 0 OID 0)
-- Dependencies: 665
-- Name: FUNCTION st_containsproperly(geometry, geometry); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_containsproperly(geometry, geometry) IS 'args: geomA, geomB - Returns true if B intersects the interior of A but not the boundary (or exterior). A does not contain properly itself, but does contain itself.';


--
-- TOC entry 601 (class 1255 OID 17507)
-- Dependencies: 6 1202 1202
-- Name: st_convexhull(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_convexhull(geometry) RETURNS geometry
    AS '$libdir/postgis-1.4', 'convexhull'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 3203 (class 0 OID 0)
-- Dependencies: 601
-- Name: FUNCTION st_convexhull(geometry); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_convexhull(geometry) IS 'args: geomA - The convex hull of a geometry represents the minimum convex geometry that encloses all geometries within the set.';


--
-- TOC entry 883 (class 1255 OID 17806)
-- Dependencies: 1202 6
-- Name: st_coorddim(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_coorddim(geometry) RETURNS smallint
    AS '$libdir/postgis-1.4', 'LWGEOM_ndims'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 3204 (class 0 OID 0)
-- Dependencies: 883
-- Name: FUNCTION st_coorddim(geometry); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_coorddim(geometry) IS 'args: geomA - Return the coordinate dimension of the ST_Geometry value.';


--
-- TOC entry 661 (class 1255 OID 17584)
-- Dependencies: 6 1202 1202
-- Name: st_coveredby(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_coveredby(geometry, geometry) RETURNS boolean
    AS $_$SELECT $1 && $2 AND _ST_CoveredBy($1,$2)$_$
    LANGUAGE sql IMMUTABLE;


--
-- TOC entry 3205 (class 0 OID 0)
-- Dependencies: 661
-- Name: FUNCTION st_coveredby(geometry, geometry); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_coveredby(geometry, geometry) IS 'args: geomA, geomB - Returns 1 (TRUE) if no point in Geometry A is outside Geometry B';


--
-- TOC entry 663 (class 1255 OID 17586)
-- Dependencies: 1202 1202 6
-- Name: st_covers(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_covers(geometry, geometry) RETURNS boolean
    AS $_$SELECT $1 && $2 AND _ST_Covers($1,$2)$_$
    LANGUAGE sql IMMUTABLE;


--
-- TOC entry 3206 (class 0 OID 0)
-- Dependencies: 663
-- Name: FUNCTION st_covers(geometry, geometry); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_covers(geometry, geometry) IS 'args: geomA, geomB - Returns 1 (TRUE) if no point in Geometry B is outside Geometry A';


--
-- TOC entry 653 (class 1255 OID 17576)
-- Dependencies: 6 1202 1202
-- Name: st_crosses(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_crosses(geometry, geometry) RETURNS boolean
    AS $_$SELECT $1 && $2 AND _ST_Crosses($1,$2)$_$
    LANGUAGE sql IMMUTABLE;


--
-- TOC entry 3207 (class 0 OID 0)
-- Dependencies: 653
-- Name: FUNCTION st_crosses(geometry, geometry); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_crosses(geometry, geometry) IS 'args: g1, g2 - Returns TRUE if the supplied geometries have some, but not all, interior points in common.';


--
-- TOC entry 894 (class 1255 OID 17817)
-- Dependencies: 1202 6 1202
-- Name: st_curvetoline(geometry, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_curvetoline(geometry, integer) RETURNS geometry
    AS '$libdir/postgis-1.4', 'LWGEOM_curve_segmentize'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 3208 (class 0 OID 0)
-- Dependencies: 894
-- Name: FUNCTION st_curvetoline(geometry, integer); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_curvetoline(geometry, integer) IS 'args: curveGeom, segments_per_qtr_circle - Converts a CIRCULARSTRING/CURVEDPOLYGON to a LINESTRING/POLYGON';


--
-- TOC entry 895 (class 1255 OID 17818)
-- Dependencies: 6 1202 1202
-- Name: st_curvetoline(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_curvetoline(geometry) RETURNS geometry
    AS $_$SELECT ST_CurveToLine($1, 32)$_$
    LANGUAGE sql IMMUTABLE STRICT;


--
-- TOC entry 3209 (class 0 OID 0)
-- Dependencies: 895
-- Name: FUNCTION st_curvetoline(geometry); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_curvetoline(geometry) IS 'args: curveGeom - Converts a CIRCULARSTRING/CURVEDPOLYGON to a LINESTRING/POLYGON';


--
-- TOC entry 360 (class 1255 OID 17225)
-- Dependencies: 6 1211
-- Name: st_datatype(chip); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_datatype(chip) RETURNS integer
    AS '$libdir/postgis-1.4', 'CHIP_getDatatype'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 608 (class 1255 OID 17514)
-- Dependencies: 6 1202 1202 1202
-- Name: st_difference(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_difference(geometry, geometry) RETURNS geometry
    AS '$libdir/postgis-1.4', 'difference'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 3210 (class 0 OID 0)
-- Dependencies: 608
-- Name: FUNCTION st_difference(geometry, geometry); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_difference(geometry, geometry) IS 'args: geomA, geomB - Returns a geometry that represents that part of geometry A that does not intersect with geometry B.';


--
-- TOC entry 721 (class 1255 OID 17644)
-- Dependencies: 6 1202
-- Name: st_dimension(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_dimension(geometry) RETURNS integer
    AS '$libdir/postgis-1.4', 'LWGEOM_dimension'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 3211 (class 0 OID 0)
-- Dependencies: 721
-- Name: FUNCTION st_dimension(geometry); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_dimension(geometry) IS 'args: g - The inherent dimension of this Geometry object, which must be less than or equal to the coordinate dimension.';


--
-- TOC entry 642 (class 1255 OID 17565)
-- Dependencies: 6 1202 1202
-- Name: st_disjoint(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_disjoint(geometry, geometry) RETURNS boolean
    AS '$libdir/postgis-1.4', 'disjoint'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 3212 (class 0 OID 0)
-- Dependencies: 642
-- Name: FUNCTION st_disjoint(geometry, geometry); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_disjoint(geometry, geometry) IS 'args: A, B - Returns TRUE if the Geometries do not "spatially intersect" - if they do not share any space together.';


--
-- TOC entry 401 (class 1255 OID 17266)
-- Dependencies: 6 1202 1202
-- Name: st_distance(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_distance(geometry, geometry) RETURNS double precision
    AS '$libdir/postgis-1.4', 'LWGEOM_mindistance2d'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 3213 (class 0 OID 0)
-- Dependencies: 401
-- Name: FUNCTION st_distance(geometry, geometry); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_distance(geometry, geometry) IS 'args: g1, g2 - Returns the 2-dimensional cartesian minimum distance between two geometries in projected units.';


--
-- TOC entry 399 (class 1255 OID 17264)
-- Dependencies: 6 1202 1202
-- Name: st_distance_sphere(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_distance_sphere(geometry, geometry) RETURNS double precision
    AS '$libdir/postgis-1.4', 'LWGEOM_distance_sphere'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 3214 (class 0 OID 0)
-- Dependencies: 399
-- Name: FUNCTION st_distance_sphere(geometry, geometry); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_distance_sphere(geometry, geometry) IS 'args: pointlonlatA, pointlonlatB - Returns linear distance in meters between two lon/lat points. Uses a spherical earth and radius of 6370986 meters. Faster than , but less accurate. Only implemented for points.';


--
-- TOC entry 397 (class 1255 OID 17262)
-- Dependencies: 6 1202 1202 1199
-- Name: st_distance_spheroid(geometry, geometry, spheroid); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_distance_spheroid(geometry, geometry, spheroid) RETURNS double precision
    AS '$libdir/postgis-1.4', 'LWGEOM_distance_ellipsoid_point'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 3215 (class 0 OID 0)
-- Dependencies: 397
-- Name: FUNCTION st_distance_spheroid(geometry, geometry, spheroid); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_distance_spheroid(geometry, geometry, spheroid) IS 'args: pointlonlatA, pointlonlatB, measurement_spheroid - Returns linear distance between two lon/lat points given a particular spheroid. Currently only implemented for points.';


--
-- TOC entry 348 (class 1255 OID 17213)
-- Dependencies: 6 1202 1202
-- Name: st_dropbbox(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_dropbbox(geometry) RETURNS geometry
    AS '$libdir/postgis-1.4', 'LWGEOM_dropBBOX'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 3216 (class 0 OID 0)
-- Dependencies: 348
-- Name: FUNCTION st_dropbbox(geometry); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_dropbbox(geometry) IS 'args: geomA - Drop the bounding box cache from the geometry.';


--
-- TOC entry 496 (class 1255 OID 17365)
-- Dependencies: 6 1217 1202
-- Name: st_dump(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_dump(geometry) RETURNS SETOF geometry_dump
    AS '$libdir/postgis-1.4', 'LWGEOM_dump'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 3217 (class 0 OID 0)
-- Dependencies: 496
-- Name: FUNCTION st_dump(geometry); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_dump(geometry) IS 'args: g1 - Returns a set of geometry_dump (geom,path) rows, that make up a geometry g1.';


--
-- TOC entry 498 (class 1255 OID 17367)
-- Dependencies: 6 1217 1202
-- Name: st_dumprings(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_dumprings(geometry) RETURNS SETOF geometry_dump
    AS '$libdir/postgis-1.4', 'LWGEOM_dump_rings'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 3218 (class 0 OID 0)
-- Dependencies: 498
-- Name: FUNCTION st_dumprings(geometry); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_dumprings(geometry) IS 'args: a_polygon - Returns a set of geometry_dump rows, representing the exterior and interior rings of a polygon.';


--
-- TOC entry 647 (class 1255 OID 17570)
-- Dependencies: 6 1202 1202
-- Name: st_dwithin(geometry, geometry, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_dwithin(geometry, geometry, double precision) RETURNS boolean
    AS $_$SELECT $1 && ST_Expand($2,$3) AND $2 && ST_Expand($1,$3) AND _ST_DWithin($1, $2, $3)$_$
    LANGUAGE sql IMMUTABLE;


--
-- TOC entry 3219 (class 0 OID 0)
-- Dependencies: 647
-- Name: FUNCTION st_dwithin(geometry, geometry, double precision); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_dwithin(geometry, geometry, double precision) IS 'args: g1, g2, distance - Returns true if the geometries are within the specified distance of one another';


--
-- TOC entry 745 (class 1255 OID 17668)
-- Dependencies: 6 1202 1202
-- Name: st_endpoint(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_endpoint(geometry) RETURNS geometry
    AS '$libdir/postgis-1.4', 'LWGEOM_endpoint_linestring'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 3220 (class 0 OID 0)
-- Dependencies: 745
-- Name: FUNCTION st_endpoint(geometry); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_endpoint(geometry) IS 'args: g - Returns the last point of a LINESTRING geometry as a POINT.';


--
-- TOC entry 429 (class 1255 OID 17294)
-- Dependencies: 6 1202 1202
-- Name: st_envelope(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_envelope(geometry) RETURNS geometry
    AS '$libdir/postgis-1.4', 'LWGEOM_envelope'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 3221 (class 0 OID 0)
-- Dependencies: 429
-- Name: FUNCTION st_envelope(geometry); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_envelope(geometry) IS 'args: g1 - Returns a geometry representing the bounding box of the supplied geometry.';


--
-- TOC entry 681 (class 1255 OID 17604)
-- Dependencies: 1202 6 1202
-- Name: st_equals(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_equals(geometry, geometry) RETURNS boolean
    AS '$libdir/postgis-1.4', 'geomequals'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 3222 (class 0 OID 0)
-- Dependencies: 681
-- Name: FUNCTION st_equals(geometry, geometry); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_equals(geometry, geometry) IS 'args: A, B - Returns true if the given geometries represent the same geometry. Directionality is ignored.';


--
-- TOC entry 506 (class 1255 OID 17379)
-- Dependencies: 6 1214
-- Name: st_estimated_extent(text, text, text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_estimated_extent(text, text, text) RETURNS box2d
    AS '$libdir/postgis-1.4', 'LWGEOM_estimated_extent'
    LANGUAGE c IMMUTABLE STRICT SECURITY DEFINER;


--
-- TOC entry 3223 (class 0 OID 0)
-- Dependencies: 506
-- Name: FUNCTION st_estimated_extent(text, text, text); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_estimated_extent(text, text, text) IS 'args: schema_name, table_name, geocolumn_name - Return the estimated extent of the given spatial table. The estimated is taken from the geometry columns statistics. The current schema will be used if not specified.';


--
-- TOC entry 508 (class 1255 OID 17381)
-- Dependencies: 6 1214
-- Name: st_estimated_extent(text, text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_estimated_extent(text, text) RETURNS box2d
    AS '$libdir/postgis-1.4', 'LWGEOM_estimated_extent'
    LANGUAGE c IMMUTABLE STRICT SECURITY DEFINER;


--
-- TOC entry 3224 (class 0 OID 0)
-- Dependencies: 508
-- Name: FUNCTION st_estimated_extent(text, text); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_estimated_extent(text, text) IS 'args: table_name, geocolumn_name - Return the estimated extent of the given spatial table. The estimated is taken from the geometry columns statistics. The current schema will be used if not specified.';


--
-- TOC entry 423 (class 1255 OID 17288)
-- Dependencies: 6 1205 1205
-- Name: st_expand(box3d, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_expand(box3d, double precision) RETURNS box3d
    AS '$libdir/postgis-1.4', 'BOX3D_expand'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 3225 (class 0 OID 0)
-- Dependencies: 423
-- Name: FUNCTION st_expand(box3d, double precision); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_expand(box3d, double precision) IS 'args: g1, units_to_expand - Returns bounding box expanded in all directions from the bounding box of the input geometry';


--
-- TOC entry 425 (class 1255 OID 17290)
-- Dependencies: 6 1214 1214
-- Name: st_expand(box2d, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_expand(box2d, double precision) RETURNS box2d
    AS '$libdir/postgis-1.4', 'BOX2DFLOAT4_expand'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 3226 (class 0 OID 0)
-- Dependencies: 425
-- Name: FUNCTION st_expand(box2d, double precision); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_expand(box2d, double precision) IS 'args: g1, units_to_expand - Returns bounding box expanded in all directions from the bounding box of the input geometry';


--
-- TOC entry 427 (class 1255 OID 17292)
-- Dependencies: 6 1202 1202
-- Name: st_expand(geometry, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_expand(geometry, double precision) RETURNS geometry
    AS '$libdir/postgis-1.4', 'LWGEOM_expand'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 3227 (class 0 OID 0)
-- Dependencies: 427
-- Name: FUNCTION st_expand(geometry, double precision); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_expand(geometry, double precision) IS 'args: g1, units_to_expand - Returns bounding box expanded in all directions from the bounding box of the input geometry';


--
-- TOC entry 723 (class 1255 OID 17646)
-- Dependencies: 6 1202 1202
-- Name: st_exteriorring(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_exteriorring(geometry) RETURNS geometry
    AS '$libdir/postgis-1.4', 'LWGEOM_exteriorring_polygon'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 3228 (class 0 OID 0)
-- Dependencies: 723
-- Name: FUNCTION st_exteriorring(geometry); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_exteriorring(geometry) IS 'args: a_polygon - Returns a line string representing the exterior ring of the POLYGON geometry. Return NULL if the geometry is not a polygon. Will not work with MULTIPOLYGON';


--
-- TOC entry 356 (class 1255 OID 17221)
-- Dependencies: 6 1211
-- Name: st_factor(chip); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_factor(chip) RETURNS real
    AS '$libdir/postgis-1.4', 'CHIP_getFactor'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 510 (class 1255 OID 17383)
-- Dependencies: 6 1340 1214
-- Name: st_find_extent(text, text, text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_find_extent(text, text, text) RETURNS box2d
    AS $_$
DECLARE
	schemaname alias for $1;
	tablename alias for $2;
	columnname alias for $3;
	myrec RECORD;

BEGIN
	FOR myrec IN EXECUTE 'SELECT extent("' || columnname || '") FROM "' || schemaname || '"."' || tablename || '"' LOOP
		return myrec.extent;
	END LOOP; 
END;
$_$
    LANGUAGE plpgsql IMMUTABLE STRICT;


--
-- TOC entry 512 (class 1255 OID 17385)
-- Dependencies: 6 1340 1214
-- Name: st_find_extent(text, text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_find_extent(text, text) RETURNS box2d
    AS $_$
DECLARE
	tablename alias for $1;
	columnname alias for $2;
	myrec RECORD;

BEGIN
	FOR myrec IN EXECUTE 'SELECT extent("' || columnname || '") FROM "' || tablename || '"' LOOP
		return myrec.extent;
	END LOOP; 
END;
$_$
    LANGUAGE plpgsql IMMUTABLE STRICT;


--
-- TOC entry 409 (class 1255 OID 17274)
-- Dependencies: 6 1202 1202
-- Name: st_force_2d(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_force_2d(geometry) RETURNS geometry
    AS '$libdir/postgis-1.4', 'LWGEOM_force_2d'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 3229 (class 0 OID 0)
-- Dependencies: 409
-- Name: FUNCTION st_force_2d(geometry); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_force_2d(geometry) IS 'args: geomA - Forces the geometries into a "2-dimensional mode" so that all output representations will only have the X and Y coordinates.';


--
-- TOC entry 413 (class 1255 OID 17278)
-- Dependencies: 6 1202 1202
-- Name: st_force_3d(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_force_3d(geometry) RETURNS geometry
    AS '$libdir/postgis-1.4', 'LWGEOM_force_3dz'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 3230 (class 0 OID 0)
-- Dependencies: 413
-- Name: FUNCTION st_force_3d(geometry); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_force_3d(geometry) IS 'args: geomA - Forces the geometries into XYZ mode. This is an alias for ST_Force_3DZ.';


--
-- TOC entry 415 (class 1255 OID 17280)
-- Dependencies: 6 1202 1202
-- Name: st_force_3dm(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_force_3dm(geometry) RETURNS geometry
    AS '$libdir/postgis-1.4', 'LWGEOM_force_3dm'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 3231 (class 0 OID 0)
-- Dependencies: 415
-- Name: FUNCTION st_force_3dm(geometry); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_force_3dm(geometry) IS 'args: geomA - Forces the geometries into XYM mode.';


--
-- TOC entry 411 (class 1255 OID 17276)
-- Dependencies: 6 1202 1202
-- Name: st_force_3dz(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_force_3dz(geometry) RETURNS geometry
    AS '$libdir/postgis-1.4', 'LWGEOM_force_3dz'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 3232 (class 0 OID 0)
-- Dependencies: 411
-- Name: FUNCTION st_force_3dz(geometry); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_force_3dz(geometry) IS 'args: geomA - Forces the geometries into XYZ mode. This is a synonym for ST_Force_3D.';


--
-- TOC entry 417 (class 1255 OID 17282)
-- Dependencies: 6 1202 1202
-- Name: st_force_4d(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_force_4d(geometry) RETURNS geometry
    AS '$libdir/postgis-1.4', 'LWGEOM_force_4d'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 3233 (class 0 OID 0)
-- Dependencies: 417
-- Name: FUNCTION st_force_4d(geometry); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_force_4d(geometry) IS 'args: geomA - Forces the geometries into XYZM mode.';


--
-- TOC entry 419 (class 1255 OID 17284)
-- Dependencies: 6 1202 1202
-- Name: st_force_collection(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_force_collection(geometry) RETURNS geometry
    AS '$libdir/postgis-1.4', 'LWGEOM_force_collection'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 3234 (class 0 OID 0)
-- Dependencies: 419
-- Name: FUNCTION st_force_collection(geometry); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_force_collection(geometry) IS 'args: geomA - Converts the geometry into a GEOMETRYCOLLECTION.';


--
-- TOC entry 433 (class 1255 OID 17298)
-- Dependencies: 6 1202 1202
-- Name: st_forcerhr(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_forcerhr(geometry) RETURNS geometry
    AS '$libdir/postgis-1.4', 'LWGEOM_forceRHR_poly'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 3235 (class 0 OID 0)
-- Dependencies: 433
-- Name: FUNCTION st_forcerhr(geometry); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_forcerhr(geometry) IS 'args: g - Forces the orientation of the vertices in a polygon to follow the Right-Hand-Rule.';


--
-- TOC entry 712 (class 1255 OID 17635)
-- Dependencies: 6 1202
-- Name: st_geohash(geometry, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_geohash(geometry, integer) RETURNS text
    AS '$libdir/postgis-1.4', 'ST_GeoHash'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 3236 (class 0 OID 0)
-- Dependencies: 712
-- Name: FUNCTION st_geohash(geometry, integer); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_geohash(geometry, integer) IS 'args: g1, precision - Return a GeoHash representation (geohash.org) of the geometry.';


--
-- TOC entry 713 (class 1255 OID 17636)
-- Dependencies: 6 1202
-- Name: st_geohash(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_geohash(geometry) RETURNS text
    AS $_$SELECT ST_GeoHash($1, 0)$_$
    LANGUAGE sql IMMUTABLE STRICT;


--
-- TOC entry 3237 (class 0 OID 0)
-- Dependencies: 713
-- Name: FUNCTION st_geohash(geometry); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_geohash(geometry) IS 'args: g1 - Return a GeoHash representation (geohash.org) of the geometry.';


--
-- TOC entry 622 (class 1255 OID 17530)
-- Dependencies: 6 1204 1204 1202
-- Name: st_geom_accum(geometry[], geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_geom_accum(geometry[], geometry) RETURNS geometry[]
    AS '$libdir/postgis-1.4', 'LWGEOM_accum'
    LANGUAGE c IMMUTABLE;


--
-- TOC entry 810 (class 1255 OID 17733)
-- Dependencies: 1202 6
-- Name: st_geomcollfromtext(text, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_geomcollfromtext(text, integer) RETURNS geometry
    AS $_$
	SELECT CASE
	WHEN geometrytype(ST_GeomFromText($1, $2)) = 'GEOMETRYCOLLECTION'
	THEN ST_GeomFromText($1,$2)
	ELSE NULL END
	$_$
    LANGUAGE sql IMMUTABLE STRICT;


--
-- TOC entry 3238 (class 0 OID 0)
-- Dependencies: 810
-- Name: FUNCTION st_geomcollfromtext(text, integer); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_geomcollfromtext(text, integer) IS 'args: WKT, srid - Makes a collection Geometry from collection WKT with the given SRID. If SRID is not give, it defaults to -1.';


--
-- TOC entry 812 (class 1255 OID 17735)
-- Dependencies: 6 1202
-- Name: st_geomcollfromtext(text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_geomcollfromtext(text) RETURNS geometry
    AS $_$
	SELECT CASE
	WHEN geometrytype(ST_GeomFromText($1)) = 'GEOMETRYCOLLECTION'
	THEN ST_GeomFromText($1)
	ELSE NULL END
	$_$
    LANGUAGE sql IMMUTABLE STRICT;


--
-- TOC entry 3239 (class 0 OID 0)
-- Dependencies: 812
-- Name: FUNCTION st_geomcollfromtext(text); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_geomcollfromtext(text) IS 'args: WKT - Makes a collection Geometry from collection WKT with the given SRID. If SRID is not give, it defaults to -1.';


--
-- TOC entry 861 (class 1255 OID 17784)
-- Dependencies: 1202 6
-- Name: st_geomcollfromwkb(bytea, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_geomcollfromwkb(bytea, integer) RETURNS geometry
    AS $_$
	SELECT CASE
	WHEN geometrytype(GeomFromWKB($1, $2)) = 'GEOMETRYCOLLECTION'
	THEN GeomFromWKB($1, $2)
	ELSE NULL END
	$_$
    LANGUAGE sql IMMUTABLE STRICT;


--
-- TOC entry 863 (class 1255 OID 17786)
-- Dependencies: 1202 6
-- Name: st_geomcollfromwkb(bytea); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_geomcollfromwkb(bytea) RETURNS geometry
    AS $_$
	SELECT CASE
	WHEN geometrytype(ST_GeomFromWKB($1)) = 'GEOMETRYCOLLECTION'
	THEN ST_GeomFromWKB($1)
	ELSE NULL END
	$_$
    LANGUAGE sql IMMUTABLE STRICT;


--
-- TOC entry 259 (class 1255 OID 17075)
-- Dependencies: 6 1202 1208
-- Name: st_geometry(box3d_extent); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_geometry(box3d_extent) RETURNS geometry
    AS '$libdir/postgis-1.4', 'BOX3D_to_LWGEOM'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 561 (class 1255 OID 17451)
-- Dependencies: 6 1202 1214
-- Name: st_geometry(box2d); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_geometry(box2d) RETURNS geometry
    AS '$libdir/postgis-1.4', 'BOX2DFLOAT4_to_LWGEOM'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 563 (class 1255 OID 17453)
-- Dependencies: 6 1202 1205
-- Name: st_geometry(box3d); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_geometry(box3d) RETURNS geometry
    AS '$libdir/postgis-1.4', 'BOX3D_to_LWGEOM'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 565 (class 1255 OID 17455)
-- Dependencies: 6 1202
-- Name: st_geometry(text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_geometry(text) RETURNS geometry
    AS '$libdir/postgis-1.4', 'parse_WKT_lwgeom'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 567 (class 1255 OID 17457)
-- Dependencies: 6 1202 1211
-- Name: st_geometry(chip); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_geometry(chip) RETURNS geometry
    AS '$libdir/postgis-1.4', 'CHIP_to_LWGEOM'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 569 (class 1255 OID 17459)
-- Dependencies: 6 1202
-- Name: st_geometry(bytea); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_geometry(bytea) RETURNS geometry
    AS '$libdir/postgis-1.4', 'LWGEOM_from_bytea'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 327 (class 1255 OID 17159)
-- Dependencies: 6 1202 1202
-- Name: st_geometry_above(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_geometry_above(geometry, geometry) RETURNS boolean
    AS '$libdir/postgis-1.4', 'LWGEOM_above'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 329 (class 1255 OID 17161)
-- Dependencies: 6 1202 1202
-- Name: st_geometry_below(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_geometry_below(geometry, geometry) RETURNS boolean
    AS '$libdir/postgis-1.4', 'LWGEOM_below'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 309 (class 1255 OID 17128)
-- Dependencies: 6 1202 1202
-- Name: st_geometry_cmp(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_geometry_cmp(geometry, geometry) RETURNS integer
    AS '$libdir/postgis-1.4', 'lwgeom_cmp'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 331 (class 1255 OID 17163)
-- Dependencies: 6 1202 1202
-- Name: st_geometry_contain(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_geometry_contain(geometry, geometry) RETURNS boolean
    AS '$libdir/postgis-1.4', 'LWGEOM_contain'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 333 (class 1255 OID 17165)
-- Dependencies: 6 1202 1202
-- Name: st_geometry_contained(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_geometry_contained(geometry, geometry) RETURNS boolean
    AS '$libdir/postgis-1.4', 'LWGEOM_contained'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 307 (class 1255 OID 17126)
-- Dependencies: 6 1202 1202
-- Name: st_geometry_eq(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_geometry_eq(geometry, geometry) RETURNS boolean
    AS '$libdir/postgis-1.4', 'lwgeom_eq'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 305 (class 1255 OID 17124)
-- Dependencies: 6 1202 1202
-- Name: st_geometry_ge(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_geometry_ge(geometry, geometry) RETURNS boolean
    AS '$libdir/postgis-1.4', 'lwgeom_ge'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 303 (class 1255 OID 17122)
-- Dependencies: 6 1202 1202
-- Name: st_geometry_gt(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_geometry_gt(geometry, geometry) RETURNS boolean
    AS '$libdir/postgis-1.4', 'lwgeom_gt'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 301 (class 1255 OID 17120)
-- Dependencies: 6 1202 1202
-- Name: st_geometry_le(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_geometry_le(geometry, geometry) RETURNS boolean
    AS '$libdir/postgis-1.4', 'lwgeom_le'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 323 (class 1255 OID 17155)
-- Dependencies: 6 1202 1202
-- Name: st_geometry_left(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_geometry_left(geometry, geometry) RETURNS boolean
    AS '$libdir/postgis-1.4', 'LWGEOM_left'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 299 (class 1255 OID 17118)
-- Dependencies: 6 1202 1202
-- Name: st_geometry_lt(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_geometry_lt(geometry, geometry) RETURNS boolean
    AS '$libdir/postgis-1.4', 'lwgeom_lt'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 319 (class 1255 OID 17151)
-- Dependencies: 6 1202 1202
-- Name: st_geometry_overabove(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_geometry_overabove(geometry, geometry) RETURNS boolean
    AS '$libdir/postgis-1.4', 'LWGEOM_overabove'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 321 (class 1255 OID 17153)
-- Dependencies: 6 1202 1202
-- Name: st_geometry_overbelow(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_geometry_overbelow(geometry, geometry) RETURNS boolean
    AS '$libdir/postgis-1.4', 'LWGEOM_overbelow'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 335 (class 1255 OID 17167)
-- Dependencies: 6 1202 1202
-- Name: st_geometry_overlap(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_geometry_overlap(geometry, geometry) RETURNS boolean
    AS '$libdir/postgis-1.4', 'LWGEOM_overlap'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 315 (class 1255 OID 17147)
-- Dependencies: 6 1202 1202
-- Name: st_geometry_overleft(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_geometry_overleft(geometry, geometry) RETURNS boolean
    AS '$libdir/postgis-1.4', 'LWGEOM_overleft'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 317 (class 1255 OID 17149)
-- Dependencies: 6 1202 1202
-- Name: st_geometry_overright(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_geometry_overright(geometry, geometry) RETURNS boolean
    AS '$libdir/postgis-1.4', 'LWGEOM_overright'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 325 (class 1255 OID 17157)
-- Dependencies: 6 1202 1202
-- Name: st_geometry_right(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_geometry_right(geometry, geometry) RETURNS boolean
    AS '$libdir/postgis-1.4', 'LWGEOM_right'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 337 (class 1255 OID 17169)
-- Dependencies: 6 1202 1202
-- Name: st_geometry_same(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_geometry_same(geometry, geometry) RETURNS boolean
    AS '$libdir/postgis-1.4', 'LWGEOM_same'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 761 (class 1255 OID 17684)
-- Dependencies: 6 1202
-- Name: st_geometryfromtext(text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_geometryfromtext(text) RETURNS geometry
    AS '$libdir/postgis-1.4', 'LWGEOM_from_text'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 3240 (class 0 OID 0)
-- Dependencies: 761
-- Name: FUNCTION st_geometryfromtext(text); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_geometryfromtext(text) IS 'args: WKT - Return a specified ST_Geometry value from Well-Known Text representation (WKT). This is an alias name for ST_GeomFromText';


--
-- TOC entry 763 (class 1255 OID 17686)
-- Dependencies: 6 1202
-- Name: st_geometryfromtext(text, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_geometryfromtext(text, integer) RETURNS geometry
    AS '$libdir/postgis-1.4', 'LWGEOM_from_text'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 3241 (class 0 OID 0)
-- Dependencies: 763
-- Name: FUNCTION st_geometryfromtext(text, integer); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_geometryfromtext(text, integer) IS 'args: WKT, srid - Return a specified ST_Geometry value from Well-Known Text representation (WKT). This is an alias name for ST_GeomFromText';


--
-- TOC entry 719 (class 1255 OID 17642)
-- Dependencies: 6 1202 1202
-- Name: st_geometryn(geometry, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_geometryn(geometry, integer) RETURNS geometry
    AS '$libdir/postgis-1.4', 'LWGEOM_geometryn_collection'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 3242 (class 0 OID 0)
-- Dependencies: 719
-- Name: FUNCTION st_geometryn(geometry, integer); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_geometryn(geometry, integer) IS 'args: geomA, n - Return the 1-based Nth geometry if the geometry is a GEOMETRYCOLLECTION, MULTIPOINT, MULTILINESTRING, MULTICURVE or MULTIPOLYGON. Otherwise, return NULL.';


--
-- TOC entry 731 (class 1255 OID 17654)
-- Dependencies: 6 1202
-- Name: st_geometrytype(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_geometrytype(geometry) RETURNS text
    AS '$libdir/postgis-1.4', 'geometry_geometrytype'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 3243 (class 0 OID 0)
-- Dependencies: 731
-- Name: FUNCTION st_geometrytype(geometry); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_geometrytype(geometry) IS 'args: g1 - Return the geometry type of the ST_Geometry value.';


--
-- TOC entry 453 (class 1255 OID 17318)
-- Dependencies: 1202 6
-- Name: st_geomfromewkb(bytea); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_geomfromewkb(bytea) RETURNS geometry
    AS '$libdir/postgis-1.4', 'LWGEOMFromWKB'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 3244 (class 0 OID 0)
-- Dependencies: 453
-- Name: FUNCTION st_geomfromewkb(bytea); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_geomfromewkb(bytea) IS 'args: EWKB - Return a specified ST_Geometry value from Extended Well-Known Binary representation (EWKB).';


--
-- TOC entry 455 (class 1255 OID 17320)
-- Dependencies: 6 1202
-- Name: st_geomfromewkt(text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_geomfromewkt(text) RETURNS geometry
    AS '$libdir/postgis-1.4', 'parse_WKT_lwgeom'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 3245 (class 0 OID 0)
-- Dependencies: 455
-- Name: FUNCTION st_geomfromewkt(text); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_geomfromewkt(text) IS 'args: EWKT - Return a specified ST_Geometry value from Extended Well-Known Text representation (EWKT).';


--
-- TOC entry 765 (class 1255 OID 17688)
-- Dependencies: 6 1202
-- Name: st_geomfromtext(text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_geomfromtext(text) RETURNS geometry
    AS '$libdir/postgis-1.4', 'LWGEOM_from_text'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 3246 (class 0 OID 0)
-- Dependencies: 765
-- Name: FUNCTION st_geomfromtext(text); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_geomfromtext(text) IS 'args: WKT - Return a specified ST_Geometry value from Well-Known Text representation (WKT).';


--
-- TOC entry 767 (class 1255 OID 17690)
-- Dependencies: 6 1202
-- Name: st_geomfromtext(text, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_geomfromtext(text, integer) RETURNS geometry
    AS '$libdir/postgis-1.4', 'LWGEOM_from_text'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 3247 (class 0 OID 0)
-- Dependencies: 767
-- Name: FUNCTION st_geomfromtext(text, integer); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_geomfromtext(text, integer) IS 'args: WKT, srid - Return a specified ST_Geometry value from Well-Known Text representation (WKT).';


--
-- TOC entry 814 (class 1255 OID 17737)
-- Dependencies: 1202 6
-- Name: st_geomfromwkb(bytea); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_geomfromwkb(bytea) RETURNS geometry
    AS '$libdir/postgis-1.4', 'LWGEOM_from_WKB'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 3248 (class 0 OID 0)
-- Dependencies: 814
-- Name: FUNCTION st_geomfromwkb(bytea); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_geomfromwkb(bytea) IS 'args: geom - Makes a geometry from WKB with the given SRID';


--
-- TOC entry 816 (class 1255 OID 17739)
-- Dependencies: 1202 6
-- Name: st_geomfromwkb(bytea, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_geomfromwkb(bytea, integer) RETURNS geometry
    AS $_$SELECT ST_SetSRID(ST_GeomFromWKB($1), $2)$_$
    LANGUAGE sql IMMUTABLE STRICT;


--
-- TOC entry 3249 (class 0 OID 0)
-- Dependencies: 816
-- Name: FUNCTION st_geomfromwkb(bytea, integer); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_geomfromwkb(bytea, integer) IS 'args: geom, srid - Makes a geometry from WKB with the given SRID';


--
-- TOC entry 896 (class 1255 OID 17819)
-- Dependencies: 6 1202
-- Name: st_hasarc(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_hasarc(geometry) RETURNS boolean
    AS '$libdir/postgis-1.4', 'LWGEOM_has_arc'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 3250 (class 0 OID 0)
-- Dependencies: 896
-- Name: FUNCTION st_hasarc(geometry); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_hasarc(geometry) IS 'args: geomA - Returns true if a geometry or geometry collection contains a circular string';


--
-- TOC entry 439 (class 1255 OID 17304)
-- Dependencies: 6 1202
-- Name: st_hasbbox(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_hasbbox(geometry) RETURNS boolean
    AS '$libdir/postgis-1.4', 'LWGEOM_hasBBOX'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 3251 (class 0 OID 0)
-- Dependencies: 439
-- Name: FUNCTION st_hasbbox(geometry); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_hasbbox(geometry) IS 'args: geomA - Returns TRUE if the bbox of this geometry is cached, FALSE otherwise.';


--
-- TOC entry 354 (class 1255 OID 17219)
-- Dependencies: 6 1211
-- Name: st_height(chip); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_height(chip) RETURNS integer
    AS '$libdir/postgis-1.4', 'CHIP_getHeight'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 729 (class 1255 OID 17652)
-- Dependencies: 1202 6 1202
-- Name: st_interiorringn(geometry, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_interiorringn(geometry, integer) RETURNS geometry
    AS '$libdir/postgis-1.4', 'LWGEOM_interiorringn_polygon'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 3252 (class 0 OID 0)
-- Dependencies: 729
-- Name: FUNCTION st_interiorringn(geometry, integer); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_interiorringn(geometry, integer) IS 'args: a_polygon, n - Return the Nth interior linestring ring of the polygon geometry. Return NULL if the geometry is not a polygon or the given N is out of range.';


--
-- TOC entry 595 (class 1255 OID 17501)
-- Dependencies: 6 1202 1202 1202
-- Name: st_intersection(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_intersection(geometry, geometry) RETURNS geometry
    AS '$libdir/postgis-1.4', 'intersection'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 3253 (class 0 OID 0)
-- Dependencies: 595
-- Name: FUNCTION st_intersection(geometry, geometry); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_intersection(geometry, geometry) IS 'args: geomA, geomB - Returns a geometry that represents the shared portion of geomA and geomB';


--
-- TOC entry 650 (class 1255 OID 17573)
-- Dependencies: 6 1202 1202
-- Name: st_intersects(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_intersects(geometry, geometry) RETURNS boolean
    AS $_$SELECT $1 && $2 AND _ST_Intersects($1,$2)$_$
    LANGUAGE sql IMMUTABLE;


--
-- TOC entry 3254 (class 0 OID 0)
-- Dependencies: 650
-- Name: FUNCTION st_intersects(geometry, geometry); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_intersects(geometry, geometry) IS 'args: A, B - Returns TRUE if the Geometries "spatially intersect" - (share any portion of space) and FALSE if they dont (they are Disjoint).';


--
-- TOC entry 747 (class 1255 OID 17670)
-- Dependencies: 1202 6
-- Name: st_isclosed(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_isclosed(geometry) RETURNS boolean
    AS '$libdir/postgis-1.4', 'LWGEOM_isclosed_linestring'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 3255 (class 0 OID 0)
-- Dependencies: 747
-- Name: FUNCTION st_isclosed(geometry); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_isclosed(geometry) IS 'args: g - Returns TRUE if the LINESTRINGs start and end points are coincident.';


--
-- TOC entry 749 (class 1255 OID 17672)
-- Dependencies: 6 1202
-- Name: st_isempty(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_isempty(geometry) RETURNS boolean
    AS '$libdir/postgis-1.4', 'LWGEOM_isempty'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 3256 (class 0 OID 0)
-- Dependencies: 749
-- Name: FUNCTION st_isempty(geometry); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_isempty(geometry) IS 'args: geomA - Returns true if this Geometry is an empty geometry . If true, then this Geometry represents the empty point set - i.e. GEOMETRYCOLLECTION(EMPTY).';


--
-- TOC entry 675 (class 1255 OID 17598)
-- Dependencies: 6 1202
-- Name: st_isring(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_isring(geometry) RETURNS boolean
    AS '$libdir/postgis-1.4', 'isring'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 3257 (class 0 OID 0)
-- Dependencies: 675
-- Name: FUNCTION st_isring(geometry); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_isring(geometry) IS 'args: g - Returns TRUE if this LINESTRING is both closed and simple.';


--
-- TOC entry 679 (class 1255 OID 17602)
-- Dependencies: 1202 6
-- Name: st_issimple(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_issimple(geometry) RETURNS boolean
    AS '$libdir/postgis-1.4', 'issimple'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 3258 (class 0 OID 0)
-- Dependencies: 679
-- Name: FUNCTION st_issimple(geometry); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_issimple(geometry) IS 'args: geomA - Returns (TRUE) if this Geometry has no anomalous geometric points, such as self intersection or self tangency.';


--
-- TOC entry 670 (class 1255 OID 17593)
-- Dependencies: 6 1202
-- Name: st_isvalid(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_isvalid(geometry) RETURNS boolean
    AS '$libdir/postgis-1.4', 'isvalid'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 3259 (class 0 OID 0)
-- Dependencies: 670
-- Name: FUNCTION st_isvalid(geometry); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_isvalid(geometry) IS 'args: g - Returns true if the ST_Geometry is well formed.';


--
-- TOC entry 606 (class 1255 OID 17512)
-- Dependencies: 6 1202
-- Name: st_isvalidreason(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_isvalidreason(geometry) RETURNS text
    AS '$libdir/postgis-1.4', 'isvalidreason'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 3260 (class 0 OID 0)
-- Dependencies: 606
-- Name: FUNCTION st_isvalidreason(geometry); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_isvalidreason(geometry) IS 'args: geomA - Returns text stating if a geometry is valid or not and if not valid, a reason why.';


--
-- TOC entry 379 (class 1255 OID 17244)
-- Dependencies: 6 1202
-- Name: st_length(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_length(geometry) RETURNS double precision
    AS '$libdir/postgis-1.4', 'LWGEOM_length2d_linestring'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 3261 (class 0 OID 0)
-- Dependencies: 379
-- Name: FUNCTION st_length(geometry); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_length(geometry) IS 'args: a_2dlinestring - Returns the 2d length of the geometry if it is a linestring or multilinestring.';


--
-- TOC entry 377 (class 1255 OID 17242)
-- Dependencies: 6 1202
-- Name: st_length2d(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_length2d(geometry) RETURNS double precision
    AS '$libdir/postgis-1.4', 'LWGEOM_length2d_linestring'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 3262 (class 0 OID 0)
-- Dependencies: 377
-- Name: FUNCTION st_length2d(geometry); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_length2d(geometry) IS 'args: a_2dlinestring - Returns the 2-dimensional length of the geometry if it is a linestring or multi-linestring. This is an alias for ST_Length';


--
-- TOC entry 385 (class 1255 OID 17250)
-- Dependencies: 6 1202 1199
-- Name: st_length2d_spheroid(geometry, spheroid); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_length2d_spheroid(geometry, spheroid) RETURNS double precision
    AS '$libdir/postgis-1.4', 'LWGEOM_length2d_ellipsoid_linestring'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 3263 (class 0 OID 0)
-- Dependencies: 385
-- Name: FUNCTION st_length2d_spheroid(geometry, spheroid); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_length2d_spheroid(geometry, spheroid) IS 'args: a_linestring, a_spheroid - Calculates the 2D length of a linestring/multilinestring on an ellipsoid. This is useful if the coordinates of the geometry are in longitude/latitude and a length is desired without reprojection.';


--
-- TOC entry 375 (class 1255 OID 17240)
-- Dependencies: 6 1202
-- Name: st_length3d(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_length3d(geometry) RETURNS double precision
    AS '$libdir/postgis-1.4', 'LWGEOM_length_linestring'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 3264 (class 0 OID 0)
-- Dependencies: 375
-- Name: FUNCTION st_length3d(geometry); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_length3d(geometry) IS 'args: a_3dlinestring - Returns the 3-dimensional or 2-dimensional length of the geometry if it is a linestring or multi-linestring.';


--
-- TOC entry 381 (class 1255 OID 17246)
-- Dependencies: 6 1202 1199
-- Name: st_length3d_spheroid(geometry, spheroid); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_length3d_spheroid(geometry, spheroid) RETURNS double precision
    AS '$libdir/postgis-1.4', 'LWGEOM_length_ellipsoid_linestring'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 3265 (class 0 OID 0)
-- Dependencies: 381
-- Name: FUNCTION st_length3d_spheroid(geometry, spheroid); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_length3d_spheroid(geometry, spheroid) IS 'args: a_linestring, a_spheroid - Calculates the length of a geometry on an ellipsoid, taking the elevation into account. This is just an alias for ST_Length_Spheroid.';


--
-- TOC entry 383 (class 1255 OID 17248)
-- Dependencies: 6 1202 1199
-- Name: st_length_spheroid(geometry, spheroid); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_length_spheroid(geometry, spheroid) RETURNS double precision
    AS '$libdir/postgis-1.4', 'LWGEOM_length_ellipsoid_linestring'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 3266 (class 0 OID 0)
-- Dependencies: 383
-- Name: FUNCTION st_length_spheroid(geometry, spheroid); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_length_spheroid(geometry, spheroid) IS 'args: a_linestring, a_spheroid - Calculates the 2D or 3D length of a linestring/multilinestring on an ellipsoid. This is useful if the coordinates of the geometry are in longitude/latitude and a length is desired without reprojection.';


--
-- TOC entry 585 (class 1255 OID 17491)
-- Dependencies: 6 1202 1202
-- Name: st_line_interpolate_point(geometry, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_line_interpolate_point(geometry, double precision) RETURNS geometry
    AS '$libdir/postgis-1.4', 'LWGEOM_line_interpolate_point'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 3267 (class 0 OID 0)
-- Dependencies: 585
-- Name: FUNCTION st_line_interpolate_point(geometry, double precision); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_line_interpolate_point(geometry, double precision) IS 'args: a_linestring, a_fraction - Returns a point interpolated along a line. Second argument is a float8 between 0 and 1 representing fraction of total length of linestring the point has to be located.';


--
-- TOC entry 589 (class 1255 OID 17495)
-- Dependencies: 6 1202 1202
-- Name: st_line_locate_point(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_line_locate_point(geometry, geometry) RETURNS double precision
    AS '$libdir/postgis-1.4', 'LWGEOM_line_locate_point'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 3268 (class 0 OID 0)
-- Dependencies: 589
-- Name: FUNCTION st_line_locate_point(geometry, geometry); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_line_locate_point(geometry, geometry) IS 'args: a_linestring, a_point - Returns a float between 0 and 1 representing the location of the closest point on LineString to the given Point, as a fraction of total 2d line length.';


--
-- TOC entry 587 (class 1255 OID 17493)
-- Dependencies: 6 1202 1202
-- Name: st_line_substring(geometry, double precision, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_line_substring(geometry, double precision, double precision) RETURNS geometry
    AS '$libdir/postgis-1.4', 'LWGEOM_line_substring'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 3269 (class 0 OID 0)
-- Dependencies: 587
-- Name: FUNCTION st_line_substring(geometry, double precision, double precision); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_line_substring(geometry, double precision, double precision) IS 'args: a_linestring, startfraction, endfraction - Return a linestring being a substring of the input one starting and ending at the given fractions of total 2d length. Second and third arguments are float8 values between 0 and 1.';


--
-- TOC entry 603 (class 1255 OID 17509)
-- Dependencies: 6 1202 1202
-- Name: st_linecrossingdirection(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_linecrossingdirection(geometry, geometry) RETURNS integer
    AS $_$ SELECT CASE WHEN NOT $1 && $2 THEN 0 ELSE _ST_LineCrossingDirection($1,$2) END $_$
    LANGUAGE sql IMMUTABLE;


--
-- TOC entry 3270 (class 0 OID 0)
-- Dependencies: 603
-- Name: FUNCTION st_linecrossingdirection(geometry, geometry); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_linecrossingdirection(geometry, geometry) IS 'args: linestringA, linestringB - Given 2 linestrings, returns a number between -3 and 3 denoting what kind of crossing behavior. 0 is no crossing.';


--
-- TOC entry 474 (class 1255 OID 17339)
-- Dependencies: 6 1202 1202
-- Name: st_linefrommultipoint(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_linefrommultipoint(geometry) RETURNS geometry
    AS '$libdir/postgis-1.4', 'LWGEOM_line_from_mpoint'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 3271 (class 0 OID 0)
-- Dependencies: 474
-- Name: FUNCTION st_linefrommultipoint(geometry); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_linefrommultipoint(geometry) IS 'args: aMultiPoint - Creates a LineString from a MultiPoint geometry.';


--
-- TOC entry 773 (class 1255 OID 17696)
-- Dependencies: 6 1202
-- Name: st_linefromtext(text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_linefromtext(text) RETURNS geometry
    AS $_$
	SELECT CASE WHEN geometrytype(ST_GeomFromText($1)) = 'LINESTRING'
	THEN ST_GeomFromText($1)
	ELSE NULL END
	$_$
    LANGUAGE sql IMMUTABLE STRICT;


--
-- TOC entry 3272 (class 0 OID 0)
-- Dependencies: 773
-- Name: FUNCTION st_linefromtext(text); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_linefromtext(text) IS 'args: WKT - Makes a Geometry from WKT representation with the given SRID. If SRID is not given, it defaults to -1.';


--
-- TOC entry 775 (class 1255 OID 17698)
-- Dependencies: 6 1202
-- Name: st_linefromtext(text, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_linefromtext(text, integer) RETURNS geometry
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromText($1, $2)) = 'LINESTRING'
	THEN GeomFromText($1,$2)
	ELSE NULL END
	$_$
    LANGUAGE sql IMMUTABLE STRICT;


--
-- TOC entry 3273 (class 0 OID 0)
-- Dependencies: 775
-- Name: FUNCTION st_linefromtext(text, integer); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_linefromtext(text, integer) IS 'args: WKT, srid - Makes a Geometry from WKT representation with the given SRID. If SRID is not given, it defaults to -1.';


--
-- TOC entry 822 (class 1255 OID 17745)
-- Dependencies: 6 1202
-- Name: st_linefromwkb(bytea, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_linefromwkb(bytea, integer) RETURNS geometry
    AS $_$
	SELECT CASE WHEN geometrytype(ST_GeomFromWKB($1, $2)) = 'LINESTRING'
	THEN ST_GeomFromWKB($1, $2)
	ELSE NULL END
	$_$
    LANGUAGE sql IMMUTABLE STRICT;


--
-- TOC entry 3274 (class 0 OID 0)
-- Dependencies: 822
-- Name: FUNCTION st_linefromwkb(bytea, integer); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_linefromwkb(bytea, integer) IS 'args: WKB, srid - Makes a LINESTRING from WKB with the given SRID';


--
-- TOC entry 824 (class 1255 OID 17747)
-- Dependencies: 1202 6
-- Name: st_linefromwkb(bytea); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_linefromwkb(bytea) RETURNS geometry
    AS $_$
	SELECT CASE WHEN geometrytype(ST_GeomFromWKB($1)) = 'LINESTRING'
	THEN ST_GeomFromWKB($1)
	ELSE NULL END
	$_$
    LANGUAGE sql IMMUTABLE STRICT;


--
-- TOC entry 3275 (class 0 OID 0)
-- Dependencies: 824
-- Name: FUNCTION st_linefromwkb(bytea); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_linefromwkb(bytea) IS 'args: WKB - Makes a LINESTRING from WKB with the given SRID';


--
-- TOC entry 495 (class 1255 OID 17360)
-- Dependencies: 6 1202 1202
-- Name: st_linemerge(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_linemerge(geometry) RETURNS geometry
    AS '$libdir/postgis-1.4', 'linemerge'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 3276 (class 0 OID 0)
-- Dependencies: 495
-- Name: FUNCTION st_linemerge(geometry); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_linemerge(geometry) IS 'args: amultilinestring - Returns a (set of) LineString(s) formed by sewing together a MULTILINESTRING.';


--
-- TOC entry 826 (class 1255 OID 17749)
-- Dependencies: 6 1202
-- Name: st_linestringfromwkb(bytea, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_linestringfromwkb(bytea, integer) RETURNS geometry
    AS $_$
	SELECT CASE WHEN geometrytype(ST_GeomFromWKB($1, $2)) = 'LINESTRING'
	THEN ST_GeomFromWKB($1, $2)
	ELSE NULL END
	$_$
    LANGUAGE sql IMMUTABLE STRICT;


--
-- TOC entry 3277 (class 0 OID 0)
-- Dependencies: 826
-- Name: FUNCTION st_linestringfromwkb(bytea, integer); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_linestringfromwkb(bytea, integer) IS 'args: WKB, srid - Makes a geometry from WKB with the given SRID.';


--
-- TOC entry 828 (class 1255 OID 17751)
-- Dependencies: 1202 6
-- Name: st_linestringfromwkb(bytea); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_linestringfromwkb(bytea) RETURNS geometry
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromWKB($1)) = 'LINESTRING'
	THEN GeomFromWKB($1)
	ELSE NULL END
	$_$
    LANGUAGE sql IMMUTABLE STRICT;


--
-- TOC entry 3278 (class 0 OID 0)
-- Dependencies: 828
-- Name: FUNCTION st_linestringfromwkb(bytea); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_linestringfromwkb(bytea) IS 'args: WKB - Makes a geometry from WKB with the given SRID.';


--
-- TOC entry 897 (class 1255 OID 17820)
-- Dependencies: 1202 1202 6
-- Name: st_linetocurve(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_linetocurve(geometry) RETURNS geometry
    AS '$libdir/postgis-1.4', 'LWGEOM_line_desegmentize'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 3279 (class 0 OID 0)
-- Dependencies: 897
-- Name: FUNCTION st_linetocurve(geometry); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_linetocurve(geometry) IS 'args: geomANoncircular - Converts a LINESTRING/POLYGON to a CIRCULARSTRING, CURVED POLYGON';


--
-- TOC entry 593 (class 1255 OID 17499)
-- Dependencies: 6 1202 1202
-- Name: st_locate_along_measure(geometry, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_locate_along_measure(geometry, double precision) RETURNS geometry
    AS $_$ SELECT locate_between_measures($1, $2, $2) $_$
    LANGUAGE sql IMMUTABLE STRICT;


--
-- TOC entry 3280 (class 0 OID 0)
-- Dependencies: 593
-- Name: FUNCTION st_locate_along_measure(geometry, double precision); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_locate_along_measure(geometry, double precision) IS 'args: ageom_with_measure, a_measure - Return a derived geometry collection value with elements that match the specified measure. Polygonal elements are not supported.';


--
-- TOC entry 591 (class 1255 OID 17497)
-- Dependencies: 6 1202 1202
-- Name: st_locate_between_measures(geometry, double precision, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_locate_between_measures(geometry, double precision, double precision) RETURNS geometry
    AS '$libdir/postgis-1.4', 'LWGEOM_locate_between_m'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 3281 (class 0 OID 0)
-- Dependencies: 591
-- Name: FUNCTION st_locate_between_measures(geometry, double precision, double precision); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_locate_between_measures(geometry, double precision, double precision) IS 'args: geomA, measure_start, measure_end - Return a derived geometry collection value with elements that match the specified range of measures inclusively. Polygonal elements are not supported.';


--
-- TOC entry 604 (class 1255 OID 17510)
-- Dependencies: 6 1202 1202
-- Name: st_locatebetweenelevations(geometry, double precision, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_locatebetweenelevations(geometry, double precision, double precision) RETURNS geometry
    AS '$libdir/postgis-1.4', 'ST_LocateBetweenElevations'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 3282 (class 0 OID 0)
-- Dependencies: 604
-- Name: FUNCTION st_locatebetweenelevations(geometry, double precision, double precision); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_locatebetweenelevations(geometry, double precision, double precision) IS 'args: geom_mline, elevation_start, elevation_end - Return a derived geometry (collection) value with elements that intersect the specified range of elevations inclusively. Only 3D, 4D LINESTRINGS and MULTILINESTRINGS are supported.';


--
-- TOC entry 741 (class 1255 OID 17664)
-- Dependencies: 6 1202
-- Name: st_m(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_m(geometry) RETURNS double precision
    AS '$libdir/postgis-1.4', 'LWGEOM_m_point'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 3283 (class 0 OID 0)
-- Dependencies: 741
-- Name: FUNCTION st_m(geometry); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_m(geometry) IS 'args: a_point - Return the M coordinate of the point, or NULL if not available. Input must be a point.';


--
-- TOC entry 467 (class 1255 OID 17332)
-- Dependencies: 6 1214 1202 1202
-- Name: st_makebox2d(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_makebox2d(geometry, geometry) RETURNS box2d
    AS '$libdir/postgis-1.4', 'BOX2DFLOAT4_construct'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 3284 (class 0 OID 0)
-- Dependencies: 467
-- Name: FUNCTION st_makebox2d(geometry, geometry); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_makebox2d(geometry, geometry) IS 'args: pointLowLeft, pointUpRight - Creates a BOX2D defined by the given point geometries.';


--
-- TOC entry 469 (class 1255 OID 17334)
-- Dependencies: 6 1205 1202 1202
-- Name: st_makebox3d(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_makebox3d(geometry, geometry) RETURNS box3d
    AS '$libdir/postgis-1.4', 'BOX3D_construct'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 3285 (class 0 OID 0)
-- Dependencies: 469
-- Name: FUNCTION st_makebox3d(geometry, geometry); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_makebox3d(geometry, geometry) IS 'args: point3DLowLeftBottom, point3DUpRightTop - Creates a BOX3D defined by the given 3d point geometries.';


--
-- TOC entry 472 (class 1255 OID 17337)
-- Dependencies: 6 1202 1204
-- Name: st_makeline(geometry[]); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_makeline(geometry[]) RETURNS geometry
    AS '$libdir/postgis-1.4', 'LWGEOM_makeline_garray'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 3286 (class 0 OID 0)
-- Dependencies: 472
-- Name: FUNCTION st_makeline(geometry[]); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_makeline(geometry[]) IS 'args: point_array - Creates a Linestring from point geometries.';


--
-- TOC entry 476 (class 1255 OID 17341)
-- Dependencies: 6 1202 1202 1202
-- Name: st_makeline(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_makeline(geometry, geometry) RETURNS geometry
    AS '$libdir/postgis-1.4', 'LWGEOM_makeline'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 3287 (class 0 OID 0)
-- Dependencies: 476
-- Name: FUNCTION st_makeline(geometry, geometry); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_makeline(geometry, geometry) IS 'args: point1, point2 - Creates a Linestring from point geometries.';


--
-- TOC entry 471 (class 1255 OID 17336)
-- Dependencies: 6 1202 1204
-- Name: st_makeline_garray(geometry[]); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_makeline_garray(geometry[]) RETURNS geometry
    AS '$libdir/postgis-1.4', 'LWGEOM_makeline_garray'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 459 (class 1255 OID 17324)
-- Dependencies: 6 1202
-- Name: st_makepoint(double precision, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_makepoint(double precision, double precision) RETURNS geometry
    AS '$libdir/postgis-1.4', 'LWGEOM_makepoint'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 3288 (class 0 OID 0)
-- Dependencies: 459
-- Name: FUNCTION st_makepoint(double precision, double precision); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_makepoint(double precision, double precision) IS 'args: x, y - Creates a 2D,3DZ or 4D point geometry.';


--
-- TOC entry 461 (class 1255 OID 17326)
-- Dependencies: 1202 6
-- Name: st_makepoint(double precision, double precision, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_makepoint(double precision, double precision, double precision) RETURNS geometry
    AS '$libdir/postgis-1.4', 'LWGEOM_makepoint'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 3289 (class 0 OID 0)
-- Dependencies: 461
-- Name: FUNCTION st_makepoint(double precision, double precision, double precision); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_makepoint(double precision, double precision, double precision) IS 'args: x, y, z - Creates a 2D,3DZ or 4D point geometry.';


--
-- TOC entry 463 (class 1255 OID 17328)
-- Dependencies: 6 1202
-- Name: st_makepoint(double precision, double precision, double precision, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_makepoint(double precision, double precision, double precision, double precision) RETURNS geometry
    AS '$libdir/postgis-1.4', 'LWGEOM_makepoint'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 3290 (class 0 OID 0)
-- Dependencies: 463
-- Name: FUNCTION st_makepoint(double precision, double precision, double precision, double precision); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_makepoint(double precision, double precision, double precision, double precision) IS 'args: x, y, z, m - Creates a 2D,3DZ or 4D point geometry.';


--
-- TOC entry 465 (class 1255 OID 17330)
-- Dependencies: 6 1202
-- Name: st_makepointm(double precision, double precision, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_makepointm(double precision, double precision, double precision) RETURNS geometry
    AS '$libdir/postgis-1.4', 'LWGEOM_makepoint3dm'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 3291 (class 0 OID 0)
-- Dependencies: 465
-- Name: FUNCTION st_makepointm(double precision, double precision, double precision); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_makepointm(double precision, double precision, double precision) IS 'args: x, y, m - Creates a point geometry with an x y and m coordinate.';


--
-- TOC entry 486 (class 1255 OID 17351)
-- Dependencies: 6 1202 1202 1204
-- Name: st_makepolygon(geometry, geometry[]); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_makepolygon(geometry, geometry[]) RETURNS geometry
    AS '$libdir/postgis-1.4', 'LWGEOM_makepoly'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 3292 (class 0 OID 0)
-- Dependencies: 486
-- Name: FUNCTION st_makepolygon(geometry, geometry[]); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_makepolygon(geometry, geometry[]) IS 'args: outerlinestring, interiorlinestrings - Creates a Polygon formed by the given shell. Input geometries must be closed LINESTRINGS.';


--
-- TOC entry 488 (class 1255 OID 17353)
-- Dependencies: 6 1202 1202
-- Name: st_makepolygon(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_makepolygon(geometry) RETURNS geometry
    AS '$libdir/postgis-1.4', 'LWGEOM_makepoly'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 3293 (class 0 OID 0)
-- Dependencies: 488
-- Name: FUNCTION st_makepolygon(geometry); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_makepolygon(geometry) IS 'args: linestring - Creates a Polygon formed by the given shell. Input geometries must be closed LINESTRINGS.';


--
-- TOC entry 403 (class 1255 OID 17268)
-- Dependencies: 6 1202 1202
-- Name: st_max_distance(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_max_distance(geometry, geometry) RETURNS double precision
    AS '$libdir/postgis-1.4', 'LWGEOM_maxdistance2d_linestring'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 3294 (class 0 OID 0)
-- Dependencies: 403
-- Name: FUNCTION st_max_distance(geometry, geometry); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_max_distance(geometry, geometry) IS 'args: g1, g2 - Returns the 2-dimensional largest distance between two geometries in projected units.';


--
-- TOC entry 367 (class 1255 OID 17232)
-- Dependencies: 6 1202
-- Name: st_mem_size(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_mem_size(geometry) RETURNS integer
    AS '$libdir/postgis-1.4', 'LWGEOM_mem_size'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 3295 (class 0 OID 0)
-- Dependencies: 367
-- Name: FUNCTION st_mem_size(geometry); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_mem_size(geometry) IS 'args: geomA - Returns the amount of space (in bytes) the geometry takes.';


--
-- TOC entry 898 (class 1255 OID 17821)
-- Dependencies: 1202 1202 1340 6
-- Name: st_minimumboundingcircle(geometry, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_minimumboundingcircle(inputgeom geometry, segs_per_quarter integer) RETURNS geometry
    AS $$
	DECLARE     
	hull GEOMETRY;
	ring GEOMETRY;
	center GEOMETRY;
	radius DOUBLE PRECISION;
	dist DOUBLE PRECISION;
	d DOUBLE PRECISION;
	idx1 integer;
	idx2 integer;
	l1 GEOMETRY;
	l2 GEOMETRY;
	p1 GEOMETRY;
	p2 GEOMETRY;
	a1 DOUBLE PRECISION;
	a2 DOUBLE PRECISION;

	
	BEGIN

	-- First compute the ConvexHull of the geometry
	hull = ST_ConvexHull(inputgeom);
	--A point really has no MBC
	IF ST_GeometryType(hull) = 'ST_Point' THEN
		RETURN hull;
	END IF;
	-- convert the hull perimeter to a linestring so we can manipulate individual points
	--If its already a linestring force it to a closed linestring
	ring = CASE WHEN ST_GeometryType(hull) = 'ST_LineString' THEN ST_AddPoint(hull, ST_StartPoint(hull)) ELSE ST_ExteriorRing(hull) END;

	dist = 0;
	-- Brute Force - check every pair
	FOR i in 1 .. (ST_NumPoints(ring)-2)
		LOOP
			FOR j in i .. (ST_NumPoints(ring)-1)
				LOOP
				d = ST_Distance(ST_PointN(ring,i),ST_PointN(ring,j));
				-- Check the distance and update if larger
				IF (d > dist) THEN
					dist = d;
					idx1 = i;
					idx2 = j;
				END IF;
			END LOOP;
		END LOOP;

	-- We now have the diameter of the convex hull.  The following line returns it if desired.
	-- RETURN MakeLine(PointN(ring,idx1),PointN(ring,idx2));

	-- Now for the Minimum Bounding Circle.  Since we know the two points furthest from each
	-- other, the MBC must go through those two points. Start with those points as a diameter of a circle.
	
	-- The radius is half the distance between them and the center is midway between them
	radius = ST_Distance(ST_PointN(ring,idx1),ST_PointN(ring,idx2)) / 2.0;
	center = ST_Line_interpolate_point(ST_MakeLine(ST_PointN(ring,idx1),ST_PointN(ring,idx2)),0.5);

	-- Loop through each vertex and check if the distance from the center to the point
	-- is greater than the current radius.
	FOR k in 1 .. (ST_NumPoints(ring)-1)
		LOOP
		IF(k <> idx1 and k <> idx2) THEN
			dist = ST_Distance(center,ST_PointN(ring,k));
			IF (dist > radius) THEN
				-- We have to expand the circle.  The new circle must pass trhough
				-- three points - the two original diameters and this point.
				
				-- Draw a line from the first diameter to this point
				l1 = ST_Makeline(ST_PointN(ring,idx1),ST_PointN(ring,k));
				-- Compute the midpoint
				p1 = ST_line_interpolate_point(l1,0.5);
				-- Rotate the line 90 degrees around the midpoint (perpendicular bisector)
				l1 = ST_Translate(ST_Rotate(ST_Translate(l1,-X(p1),-Y(p1)),pi()/2),X(p1),Y(p1));
				--  Compute the azimuth of the bisector
				a1 = ST_Azimuth(ST_PointN(l1,1),ST_PointN(l1,2));
				--  Extend the line in each direction the new computed distance to insure they will intersect
				l1 = ST_AddPoint(l1,ST_Makepoint(X(ST_PointN(l1,2))+sin(a1)*dist,Y(ST_PointN(l1,2))+cos(a1)*dist),-1);
				l1 = ST_AddPoint(l1,ST_Makepoint(X(ST_PointN(l1,1))-sin(a1)*dist,Y(ST_PointN(l1,1))-cos(a1)*dist),0);

				-- Repeat for the line from the point to the other diameter point
				l2 = ST_Makeline(ST_PointN(ring,idx2),ST_PointN(ring,k));
				p2 = ST_Line_interpolate_point(l2,0.5);
				l2 = ST_Translate(ST_Rotate(ST_Translate(l2,-X(p2),-Y(p2)),pi()/2),X(p2),Y(p2));
				a2 = ST_Azimuth(ST_PointN(l2,1),ST_PointN(l2,2));
				l2 = ST_AddPoint(l2,ST_Makepoint(X(ST_PointN(l2,2))+sin(a2)*dist,Y(ST_PointN(l2,2))+cos(a2)*dist),-1);
				l2 = ST_AddPoint(l2,ST_Makepoint(X(ST_PointN(l2,1))-sin(a2)*dist,Y(ST_PointN(l2,1))-cos(a2)*dist),0);

				-- The new center is the intersection of the two bisectors
				center = ST_Intersection(l1,l2);
				-- The new radius is the distance to any of the three points
				radius = ST_Distance(center,ST_PointN(ring,idx1));
			END IF;
		END IF;
		END LOOP;
	--DONE!!  Return the MBC via the buffer command
	RETURN ST_Buffer(center,radius,segs_per_quarter);

	END;
$$
    LANGUAGE plpgsql IMMUTABLE STRICT;


--
-- TOC entry 3296 (class 0 OID 0)
-- Dependencies: 898
-- Name: FUNCTION st_minimumboundingcircle(inputgeom geometry, segs_per_quarter integer); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_minimumboundingcircle(inputgeom geometry, segs_per_quarter integer) IS 'args: geomA, num_segs_per_qt_circ - Returns the smallest circle polygon that can fully contain a geometry. Default uses 48 segments per quarter circle.';


--
-- TOC entry 899 (class 1255 OID 17823)
-- Dependencies: 1202 6 1202
-- Name: st_minimumboundingcircle(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_minimumboundingcircle(geometry) RETURNS geometry
    AS $_$SELECT ST_MinimumBoundingCircle($1, 48)$_$
    LANGUAGE sql IMMUTABLE STRICT;


--
-- TOC entry 3297 (class 0 OID 0)
-- Dependencies: 899
-- Name: FUNCTION st_minimumboundingcircle(geometry); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_minimumboundingcircle(geometry) IS 'args: geomA - Returns the smallest circle polygon that can fully contain a geometry. Default uses 48 segments per quarter circle.';


--
-- TOC entry 787 (class 1255 OID 17710)
-- Dependencies: 6 1202
-- Name: st_mlinefromtext(text, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_mlinefromtext(text, integer) RETURNS geometry
    AS $_$
	SELECT CASE
	WHEN geometrytype(GeomFromText($1, $2)) = 'MULTILINESTRING'
	THEN GeomFromText($1,$2)
	ELSE NULL END
	$_$
    LANGUAGE sql IMMUTABLE STRICT;


--
-- TOC entry 3298 (class 0 OID 0)
-- Dependencies: 787
-- Name: FUNCTION st_mlinefromtext(text, integer); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_mlinefromtext(text, integer) IS 'args: WKT, srid - Return a specified ST_MultiLineString value from WKT representation.';


--
-- TOC entry 789 (class 1255 OID 17712)
-- Dependencies: 1202 6
-- Name: st_mlinefromtext(text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_mlinefromtext(text) RETURNS geometry
    AS $_$
	SELECT CASE WHEN geometrytype(ST_GeomFromText($1)) = 'MULTILINESTRING'
	THEN ST_GeomFromText($1)
	ELSE NULL END
	$_$
    LANGUAGE sql IMMUTABLE STRICT;


--
-- TOC entry 3299 (class 0 OID 0)
-- Dependencies: 789
-- Name: FUNCTION st_mlinefromtext(text); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_mlinefromtext(text) IS 'args: WKT - Return a specified ST_MultiLineString value from WKT representation.';


--
-- TOC entry 849 (class 1255 OID 17772)
-- Dependencies: 6 1202
-- Name: st_mlinefromwkb(bytea, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_mlinefromwkb(bytea, integer) RETURNS geometry
    AS $_$
	SELECT CASE WHEN geometrytype(ST_GeomFromWKB($1, $2)) = 'MULTILINESTRING'
	THEN ST_GeomFromWKB($1, $2)
	ELSE NULL END
	$_$
    LANGUAGE sql IMMUTABLE STRICT;


--
-- TOC entry 851 (class 1255 OID 17774)
-- Dependencies: 1202 6
-- Name: st_mlinefromwkb(bytea); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_mlinefromwkb(bytea) RETURNS geometry
    AS $_$
	SELECT CASE WHEN geometrytype(ST_GeomFromWKB($1)) = 'MULTILINESTRING'
	THEN ST_GeomFromWKB($1)
	ELSE NULL END
	$_$
    LANGUAGE sql IMMUTABLE STRICT;


--
-- TOC entry 795 (class 1255 OID 17718)
-- Dependencies: 6 1202
-- Name: st_mpointfromtext(text, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_mpointfromtext(text, integer) RETURNS geometry
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromText($1, $2)) = 'MULTIPOINT'
	THEN GeomFromText($1, $2)
	ELSE NULL END
	$_$
    LANGUAGE sql IMMUTABLE STRICT;


--
-- TOC entry 3300 (class 0 OID 0)
-- Dependencies: 795
-- Name: FUNCTION st_mpointfromtext(text, integer); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_mpointfromtext(text, integer) IS 'args: WKT, srid - Makes a Geometry from WKT with the given SRID. If SRID is not give, it defaults to -1.';


--
-- TOC entry 797 (class 1255 OID 17720)
-- Dependencies: 6 1202
-- Name: st_mpointfromtext(text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_mpointfromtext(text) RETURNS geometry
    AS $_$
	SELECT CASE WHEN geometrytype(ST_GeomFromText($1)) = 'MULTIPOINT'
	THEN ST_GeomFromText($1)
	ELSE NULL END
	$_$
    LANGUAGE sql IMMUTABLE STRICT;


--
-- TOC entry 3301 (class 0 OID 0)
-- Dependencies: 797
-- Name: FUNCTION st_mpointfromtext(text); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_mpointfromtext(text) IS 'args: WKT - Makes a Geometry from WKT with the given SRID. If SRID is not give, it defaults to -1.';


--
-- TOC entry 838 (class 1255 OID 17761)
-- Dependencies: 1202 6
-- Name: st_mpointfromwkb(bytea, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_mpointfromwkb(bytea, integer) RETURNS geometry
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromWKB($1, $2)) = 'MULTIPOINT'
	THEN GeomFromWKB($1, $2)
	ELSE NULL END
	$_$
    LANGUAGE sql IMMUTABLE STRICT;


--
-- TOC entry 840 (class 1255 OID 17763)
-- Dependencies: 6 1202
-- Name: st_mpointfromwkb(bytea); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_mpointfromwkb(bytea) RETURNS geometry
    AS $_$
	SELECT CASE WHEN geometrytype(ST_GeomFromWKB($1)) = 'MULTIPOINT'
	THEN ST_GeomFromWKB($1)
	ELSE NULL END
	$_$
    LANGUAGE sql IMMUTABLE STRICT;


--
-- TOC entry 802 (class 1255 OID 17725)
-- Dependencies: 1202 6
-- Name: st_mpolyfromtext(text, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_mpolyfromtext(text, integer) RETURNS geometry
    AS $_$
	SELECT CASE WHEN geometrytype(ST_GeomFromText($1, $2)) = 'MULTIPOLYGON'
	THEN ST_GeomFromText($1,$2)
	ELSE NULL END
	$_$
    LANGUAGE sql IMMUTABLE STRICT;


--
-- TOC entry 3302 (class 0 OID 0)
-- Dependencies: 802
-- Name: FUNCTION st_mpolyfromtext(text, integer); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_mpolyfromtext(text, integer) IS 'args: WKT, srid - Makes a MultiPolygon Geometry from WKT with the given SRID. If SRID is not give, it defaults to -1.';


--
-- TOC entry 804 (class 1255 OID 17727)
-- Dependencies: 6 1202
-- Name: st_mpolyfromtext(text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_mpolyfromtext(text) RETURNS geometry
    AS $_$
	SELECT CASE WHEN geometrytype(ST_GeomFromText($1)) = 'MULTIPOLYGON'
	THEN ST_GeomFromText($1)
	ELSE NULL END
	$_$
    LANGUAGE sql IMMUTABLE STRICT;


--
-- TOC entry 3303 (class 0 OID 0)
-- Dependencies: 804
-- Name: FUNCTION st_mpolyfromtext(text); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_mpolyfromtext(text) IS 'args: WKT - Makes a MultiPolygon Geometry from WKT with the given SRID. If SRID is not give, it defaults to -1.';


--
-- TOC entry 853 (class 1255 OID 17776)
-- Dependencies: 6 1202
-- Name: st_mpolyfromwkb(bytea, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_mpolyfromwkb(bytea, integer) RETURNS geometry
    AS $_$
	SELECT CASE WHEN geometrytype(ST_GeomFromWKB($1, $2)) = 'MULTIPOLYGON'
	THEN ST_GeomFromWKB($1, $2)
	ELSE NULL END
	$_$
    LANGUAGE sql IMMUTABLE STRICT;


--
-- TOC entry 855 (class 1255 OID 17778)
-- Dependencies: 6 1202
-- Name: st_mpolyfromwkb(bytea); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_mpolyfromwkb(bytea) RETURNS geometry
    AS $_$
	SELECT CASE WHEN geometrytype(ST_GeomFromWKB($1)) = 'MULTIPOLYGON'
	THEN ST_GeomFromWKB($1)
	ELSE NULL END
	$_$
    LANGUAGE sql IMMUTABLE STRICT;


--
-- TOC entry 421 (class 1255 OID 17286)
-- Dependencies: 6 1202 1202
-- Name: st_multi(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_multi(geometry) RETURNS geometry
    AS '$libdir/postgis-1.4', 'LWGEOM_force_multi'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 3304 (class 0 OID 0)
-- Dependencies: 421
-- Name: FUNCTION st_multi(geometry); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_multi(geometry) IS 'args: g1 - Returns the geometry as a MULTI* geometry. If the geometry is already a MULTI*, it is returned unchanged.';


--
-- TOC entry 847 (class 1255 OID 17770)
-- Dependencies: 6 1202
-- Name: st_multilinefromwkb(bytea); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_multilinefromwkb(bytea) RETURNS geometry
    AS $_$
	SELECT CASE WHEN geometrytype(ST_GeomFromWKB($1)) = 'MULTILINESTRING'
	THEN ST_GeomFromWKB($1)
	ELSE NULL END
	$_$
    LANGUAGE sql IMMUTABLE STRICT;


--
-- TOC entry 791 (class 1255 OID 17714)
-- Dependencies: 6 1202
-- Name: st_multilinestringfromtext(text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_multilinestringfromtext(text) RETURNS geometry
    AS $_$SELECT ST_MLineFromText($1)$_$
    LANGUAGE sql IMMUTABLE STRICT;


--
-- TOC entry 793 (class 1255 OID 17716)
-- Dependencies: 6 1202
-- Name: st_multilinestringfromtext(text, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_multilinestringfromtext(text, integer) RETURNS geometry
    AS $_$SELECT MLineFromText($1, $2)$_$
    LANGUAGE sql IMMUTABLE STRICT;


--
-- TOC entry 800 (class 1255 OID 17723)
-- Dependencies: 6 1202
-- Name: st_multipointfromtext(text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_multipointfromtext(text) RETURNS geometry
    AS $_$SELECT MPointFromText($1)$_$
    LANGUAGE sql IMMUTABLE STRICT;


--
-- TOC entry 842 (class 1255 OID 17765)
-- Dependencies: 1202 6
-- Name: st_multipointfromwkb(bytea, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_multipointfromwkb(bytea, integer) RETURNS geometry
    AS $_$
	SELECT CASE WHEN geometrytype(ST_GeomFromWKB($1,$2)) = 'MULTIPOINT'
	THEN ST_GeomFromWKB($1, $2)
	ELSE NULL END
	$_$
    LANGUAGE sql IMMUTABLE STRICT;


--
-- TOC entry 844 (class 1255 OID 17767)
-- Dependencies: 6 1202
-- Name: st_multipointfromwkb(bytea); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_multipointfromwkb(bytea) RETURNS geometry
    AS $_$
	SELECT CASE WHEN geometrytype(ST_GeomFromWKB($1)) = 'MULTIPOINT'
	THEN ST_GeomFromWKB($1)
	ELSE NULL END
	$_$
    LANGUAGE sql IMMUTABLE STRICT;


--
-- TOC entry 857 (class 1255 OID 17780)
-- Dependencies: 6 1202
-- Name: st_multipolyfromwkb(bytea, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_multipolyfromwkb(bytea, integer) RETURNS geometry
    AS $_$
	SELECT CASE WHEN geometrytype(ST_GeomFromWKB($1, $2)) = 'MULTIPOLYGON'
	THEN ST_GeomFromWKB($1, $2)
	ELSE NULL END
	$_$
    LANGUAGE sql IMMUTABLE STRICT;


--
-- TOC entry 859 (class 1255 OID 17782)
-- Dependencies: 1202 6
-- Name: st_multipolyfromwkb(bytea); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_multipolyfromwkb(bytea) RETURNS geometry
    AS $_$
	SELECT CASE WHEN geometrytype(ST_GeomFromWKB($1)) = 'MULTIPOLYGON'
	THEN ST_GeomFromWKB($1)
	ELSE NULL END
	$_$
    LANGUAGE sql IMMUTABLE STRICT;


--
-- TOC entry 806 (class 1255 OID 17729)
-- Dependencies: 1202 6
-- Name: st_multipolygonfromtext(text, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_multipolygonfromtext(text, integer) RETURNS geometry
    AS $_$SELECT MPolyFromText($1, $2)$_$
    LANGUAGE sql IMMUTABLE STRICT;


--
-- TOC entry 808 (class 1255 OID 17731)
-- Dependencies: 6 1202
-- Name: st_multipolygonfromtext(text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_multipolygonfromtext(text) RETURNS geometry
    AS $_$SELECT MPolyFromText($1)$_$
    LANGUAGE sql IMMUTABLE STRICT;


--
-- TOC entry 441 (class 1255 OID 17306)
-- Dependencies: 6 1202
-- Name: st_ndims(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_ndims(geometry) RETURNS smallint
    AS '$libdir/postgis-1.4', 'LWGEOM_ndims'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 3305 (class 0 OID 0)
-- Dependencies: 441
-- Name: FUNCTION st_ndims(geometry); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_ndims(geometry) IS 'args: g1 - Returns coordinate dimension of the geometry as a small int. Values are: 2,3 or 4.';


--
-- TOC entry 435 (class 1255 OID 17300)
-- Dependencies: 6 1202 1202
-- Name: st_noop(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_noop(geometry) RETURNS geometry
    AS '$libdir/postgis-1.4', 'LWGEOM_noop'
    LANGUAGE c STRICT;


--
-- TOC entry 371 (class 1255 OID 17236)
-- Dependencies: 6 1202
-- Name: st_npoints(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_npoints(geometry) RETURNS integer
    AS '$libdir/postgis-1.4', 'LWGEOM_npoints'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 3306 (class 0 OID 0)
-- Dependencies: 371
-- Name: FUNCTION st_npoints(geometry); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_npoints(geometry) IS 'args: g1 - Return the number of points (vertexes) in a geometry.';


--
-- TOC entry 373 (class 1255 OID 17238)
-- Dependencies: 6 1202
-- Name: st_nrings(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_nrings(geometry) RETURNS integer
    AS '$libdir/postgis-1.4', 'LWGEOM_nrings'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 3307 (class 0 OID 0)
-- Dependencies: 373
-- Name: FUNCTION st_nrings(geometry); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_nrings(geometry) IS 'args: geomA - If the geometry is a polygon or multi-polygon returns the number of rings.';


--
-- TOC entry 717 (class 1255 OID 17640)
-- Dependencies: 1202 6
-- Name: st_numgeometries(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_numgeometries(geometry) RETURNS integer
    AS '$libdir/postgis-1.4', 'LWGEOM_numgeometries_collection'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 3308 (class 0 OID 0)
-- Dependencies: 717
-- Name: FUNCTION st_numgeometries(geometry); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_numgeometries(geometry) IS 'args: a_multi_or_geomcollection - If geometry is a GEOMETRYCOLLECTION (or MULTI*) return the number of geometries, otherwise return NULL.';


--
-- TOC entry 727 (class 1255 OID 17650)
-- Dependencies: 6 1202
-- Name: st_numinteriorring(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_numinteriorring(geometry) RETURNS integer
    AS '$libdir/postgis-1.4', 'LWGEOM_numinteriorrings_polygon'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 3309 (class 0 OID 0)
-- Dependencies: 727
-- Name: FUNCTION st_numinteriorring(geometry); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_numinteriorring(geometry) IS 'args: a_polygon - Return the number of interior rings of the first polygon in the geometry. Synonym to ST_NumInteriorRings.';


--
-- TOC entry 725 (class 1255 OID 17648)
-- Dependencies: 1202 6
-- Name: st_numinteriorrings(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_numinteriorrings(geometry) RETURNS integer
    AS '$libdir/postgis-1.4', 'LWGEOM_numinteriorrings_polygon'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 3310 (class 0 OID 0)
-- Dependencies: 725
-- Name: FUNCTION st_numinteriorrings(geometry); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_numinteriorrings(geometry) IS 'args: a_polygon - Return the number of interior rings of the first polygon in the geometry. This will work with both POLYGON and MULTIPOLYGON types but only looks at the first polygon. Return NULL if there is no polygon in the geometry.';


--
-- TOC entry 715 (class 1255 OID 17638)
-- Dependencies: 1202 6
-- Name: st_numpoints(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_numpoints(geometry) RETURNS integer
    AS '$libdir/postgis-1.4', 'LWGEOM_numpoints_linestring'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 3311 (class 0 OID 0)
-- Dependencies: 715
-- Name: FUNCTION st_numpoints(geometry); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_numpoints(geometry) IS 'args: g1 - Return the number of points in an ST_LineString or ST_CircularString value.';


--
-- TOC entry 884 (class 1255 OID 17807)
-- Dependencies: 6 1202 1202
-- Name: st_orderingequals(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_orderingequals(geometry, geometry) RETURNS boolean
    AS $_$ 
	SELECT $1 && $2 AND $1 ~= $2
	$_$
    LANGUAGE sql IMMUTABLE STRICT;


--
-- TOC entry 3312 (class 0 OID 0)
-- Dependencies: 884
-- Name: FUNCTION st_orderingequals(geometry, geometry); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_orderingequals(geometry, geometry) IS 'args: A, B - Returns true if the given geometries represent the same geometry and points are in the same directional order.';


--
-- TOC entry 668 (class 1255 OID 17591)
-- Dependencies: 6 1202 1202
-- Name: st_overlaps(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_overlaps(geometry, geometry) RETURNS boolean
    AS $_$SELECT $1 && $2 AND _ST_Overlaps($1,$2)$_$
    LANGUAGE sql IMMUTABLE;


--
-- TOC entry 3313 (class 0 OID 0)
-- Dependencies: 668
-- Name: FUNCTION st_overlaps(geometry, geometry); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_overlaps(geometry, geometry) IS 'args: A, B - Returns TRUE if the Geometries share space, are of the same dimension, but are not completely contained by each other.';


--
-- TOC entry 391 (class 1255 OID 17256)
-- Dependencies: 6 1202
-- Name: st_perimeter(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_perimeter(geometry) RETURNS double precision
    AS '$libdir/postgis-1.4', 'LWGEOM_perimeter2d_poly'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 3314 (class 0 OID 0)
-- Dependencies: 391
-- Name: FUNCTION st_perimeter(geometry); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_perimeter(geometry) IS 'args: g1 - Return the length measurement of the boundary of an ST_Surface or ST_MultiSurface value. (Polygon, Multipolygon)';


--
-- TOC entry 389 (class 1255 OID 17254)
-- Dependencies: 6 1202
-- Name: st_perimeter2d(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_perimeter2d(geometry) RETURNS double precision
    AS '$libdir/postgis-1.4', 'LWGEOM_perimeter2d_poly'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 3315 (class 0 OID 0)
-- Dependencies: 389
-- Name: FUNCTION st_perimeter2d(geometry); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_perimeter2d(geometry) IS 'args: geomA - Returns the 2-dimensional perimeter of the geometry, if it is a polygon or multi-polygon. This is currently an alias for ST_Perimeter.';


--
-- TOC entry 387 (class 1255 OID 17252)
-- Dependencies: 6 1202
-- Name: st_perimeter3d(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_perimeter3d(geometry) RETURNS double precision
    AS '$libdir/postgis-1.4', 'LWGEOM_perimeter_poly'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 3316 (class 0 OID 0)
-- Dependencies: 387
-- Name: FUNCTION st_perimeter3d(geometry); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_perimeter3d(geometry) IS 'args: geomA - Returns the 3-dimensional perimeter of the geometry, if it is a polygon or multi-polygon.';


--
-- TOC entry 887 (class 1255 OID 17810)
-- Dependencies: 1202 6
-- Name: st_point(double precision, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_point(double precision, double precision) RETURNS geometry
    AS '$libdir/postgis-1.4', 'LWGEOM_makepoint'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 3317 (class 0 OID 0)
-- Dependencies: 887
-- Name: FUNCTION st_point(double precision, double precision); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_point(double precision, double precision) IS 'args: x_lon, y_lat - Returns an ST_Point with the given coordinate values. OGC alias for ST_MakePoint.';


--
-- TOC entry 405 (class 1255 OID 17270)
-- Dependencies: 6 1202
-- Name: st_point_inside_circle(geometry, double precision, double precision, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_point_inside_circle(geometry, double precision, double precision, double precision) RETURNS boolean
    AS '$libdir/postgis-1.4', 'LWGEOM_inside_circle_point'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 3318 (class 0 OID 0)
-- Dependencies: 405
-- Name: FUNCTION st_point_inside_circle(geometry, double precision, double precision, double precision); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_point_inside_circle(geometry, double precision, double precision, double precision) IS 'args: a_point, center_x, center_y, radius - Is the point geometry insert circle defined by center_x, center_y , radius';


--
-- TOC entry 769 (class 1255 OID 17692)
-- Dependencies: 6 1202
-- Name: st_pointfromtext(text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_pointfromtext(text) RETURNS geometry
    AS $_$
	SELECT CASE WHEN geometrytype(ST_GeomFromText($1)) = 'POINT'
	THEN ST_GeomFromText($1)
	ELSE NULL END
	$_$
    LANGUAGE sql IMMUTABLE STRICT;


--
-- TOC entry 3319 (class 0 OID 0)
-- Dependencies: 769
-- Name: FUNCTION st_pointfromtext(text); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_pointfromtext(text) IS 'args: WKT - Makes a point Geometry from WKT with the given SRID. If SRID is not given, it defaults to unknown.';


--
-- TOC entry 771 (class 1255 OID 17694)
-- Dependencies: 6 1202
-- Name: st_pointfromtext(text, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_pointfromtext(text, integer) RETURNS geometry
    AS $_$
	SELECT CASE WHEN geometrytype(ST_GeomFromText($1, $2)) = 'POINT'
	THEN ST_GeomFromText($1, $2)
	ELSE NULL END
	$_$
    LANGUAGE sql IMMUTABLE STRICT;


--
-- TOC entry 3320 (class 0 OID 0)
-- Dependencies: 771
-- Name: FUNCTION st_pointfromtext(text, integer); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_pointfromtext(text, integer) IS 'args: WKT, srid - Makes a point Geometry from WKT with the given SRID. If SRID is not given, it defaults to unknown.';


--
-- TOC entry 818 (class 1255 OID 17741)
-- Dependencies: 1202 6
-- Name: st_pointfromwkb(bytea, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_pointfromwkb(bytea, integer) RETURNS geometry
    AS $_$
	SELECT CASE WHEN geometrytype(ST_GeomFromWKB($1, $2)) = 'POINT'
	THEN ST_GeomFromWKB($1, $2)
	ELSE NULL END
	$_$
    LANGUAGE sql IMMUTABLE STRICT;


--
-- TOC entry 820 (class 1255 OID 17743)
-- Dependencies: 1202 6
-- Name: st_pointfromwkb(bytea); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_pointfromwkb(bytea) RETURNS geometry
    AS $_$
	SELECT CASE WHEN geometrytype(ST_GeomFromWKB($1)) = 'POINT'
	THEN ST_GeomFromWKB($1)
	ELSE NULL END
	$_$
    LANGUAGE sql IMMUTABLE STRICT;


--
-- TOC entry 733 (class 1255 OID 17656)
-- Dependencies: 1202 6 1202
-- Name: st_pointn(geometry, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_pointn(geometry, integer) RETURNS geometry
    AS '$libdir/postgis-1.4', 'LWGEOM_pointn_linestring'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 3321 (class 0 OID 0)
-- Dependencies: 733
-- Name: FUNCTION st_pointn(geometry, integer); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_pointn(geometry, integer) IS 'args: a_linestring, n - Return the Nth point in the first linestring or circular linestring in the geometry. Return NULL if there is no linestring in the geometry.';


--
-- TOC entry 677 (class 1255 OID 17600)
-- Dependencies: 1202 6 1202
-- Name: st_pointonsurface(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_pointonsurface(geometry) RETURNS geometry
    AS '$libdir/postgis-1.4', 'pointonsurface'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 3322 (class 0 OID 0)
-- Dependencies: 677
-- Name: FUNCTION st_pointonsurface(geometry); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_pointonsurface(geometry) IS 'args: g1 - Returns a POINT guaranteed to lie on the surface.';


--
-- TOC entry 779 (class 1255 OID 17702)
-- Dependencies: 6 1202
-- Name: st_polyfromtext(text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_polyfromtext(text) RETURNS geometry
    AS $_$
	SELECT CASE WHEN geometrytype(ST_GeomFromText($1)) = 'POLYGON'
	THEN ST_GeomFromText($1)
	ELSE NULL END
	$_$
    LANGUAGE sql IMMUTABLE STRICT;


--
-- TOC entry 781 (class 1255 OID 17704)
-- Dependencies: 1202 6
-- Name: st_polyfromtext(text, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_polyfromtext(text, integer) RETURNS geometry
    AS $_$
	SELECT CASE WHEN geometrytype(ST_GeomFromText($1, $2)) = 'POLYGON'
	THEN ST_GeomFromText($1, $2)
	ELSE NULL END
	$_$
    LANGUAGE sql IMMUTABLE STRICT;


--
-- TOC entry 830 (class 1255 OID 17753)
-- Dependencies: 6 1202
-- Name: st_polyfromwkb(bytea, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_polyfromwkb(bytea, integer) RETURNS geometry
    AS $_$
	SELECT CASE WHEN geometrytype(ST_GeomFromWKB($1, $2)) = 'POLYGON'
	THEN ST_GeomFromWKB($1, $2)
	ELSE NULL END
	$_$
    LANGUAGE sql IMMUTABLE STRICT;


--
-- TOC entry 832 (class 1255 OID 17755)
-- Dependencies: 6 1202
-- Name: st_polyfromwkb(bytea); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_polyfromwkb(bytea) RETURNS geometry
    AS $_$
	SELECT CASE WHEN geometrytype(ST_GeomFromWKB($1)) = 'POLYGON'
	THEN ST_GeomFromWKB($1)
	ELSE NULL END
	$_$
    LANGUAGE sql IMMUTABLE STRICT;


--
-- TOC entry 890 (class 1255 OID 17813)
-- Dependencies: 1202 6 1202
-- Name: st_polygon(geometry, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_polygon(geometry, integer) RETURNS geometry
    AS $_$ 
	SELECT setSRID(makepolygon($1), $2)
	$_$
    LANGUAGE sql IMMUTABLE STRICT;


--
-- TOC entry 3323 (class 0 OID 0)
-- Dependencies: 890
-- Name: FUNCTION st_polygon(geometry, integer); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_polygon(geometry, integer) IS 'args: aLineString, srid - Returns a polygon built from the specified linestring and SRID.';


--
-- TOC entry 783 (class 1255 OID 17706)
-- Dependencies: 1202 6
-- Name: st_polygonfromtext(text, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_polygonfromtext(text, integer) RETURNS geometry
    AS $_$SELECT PolyFromText($1, $2)$_$
    LANGUAGE sql IMMUTABLE STRICT;


--
-- TOC entry 3324 (class 0 OID 0)
-- Dependencies: 783
-- Name: FUNCTION st_polygonfromtext(text, integer); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_polygonfromtext(text, integer) IS 'args: WKT, srid - Makes a Geometry from WKT with the given SRID. If SRID is not give, it defaults to -1.';


--
-- TOC entry 785 (class 1255 OID 17708)
-- Dependencies: 1202 6
-- Name: st_polygonfromtext(text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_polygonfromtext(text) RETURNS geometry
    AS $_$SELECT ST_PolyFromText($1)$_$
    LANGUAGE sql IMMUTABLE STRICT;


--
-- TOC entry 3325 (class 0 OID 0)
-- Dependencies: 785
-- Name: FUNCTION st_polygonfromtext(text); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_polygonfromtext(text) IS 'args: WKT - Makes a Geometry from WKT with the given SRID. If SRID is not give, it defaults to -1.';


--
-- TOC entry 834 (class 1255 OID 17757)
-- Dependencies: 1202 6
-- Name: st_polygonfromwkb(bytea, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_polygonfromwkb(bytea, integer) RETURNS geometry
    AS $_$
	SELECT CASE WHEN geometrytype(ST_GeomFromWKB($1,$2)) = 'POLYGON'
	THEN ST_GeomFromWKB($1, $2)
	ELSE NULL END
	$_$
    LANGUAGE sql IMMUTABLE STRICT;


--
-- TOC entry 836 (class 1255 OID 17759)
-- Dependencies: 6 1202
-- Name: st_polygonfromwkb(bytea); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_polygonfromwkb(bytea) RETURNS geometry
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromWKB($1)) = 'POLYGON'
	THEN GeomFromWKB($1)
	ELSE NULL END
	$_$
    LANGUAGE sql IMMUTABLE STRICT;


--
-- TOC entry 493 (class 1255 OID 17358)
-- Dependencies: 6 1202 1204
-- Name: st_polygonize(geometry[]); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_polygonize(geometry[]) RETURNS geometry
    AS '$libdir/postgis-1.4', 'polygonize_garray'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 492 (class 1255 OID 17357)
-- Dependencies: 6 1202 1204
-- Name: st_polygonize_garray(geometry[]); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_polygonize_garray(geometry[]) RETURNS geometry
    AS '$libdir/postgis-1.4', 'polygonize_garray'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 313 (class 1255 OID 17145)
-- Dependencies: 6
-- Name: st_postgis_gist_joinsel(internal, oid, internal, smallint); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_postgis_gist_joinsel(internal, oid, internal, smallint) RETURNS double precision
    AS '$libdir/postgis-1.4', 'LWGEOM_gist_joinsel'
    LANGUAGE c;


--
-- TOC entry 311 (class 1255 OID 17143)
-- Dependencies: 6
-- Name: st_postgis_gist_sel(internal, oid, internal, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_postgis_gist_sel(internal, oid, internal, integer) RETURNS double precision
    AS '$libdir/postgis-1.4', 'LWGEOM_gist_sel'
    LANGUAGE c;


--
-- TOC entry 638 (class 1255 OID 17561)
-- Dependencies: 6 1202 1202
-- Name: st_relate(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_relate(geometry, geometry) RETURNS text
    AS '$libdir/postgis-1.4', 'relate_full'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 3326 (class 0 OID 0)
-- Dependencies: 638
-- Name: FUNCTION st_relate(geometry, geometry); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_relate(geometry, geometry) IS 'args: geomA, geomB - Returns true if this Geometry is spatially related to anotherGeometry, by testing for intersections between the Interior, Boundary and Exterior of the two geometries as specified by the values in the intersectionMatrixPattern. If no intersectionMatrixPattern is passed in, then returns the maximum intersectionMatrixPattern that relates the 2 geometries.';


--
-- TOC entry 640 (class 1255 OID 17563)
-- Dependencies: 6 1202 1202
-- Name: st_relate(geometry, geometry, text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_relate(geometry, geometry, text) RETURNS boolean
    AS '$libdir/postgis-1.4', 'relate_pattern'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 3327 (class 0 OID 0)
-- Dependencies: 640
-- Name: FUNCTION st_relate(geometry, geometry, text); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_relate(geometry, geometry, text) IS 'args: geomA, geomB, intersectionMatrixPattern - Returns true if this Geometry is spatially related to anotherGeometry, by testing for intersections between the Interior, Boundary and Exterior of the two geometries as specified by the values in the intersectionMatrixPattern. If no intersectionMatrixPattern is passed in, then returns the maximum intersectionMatrixPattern that relates the 2 geometries.';


--
-- TOC entry 482 (class 1255 OID 17347)
-- Dependencies: 6 1202 1202
-- Name: st_removepoint(geometry, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_removepoint(geometry, integer) RETURNS geometry
    AS '$libdir/postgis-1.4', 'LWGEOM_removepoint'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 3328 (class 0 OID 0)
-- Dependencies: 482
-- Name: FUNCTION st_removepoint(geometry, integer); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_removepoint(geometry, integer) IS 'args: linestring, offset - Removes point from a linestring. Offset is 0-based.';


--
-- TOC entry 431 (class 1255 OID 17296)
-- Dependencies: 6 1202 1202
-- Name: st_reverse(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_reverse(geometry) RETURNS geometry
    AS '$libdir/postgis-1.4', 'LWGEOM_reverse'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 3329 (class 0 OID 0)
-- Dependencies: 431
-- Name: FUNCTION st_reverse(geometry); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_reverse(geometry) IS 'args: g1 - Returns the geometry with vertex order reversed.';


--
-- TOC entry 234 (class 1255 OID 17045)
-- Dependencies: 1202 6 1202
-- Name: st_rotate(geometry, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_rotate(geometry, double precision) RETURNS geometry
    AS $_$SELECT rotateZ($1, $2)$_$
    LANGUAGE sql IMMUTABLE STRICT;


--
-- TOC entry 3330 (class 0 OID 0)
-- Dependencies: 234
-- Name: FUNCTION st_rotate(geometry, double precision); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_rotate(geometry, double precision) IS 'args: geomA, rotZRadians - This is a synonym for ST_RotateZ';


--
-- TOC entry 236 (class 1255 OID 17047)
-- Dependencies: 1202 6 1202
-- Name: st_rotatex(geometry, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_rotatex(geometry, double precision) RETURNS geometry
    AS $_$SELECT affine($1, 1, 0, 0, 0, cos($2), -sin($2), 0, sin($2), cos($2), 0, 0, 0)$_$
    LANGUAGE sql IMMUTABLE STRICT;


--
-- TOC entry 3331 (class 0 OID 0)
-- Dependencies: 236
-- Name: FUNCTION st_rotatex(geometry, double precision); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_rotatex(geometry, double precision) IS 'args: geomA, rotRadians - Rotate a geometry rotRadians about the X axis.';


--
-- TOC entry 238 (class 1255 OID 17049)
-- Dependencies: 1202 6 1202
-- Name: st_rotatey(geometry, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_rotatey(geometry, double precision) RETURNS geometry
    AS $_$SELECT affine($1,  cos($2), 0, sin($2),  0, 1, 0,  -sin($2), 0, cos($2), 0,  0, 0)$_$
    LANGUAGE sql IMMUTABLE STRICT;


--
-- TOC entry 3332 (class 0 OID 0)
-- Dependencies: 238
-- Name: FUNCTION st_rotatey(geometry, double precision); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_rotatey(geometry, double precision) IS 'args: geomA, rotRadians - Rotate a geometry rotRadians about the Y axis.';


--
-- TOC entry 232 (class 1255 OID 17043)
-- Dependencies: 1202 6 1202
-- Name: st_rotatez(geometry, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_rotatez(geometry, double precision) RETURNS geometry
    AS $_$SELECT affine($1,  cos($2), -sin($2), 0,  sin($2), cos($2), 0,  0, 0, 1,  0, 0, 0)$_$
    LANGUAGE sql IMMUTABLE STRICT;


--
-- TOC entry 3333 (class 0 OID 0)
-- Dependencies: 232
-- Name: FUNCTION st_rotatez(geometry, double precision); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_rotatez(geometry, double precision) IS 'args: geomA, rotRadians - Rotate a geometry rotRadians about the Z axis.';


--
-- TOC entry 244 (class 1255 OID 17055)
-- Dependencies: 6 1202 1202
-- Name: st_scale(geometry, double precision, double precision, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_scale(geometry, double precision, double precision, double precision) RETURNS geometry
    AS $_$SELECT affine($1,  $2, 0, 0,  0, $3, 0,  0, 0, $4,  0, 0, 0)$_$
    LANGUAGE sql IMMUTABLE STRICT;


--
-- TOC entry 3334 (class 0 OID 0)
-- Dependencies: 244
-- Name: FUNCTION st_scale(geometry, double precision, double precision, double precision); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_scale(geometry, double precision, double precision, double precision) IS 'args: geomA, XFactor, YFactor, ZFactor - Scales the geometry to a new size by multiplying the ordinates with the parameters. Ie: ST_Scale(geom, Xfactor, Yfactor, Zfactor).';


--
-- TOC entry 246 (class 1255 OID 17057)
-- Dependencies: 1202 6 1202
-- Name: st_scale(geometry, double precision, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_scale(geometry, double precision, double precision) RETURNS geometry
    AS $_$SELECT scale($1, $2, $3, 1)$_$
    LANGUAGE sql IMMUTABLE STRICT;


--
-- TOC entry 3335 (class 0 OID 0)
-- Dependencies: 246
-- Name: FUNCTION st_scale(geometry, double precision, double precision); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_scale(geometry, double precision, double precision) IS 'args: geomA, XFactor, YFactor - Scales the geometry to a new size by multiplying the ordinates with the parameters. Ie: ST_Scale(geom, Xfactor, Yfactor, Zfactor).';


--
-- TOC entry 583 (class 1255 OID 17489)
-- Dependencies: 6 1202 1202
-- Name: st_segmentize(geometry, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_segmentize(geometry, double precision) RETURNS geometry
    AS '$libdir/postgis-1.4', 'LWGEOM_segmentize2d'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 3336 (class 0 OID 0)
-- Dependencies: 583
-- Name: FUNCTION st_segmentize(geometry, double precision); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_segmentize(geometry, double precision) IS 'args: geomA, max_length - Return a modified geometry having no segment longer than the given distance. Distance computation is performed in 2d only.';


--
-- TOC entry 365 (class 1255 OID 17230)
-- Dependencies: 6 1211 1211
-- Name: st_setfactor(chip, real); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_setfactor(chip, real) RETURNS chip
    AS '$libdir/postgis-1.4', 'CHIP_setFactor'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 484 (class 1255 OID 17349)
-- Dependencies: 6 1202 1202 1202
-- Name: st_setpoint(geometry, integer, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_setpoint(geometry, integer, geometry) RETURNS geometry
    AS '$libdir/postgis-1.4', 'LWGEOM_setpoint_linestring'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 3337 (class 0 OID 0)
-- Dependencies: 484
-- Name: FUNCTION st_setpoint(geometry, integer, geometry); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_setpoint(geometry, integer, geometry) IS 'args: linestring, zerobasedposition, point - Replace point N of linestring with given point. Index is 0-based.';


--
-- TOC entry 753 (class 1255 OID 17676)
-- Dependencies: 1202 6 1202
-- Name: st_setsrid(geometry, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_setsrid(geometry, integer) RETURNS geometry
    AS '$libdir/postgis-1.4', 'LWGEOM_setSRID'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 3338 (class 0 OID 0)
-- Dependencies: 753
-- Name: FUNCTION st_setsrid(geometry, integer); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_setsrid(geometry, integer) IS 'args: geom, srid - Sets the SRID on a geometry to a particular integer value.';


--
-- TOC entry 250 (class 1255 OID 17061)
-- Dependencies: 1202 1202 6
-- Name: st_shift_longitude(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_shift_longitude(geometry) RETURNS geometry
    AS '$libdir/postgis-1.4', 'LWGEOM_longitude_shift'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 3339 (class 0 OID 0)
-- Dependencies: 250
-- Name: FUNCTION st_shift_longitude(geometry); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_shift_longitude(geometry) IS 'args: geomA - Reads every point/vertex in every component of every feature in a geometry, and if the longitude coordinate is <0, adds 360 to it. The result would be a 0-360 version of the data to be plotted in a 180 centric map';


--
-- TOC entry 573 (class 1255 OID 17479)
-- Dependencies: 6 1202 1202
-- Name: st_simplify(geometry, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_simplify(geometry, double precision) RETURNS geometry
    AS '$libdir/postgis-1.4', 'LWGEOM_simplify2d'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 3340 (class 0 OID 0)
-- Dependencies: 573
-- Name: FUNCTION st_simplify(geometry, double precision); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_simplify(geometry, double precision) IS 'args: geomA, tolerance - Returns a "simplified" version of the given geometry using the Douglas-Peuker algorithm.';


--
-- TOC entry 605 (class 1255 OID 17511)
-- Dependencies: 6 1202 1202
-- Name: st_simplifypreservetopology(geometry, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_simplifypreservetopology(geometry, double precision) RETURNS geometry
    AS '$libdir/postgis-1.4', 'topologypreservesimplify'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 3341 (class 0 OID 0)
-- Dependencies: 605
-- Name: FUNCTION st_simplifypreservetopology(geometry, double precision); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_simplifypreservetopology(geometry, double precision) IS 'args: geomA, tolerance - Returns a "simplified" version of the given geometry using the Douglas-Peuker algorithm. Will avoid creating derived geometries (polygons in particular) that are invalid.';


--
-- TOC entry 575 (class 1255 OID 17481)
-- Dependencies: 6 1202 1202
-- Name: st_snaptogrid(geometry, double precision, double precision, double precision, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_snaptogrid(geometry, double precision, double precision, double precision, double precision) RETURNS geometry
    AS '$libdir/postgis-1.4', 'LWGEOM_snaptogrid'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 3342 (class 0 OID 0)
-- Dependencies: 575
-- Name: FUNCTION st_snaptogrid(geometry, double precision, double precision, double precision, double precision); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_snaptogrid(geometry, double precision, double precision, double precision, double precision) IS 'args: geomA, originX, originY, sizeX, sizeY - Snap all points of the input geometry to the grid defined by its origin and cell size. Remove consecutive points falling on the same cell, eventually returning NULL if output points are not enough to define a geometry of the given type. Collapsed geometries in a collection are stripped from it. Useful for reducing precision.';


--
-- TOC entry 577 (class 1255 OID 17483)
-- Dependencies: 6 1202 1202
-- Name: st_snaptogrid(geometry, double precision, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_snaptogrid(geometry, double precision, double precision) RETURNS geometry
    AS $_$SELECT ST_SnapToGrid($1, 0, 0, $2, $3)$_$
    LANGUAGE sql IMMUTABLE STRICT;


--
-- TOC entry 3343 (class 0 OID 0)
-- Dependencies: 577
-- Name: FUNCTION st_snaptogrid(geometry, double precision, double precision); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_snaptogrid(geometry, double precision, double precision) IS 'args: geomA, sizeX, sizeY - Snap all points of the input geometry to the grid defined by its origin and cell size. Remove consecutive points falling on the same cell, eventually returning NULL if output points are not enough to define a geometry of the given type. Collapsed geometries in a collection are stripped from it. Useful for reducing precision.';


--
-- TOC entry 579 (class 1255 OID 17485)
-- Dependencies: 6 1202 1202
-- Name: st_snaptogrid(geometry, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_snaptogrid(geometry, double precision) RETURNS geometry
    AS $_$SELECT ST_SnapToGrid($1, 0, 0, $2, $2)$_$
    LANGUAGE sql IMMUTABLE STRICT;


--
-- TOC entry 3344 (class 0 OID 0)
-- Dependencies: 579
-- Name: FUNCTION st_snaptogrid(geometry, double precision); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_snaptogrid(geometry, double precision) IS 'args: geomA, size - Snap all points of the input geometry to the grid defined by its origin and cell size. Remove consecutive points falling on the same cell, eventually returning NULL if output points are not enough to define a geometry of the given type. Collapsed geometries in a collection are stripped from it. Useful for reducing precision.';


--
-- TOC entry 581 (class 1255 OID 17487)
-- Dependencies: 6 1202 1202 1202
-- Name: st_snaptogrid(geometry, geometry, double precision, double precision, double precision, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_snaptogrid(geometry, geometry, double precision, double precision, double precision, double precision) RETURNS geometry
    AS '$libdir/postgis-1.4', 'LWGEOM_snaptogrid_pointoff'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 3345 (class 0 OID 0)
-- Dependencies: 581
-- Name: FUNCTION st_snaptogrid(geometry, geometry, double precision, double precision, double precision, double precision); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_snaptogrid(geometry, geometry, double precision, double precision, double precision, double precision) IS 'args: geomA, pointOrigin, sizeX, sizeY, sizeZ, sizeM - Snap all points of the input geometry to the grid defined by its origin and cell size. Remove consecutive points falling on the same cell, eventually returning NULL if output points are not enough to define a geometry of the given type. Collapsed geometries in a collection are stripped from it. Useful for reducing precision.';


--
-- TOC entry 352 (class 1255 OID 17217)
-- Dependencies: 6 1211
-- Name: st_srid(chip); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_srid(chip) RETURNS integer
    AS '$libdir/postgis-1.4', 'CHIP_getSRID'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 751 (class 1255 OID 17674)
-- Dependencies: 1202 6
-- Name: st_srid(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_srid(geometry) RETURNS integer
    AS '$libdir/postgis-1.4', 'LWGEOM_getSRID'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 3346 (class 0 OID 0)
-- Dependencies: 751
-- Name: FUNCTION st_srid(geometry); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_srid(geometry) IS 'args: g1 - Returns the spatial reference identifier for the ST_Geometry as defined in spatial_ref_sys table.';


--
-- TOC entry 743 (class 1255 OID 17666)
-- Dependencies: 1202 1202 6
-- Name: st_startpoint(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_startpoint(geometry) RETURNS geometry
    AS '$libdir/postgis-1.4', 'LWGEOM_startpoint_linestring'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 3347 (class 0 OID 0)
-- Dependencies: 743
-- Name: FUNCTION st_startpoint(geometry); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_startpoint(geometry) IS 'args: geomA - Returns the first point of a LINESTRING geometry as a POINT.';


--
-- TOC entry 369 (class 1255 OID 17234)
-- Dependencies: 6 1202
-- Name: st_summary(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_summary(geometry) RETURNS text
    AS '$libdir/postgis-1.4', 'LWGEOM_summary'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 3348 (class 0 OID 0)
-- Dependencies: 369
-- Name: FUNCTION st_summary(geometry); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_summary(geometry) IS 'args: g - Returns a text summary of the contents of the ST_Geometry.';


--
-- TOC entry 612 (class 1255 OID 17518)
-- Dependencies: 6 1202 1202 1202
-- Name: st_symdifference(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_symdifference(geometry, geometry) RETURNS geometry
    AS '$libdir/postgis-1.4', 'symdifference'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 3349 (class 0 OID 0)
-- Dependencies: 612
-- Name: FUNCTION st_symdifference(geometry, geometry); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_symdifference(geometry, geometry) IS 'args: geomA, geomB - Returns a geometry that represents the portions of A and B that do not intersect. It is called a symmetric difference because ST_SymDifference(A,B) = ST_SymDifference(B,A).';


--
-- TOC entry 614 (class 1255 OID 17520)
-- Dependencies: 6 1202 1202 1202
-- Name: st_symmetricdifference(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_symmetricdifference(geometry, geometry) RETURNS geometry
    AS '$libdir/postgis-1.4', 'symdifference'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 558 (class 1255 OID 17448)
-- Dependencies: 6 1202
-- Name: st_text(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_text(geometry) RETURNS text
    AS '$libdir/postgis-1.4', 'LWGEOM_to_text'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 645 (class 1255 OID 17568)
-- Dependencies: 6 1202 1202
-- Name: st_touches(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_touches(geometry, geometry) RETURNS boolean
    AS $_$SELECT $1 && $2 AND _ST_Touches($1,$2)$_$
    LANGUAGE sql IMMUTABLE;


--
-- TOC entry 3350 (class 0 OID 0)
-- Dependencies: 645
-- Name: FUNCTION st_touches(geometry, geometry); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_touches(geometry, geometry) IS 'args: g1, g2 - Returns TRUE if the geometries have at least one point in common, but their interiors do not intersect.';


--
-- TOC entry 534 (class 1255 OID 17424)
-- Dependencies: 6 1202 1202
-- Name: st_transform(geometry, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_transform(geometry, integer) RETURNS geometry
    AS '$libdir/postgis-1.4', 'transform'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 3351 (class 0 OID 0)
-- Dependencies: 534
-- Name: FUNCTION st_transform(geometry, integer); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_transform(geometry, integer) IS 'args: g1, srid - Returns a new geometry with its coordinates transformed to the SRID referenced by the integer parameter.';


--
-- TOC entry 240 (class 1255 OID 17051)
-- Dependencies: 1202 1202 6
-- Name: st_translate(geometry, double precision, double precision, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_translate(geometry, double precision, double precision, double precision) RETURNS geometry
    AS $_$SELECT affine($1, 1, 0, 0, 0, 1, 0, 0, 0, 1, $2, $3, $4)$_$
    LANGUAGE sql IMMUTABLE STRICT;


--
-- TOC entry 3352 (class 0 OID 0)
-- Dependencies: 240
-- Name: FUNCTION st_translate(geometry, double precision, double precision, double precision); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_translate(geometry, double precision, double precision, double precision) IS 'args: g1, deltax, deltay, deltaz - Translates the geometry to a new location using the numeric parameters as offsets. Ie: ST_Translate(geom, X, Y) or ST_Translate(geom, X, Y,Z).';


--
-- TOC entry 242 (class 1255 OID 17053)
-- Dependencies: 1202 1202 6
-- Name: st_translate(geometry, double precision, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_translate(geometry, double precision, double precision) RETURNS geometry
    AS $_$SELECT translate($1, $2, $3, 0)$_$
    LANGUAGE sql IMMUTABLE STRICT;


--
-- TOC entry 3353 (class 0 OID 0)
-- Dependencies: 242
-- Name: FUNCTION st_translate(geometry, double precision, double precision); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_translate(geometry, double precision, double precision) IS 'args: g1, deltax, deltay - Translates the geometry to a new location using the numeric parameters as offsets. Ie: ST_Translate(geom, X, Y) or ST_Translate(geom, X, Y,Z).';


--
-- TOC entry 248 (class 1255 OID 17059)
-- Dependencies: 1202 1202 6
-- Name: st_transscale(geometry, double precision, double precision, double precision, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_transscale(geometry, double precision, double precision, double precision, double precision) RETURNS geometry
    AS $_$SELECT affine($1,  $4, 0, 0,  0, $5, 0, 
		0, 0, 1,  $2 * $4, $3 * $5, 0)$_$
    LANGUAGE sql IMMUTABLE STRICT;


--
-- TOC entry 3354 (class 0 OID 0)
-- Dependencies: 248
-- Name: FUNCTION st_transscale(geometry, double precision, double precision, double precision, double precision); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_transscale(geometry, double precision, double precision, double precision, double precision) IS 'args: geomA, deltaX, deltaY, XFactor, YFactor - Translates the geometry using the deltaX and deltaY args, then scales it using the XFactor, YFactor args, working in 2D only.';


--
-- TOC entry 616 (class 1255 OID 17522)
-- Dependencies: 6 1202 1202 1202
-- Name: st_union(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_union(geometry, geometry) RETURNS geometry
    AS '$libdir/postgis-1.4', 'geomunion'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 3355 (class 0 OID 0)
-- Dependencies: 616
-- Name: FUNCTION st_union(geometry, geometry); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_union(geometry, geometry) IS 'args: g1, g2 - Returns a geometry that represents the point set union of the Geometries.';


--
-- TOC entry 636 (class 1255 OID 17552)
-- Dependencies: 6 1202 1204
-- Name: st_union(geometry[]); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_union(geometry[]) RETURNS geometry
    AS '$libdir/postgis-1.4', 'pgis_union_geometry_array'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 3356 (class 0 OID 0)
-- Dependencies: 636
-- Name: FUNCTION st_union(geometry[]); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_union(geometry[]) IS 'args: g1_array - Returns a geometry that represents the point set union of the Geometries.';


--
-- TOC entry 635 (class 1255 OID 17551)
-- Dependencies: 6 1202 1204
-- Name: st_unite_garray(geometry[]); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_unite_garray(geometry[]) RETURNS geometry
    AS '$libdir/postgis-1.4', 'pgis_union_geometry_array'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 358 (class 1255 OID 17223)
-- Dependencies: 6 1211
-- Name: st_width(chip); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_width(chip) RETURNS integer
    AS '$libdir/postgis-1.4', 'CHIP_getWidth'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 656 (class 1255 OID 17579)
-- Dependencies: 6 1202 1202
-- Name: st_within(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_within(geometry, geometry) RETURNS boolean
    AS $_$SELECT $1 && $2 AND _ST_Within($1,$2)$_$
    LANGUAGE sql IMMUTABLE;


--
-- TOC entry 3357 (class 0 OID 0)
-- Dependencies: 656
-- Name: FUNCTION st_within(geometry, geometry); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_within(geometry, geometry) IS 'args: A, B - Returns true if the geometry A is completely inside geometry B';


--
-- TOC entry 882 (class 1255 OID 17805)
-- Dependencies: 6 1202
-- Name: st_wkbtosql(bytea); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_wkbtosql(bytea) RETURNS geometry
    AS '$libdir/postgis-1.4', 'LWGEOM_from_WKB'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 3358 (class 0 OID 0)
-- Dependencies: 882
-- Name: FUNCTION st_wkbtosql(bytea); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_wkbtosql(bytea) IS 'args: WKB - Return a specified ST_Geometry value from Well-Known Binary representation (WKB). This is an alias name for ST_GeomFromWKB that takes no srid';


--
-- TOC entry 881 (class 1255 OID 17804)
-- Dependencies: 6 1202
-- Name: st_wkttosql(text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_wkttosql(text) RETURNS geometry
    AS '$libdir/postgis-1.4', 'LWGEOM_from_text'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 3359 (class 0 OID 0)
-- Dependencies: 881
-- Name: FUNCTION st_wkttosql(text); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_wkttosql(text) IS 'args: WKT - Return a specified ST_Geometry value from Well-Known Text representation (WKT). This is an alias name for ST_GeomFromText';


--
-- TOC entry 735 (class 1255 OID 17658)
-- Dependencies: 1202 6
-- Name: st_x(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_x(geometry) RETURNS double precision
    AS '$libdir/postgis-1.4', 'LWGEOM_x_point'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 3360 (class 0 OID 0)
-- Dependencies: 735
-- Name: FUNCTION st_x(geometry); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_x(geometry) IS 'args: a_point - Return the X coordinate of the point, or NULL if not available. Input must be a point.';


--
-- TOC entry 267 (class 1255 OID 17083)
-- Dependencies: 6 1205
-- Name: st_xmax(box3d); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_xmax(box3d) RETURNS double precision
    AS '$libdir/postgis-1.4', 'BOX3D_xmax'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 3361 (class 0 OID 0)
-- Dependencies: 267
-- Name: FUNCTION st_xmax(box3d); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_xmax(box3d) IS 'args: aGeomorBox2DorBox3D - Returns X maxima of a bounding box 2d or 3d or a geometry.';


--
-- TOC entry 261 (class 1255 OID 17077)
-- Dependencies: 6 1205
-- Name: st_xmin(box3d); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_xmin(box3d) RETURNS double precision
    AS '$libdir/postgis-1.4', 'BOX3D_xmin'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 3362 (class 0 OID 0)
-- Dependencies: 261
-- Name: FUNCTION st_xmin(box3d); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_xmin(box3d) IS 'args: aGeomorBox2DorBox3D - Returns X minima of a bounding box 2d or 3d or a geometry.';


--
-- TOC entry 737 (class 1255 OID 17660)
-- Dependencies: 6 1202
-- Name: st_y(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_y(geometry) RETURNS double precision
    AS '$libdir/postgis-1.4', 'LWGEOM_y_point'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 3363 (class 0 OID 0)
-- Dependencies: 737
-- Name: FUNCTION st_y(geometry); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_y(geometry) IS 'args: a_point - Return the Y coordinate of the point, or NULL if not available. Input must be a point.';


--
-- TOC entry 269 (class 1255 OID 17085)
-- Dependencies: 6 1205
-- Name: st_ymax(box3d); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_ymax(box3d) RETURNS double precision
    AS '$libdir/postgis-1.4', 'BOX3D_ymax'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 3364 (class 0 OID 0)
-- Dependencies: 269
-- Name: FUNCTION st_ymax(box3d); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_ymax(box3d) IS 'args: aGeomorBox2DorBox3D - Returns Y maxima of a bounding box 2d or 3d or a geometry.';


--
-- TOC entry 263 (class 1255 OID 17079)
-- Dependencies: 6 1205
-- Name: st_ymin(box3d); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_ymin(box3d) RETURNS double precision
    AS '$libdir/postgis-1.4', 'BOX3D_ymin'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 3365 (class 0 OID 0)
-- Dependencies: 263
-- Name: FUNCTION st_ymin(box3d); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_ymin(box3d) IS 'args: aGeomorBox2DorBox3D - Returns Y minima of a bounding box 2d or 3d or a geometry.';


--
-- TOC entry 739 (class 1255 OID 17662)
-- Dependencies: 6 1202
-- Name: st_z(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_z(geometry) RETURNS double precision
    AS '$libdir/postgis-1.4', 'LWGEOM_z_point'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 3366 (class 0 OID 0)
-- Dependencies: 739
-- Name: FUNCTION st_z(geometry); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_z(geometry) IS 'args: a_point - Return the Z coordinate of the point, or NULL if not available. Input must be a point.';


--
-- TOC entry 271 (class 1255 OID 17087)
-- Dependencies: 6 1205
-- Name: st_zmax(box3d); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_zmax(box3d) RETURNS double precision
    AS '$libdir/postgis-1.4', 'BOX3D_zmax'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 3367 (class 0 OID 0)
-- Dependencies: 271
-- Name: FUNCTION st_zmax(box3d); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_zmax(box3d) IS 'args: aGeomorBox2DorBox3D - Returns Z minima of a bounding box 2d or 3d or a geometry.';


--
-- TOC entry 437 (class 1255 OID 17302)
-- Dependencies: 6 1202
-- Name: st_zmflag(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_zmflag(geometry) RETURNS smallint
    AS '$libdir/postgis-1.4', 'LWGEOM_zmflag'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 3368 (class 0 OID 0)
-- Dependencies: 437
-- Name: FUNCTION st_zmflag(geometry); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_zmflag(geometry) IS 'args: geomA - Returns ZM (dimension semantic) flag of the geometries as a small int. Values are: 0=2d, 1=3dm, 2=3dz, 3=4d.';


--
-- TOC entry 265 (class 1255 OID 17081)
-- Dependencies: 6 1205
-- Name: st_zmin(box3d); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_zmin(box3d) RETURNS double precision
    AS '$libdir/postgis-1.4', 'BOX3D_zmin'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 3369 (class 0 OID 0)
-- Dependencies: 265
-- Name: FUNCTION st_zmin(box3d); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION st_zmin(box3d) IS 'args: aGeomorBox2DorBox3D - Returns Z minima of a bounding box 2d or 3d or a geometry.';


--
-- TOC entry 742 (class 1255 OID 17665)
-- Dependencies: 6 1202 1202
-- Name: startpoint(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION startpoint(geometry) RETURNS geometry
    AS '$libdir/postgis-1.4', 'LWGEOM_startpoint_linestring'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 152 (class 1255 OID 16862)
-- Dependencies: 1187 1187 6
-- Name: subltree(ltree, integer, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION subltree(ltree, integer, integer) RETURNS ltree
    AS '$libdir/ltree', 'subltree'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 153 (class 1255 OID 16863)
-- Dependencies: 1187 6 1187
-- Name: subpath(ltree, integer, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION subpath(ltree, integer, integer) RETURNS ltree
    AS '$libdir/ltree', 'subpath'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 154 (class 1255 OID 16864)
-- Dependencies: 1187 1187 6
-- Name: subpath(ltree, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION subpath(ltree, integer) RETURNS ltree
    AS '$libdir/ltree', 'subpath'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 368 (class 1255 OID 17233)
-- Dependencies: 6 1202
-- Name: summary(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION summary(geometry) RETURNS text
    AS '$libdir/postgis-1.4', 'LWGEOM_summary'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 611 (class 1255 OID 17517)
-- Dependencies: 6 1202 1202 1202
-- Name: symdifference(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION symdifference(geometry, geometry) RETURNS geometry
    AS '$libdir/postgis-1.4', 'symdifference'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 613 (class 1255 OID 17519)
-- Dependencies: 6 1202 1202 1202
-- Name: symmetricdifference(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION symmetricdifference(geometry, geometry) RETURNS geometry
    AS '$libdir/postgis-1.4', 'symdifference'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 557 (class 1255 OID 17447)
-- Dependencies: 6 1202
-- Name: text(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION text(geometry) RETURNS text
    AS '$libdir/postgis-1.4', 'LWGEOM_to_text'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 159 (class 1255 OID 16869)
-- Dependencies: 1187 6
-- Name: text2ltree(text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION text2ltree(text) RETURNS ltree
    AS '$libdir/ltree', 'text2ltree'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 643 (class 1255 OID 17566)
-- Dependencies: 6 1202 1202
-- Name: touches(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION touches(geometry, geometry) RETURNS boolean
    AS '$libdir/postgis-1.4', 'touches'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 533 (class 1255 OID 17423)
-- Dependencies: 6 1202 1202
-- Name: transform(geometry, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION transform(geometry, integer) RETURNS geometry
    AS '$libdir/postgis-1.4', 'transform'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 532 (class 1255 OID 17422)
-- Dependencies: 6 1202 1202
-- Name: transform_geometry(geometry, text, text, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION transform_geometry(geometry, text, text, integer) RETURNS geometry
    AS '$libdir/postgis-1.4', 'transform_geom'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 239 (class 1255 OID 17050)
-- Dependencies: 1202 1202 6
-- Name: translate(geometry, double precision, double precision, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION translate(geometry, double precision, double precision, double precision) RETURNS geometry
    AS $_$SELECT affine($1, 1, 0, 0, 0, 1, 0, 0, 0, 1, $2, $3, $4)$_$
    LANGUAGE sql IMMUTABLE STRICT;


--
-- TOC entry 241 (class 1255 OID 17052)
-- Dependencies: 6 1202 1202
-- Name: translate(geometry, double precision, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION translate(geometry, double precision, double precision) RETURNS geometry
    AS $_$SELECT translate($1, $2, $3, 0)$_$
    LANGUAGE sql IMMUTABLE STRICT;


--
-- TOC entry 247 (class 1255 OID 17058)
-- Dependencies: 6 1202 1202
-- Name: transscale(geometry, double precision, double precision, double precision, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION transscale(geometry, double precision, double precision, double precision, double precision) RETURNS geometry
    AS $_$SELECT affine($1,  $4, 0, 0,  0, $5, 0, 
		0, 0, 1,  $2 * $4, $3 * $5, 0)$_$
    LANGUAGE sql IMMUTABLE STRICT;


--
-- TOC entry 634 (class 1255 OID 17550)
-- Dependencies: 6 1202 1204
-- Name: unite_garray(geometry[]); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION unite_garray(geometry[]) RETURNS geometry
    AS '$libdir/postgis-1.4', 'pgis_union_geometry_array'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 868 (class 1255 OID 17791)
-- Dependencies: 1340 6
-- Name: unlockrows(text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION unlockrows(text) RETURNS integer
    AS $_$ 
DECLARE
	ret int;
BEGIN

	IF NOT LongTransactionsEnabled() THEN
		RAISE EXCEPTION 'Long transaction support disabled, use EnableLongTransaction() to enable.';
	END IF;

	EXECUTE 'DELETE FROM authorization_table where authid = ' ||
		quote_literal($1);

	GET DIAGNOSTICS ret = ROW_COUNT;

	RETURN ret;
END;
$_$
    LANGUAGE plpgsql STRICT;


--
-- TOC entry 3370 (class 0 OID 0)
-- Dependencies: 868
-- Name: FUNCTION unlockrows(text); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION unlockrows(text) IS 'args: auth_token - Remove all locks held by specified authorization id. Returns the number of locks released.';


--
-- TOC entry 900 (class 1255 OID 17863)
-- Dependencies: 6
-- Name: update_geometry_stats(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION update_geometry_stats() RETURNS text
    AS $$ SELECT 'update_geometry_stats() has been obsoleted. Statistics are automatically built running the ANALYZE command'::text$$
    LANGUAGE sql;


--
-- TOC entry 901 (class 1255 OID 17864)
-- Dependencies: 6
-- Name: update_geometry_stats(character varying, character varying); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION update_geometry_stats(character varying, character varying) RETURNS text
    AS $$SELECT update_geometry_stats();$$
    LANGUAGE sql;


--
-- TOC entry 527 (class 1255 OID 17417)
-- Dependencies: 6 1340
-- Name: updategeometrysrid(character varying, character varying, character varying, character varying, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION updategeometrysrid(character varying, character varying, character varying, character varying, integer) RETURNS text
    AS $_$
DECLARE
	catalog_name alias for $1; 
	schema_name alias for $2;
	table_name alias for $3;
	column_name alias for $4;
	new_srid alias for $5;
	myrec RECORD;
	okay boolean;
	cname varchar;
	real_schema name;

BEGIN


	-- Find, check or fix schema_name
	IF ( schema_name != '' ) THEN
		okay = 'f';

		FOR myrec IN SELECT nspname FROM pg_namespace WHERE text(nspname) = schema_name LOOP
			okay := 't';
		END LOOP;

		IF ( okay <> 't' ) THEN
			RAISE EXCEPTION 'Invalid schema name';
		ELSE
			real_schema = schema_name;
		END IF;
	ELSE
		SELECT INTO real_schema current_schema()::text;
	END IF;

 	-- Find out if the column is in the geometry_columns table
	okay = 'f';
	FOR myrec IN SELECT * from geometry_columns where f_table_schema = text(real_schema) and f_table_name = table_name and f_geometry_column = column_name LOOP
		okay := 't';
	END LOOP; 
	IF (okay <> 't') THEN 
		RAISE EXCEPTION 'column not found in geometry_columns table';
		RETURN 'f';
	END IF;

	-- Update ref from geometry_columns table
	EXECUTE 'UPDATE geometry_columns SET SRID = ' || new_srid::text || 
		' where f_table_schema = ' ||
		quote_literal(real_schema) || ' and f_table_name = ' ||
		quote_literal(table_name)  || ' and f_geometry_column = ' ||
		quote_literal(column_name);
	
	-- Make up constraint name
	cname = 'enforce_srid_'  || column_name;

	-- Drop enforce_srid constraint
	EXECUTE 'ALTER TABLE ' || quote_ident(real_schema) ||
		'.' || quote_ident(table_name) ||
		' DROP constraint ' || quote_ident(cname);

	-- Update geometries SRID
	EXECUTE 'UPDATE ' || quote_ident(real_schema) ||
		'.' || quote_ident(table_name) ||
		' SET ' || quote_ident(column_name) ||
		' = setSRID(' || quote_ident(column_name) ||
		', ' || new_srid::text || ')';

	-- Reset enforce_srid constraint
	EXECUTE 'ALTER TABLE ' || quote_ident(real_schema) ||
		'.' || quote_ident(table_name) ||
		' ADD constraint ' || quote_ident(cname) ||
		' CHECK (srid(' || quote_ident(column_name) ||
		') = ' || new_srid::text || ')';

	RETURN real_schema || '.' || table_name || '.' || column_name ||' SRID changed to ' || new_srid::text;
	
END;
$_$
    LANGUAGE plpgsql STRICT;


--
-- TOC entry 3371 (class 0 OID 0)
-- Dependencies: 527
-- Name: FUNCTION updategeometrysrid(character varying, character varying, character varying, character varying, integer); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION updategeometrysrid(character varying, character varying, character varying, character varying, integer) IS 'args: catalog_name, schema_name, table_name, column_name, srid - Updates the SRID of all features in a geometry column, geometry_columns metadata and srid table constraint';


--
-- TOC entry 528 (class 1255 OID 17418)
-- Dependencies: 6 1340
-- Name: updategeometrysrid(character varying, character varying, character varying, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION updategeometrysrid(character varying, character varying, character varying, integer) RETURNS text
    AS $_$ 
DECLARE
	ret  text;
BEGIN
	SELECT UpdateGeometrySRID('',$1,$2,$3,$4) into ret;
	RETURN ret;
END;
$_$
    LANGUAGE plpgsql STRICT;


--
-- TOC entry 3372 (class 0 OID 0)
-- Dependencies: 528
-- Name: FUNCTION updategeometrysrid(character varying, character varying, character varying, integer); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION updategeometrysrid(character varying, character varying, character varying, integer) IS 'args: schema_name, table_name, column_name, srid - Updates the SRID of all features in a geometry column, geometry_columns metadata and srid table constraint';


--
-- TOC entry 529 (class 1255 OID 17419)
-- Dependencies: 6 1340
-- Name: updategeometrysrid(character varying, character varying, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION updategeometrysrid(character varying, character varying, integer) RETURNS text
    AS $_$ 
DECLARE
	ret  text;
BEGIN
	SELECT UpdateGeometrySRID('','',$1,$2,$3) into ret;
	RETURN ret;
END;
$_$
    LANGUAGE plpgsql STRICT;


--
-- TOC entry 3373 (class 0 OID 0)
-- Dependencies: 529
-- Name: FUNCTION updategeometrysrid(character varying, character varying, integer); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION updategeometrysrid(character varying, character varying, integer) IS 'args: table_name, column_name, srid - Updates the SRID of all features in a geometry column, geometry_columns metadata and srid table constraint';


--
-- TOC entry 357 (class 1255 OID 17222)
-- Dependencies: 6 1211
-- Name: width(chip); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION width(chip) RETURNS integer
    AS '$libdir/postgis-1.4', 'CHIP_getWidth'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 654 (class 1255 OID 17577)
-- Dependencies: 1202 6 1202
-- Name: within(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION within(geometry, geometry) RETURNS boolean
    AS '$libdir/postgis-1.4', 'within'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 734 (class 1255 OID 17657)
-- Dependencies: 1202 6
-- Name: x(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION x(geometry) RETURNS double precision
    AS '$libdir/postgis-1.4', 'LWGEOM_x_point'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 266 (class 1255 OID 17082)
-- Dependencies: 1205 6
-- Name: xmax(box3d); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION xmax(box3d) RETURNS double precision
    AS '$libdir/postgis-1.4', 'BOX3D_xmax'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 260 (class 1255 OID 17076)
-- Dependencies: 6 1205
-- Name: xmin(box3d); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION xmin(box3d) RETURNS double precision
    AS '$libdir/postgis-1.4', 'BOX3D_xmin'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 736 (class 1255 OID 17659)
-- Dependencies: 6 1202
-- Name: y(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION y(geometry) RETURNS double precision
    AS '$libdir/postgis-1.4', 'LWGEOM_y_point'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 268 (class 1255 OID 17084)
-- Dependencies: 6 1205
-- Name: ymax(box3d); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION ymax(box3d) RETURNS double precision
    AS '$libdir/postgis-1.4', 'BOX3D_ymax'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 262 (class 1255 OID 17078)
-- Dependencies: 1205 6
-- Name: ymin(box3d); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION ymin(box3d) RETURNS double precision
    AS '$libdir/postgis-1.4', 'BOX3D_ymin'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 738 (class 1255 OID 17661)
-- Dependencies: 1202 6
-- Name: z(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION z(geometry) RETURNS double precision
    AS '$libdir/postgis-1.4', 'LWGEOM_z_point'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 270 (class 1255 OID 17086)
-- Dependencies: 6 1205
-- Name: zmax(box3d); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION zmax(box3d) RETURNS double precision
    AS '$libdir/postgis-1.4', 'BOX3D_zmax'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 436 (class 1255 OID 17301)
-- Dependencies: 6 1202
-- Name: zmflag(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION zmflag(geometry) RETURNS smallint
    AS '$libdir/postgis-1.4', 'LWGEOM_zmflag'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 264 (class 1255 OID 17080)
-- Dependencies: 1205 6
-- Name: zmin(box3d); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION zmin(box3d) RETURNS double precision
    AS '$libdir/postgis-1.4', 'BOX3D_zmin'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 1349 (class 1255 OID 17546)
-- Dependencies: 6 1204 1202 628 629
-- Name: accum(geometry); Type: AGGREGATE; Schema: public; Owner: -
--

CREATE AGGREGATE accum(geometry) (
    SFUNC = pgis_geometry_accum_transfn,
    STYPE = pgis_abs,
    FINALFUNC = pgis_geometry_accum_finalfn
);


--
-- TOC entry 1351 (class 1255 OID 17548)
-- Dependencies: 6 1204 1202 622
-- Name: accum_old(geometry); Type: AGGREGATE; Schema: public; Owner: -
--

CREATE AGGREGATE accum_old(geometry) (
    SFUNC = st_geom_accum,
    STYPE = geometry[]
);


--
-- TOC entry 1354 (class 1255 OID 17554)
-- Dependencies: 6 1202 1202 628 631
-- Name: collect(geometry); Type: AGGREGATE; Schema: public; Owner: -
--

CREATE AGGREGATE collect(geometry) (
    SFUNC = pgis_geometry_accum_transfn,
    STYPE = pgis_abs,
    FINALFUNC = pgis_geometry_collect_finalfn
);


--
-- TOC entry 1341 (class 1255 OID 17372)
-- Dependencies: 6 1208 1202 502
-- Name: extent(geometry); Type: AGGREGATE; Schema: public; Owner: -
--

CREATE AGGREGATE extent(geometry) (
    SFUNC = public.st_combine_bbox,
    STYPE = box3d_extent
);


--
-- TOC entry 1343 (class 1255 OID 17376)
-- Dependencies: 6 1205 1202 503
-- Name: extent3d(geometry); Type: AGGREGATE; Schema: public; Owner: -
--

CREATE AGGREGATE extent3d(geometry) (
    SFUNC = public.combine_bbox,
    STYPE = box3d
);


--
-- TOC entry 1360 (class 1255 OID 17865)
-- Dependencies: 1202 635 621 1202 6
-- Name: geomunion(geometry); Type: AGGREGATE; Schema: public; Owner: -
--

CREATE AGGREGATE geomunion(geometry) (
    SFUNC = geom_accum,
    STYPE = geometry[],
    FINALFUNC = st_unite_garray
);


--
-- TOC entry 1358 (class 1255 OID 17558)
-- Dependencies: 6 1202 1202 628 633
-- Name: makeline(geometry); Type: AGGREGATE; Schema: public; Owner: -
--

CREATE AGGREGATE makeline(geometry) (
    SFUNC = pgis_geometry_accum_transfn,
    STYPE = pgis_abs,
    FINALFUNC = pgis_geometry_makeline_finalfn
);


--
-- TOC entry 1345 (class 1255 OID 17527)
-- Dependencies: 6 1202 1202 620
-- Name: memcollect(geometry); Type: AGGREGATE; Schema: public; Owner: -
--

CREATE AGGREGATE memcollect(geometry) (
    SFUNC = public.st_collect,
    STYPE = geometry
);


--
-- TOC entry 1347 (class 1255 OID 17534)
-- Dependencies: 6 1202 1202 615
-- Name: memgeomunion(geometry); Type: AGGREGATE; Schema: public; Owner: -
--

CREATE AGGREGATE memgeomunion(geometry) (
    SFUNC = public.geomunion,
    STYPE = geometry
);


--
-- TOC entry 1356 (class 1255 OID 17556)
-- Dependencies: 6 1202 1202 628 632
-- Name: polygonize(geometry); Type: AGGREGATE; Schema: public; Owner: -
--

CREATE AGGREGATE polygonize(geometry) (
    SFUNC = pgis_geometry_accum_transfn,
    STYPE = pgis_abs,
    FINALFUNC = pgis_geometry_polygonize_finalfn
);


--
-- TOC entry 1350 (class 1255 OID 17547)
-- Dependencies: 6 1204 1202 628 629
-- Name: st_accum(geometry); Type: AGGREGATE; Schema: public; Owner: -
--

CREATE AGGREGATE st_accum(geometry) (
    SFUNC = pgis_geometry_accum_transfn,
    STYPE = pgis_abs,
    FINALFUNC = pgis_geometry_accum_finalfn
);


--
-- TOC entry 3374 (class 0 OID 0)
-- Dependencies: 1350
-- Name: AGGREGATE st_accum(geometry); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON AGGREGATE st_accum(geometry) IS 'args: geomfield - Aggregate. Constructs an array of geometries.';


--
-- TOC entry 1352 (class 1255 OID 17549)
-- Dependencies: 6 1204 1202 622
-- Name: st_accum_old(geometry); Type: AGGREGATE; Schema: public; Owner: -
--

CREATE AGGREGATE st_accum_old(geometry) (
    SFUNC = st_geom_accum,
    STYPE = geometry[]
);


--
-- TOC entry 1355 (class 1255 OID 17555)
-- Dependencies: 6 1202 1202 628 631
-- Name: st_collect(geometry); Type: AGGREGATE; Schema: public; Owner: -
--

CREATE AGGREGATE st_collect(geometry) (
    SFUNC = pgis_geometry_accum_transfn,
    STYPE = pgis_abs,
    FINALFUNC = pgis_geometry_collect_finalfn
);


--
-- TOC entry 3375 (class 0 OID 0)
-- Dependencies: 1355
-- Name: AGGREGATE st_collect(geometry); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON AGGREGATE st_collect(geometry) IS 'args: g1field - Return a specified ST_Geometry value from a collection of other geometries.';


--
-- TOC entry 1342 (class 1255 OID 17373)
-- Dependencies: 6 1208 1202 502
-- Name: st_extent(geometry); Type: AGGREGATE; Schema: public; Owner: -
--

CREATE AGGREGATE st_extent(geometry) (
    SFUNC = public.st_combine_bbox,
    STYPE = box3d_extent
);


--
-- TOC entry 3376 (class 0 OID 0)
-- Dependencies: 1342
-- Name: AGGREGATE st_extent(geometry); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON AGGREGATE st_extent(geometry) IS 'args: geomfield - an aggregate function that returns the bounding box that bounds rows of geometries.';


--
-- TOC entry 1344 (class 1255 OID 17377)
-- Dependencies: 6 1205 1202 504
-- Name: st_extent3d(geometry); Type: AGGREGATE; Schema: public; Owner: -
--

CREATE AGGREGATE st_extent3d(geometry) (
    SFUNC = public.st_combine_bbox,
    STYPE = box3d
);


--
-- TOC entry 3377 (class 0 OID 0)
-- Dependencies: 1344
-- Name: AGGREGATE st_extent3d(geometry); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON AGGREGATE st_extent3d(geometry) IS 'args: geomfield - an aggregate function that returns the box3D bounding box that bounds rows of geometries.';


--
-- TOC entry 1359 (class 1255 OID 17559)
-- Dependencies: 6 1202 1202 628 633
-- Name: st_makeline(geometry); Type: AGGREGATE; Schema: public; Owner: -
--

CREATE AGGREGATE st_makeline(geometry) (
    SFUNC = pgis_geometry_accum_transfn,
    STYPE = pgis_abs,
    FINALFUNC = pgis_geometry_makeline_finalfn
);


--
-- TOC entry 3378 (class 0 OID 0)
-- Dependencies: 1359
-- Name: AGGREGATE st_makeline(geometry); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON AGGREGATE st_makeline(geometry) IS 'args: pointfield - Creates a Linestring from point geometries.';


--
-- TOC entry 1346 (class 1255 OID 17528)
-- Dependencies: 6 1202 1202 620
-- Name: st_memcollect(geometry); Type: AGGREGATE; Schema: public; Owner: -
--

CREATE AGGREGATE st_memcollect(geometry) (
    SFUNC = public.st_collect,
    STYPE = geometry
);


--
-- TOC entry 1348 (class 1255 OID 17535)
-- Dependencies: 6 1202 1202 616
-- Name: st_memunion(geometry); Type: AGGREGATE; Schema: public; Owner: -
--

CREATE AGGREGATE st_memunion(geometry) (
    SFUNC = public.st_union,
    STYPE = geometry
);


--
-- TOC entry 3379 (class 0 OID 0)
-- Dependencies: 1348
-- Name: AGGREGATE st_memunion(geometry); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON AGGREGATE st_memunion(geometry) IS 'args: geomfield - Same as ST_Union, only memory-friendly (uses less memory and more processor time).';


--
-- TOC entry 1357 (class 1255 OID 17557)
-- Dependencies: 6 1202 1202 628 632
-- Name: st_polygonize(geometry); Type: AGGREGATE; Schema: public; Owner: -
--

CREATE AGGREGATE st_polygonize(geometry) (
    SFUNC = pgis_geometry_accum_transfn,
    STYPE = pgis_abs,
    FINALFUNC = pgis_geometry_polygonize_finalfn
);


--
-- TOC entry 3380 (class 0 OID 0)
-- Dependencies: 1357
-- Name: AGGREGATE st_polygonize(geometry); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON AGGREGATE st_polygonize(geometry) IS 'args: geomfield - Aggregate. Creates a GeometryCollection containing possible polygons formed from the constituent linework of a set of geometries.';


--
-- TOC entry 1353 (class 1255 OID 17553)
-- Dependencies: 6 1202 1202 628 630
-- Name: st_union(geometry); Type: AGGREGATE; Schema: public; Owner: -
--

CREATE AGGREGATE st_union(geometry) (
    SFUNC = pgis_geometry_accum_transfn,
    STYPE = pgis_abs,
    FINALFUNC = pgis_geometry_union_finalfn
);


--
-- TOC entry 3381 (class 0 OID 0)
-- Dependencies: 1353
-- Name: AGGREGATE st_union(geometry); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON AGGREGATE st_union(geometry) IS 'args: g1field - Returns a geometry that represents the point set union of the Geometries.';


--
-- TOC entry 2099 (class 2617 OID 17178)
-- Dependencies: 6 311 313 335 1202 1202
-- Name: &&; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR && (
    PROCEDURE = st_geometry_overlap,
    LEFTARG = geometry,
    RIGHTARG = geometry,
    COMMUTATOR = &&,
    RESTRICT = st_postgis_gist_sel,
    JOIN = st_postgis_gist_joinsel
);


--
-- TOC entry 2123 (class 2617 OID 17173)
-- Dependencies: 1202 6 315 1202
-- Name: &<; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR &< (
    PROCEDURE = st_geometry_overleft,
    LEFTARG = geometry,
    RIGHTARG = geometry,
    COMMUTATOR = &>,
    RESTRICT = positionsel,
    JOIN = positionjoinsel
);


--
-- TOC entry 2125 (class 2617 OID 17177)
-- Dependencies: 1202 6 321 1202
-- Name: &<|; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR &<| (
    PROCEDURE = st_geometry_overbelow,
    LEFTARG = geometry,
    RIGHTARG = geometry,
    COMMUTATOR = |&>,
    RESTRICT = positionsel,
    JOIN = positionjoinsel
);


--
-- TOC entry 2102 (class 2617 OID 17172)
-- Dependencies: 1202 317 6 1202
-- Name: &>; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR &> (
    PROCEDURE = st_geometry_overright,
    LEFTARG = geometry,
    RIGHTARG = geometry,
    COMMUTATOR = &<,
    RESTRICT = positionsel,
    JOIN = positionjoinsel
);


--
-- TOC entry 2063 (class 2617 OID 16858)
-- Dependencies: 1187 6 146 1187
-- Name: <; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR < (
    PROCEDURE = ltree_lt,
    LEFTARG = ltree,
    RIGHTARG = ltree,
    COMMUTATOR = >,
    NEGATOR = >=,
    RESTRICT = contsel,
    JOIN = contjoinsel
);


--
-- TOC entry 2117 (class 2617 OID 17131)
-- Dependencies: 299 1202 1202 6
-- Name: <; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR < (
    PROCEDURE = st_geometry_lt,
    LEFTARG = geometry,
    RIGHTARG = geometry,
    COMMUTATOR = >,
    NEGATOR = >=,
    RESTRICT = contsel,
    JOIN = contjoinsel
);


--
-- TOC entry 2122 (class 2617 OID 17171)
-- Dependencies: 6 1202 323 1202
-- Name: <<; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR << (
    PROCEDURE = st_geometry_left,
    LEFTARG = geometry,
    RIGHTARG = geometry,
    COMMUTATOR = >>,
    RESTRICT = positionsel,
    JOIN = positionjoinsel
);


--
-- TOC entry 2124 (class 2617 OID 17175)
-- Dependencies: 6 329 1202 1202
-- Name: <<|; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR <<| (
    PROCEDURE = st_geometry_below,
    LEFTARG = geometry,
    RIGHTARG = geometry,
    COMMUTATOR = |>>,
    RESTRICT = positionsel,
    JOIN = positionjoinsel
);


--
-- TOC entry 2064 (class 2617 OID 16859)
-- Dependencies: 6 147 1187 1187
-- Name: <=; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR <= (
    PROCEDURE = ltree_le,
    LEFTARG = ltree,
    RIGHTARG = ltree,
    COMMUTATOR = >=,
    NEGATOR = >,
    RESTRICT = contsel,
    JOIN = contjoinsel
);


--
-- TOC entry 2118 (class 2617 OID 17132)
-- Dependencies: 1202 6 301 1202
-- Name: <=; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR <= (
    PROCEDURE = st_geometry_le,
    LEFTARG = geometry,
    RIGHTARG = geometry,
    COMMUTATOR = >=,
    NEGATOR = >,
    RESTRICT = contsel,
    JOIN = contjoinsel
);


--
-- TOC entry 2068 (class 2617 OID 16860)
-- Dependencies: 6 151 1187 1187
-- Name: <>; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR <> (
    PROCEDURE = ltree_ne,
    LEFTARG = ltree,
    RIGHTARG = ltree,
    COMMUTATOR = <>,
    NEGATOR = =,
    RESTRICT = neqsel,
    JOIN = neqjoinsel
);


--
-- TOC entry 2071 (class 2617 OID 16884)
-- Dependencies: 1187 173 169 1187 6
-- Name: <@; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR <@ (
    PROCEDURE = ltree_risparent,
    LEFTARG = ltree,
    RIGHTARG = ltree,
    COMMUTATOR = @>,
    RESTRICT = ltreeparentsel,
    JOIN = contjoinsel
);


--
-- TOC entry 2089 (class 2617 OID 16968)
-- Dependencies: 1187 1189 194 6
-- Name: <@; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR <@ (
    PROCEDURE = _ltree_r_isparent,
    LEFTARG = ltree,
    RIGHTARG = ltree[],
    COMMUTATOR = @>,
    RESTRICT = contsel,
    JOIN = contjoinsel
);


--
-- TOC entry 2090 (class 2617 OID 16971)
-- Dependencies: 1189 195 1187 6
-- Name: <@; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR <@ (
    PROCEDURE = _ltree_risparent,
    LEFTARG = ltree[],
    RIGHTARG = ltree,
    COMMUTATOR = @>,
    RESTRICT = contsel,
    JOIN = contjoinsel
);


--
-- TOC entry 2067 (class 2617 OID 16861)
-- Dependencies: 1187 6 148 1187
-- Name: =; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR = (
    PROCEDURE = ltree_eq,
    LEFTARG = ltree,
    RIGHTARG = ltree,
    COMMUTATOR = =,
    NEGATOR = <>,
    MERGES,
    RESTRICT = eqsel,
    JOIN = eqjoinsel
);


--
-- TOC entry 2119 (class 2617 OID 17133)
-- Dependencies: 1202 6 1202 307
-- Name: =; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR = (
    PROCEDURE = st_geometry_eq,
    LEFTARG = geometry,
    RIGHTARG = geometry,
    COMMUTATOR = =,
    RESTRICT = contsel,
    JOIN = contjoinsel
);


--
-- TOC entry 2066 (class 2617 OID 16856)
-- Dependencies: 6 1187 150 1187
-- Name: >; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR > (
    PROCEDURE = ltree_gt,
    LEFTARG = ltree,
    RIGHTARG = ltree,
    COMMUTATOR = <,
    NEGATOR = <=,
    RESTRICT = contsel,
    JOIN = contjoinsel
);


--
-- TOC entry 2121 (class 2617 OID 17129)
-- Dependencies: 6 1202 303 1202
-- Name: >; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR > (
    PROCEDURE = st_geometry_gt,
    LEFTARG = geometry,
    RIGHTARG = geometry,
    COMMUTATOR = <,
    NEGATOR = <=,
    RESTRICT = contsel,
    JOIN = contjoinsel
);


--
-- TOC entry 2065 (class 2617 OID 16857)
-- Dependencies: 149 1187 6 1187
-- Name: >=; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR >= (
    PROCEDURE = ltree_ge,
    LEFTARG = ltree,
    RIGHTARG = ltree,
    COMMUTATOR = <=,
    NEGATOR = <,
    RESTRICT = contsel,
    JOIN = contjoinsel
);


--
-- TOC entry 2120 (class 2617 OID 17130)
-- Dependencies: 305 6 1202 1202
-- Name: >=; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR >= (
    PROCEDURE = st_geometry_ge,
    LEFTARG = geometry,
    RIGHTARG = geometry,
    COMMUTATOR = <=,
    NEGATOR = <,
    RESTRICT = contsel,
    JOIN = contjoinsel
);


--
-- TOC entry 2105 (class 2617 OID 17170)
-- Dependencies: 325 6 1202 1202
-- Name: >>; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR >> (
    PROCEDURE = st_geometry_right,
    LEFTARG = geometry,
    RIGHTARG = geometry,
    COMMUTATOR = <<,
    RESTRICT = positionsel,
    JOIN = positionjoinsel
);


--
-- TOC entry 2081 (class 2617 OID 16911)
-- Dependencies: 179 6 1192 1187
-- Name: ?; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR ? (
    PROCEDURE = lt_q_rregex,
    LEFTARG = lquery[],
    RIGHTARG = ltree,
    COMMUTATOR = ?,
    RESTRICT = contsel,
    JOIN = contjoinsel
);


--
-- TOC entry 2080 (class 2617 OID 16912)
-- Dependencies: 6 1187 1192 178
-- Name: ?; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR ? (
    PROCEDURE = lt_q_regex,
    LEFTARG = ltree,
    RIGHTARG = lquery[],
    COMMUTATOR = ?,
    RESTRICT = contsel,
    JOIN = contjoinsel
);


--
-- TOC entry 2095 (class 2617 OID 16974)
-- Dependencies: 6 200 1189 1192
-- Name: ?; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR ? (
    PROCEDURE = _lt_q_rregex,
    LEFTARG = lquery[],
    RIGHTARG = ltree[],
    COMMUTATOR = ?,
    RESTRICT = contsel,
    JOIN = contjoinsel
);


--
-- TOC entry 2094 (class 2617 OID 16975)
-- Dependencies: 6 1189 1192 199
-- Name: ?; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR ? (
    PROCEDURE = _lt_q_regex,
    LEFTARG = ltree[],
    RIGHTARG = lquery[],
    COMMUTATOR = ?,
    RESTRICT = contsel,
    JOIN = contjoinsel
);


--
-- TOC entry 2114 (class 2617 OID 16991)
-- Dependencies: 1187 6 1189 204 1187
-- Name: ?<@; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR ?<@ (
    PROCEDURE = _ltree_extract_risparent,
    LEFTARG = ltree[],
    RIGHTARG = ltree
);


--
-- TOC entry 2116 (class 2617 OID 16995)
-- Dependencies: 1187 6 1189 1193 206
-- Name: ?@; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR ?@ (
    PROCEDURE = _ltxtq_extract_exec,
    LEFTARG = ltree[],
    RIGHTARG = ltxtquery
);


--
-- TOC entry 2113 (class 2617 OID 16989)
-- Dependencies: 1189 1187 1187 203 6
-- Name: ?@>; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR ?@> (
    PROCEDURE = _ltree_extract_isparent,
    LEFTARG = ltree[],
    RIGHTARG = ltree
);


--
-- TOC entry 2115 (class 2617 OID 16993)
-- Dependencies: 1190 205 6 1189 1187
-- Name: ?~; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR ?~ (
    PROCEDURE = _ltq_extract_regex,
    LEFTARG = ltree[],
    RIGHTARG = lquery
);


--
-- TOC entry 2085 (class 2617 OID 16921)
-- Dependencies: 6 1193 1187 183
-- Name: @; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR @ (
    PROCEDURE = ltxtq_rexec,
    LEFTARG = ltxtquery,
    RIGHTARG = ltree,
    COMMUTATOR = @,
    RESTRICT = contsel,
    JOIN = contjoinsel
);


--
-- TOC entry 2084 (class 2617 OID 16922)
-- Dependencies: 6 1187 1193 182
-- Name: @; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR @ (
    PROCEDURE = ltxtq_exec,
    LEFTARG = ltree,
    RIGHTARG = ltxtquery,
    COMMUTATOR = @,
    RESTRICT = contsel,
    JOIN = contjoinsel
);


--
-- TOC entry 2097 (class 2617 OID 16976)
-- Dependencies: 1189 6 1193 202
-- Name: @; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR @ (
    PROCEDURE = _ltxtq_rexec,
    LEFTARG = ltxtquery,
    RIGHTARG = ltree[],
    COMMUTATOR = @,
    RESTRICT = contsel,
    JOIN = contjoinsel
);


--
-- TOC entry 2096 (class 2617 OID 16977)
-- Dependencies: 6 201 1193 1189
-- Name: @; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR @ (
    PROCEDURE = _ltxtq_exec,
    LEFTARG = ltree[],
    RIGHTARG = ltxtquery,
    COMMUTATOR = @,
    RESTRICT = contsel,
    JOIN = contjoinsel
);


--
-- TOC entry 2127 (class 2617 OID 17181)
-- Dependencies: 1202 6 333 1202
-- Name: @; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR @ (
    PROCEDURE = st_geometry_contained,
    LEFTARG = geometry,
    RIGHTARG = geometry,
    COMMUTATOR = ~,
    RESTRICT = contsel,
    JOIN = contjoinsel
);


--
-- TOC entry 2069 (class 2617 OID 16885)
-- Dependencies: 168 1187 1187 6 173
-- Name: @>; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR @> (
    PROCEDURE = ltree_isparent,
    LEFTARG = ltree,
    RIGHTARG = ltree,
    COMMUTATOR = <@,
    RESTRICT = ltreeparentsel,
    JOIN = contjoinsel
);


--
-- TOC entry 2088 (class 2617 OID 16969)
-- Dependencies: 1189 193 1187 6
-- Name: @>; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR @> (
    PROCEDURE = _ltree_isparent,
    LEFTARG = ltree[],
    RIGHTARG = ltree,
    COMMUTATOR = <@,
    RESTRICT = contsel,
    JOIN = contjoinsel
);


--
-- TOC entry 2091 (class 2617 OID 16970)
-- Dependencies: 6 196 1187 1189
-- Name: @>; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR @> (
    PROCEDURE = _ltree_r_risparent,
    LEFTARG = ltree,
    RIGHTARG = ltree[],
    COMMUTATOR = <@,
    RESTRICT = contsel,
    JOIN = contjoinsel
);


--
-- TOC entry 2072 (class 2617 OID 16886)
-- Dependencies: 6 1187 1187 169
-- Name: ^<@; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR ^<@ (
    PROCEDURE = ltree_risparent,
    LEFTARG = ltree,
    RIGHTARG = ltree,
    COMMUTATOR = ^@>,
    RESTRICT = contsel,
    JOIN = contjoinsel
);


--
-- TOC entry 2100 (class 2617 OID 16978)
-- Dependencies: 6 194 1187 1189
-- Name: ^<@; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR ^<@ (
    PROCEDURE = _ltree_r_isparent,
    LEFTARG = ltree,
    RIGHTARG = ltree[],
    COMMUTATOR = ^@>,
    RESTRICT = contsel,
    JOIN = contjoinsel
);


--
-- TOC entry 2101 (class 2617 OID 16981)
-- Dependencies: 6 195 1187 1189
-- Name: ^<@; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR ^<@ (
    PROCEDURE = _ltree_risparent,
    LEFTARG = ltree[],
    RIGHTARG = ltree,
    COMMUTATOR = ^@>,
    RESTRICT = contsel,
    JOIN = contjoinsel
);


--
-- TOC entry 2083 (class 2617 OID 16913)
-- Dependencies: 1187 6 1192 179
-- Name: ^?; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR ^? (
    PROCEDURE = lt_q_rregex,
    LEFTARG = lquery[],
    RIGHTARG = ltree,
    COMMUTATOR = ^?,
    RESTRICT = contsel,
    JOIN = contjoinsel
);


--
-- TOC entry 2082 (class 2617 OID 16914)
-- Dependencies: 1187 178 6 1192
-- Name: ^?; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR ^? (
    PROCEDURE = lt_q_regex,
    LEFTARG = ltree,
    RIGHTARG = lquery[],
    COMMUTATOR = ^?,
    RESTRICT = contsel,
    JOIN = contjoinsel
);


--
-- TOC entry 2109 (class 2617 OID 16984)
-- Dependencies: 1189 1192 6 200
-- Name: ^?; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR ^? (
    PROCEDURE = _lt_q_rregex,
    LEFTARG = lquery[],
    RIGHTARG = ltree[],
    COMMUTATOR = ^?,
    RESTRICT = contsel,
    JOIN = contjoinsel
);


--
-- TOC entry 2107 (class 2617 OID 16985)
-- Dependencies: 199 1192 1189 6
-- Name: ^?; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR ^? (
    PROCEDURE = _lt_q_regex,
    LEFTARG = ltree[],
    RIGHTARG = lquery[],
    COMMUTATOR = ^?,
    RESTRICT = contsel,
    JOIN = contjoinsel
);


--
-- TOC entry 2087 (class 2617 OID 16923)
-- Dependencies: 6 183 1187 1193
-- Name: ^@; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR ^@ (
    PROCEDURE = ltxtq_rexec,
    LEFTARG = ltxtquery,
    RIGHTARG = ltree,
    COMMUTATOR = ^@,
    RESTRICT = contsel,
    JOIN = contjoinsel
);


--
-- TOC entry 2086 (class 2617 OID 16924)
-- Dependencies: 6 1187 1193 182
-- Name: ^@; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR ^@ (
    PROCEDURE = ltxtq_exec,
    LEFTARG = ltree,
    RIGHTARG = ltxtquery,
    COMMUTATOR = ^@,
    RESTRICT = contsel,
    JOIN = contjoinsel
);


--
-- TOC entry 2112 (class 2617 OID 16986)
-- Dependencies: 6 1193 1189 202
-- Name: ^@; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR ^@ (
    PROCEDURE = _ltxtq_rexec,
    LEFTARG = ltxtquery,
    RIGHTARG = ltree[],
    COMMUTATOR = ^@,
    RESTRICT = contsel,
    JOIN = contjoinsel
);


--
-- TOC entry 2110 (class 2617 OID 16987)
-- Dependencies: 6 1189 1193 201
-- Name: ^@; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR ^@ (
    PROCEDURE = _ltxtq_exec,
    LEFTARG = ltree[],
    RIGHTARG = ltxtquery,
    COMMUTATOR = ^@,
    RESTRICT = contsel,
    JOIN = contjoinsel
);


--
-- TOC entry 2070 (class 2617 OID 16887)
-- Dependencies: 6 1187 1187 168
-- Name: ^@>; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR ^@> (
    PROCEDURE = ltree_isparent,
    LEFTARG = ltree,
    RIGHTARG = ltree,
    COMMUTATOR = ^<@,
    RESTRICT = contsel,
    JOIN = contjoinsel
);


--
-- TOC entry 2098 (class 2617 OID 16979)
-- Dependencies: 1187 6 1189 193
-- Name: ^@>; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR ^@> (
    PROCEDURE = _ltree_isparent,
    LEFTARG = ltree[],
    RIGHTARG = ltree,
    COMMUTATOR = ^<@,
    RESTRICT = contsel,
    JOIN = contjoinsel
);


--
-- TOC entry 2103 (class 2617 OID 16980)
-- Dependencies: 1189 6 1187 196
-- Name: ^@>; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR ^@> (
    PROCEDURE = _ltree_r_risparent,
    LEFTARG = ltree,
    RIGHTARG = ltree[],
    COMMUTATOR = ^<@,
    RESTRICT = contsel,
    JOIN = contjoinsel
);


--
-- TOC entry 2079 (class 2617 OID 16907)
-- Dependencies: 6 177 1187 1190
-- Name: ^~; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR ^~ (
    PROCEDURE = ltq_rregex,
    LEFTARG = lquery,
    RIGHTARG = ltree,
    COMMUTATOR = ^~,
    RESTRICT = contsel,
    JOIN = contjoinsel
);


--
-- TOC entry 2078 (class 2617 OID 16908)
-- Dependencies: 1187 6 1190 176
-- Name: ^~; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR ^~ (
    PROCEDURE = ltq_regex,
    LEFTARG = ltree,
    RIGHTARG = lquery,
    COMMUTATOR = ^~,
    RESTRICT = contsel,
    JOIN = contjoinsel
);


--
-- TOC entry 2106 (class 2617 OID 16982)
-- Dependencies: 198 6 1190 1189
-- Name: ^~; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR ^~ (
    PROCEDURE = _ltq_rregex,
    LEFTARG = lquery,
    RIGHTARG = ltree[],
    COMMUTATOR = ^~,
    RESTRICT = contsel,
    JOIN = contjoinsel
);


--
-- TOC entry 2104 (class 2617 OID 16983)
-- Dependencies: 1189 197 1190 6
-- Name: ^~; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR ^~ (
    PROCEDURE = _ltq_regex,
    LEFTARG = ltree[],
    RIGHTARG = lquery,
    COMMUTATOR = ^~,
    RESTRICT = contsel,
    JOIN = contjoinsel
);


--
-- TOC entry 2108 (class 2617 OID 17176)
-- Dependencies: 1202 1202 6 319
-- Name: |&>; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR |&> (
    PROCEDURE = st_geometry_overabove,
    LEFTARG = geometry,
    RIGHTARG = geometry,
    COMMUTATOR = &<|,
    RESTRICT = positionsel,
    JOIN = positionjoinsel
);


--
-- TOC entry 2111 (class 2617 OID 17174)
-- Dependencies: 1202 6 1202 327
-- Name: |>>; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR |>> (
    PROCEDURE = st_geometry_above,
    LEFTARG = geometry,
    RIGHTARG = geometry,
    COMMUTATOR = <<|,
    RESTRICT = positionsel,
    JOIN = positionjoinsel
);


--
-- TOC entry 2073 (class 2617 OID 16888)
-- Dependencies: 6 1187 1187 1187 170
-- Name: ||; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR || (
    PROCEDURE = ltree_addltree,
    LEFTARG = ltree,
    RIGHTARG = ltree
);


--
-- TOC entry 2074 (class 2617 OID 16889)
-- Dependencies: 1187 6 1187 171
-- Name: ||; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR || (
    PROCEDURE = ltree_addtext,
    LEFTARG = ltree,
    RIGHTARG = text
);


--
-- TOC entry 2075 (class 2617 OID 16890)
-- Dependencies: 6 1187 1187 172
-- Name: ||; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR || (
    PROCEDURE = ltree_textadd,
    LEFTARG = text,
    RIGHTARG = ltree
);


--
-- TOC entry 2077 (class 2617 OID 16905)
-- Dependencies: 6 1190 1187 177
-- Name: ~; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR ~ (
    PROCEDURE = ltq_rregex,
    LEFTARG = lquery,
    RIGHTARG = ltree,
    COMMUTATOR = ~,
    RESTRICT = contsel,
    JOIN = contjoinsel
);


--
-- TOC entry 2076 (class 2617 OID 16906)
-- Dependencies: 6 1187 1190 176
-- Name: ~; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR ~ (
    PROCEDURE = ltq_regex,
    LEFTARG = ltree,
    RIGHTARG = lquery,
    COMMUTATOR = ~,
    RESTRICT = contsel,
    JOIN = contjoinsel
);


--
-- TOC entry 2093 (class 2617 OID 16972)
-- Dependencies: 1190 6 1189 198
-- Name: ~; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR ~ (
    PROCEDURE = _ltq_rregex,
    LEFTARG = lquery,
    RIGHTARG = ltree[],
    COMMUTATOR = ~,
    RESTRICT = contsel,
    JOIN = contjoinsel
);


--
-- TOC entry 2092 (class 2617 OID 16973)
-- Dependencies: 1190 197 6 1189
-- Name: ~; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR ~ (
    PROCEDURE = _ltq_regex,
    LEFTARG = ltree[],
    RIGHTARG = lquery,
    COMMUTATOR = ~,
    RESTRICT = contsel,
    JOIN = contjoinsel
);


--
-- TOC entry 2128 (class 2617 OID 17180)
-- Dependencies: 1202 6 1202 331
-- Name: ~; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR ~ (
    PROCEDURE = st_geometry_contain,
    LEFTARG = geometry,
    RIGHTARG = geometry,
    COMMUTATOR = @,
    RESTRICT = contsel,
    JOIN = contjoinsel
);


--
-- TOC entry 2126 (class 2617 OID 17179)
-- Dependencies: 337 1202 1202 6
-- Name: ~=; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR ~= (
    PROCEDURE = st_geometry_same,
    LEFTARG = geometry,
    RIGHTARG = geometry,
    COMMUTATOR = ~=,
    RESTRICT = eqsel,
    JOIN = eqjoinsel
);


--
-- TOC entry 2266 (class 2616 OID 17135)
-- Dependencies: 1202 2400 6
-- Name: btree_geometry_ops; Type: OPERATOR CLASS; Schema: public; Owner: -
--

CREATE OPERATOR CLASS btree_geometry_ops
    DEFAULT FOR TYPE geometry USING btree AS
    OPERATOR 1 <(geometry,geometry) ,
    OPERATOR 2 <=(geometry,geometry) ,
    OPERATOR 3 =(geometry,geometry) ,
    OPERATOR 4 >=(geometry,geometry) ,
    OPERATOR 5 >(geometry,geometry) ,
    FUNCTION 1 geometry_cmp(geometry,geometry);


--
-- TOC entry 2265 (class 2616 OID 17003)
-- Dependencies: 6 2399 1189 1196
-- Name: gist__ltree_ops; Type: OPERATOR CLASS; Schema: public; Owner: -
--

CREATE OPERATOR CLASS gist__ltree_ops
    DEFAULT FOR TYPE ltree[] USING gist AS
    STORAGE ltree_gist ,
    OPERATOR 10 <@(ltree[],ltree) RECHECK ,
    OPERATOR 11 @>(ltree,ltree[]) RECHECK ,
    OPERATOR 12 ~(ltree[],lquery) RECHECK ,
    OPERATOR 13 ~(lquery,ltree[]) RECHECK ,
    OPERATOR 14 @(ltree[],ltxtquery) RECHECK ,
    OPERATOR 15 @(ltxtquery,ltree[]) RECHECK ,
    OPERATOR 16 ?(ltree[],lquery[]) RECHECK ,
    OPERATOR 17 ?(lquery[],ltree[]) RECHECK ,
    FUNCTION 1 _ltree_consistent(internal,internal,smallint) ,
    FUNCTION 2 _ltree_union(internal,internal) ,
    FUNCTION 3 _ltree_compress(internal) ,
    FUNCTION 4 ltree_decompress(internal) ,
    FUNCTION 5 _ltree_penalty(internal,internal,internal) ,
    FUNCTION 6 _ltree_picksplit(internal,internal) ,
    FUNCTION 7 _ltree_same(internal,internal,internal);


--
-- TOC entry 2259 (class 2616 OID 16781)
-- Dependencies: 6 1183 2393
-- Name: gist_bit_ops; Type: OPERATOR CLASS; Schema: public; Owner: -
--

CREATE OPERATOR CLASS gist_bit_ops
    DEFAULT FOR TYPE bit USING gist AS
    STORAGE gbtreekey_var ,
    OPERATOR 1 <(bit,bit) ,
    OPERATOR 2 <=(bit,bit) ,
    OPERATOR 3 =(bit,bit) ,
    OPERATOR 4 >=(bit,bit) ,
    OPERATOR 5 >(bit,bit) ,
    FUNCTION 1 gbt_bit_consistent(internal,bit,smallint) ,
    FUNCTION 2 gbt_bit_union(bytea,internal) ,
    FUNCTION 3 gbt_bit_compress(internal) ,
    FUNCTION 4 gbt_var_decompress(internal) ,
    FUNCTION 5 gbt_bit_penalty(internal,internal,internal) ,
    FUNCTION 6 gbt_bit_picksplit(internal,internal) ,
    FUNCTION 7 gbt_bit_same(internal,internal,internal);


--
-- TOC entry 2256 (class 2616 OID 16721)
-- Dependencies: 2390 1183 6
-- Name: gist_bpchar_ops; Type: OPERATOR CLASS; Schema: public; Owner: -
--

CREATE OPERATOR CLASS gist_bpchar_ops
    DEFAULT FOR TYPE character USING gist AS
    STORAGE gbtreekey_var ,
    OPERATOR 1 <(character,character) ,
    OPERATOR 2 <=(character,character) ,
    OPERATOR 3 =(character,character) ,
    OPERATOR 4 >=(character,character) ,
    OPERATOR 5 >(character,character) ,
    FUNCTION 1 gbt_bpchar_consistent(internal,character,smallint) ,
    FUNCTION 2 gbt_text_union(bytea,internal) ,
    FUNCTION 3 gbt_bpchar_compress(internal) ,
    FUNCTION 4 gbt_var_decompress(internal) ,
    FUNCTION 5 gbt_text_penalty(internal,internal,internal) ,
    FUNCTION 6 gbt_text_picksplit(internal,internal) ,
    FUNCTION 7 gbt_text_same(internal,internal,internal);


--
-- TOC entry 2257 (class 2616 OID 16741)
-- Dependencies: 2391 6 1183
-- Name: gist_bytea_ops; Type: OPERATOR CLASS; Schema: public; Owner: -
--

CREATE OPERATOR CLASS gist_bytea_ops
    DEFAULT FOR TYPE bytea USING gist AS
    STORAGE gbtreekey_var ,
    OPERATOR 1 <(bytea,bytea) ,
    OPERATOR 2 <=(bytea,bytea) ,
    OPERATOR 3 =(bytea,bytea) ,
    OPERATOR 4 >=(bytea,bytea) ,
    OPERATOR 5 >(bytea,bytea) ,
    FUNCTION 1 gbt_bytea_consistent(internal,bytea,smallint) ,
    FUNCTION 2 gbt_bytea_union(bytea,internal) ,
    FUNCTION 3 gbt_bytea_compress(internal) ,
    FUNCTION 4 gbt_var_decompress(internal) ,
    FUNCTION 5 gbt_bytea_penalty(internal,internal,internal) ,
    FUNCTION 6 gbt_bytea_picksplit(internal,internal) ,
    FUNCTION 7 gbt_bytea_same(internal,internal,internal);


--
-- TOC entry 2253 (class 2616 OID 16665)
-- Dependencies: 1177 2387 6
-- Name: gist_cash_ops; Type: OPERATOR CLASS; Schema: public; Owner: -
--

CREATE OPERATOR CLASS gist_cash_ops
    DEFAULT FOR TYPE money USING gist AS
    STORAGE gbtreekey16 ,
    OPERATOR 1 <(money,money) ,
    OPERATOR 2 <=(money,money) ,
    OPERATOR 3 =(money,money) ,
    OPERATOR 4 >=(money,money) ,
    OPERATOR 5 >(money,money) ,
    FUNCTION 1 gbt_cash_consistent(internal,money,smallint) ,
    FUNCTION 2 gbt_cash_union(bytea,internal) ,
    FUNCTION 3 gbt_cash_compress(internal) ,
    FUNCTION 4 gbt_decompress(internal) ,
    FUNCTION 5 gbt_cash_penalty(internal,internal,internal) ,
    FUNCTION 6 gbt_cash_picksplit(internal,internal) ,
    FUNCTION 7 gbt_cash_same(internal,internal,internal);


--
-- TOC entry 2262 (class 2616 OID 16829)
-- Dependencies: 2396 1177 6
-- Name: gist_cidr_ops; Type: OPERATOR CLASS; Schema: public; Owner: -
--

CREATE OPERATOR CLASS gist_cidr_ops
    DEFAULT FOR TYPE cidr USING gist AS
    STORAGE gbtreekey16 ,
    OPERATOR 1 <(inet,inet) RECHECK ,
    OPERATOR 2 <=(inet,inet) RECHECK ,
    OPERATOR 3 =(inet,inet) RECHECK ,
    OPERATOR 4 >=(inet,inet) RECHECK ,
    OPERATOR 5 >(inet,inet) RECHECK ,
    FUNCTION 1 gbt_inet_consistent(internal,inet,smallint) ,
    FUNCTION 2 gbt_inet_union(bytea,internal) ,
    FUNCTION 3 gbt_inet_compress(internal) ,
    FUNCTION 4 gbt_decompress(internal) ,
    FUNCTION 5 gbt_inet_penalty(internal,internal,internal) ,
    FUNCTION 6 gbt_inet_picksplit(internal,internal) ,
    FUNCTION 7 gbt_inet_same(internal,internal,internal);


--
-- TOC entry 2251 (class 2616 OID 16624)
-- Dependencies: 2385 1174 6
-- Name: gist_date_ops; Type: OPERATOR CLASS; Schema: public; Owner: -
--

CREATE OPERATOR CLASS gist_date_ops
    DEFAULT FOR TYPE date USING gist AS
    STORAGE gbtreekey8 ,
    OPERATOR 1 <(date,date) ,
    OPERATOR 2 <=(date,date) ,
    OPERATOR 3 =(date,date) ,
    OPERATOR 4 >=(date,date) ,
    OPERATOR 5 >(date,date) ,
    FUNCTION 1 gbt_date_consistent(internal,date,smallint) ,
    FUNCTION 2 gbt_date_union(bytea,internal) ,
    FUNCTION 3 gbt_date_compress(internal) ,
    FUNCTION 4 gbt_decompress(internal) ,
    FUNCTION 5 gbt_date_penalty(internal,internal,internal) ,
    FUNCTION 6 gbt_date_picksplit(internal,internal) ,
    FUNCTION 7 gbt_date_same(internal,internal,internal);


--
-- TOC entry 2245 (class 2616 OID 16512)
-- Dependencies: 2379 1174 6
-- Name: gist_float4_ops; Type: OPERATOR CLASS; Schema: public; Owner: -
--

CREATE OPERATOR CLASS gist_float4_ops
    DEFAULT FOR TYPE real USING gist AS
    STORAGE gbtreekey8 ,
    OPERATOR 1 <(real,real) ,
    OPERATOR 2 <=(real,real) ,
    OPERATOR 3 =(real,real) ,
    OPERATOR 4 >=(real,real) ,
    OPERATOR 5 >(real,real) ,
    FUNCTION 1 gbt_float4_consistent(internal,real,smallint) ,
    FUNCTION 2 gbt_float4_union(bytea,internal) ,
    FUNCTION 3 gbt_float4_compress(internal) ,
    FUNCTION 4 gbt_decompress(internal) ,
    FUNCTION 5 gbt_float4_penalty(internal,internal,internal) ,
    FUNCTION 6 gbt_float4_picksplit(internal,internal) ,
    FUNCTION 7 gbt_float4_same(internal,internal,internal);


--
-- TOC entry 2246 (class 2616 OID 16532)
-- Dependencies: 6 1177 2380
-- Name: gist_float8_ops; Type: OPERATOR CLASS; Schema: public; Owner: -
--

CREATE OPERATOR CLASS gist_float8_ops
    DEFAULT FOR TYPE double precision USING gist AS
    STORAGE gbtreekey16 ,
    OPERATOR 1 <(double precision,double precision) ,
    OPERATOR 2 <=(double precision,double precision) ,
    OPERATOR 3 =(double precision,double precision) ,
    OPERATOR 4 >=(double precision,double precision) ,
    OPERATOR 5 >(double precision,double precision) ,
    FUNCTION 1 gbt_float8_consistent(internal,double precision,smallint) ,
    FUNCTION 2 gbt_float8_union(bytea,internal) ,
    FUNCTION 3 gbt_float8_compress(internal) ,
    FUNCTION 4 gbt_decompress(internal) ,
    FUNCTION 5 gbt_float8_penalty(internal,internal,internal) ,
    FUNCTION 6 gbt_float8_picksplit(internal,internal) ,
    FUNCTION 7 gbt_float8_same(internal,internal,internal);


--
-- TOC entry 2267 (class 2616 OID 17190)
-- Dependencies: 1214 1202 2401 6
-- Name: gist_geometry_ops; Type: OPERATOR CLASS; Schema: public; Owner: -
--

CREATE OPERATOR CLASS gist_geometry_ops
    DEFAULT FOR TYPE geometry USING gist AS
    STORAGE box2d ,
    OPERATOR 1 <<(geometry,geometry) ,
    OPERATOR 2 &<(geometry,geometry) ,
    OPERATOR 3 &&(geometry,geometry) ,
    OPERATOR 4 &>(geometry,geometry) ,
    OPERATOR 5 >>(geometry,geometry) ,
    OPERATOR 6 ~=(geometry,geometry) RECHECK ,
    OPERATOR 7 ~(geometry,geometry) ,
    OPERATOR 8 @(geometry,geometry) ,
    OPERATOR 9 &<|(geometry,geometry) ,
    OPERATOR 10 <<|(geometry,geometry) ,
    OPERATOR 11 |>>(geometry,geometry) ,
    OPERATOR 12 |&>(geometry,geometry) ,
    FUNCTION 1 lwgeom_gist_consistent(internal,geometry,integer) ,
    FUNCTION 2 lwgeom_gist_union(bytea,internal) ,
    FUNCTION 3 lwgeom_gist_compress(internal) ,
    FUNCTION 4 lwgeom_gist_decompress(internal) ,
    FUNCTION 5 lwgeom_gist_penalty(internal,internal,internal) ,
    FUNCTION 6 lwgeom_gist_picksplit(internal,internal) ,
    FUNCTION 7 lwgeom_gist_same(box2d,box2d,internal);


--
-- TOC entry 2261 (class 2616 OID 16815)
-- Dependencies: 6 1177 2395
-- Name: gist_inet_ops; Type: OPERATOR CLASS; Schema: public; Owner: -
--

CREATE OPERATOR CLASS gist_inet_ops
    DEFAULT FOR TYPE inet USING gist AS
    STORAGE gbtreekey16 ,
    OPERATOR 1 <(inet,inet) RECHECK ,
    OPERATOR 2 <=(inet,inet) RECHECK ,
    OPERATOR 3 =(inet,inet) RECHECK ,
    OPERATOR 4 >=(inet,inet) RECHECK ,
    OPERATOR 5 >(inet,inet) RECHECK ,
    FUNCTION 1 gbt_inet_consistent(internal,inet,smallint) ,
    FUNCTION 2 gbt_inet_union(bytea,internal) ,
    FUNCTION 3 gbt_inet_compress(internal) ,
    FUNCTION 4 gbt_decompress(internal) ,
    FUNCTION 5 gbt_inet_penalty(internal,internal,internal) ,
    FUNCTION 6 gbt_inet_picksplit(internal,internal) ,
    FUNCTION 7 gbt_inet_same(internal,internal,internal);


--
-- TOC entry 2242 (class 2616 OID 16452)
-- Dependencies: 2376 1135 6
-- Name: gist_int2_ops; Type: OPERATOR CLASS; Schema: public; Owner: -
--

CREATE OPERATOR CLASS gist_int2_ops
    DEFAULT FOR TYPE smallint USING gist AS
    STORAGE gbtreekey4 ,
    OPERATOR 1 <(smallint,smallint) ,
    OPERATOR 2 <=(smallint,smallint) ,
    OPERATOR 3 =(smallint,smallint) ,
    OPERATOR 4 >=(smallint,smallint) ,
    OPERATOR 5 >(smallint,smallint) ,
    FUNCTION 1 gbt_int2_consistent(internal,smallint,smallint) ,
    FUNCTION 2 gbt_int2_union(bytea,internal) ,
    FUNCTION 3 gbt_int2_compress(internal) ,
    FUNCTION 4 gbt_decompress(internal) ,
    FUNCTION 5 gbt_int2_penalty(internal,internal,internal) ,
    FUNCTION 6 gbt_int2_picksplit(internal,internal) ,
    FUNCTION 7 gbt_int2_same(internal,internal,internal);


--
-- TOC entry 2243 (class 2616 OID 16472)
-- Dependencies: 1174 6 2377
-- Name: gist_int4_ops; Type: OPERATOR CLASS; Schema: public; Owner: -
--

CREATE OPERATOR CLASS gist_int4_ops
    DEFAULT FOR TYPE integer USING gist AS
    STORAGE gbtreekey8 ,
    OPERATOR 1 <(integer,integer) ,
    OPERATOR 2 <=(integer,integer) ,
    OPERATOR 3 =(integer,integer) ,
    OPERATOR 4 >=(integer,integer) ,
    OPERATOR 5 >(integer,integer) ,
    FUNCTION 1 gbt_int4_consistent(internal,integer,smallint) ,
    FUNCTION 2 gbt_int4_union(bytea,internal) ,
    FUNCTION 3 gbt_int4_compress(internal) ,
    FUNCTION 4 gbt_decompress(internal) ,
    FUNCTION 5 gbt_int4_penalty(internal,internal,internal) ,
    FUNCTION 6 gbt_int4_picksplit(internal,internal) ,
    FUNCTION 7 gbt_int4_same(internal,internal,internal);


--
-- TOC entry 2244 (class 2616 OID 16492)
-- Dependencies: 1177 6 2378
-- Name: gist_int8_ops; Type: OPERATOR CLASS; Schema: public; Owner: -
--

CREATE OPERATOR CLASS gist_int8_ops
    DEFAULT FOR TYPE bigint USING gist AS
    STORAGE gbtreekey16 ,
    OPERATOR 1 <(bigint,bigint) ,
    OPERATOR 2 <=(bigint,bigint) ,
    OPERATOR 3 =(bigint,bigint) ,
    OPERATOR 4 >=(bigint,bigint) ,
    OPERATOR 5 >(bigint,bigint) ,
    FUNCTION 1 gbt_int8_consistent(internal,bigint,smallint) ,
    FUNCTION 2 gbt_int8_union(bytea,internal) ,
    FUNCTION 3 gbt_int8_compress(internal) ,
    FUNCTION 4 gbt_decompress(internal) ,
    FUNCTION 5 gbt_int8_penalty(internal,internal,internal) ,
    FUNCTION 6 gbt_int8_picksplit(internal,internal) ,
    FUNCTION 7 gbt_int8_same(internal,internal,internal);


--
-- TOC entry 2252 (class 2616 OID 16645)
-- Dependencies: 1180 2386 6
-- Name: gist_interval_ops; Type: OPERATOR CLASS; Schema: public; Owner: -
--

CREATE OPERATOR CLASS gist_interval_ops
    DEFAULT FOR TYPE interval USING gist AS
    STORAGE gbtreekey32 ,
    OPERATOR 1 <(interval,interval) ,
    OPERATOR 2 <=(interval,interval) ,
    OPERATOR 3 =(interval,interval) ,
    OPERATOR 4 >=(interval,interval) ,
    OPERATOR 5 >(interval,interval) ,
    FUNCTION 1 gbt_intv_consistent(internal,interval,smallint) ,
    FUNCTION 2 gbt_intv_union(bytea,internal) ,
    FUNCTION 3 gbt_intv_compress(internal) ,
    FUNCTION 4 gbt_intv_decompress(internal) ,
    FUNCTION 5 gbt_intv_penalty(internal,internal,internal) ,
    FUNCTION 6 gbt_intv_picksplit(internal,internal) ,
    FUNCTION 7 gbt_intv_same(internal,internal,internal);


--
-- TOC entry 2264 (class 2616 OID 16937)
-- Dependencies: 1196 6 2398 1187
-- Name: gist_ltree_ops; Type: OPERATOR CLASS; Schema: public; Owner: -
--

CREATE OPERATOR CLASS gist_ltree_ops
    DEFAULT FOR TYPE ltree USING gist AS
    STORAGE ltree_gist ,
    OPERATOR 1 <(ltree,ltree) ,
    OPERATOR 2 <=(ltree,ltree) ,
    OPERATOR 3 =(ltree,ltree) ,
    OPERATOR 4 >=(ltree,ltree) ,
    OPERATOR 5 >(ltree,ltree) ,
    OPERATOR 10 @>(ltree,ltree) ,
    OPERATOR 11 <@(ltree,ltree) ,
    OPERATOR 12 ~(ltree,lquery) ,
    OPERATOR 13 ~(lquery,ltree) ,
    OPERATOR 14 @(ltree,ltxtquery) ,
    OPERATOR 15 @(ltxtquery,ltree) ,
    OPERATOR 16 ?(ltree,lquery[]) ,
    OPERATOR 17 ?(lquery[],ltree) ,
    FUNCTION 1 ltree_consistent(internal,internal,smallint) ,
    FUNCTION 2 ltree_union(internal,internal) ,
    FUNCTION 3 ltree_compress(internal) ,
    FUNCTION 4 ltree_decompress(internal) ,
    FUNCTION 5 ltree_penalty(internal,internal,internal) ,
    FUNCTION 6 ltree_picksplit(internal,internal) ,
    FUNCTION 7 ltree_same(internal,internal,internal);


--
-- TOC entry 2254 (class 2616 OID 16685)
-- Dependencies: 2388 1177 6
-- Name: gist_macaddr_ops; Type: OPERATOR CLASS; Schema: public; Owner: -
--

CREATE OPERATOR CLASS gist_macaddr_ops
    DEFAULT FOR TYPE macaddr USING gist AS
    STORAGE gbtreekey16 ,
    OPERATOR 1 <(macaddr,macaddr) ,
    OPERATOR 2 <=(macaddr,macaddr) ,
    OPERATOR 3 =(macaddr,macaddr) ,
    OPERATOR 4 >=(macaddr,macaddr) ,
    OPERATOR 5 >(macaddr,macaddr) ,
    FUNCTION 1 gbt_macad_consistent(internal,macaddr,smallint) ,
    FUNCTION 2 gbt_macad_union(bytea,internal) ,
    FUNCTION 3 gbt_macad_compress(internal) ,
    FUNCTION 4 gbt_decompress(internal) ,
    FUNCTION 5 gbt_macad_penalty(internal,internal,internal) ,
    FUNCTION 6 gbt_macad_picksplit(internal,internal) ,
    FUNCTION 7 gbt_macad_same(internal,internal,internal);


--
-- TOC entry 2258 (class 2616 OID 16761)
-- Dependencies: 1183 2392 6
-- Name: gist_numeric_ops; Type: OPERATOR CLASS; Schema: public; Owner: -
--

CREATE OPERATOR CLASS gist_numeric_ops
    DEFAULT FOR TYPE numeric USING gist AS
    STORAGE gbtreekey_var ,
    OPERATOR 1 <(numeric,numeric) ,
    OPERATOR 2 <=(numeric,numeric) ,
    OPERATOR 3 =(numeric,numeric) ,
    OPERATOR 4 >=(numeric,numeric) ,
    OPERATOR 5 >(numeric,numeric) ,
    FUNCTION 1 gbt_numeric_consistent(internal,numeric,smallint) ,
    FUNCTION 2 gbt_numeric_union(bytea,internal) ,
    FUNCTION 3 gbt_numeric_compress(internal) ,
    FUNCTION 4 gbt_var_decompress(internal) ,
    FUNCTION 5 gbt_numeric_penalty(internal,internal,internal) ,
    FUNCTION 6 gbt_numeric_picksplit(internal,internal) ,
    FUNCTION 7 gbt_numeric_same(internal,internal,internal);


--
-- TOC entry 2241 (class 2616 OID 16432)
-- Dependencies: 6 2375 1174
-- Name: gist_oid_ops; Type: OPERATOR CLASS; Schema: public; Owner: -
--

CREATE OPERATOR CLASS gist_oid_ops
    DEFAULT FOR TYPE oid USING gist AS
    STORAGE gbtreekey8 ,
    OPERATOR 1 <(oid,oid) ,
    OPERATOR 2 <=(oid,oid) ,
    OPERATOR 3 =(oid,oid) ,
    OPERATOR 4 >=(oid,oid) ,
    OPERATOR 5 >(oid,oid) ,
    FUNCTION 1 gbt_oid_consistent(internal,oid,smallint) ,
    FUNCTION 2 gbt_oid_union(bytea,internal) ,
    FUNCTION 3 gbt_oid_compress(internal) ,
    FUNCTION 4 gbt_decompress(internal) ,
    FUNCTION 5 gbt_oid_penalty(internal,internal,internal) ,
    FUNCTION 6 gbt_oid_picksplit(internal,internal) ,
    FUNCTION 7 gbt_oid_same(internal,internal,internal);


--
-- TOC entry 2255 (class 2616 OID 16707)
-- Dependencies: 6 2389 1183
-- Name: gist_text_ops; Type: OPERATOR CLASS; Schema: public; Owner: -
--

CREATE OPERATOR CLASS gist_text_ops
    DEFAULT FOR TYPE text USING gist AS
    STORAGE gbtreekey_var ,
    OPERATOR 1 <(text,text) ,
    OPERATOR 2 <=(text,text) ,
    OPERATOR 3 =(text,text) ,
    OPERATOR 4 >=(text,text) ,
    OPERATOR 5 >(text,text) ,
    FUNCTION 1 gbt_text_consistent(internal,text,smallint) ,
    FUNCTION 2 gbt_text_union(bytea,internal) ,
    FUNCTION 3 gbt_text_compress(internal) ,
    FUNCTION 4 gbt_var_decompress(internal) ,
    FUNCTION 5 gbt_text_penalty(internal,internal,internal) ,
    FUNCTION 6 gbt_text_picksplit(internal,internal) ,
    FUNCTION 7 gbt_text_same(internal,internal,internal);


--
-- TOC entry 2249 (class 2616 OID 16590)
-- Dependencies: 2383 6 1177
-- Name: gist_time_ops; Type: OPERATOR CLASS; Schema: public; Owner: -
--

CREATE OPERATOR CLASS gist_time_ops
    DEFAULT FOR TYPE time without time zone USING gist AS
    STORAGE gbtreekey16 ,
    OPERATOR 1 <(time without time zone,time without time zone) ,
    OPERATOR 2 <=(time without time zone,time without time zone) ,
    OPERATOR 3 =(time without time zone,time without time zone) ,
    OPERATOR 4 >=(time without time zone,time without time zone) ,
    OPERATOR 5 >(time without time zone,time without time zone) ,
    FUNCTION 1 gbt_time_consistent(internal,time without time zone,smallint) ,
    FUNCTION 2 gbt_time_union(bytea,internal) ,
    FUNCTION 3 gbt_time_compress(internal) ,
    FUNCTION 4 gbt_decompress(internal) ,
    FUNCTION 5 gbt_time_penalty(internal,internal,internal) ,
    FUNCTION 6 gbt_time_picksplit(internal,internal) ,
    FUNCTION 7 gbt_time_same(internal,internal,internal);


--
-- TOC entry 2247 (class 2616 OID 16554)
-- Dependencies: 2381 6 1177
-- Name: gist_timestamp_ops; Type: OPERATOR CLASS; Schema: public; Owner: -
--

CREATE OPERATOR CLASS gist_timestamp_ops
    DEFAULT FOR TYPE timestamp without time zone USING gist AS
    STORAGE gbtreekey16 ,
    OPERATOR 1 <(timestamp without time zone,timestamp without time zone) ,
    OPERATOR 2 <=(timestamp without time zone,timestamp without time zone) ,
    OPERATOR 3 =(timestamp without time zone,timestamp without time zone) ,
    OPERATOR 4 >=(timestamp without time zone,timestamp without time zone) ,
    OPERATOR 5 >(timestamp without time zone,timestamp without time zone) ,
    FUNCTION 1 gbt_ts_consistent(internal,timestamp without time zone,smallint) ,
    FUNCTION 2 gbt_ts_union(bytea,internal) ,
    FUNCTION 3 gbt_ts_compress(internal) ,
    FUNCTION 4 gbt_decompress(internal) ,
    FUNCTION 5 gbt_ts_penalty(internal,internal,internal) ,
    FUNCTION 6 gbt_ts_picksplit(internal,internal) ,
    FUNCTION 7 gbt_ts_same(internal,internal,internal);


--
-- TOC entry 2248 (class 2616 OID 16568)
-- Dependencies: 2382 6 1177
-- Name: gist_timestamptz_ops; Type: OPERATOR CLASS; Schema: public; Owner: -
--

CREATE OPERATOR CLASS gist_timestamptz_ops
    DEFAULT FOR TYPE timestamp with time zone USING gist AS
    STORAGE gbtreekey16 ,
    OPERATOR 1 <(timestamp with time zone,timestamp with time zone) ,
    OPERATOR 2 <=(timestamp with time zone,timestamp with time zone) ,
    OPERATOR 3 =(timestamp with time zone,timestamp with time zone) ,
    OPERATOR 4 >=(timestamp with time zone,timestamp with time zone) ,
    OPERATOR 5 >(timestamp with time zone,timestamp with time zone) ,
    FUNCTION 1 gbt_tstz_consistent(internal,timestamp with time zone,smallint) ,
    FUNCTION 2 gbt_ts_union(bytea,internal) ,
    FUNCTION 3 gbt_tstz_compress(internal) ,
    FUNCTION 4 gbt_decompress(internal) ,
    FUNCTION 5 gbt_ts_penalty(internal,internal,internal) ,
    FUNCTION 6 gbt_ts_picksplit(internal,internal) ,
    FUNCTION 7 gbt_ts_same(internal,internal,internal);


--
-- TOC entry 2250 (class 2616 OID 16604)
-- Dependencies: 1177 6 2384
-- Name: gist_timetz_ops; Type: OPERATOR CLASS; Schema: public; Owner: -
--

CREATE OPERATOR CLASS gist_timetz_ops
    DEFAULT FOR TYPE time with time zone USING gist AS
    STORAGE gbtreekey16 ,
    OPERATOR 1 <(time with time zone,time with time zone) RECHECK ,
    OPERATOR 2 <=(time with time zone,time with time zone) RECHECK ,
    OPERATOR 3 =(time with time zone,time with time zone) RECHECK ,
    OPERATOR 4 >=(time with time zone,time with time zone) RECHECK ,
    OPERATOR 5 >(time with time zone,time with time zone) RECHECK ,
    FUNCTION 1 gbt_timetz_consistent(internal,time with time zone,smallint) ,
    FUNCTION 2 gbt_time_union(bytea,internal) ,
    FUNCTION 3 gbt_timetz_compress(internal) ,
    FUNCTION 4 gbt_decompress(internal) ,
    FUNCTION 5 gbt_time_penalty(internal,internal,internal) ,
    FUNCTION 6 gbt_time_picksplit(internal,internal) ,
    FUNCTION 7 gbt_time_same(internal,internal,internal);


--
-- TOC entry 2260 (class 2616 OID 16795)
-- Dependencies: 1183 6 2394
-- Name: gist_vbit_ops; Type: OPERATOR CLASS; Schema: public; Owner: -
--

CREATE OPERATOR CLASS gist_vbit_ops
    DEFAULT FOR TYPE bit varying USING gist AS
    STORAGE gbtreekey_var ,
    OPERATOR 1 <(bit varying,bit varying) ,
    OPERATOR 2 <=(bit varying,bit varying) ,
    OPERATOR 3 =(bit varying,bit varying) ,
    OPERATOR 4 >=(bit varying,bit varying) ,
    OPERATOR 5 >(bit varying,bit varying) ,
    FUNCTION 1 gbt_bit_consistent(internal,bit,smallint) ,
    FUNCTION 2 gbt_bit_union(bytea,internal) ,
    FUNCTION 3 gbt_bit_compress(internal) ,
    FUNCTION 4 gbt_var_decompress(internal) ,
    FUNCTION 5 gbt_bit_penalty(internal,internal,internal) ,
    FUNCTION 6 gbt_bit_picksplit(internal,internal) ,
    FUNCTION 7 gbt_bit_same(internal,internal,internal);


--
-- TOC entry 2263 (class 2616 OID 16892)
-- Dependencies: 6 2397 1187
-- Name: ltree_ops; Type: OPERATOR CLASS; Schema: public; Owner: -
--

CREATE OPERATOR CLASS ltree_ops
    DEFAULT FOR TYPE ltree USING btree AS
    OPERATOR 1 <(ltree,ltree) ,
    OPERATOR 2 <=(ltree,ltree) ,
    OPERATOR 3 =(ltree,ltree) ,
    OPERATOR 4 >=(ltree,ltree) ,
    OPERATOR 5 >(ltree,ltree) ,
    FUNCTION 1 ltree_cmp(ltree,ltree);


SET search_path = pg_catalog;

--
-- TOC entry 3006 (class 2605 OID 17466)
-- Dependencies: 554 554 1214 1205
-- Name: CAST (public.box2d AS public.box3d); Type: CAST; Schema: pg_catalog; Owner: -
--

CREATE CAST (public.box2d AS public.box3d) WITH FUNCTION public.st_box3d(public.box2d) AS IMPLICIT;


--
-- TOC entry 3005 (class 2605 OID 17467)
-- Dependencies: 561 561 1214 1202
-- Name: CAST (public.box2d AS public.geometry); Type: CAST; Schema: pg_catalog; Owner: -
--

CREATE CAST (public.box2d AS public.geometry) WITH FUNCTION public.st_geometry(public.box2d) AS IMPLICIT;


--
-- TOC entry 2999 (class 2605 OID 17468)
-- Dependencies: 556 556 1205
-- Name: CAST (public.box3d AS box); Type: CAST; Schema: pg_catalog; Owner: -
--

CREATE CAST (public.box3d AS box) WITH FUNCTION public.st_box(public.box3d) AS IMPLICIT;


--
-- TOC entry 3001 (class 2605 OID 17465)
-- Dependencies: 552 1214 1205 552
-- Name: CAST (public.box3d AS public.box2d); Type: CAST; Schema: pg_catalog; Owner: -
--

CREATE CAST (public.box3d AS public.box2d) WITH FUNCTION public.st_box2d(public.box3d) AS IMPLICIT;


--
-- TOC entry 3000 (class 2605 OID 17469)
-- Dependencies: 563 1202 563 1205
-- Name: CAST (public.box3d AS public.geometry); Type: CAST; Schema: pg_catalog; Owner: -
--

CREATE CAST (public.box3d AS public.geometry) WITH FUNCTION public.st_geometry(public.box3d) AS IMPLICIT;


--
-- TOC entry 3004 (class 2605 OID 17476)
-- Dependencies: 258 1208 1214 258
-- Name: CAST (public.box3d_extent AS public.box2d); Type: CAST; Schema: pg_catalog; Owner: -
--

CREATE CAST (public.box3d_extent AS public.box2d) WITH FUNCTION public.st_box2d(public.box3d_extent) AS IMPLICIT;


--
-- TOC entry 3003 (class 2605 OID 17475)
-- Dependencies: 257 1205 1208 257
-- Name: CAST (public.box3d_extent AS public.box3d); Type: CAST; Schema: pg_catalog; Owner: -
--

CREATE CAST (public.box3d_extent AS public.box3d) WITH FUNCTION public.st_box3d_extent(public.box3d_extent) AS IMPLICIT;


--
-- TOC entry 3002 (class 2605 OID 17477)
-- Dependencies: 259 1208 1202 259
-- Name: CAST (public.box3d_extent AS public.geometry); Type: CAST; Schema: pg_catalog; Owner: -
--

CREATE CAST (public.box3d_extent AS public.geometry) WITH FUNCTION public.st_geometry(public.box3d_extent) AS IMPLICIT;


--
-- TOC entry 2805 (class 2605 OID 17473)
-- Dependencies: 569 1202 569
-- Name: CAST (bytea AS public.geometry); Type: CAST; Schema: pg_catalog; Owner: -
--

CREATE CAST (bytea AS public.geometry) WITH FUNCTION public.st_geometry(bytea) AS IMPLICIT;


--
-- TOC entry 3007 (class 2605 OID 17472)
-- Dependencies: 567 1211 1202 567
-- Name: CAST (public.chip AS public.geometry); Type: CAST; Schema: pg_catalog; Owner: -
--

CREATE CAST (public.chip AS public.geometry) WITH FUNCTION public.st_geometry(public.chip) AS IMPLICIT;


--
-- TOC entry 2996 (class 2605 OID 17464)
-- Dependencies: 550 1202 550
-- Name: CAST (public.geometry AS box); Type: CAST; Schema: pg_catalog; Owner: -
--

CREATE CAST (public.geometry AS box) WITH FUNCTION public.st_box(public.geometry) AS IMPLICIT;


--
-- TOC entry 2998 (class 2605 OID 17462)
-- Dependencies: 546 1214 546 1202
-- Name: CAST (public.geometry AS public.box2d); Type: CAST; Schema: pg_catalog; Owner: -
--

CREATE CAST (public.geometry AS public.box2d) WITH FUNCTION public.st_box2d(public.geometry) AS IMPLICIT;


--
-- TOC entry 2997 (class 2605 OID 17463)
-- Dependencies: 548 1202 1205 548
-- Name: CAST (public.geometry AS public.box3d); Type: CAST; Schema: pg_catalog; Owner: -
--

CREATE CAST (public.geometry AS public.box3d) WITH FUNCTION public.st_box3d(public.geometry) AS IMPLICIT;


--
-- TOC entry 2994 (class 2605 OID 17474)
-- Dependencies: 571 571 1202
-- Name: CAST (public.geometry AS bytea); Type: CAST; Schema: pg_catalog; Owner: -
--

CREATE CAST (public.geometry AS bytea) WITH FUNCTION public.st_bytea(public.geometry) AS IMPLICIT;


--
-- TOC entry 2995 (class 2605 OID 17471)
-- Dependencies: 558 558 1202
-- Name: CAST (public.geometry AS text); Type: CAST; Schema: pg_catalog; Owner: -
--

CREATE CAST (public.geometry AS text) WITH FUNCTION public.st_text(public.geometry) AS IMPLICIT;


--
-- TOC entry 2871 (class 2605 OID 17470)
-- Dependencies: 565 565 1202
-- Name: CAST (text AS public.geometry); Type: CAST; Schema: pg_catalog; Owner: -
--

CREATE CAST (text AS public.geometry) WITH FUNCTION public.st_geometry(text) AS IMPLICIT;


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 2655 (class 1259 OID 17885)
-- Dependencies: 6
-- Name: Log; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE "Log" (
    "ID" integer NOT NULL,
    "OBJETO" character varying(50),
    "PRIORIDAD" character varying(50),
    "FECHA" character varying(50),
    "MENSAJE" character varying(50)
);


--
-- TOC entry 2656 (class 1259 OID 17888)
-- Dependencies: 2655 6
-- Name: Log_ID_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE "Log_ID_seq"
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- TOC entry 3382 (class 0 OID 0)
-- Dependencies: 2656
-- Name: Log_ID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE "Log_ID_seq" OWNED BY "Log"."ID";


--
-- TOC entry 2657 (class 1259 OID 17890)
-- Dependencies: 6
-- Name: cargo_funcionario; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE cargo_funcionario (
    id_cargo integer NOT NULL,
    nom_cargo text NOT NULL,
    tipo_cargo integer
);


--
-- TOC entry 2658 (class 1259 OID 17896)
-- Dependencies: 6 2657
-- Name: cargo_funcionario_id_cargo_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE cargo_funcionario_id_cargo_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- TOC entry 3383 (class 0 OID 0)
-- Dependencies: 2658
-- Name: cargo_funcionario_id_cargo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE cargo_funcionario_id_cargo_seq OWNED BY cargo_funcionario.id_cargo;


--
-- TOC entry 2659 (class 1259 OID 17898)
-- Dependencies: 6
-- Name: ciudad_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE ciudad_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 20;


--
-- TOC entry 2660 (class 1259 OID 17900)
-- Dependencies: 3010 6
-- Name: ciudad; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE ciudad (
    id_ciudad integer DEFAULT nextval('ciudad_seq'::regclass) NOT NULL,
    nom_ciudad text NOT NULL,
    id_dept integer NOT NULL
);


--
-- TOC entry 2661 (class 1259 OID 17907)
-- Dependencies: 3012 3013 3014 1202 6
-- Name: corredores; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE corredores (
    gid integer NOT NULL,
    id_corredo integer,
    the_geom geometry,
    CONSTRAINT enforce_dims_the_geom CHECK ((ndims(the_geom) = 2)),
    CONSTRAINT enforce_geotype_the_geom CHECK (((geometrytype(the_geom) = 'MULTIPOLYGON'::text) OR (the_geom IS NULL))),
    CONSTRAINT enforce_srid_the_geom CHECK ((srid(the_geom) = 3116))
);


--
-- TOC entry 2662 (class 1259 OID 17916)
-- Dependencies: 6 2661
-- Name: corredores_gid_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE corredores_gid_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- TOC entry 3384 (class 0 OID 0)
-- Dependencies: 2662
-- Name: corredores_gid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE corredores_gid_seq OWNED BY corredores.gid;


--
-- TOC entry 2663 (class 1259 OID 17918)
-- Dependencies: 6
-- Name: dept_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE dept_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 20;


--
-- TOC entry 2664 (class 1259 OID 17920)
-- Dependencies: 3015 6
-- Name: departamento; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE departamento (
    id_dept integer DEFAULT nextval('dept_seq'::regclass) NOT NULL,
    nom_dept text
);


--
-- TOC entry 2665 (class 1259 OID 17927)
-- Dependencies: 6
-- Name: edificio_espacio; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE edificio_espacio (
    id_piso bigint NOT NULL,
    nom_espacio text NOT NULL,
    tipo_espacio integer NOT NULL,
    id_edf_espacio integer NOT NULL
);


--
-- TOC entry 2666 (class 1259 OID 17933)
-- Dependencies: 3017 6
-- Name: edificio_info; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE edificio_info (
    id_edificio integer NOT NULL,
    nom_edificio character varying(50) NOT NULL,
    direccion_1 character varying(50),
    direccion_2 character varying(50),
    fecha_construccion date,
    ciudad integer NOT NULL,
    sede integer DEFAULT 1,
    descripcion text,
    fotografia text,
    uso integer,
    foto bytea
);


--
-- TOC entry 2667 (class 1259 OID 17940)
-- Dependencies: 6
-- Name: edificio_piso_id_edf_piso_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE edificio_piso_id_edf_piso_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- TOC entry 2668 (class 1259 OID 17942)
-- Dependencies: 3018 6
-- Name: edificio_piso; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE edificio_piso (
    id_edf_piso integer DEFAULT nextval('edificio_piso_id_edf_piso_seq'::regclass) NOT NULL,
    nom_piso character varying(20) NOT NULL,
    id_edificio integer NOT NULL,
    plano text
);


--
-- TOC entry 2669 (class 1259 OID 17949)
-- Dependencies: 6
-- Name: funcionario; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE funcionario (
    id_funcionario integer NOT NULL,
    nom_funcionario character varying(255),
    cargo integer,
    edf_espacio integer
);


--
-- TOC entry 2670 (class 1259 OID 17952)
-- Dependencies: 6
-- Name: sede_info; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE sede_info (
    id_sede integer NOT NULL,
    nom_sede text NOT NULL
);


--
-- TOC entry 2671 (class 1259 OID 17958)
-- Dependencies: 6
-- Name: tipo_cargo; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE tipo_cargo (
    id_tipocargo integer NOT NULL,
    nom_tipocargo character varying(255)
);


--
-- TOC entry 2672 (class 1259 OID 17961)
-- Dependencies: 6
-- Name: tipo_espacio; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE tipo_espacio (
    id_tipo_espacio integer NOT NULL,
    nom_tipo_espacio character varying(255)
);


--
-- TOC entry 2673 (class 1259 OID 17964)
-- Dependencies: 2790 6
-- Name: edf_cargo; Type: VIEW; Schema: public; Owner: -
--

CREATE VIEW edf_cargo AS
    SELECT cargo_funcionario.nom_cargo, funcionario.nom_funcionario, tipo_cargo.nom_tipocargo, funcionario.id_funcionario, cargo_funcionario.id_cargo, tipo_cargo.id_tipocargo, edificio_espacio.id_edf_espacio, edificio_espacio.nom_espacio, edificio_piso.id_edf_piso, edificio_piso.nom_piso, edificio_info.id_edificio, edificio_info.nom_edificio, tipo_espacio.id_tipo_espacio, tipo_espacio.nom_tipo_espacio, sede_info.id_sede, sede_info.nom_sede FROM (((((((funcionario JOIN cargo_funcionario ON ((funcionario.cargo = cargo_funcionario.id_cargo))) JOIN tipo_cargo ON ((cargo_funcionario.tipo_cargo = tipo_cargo.id_tipocargo))) JOIN edificio_espacio ON ((funcionario.edf_espacio = edificio_espacio.id_edf_espacio))) JOIN edificio_piso ON ((edificio_espacio.id_piso = edificio_piso.id_edf_piso))) JOIN edificio_info ON ((edificio_piso.id_edificio = edificio_info.id_edificio))) JOIN tipo_espacio ON ((edificio_espacio.tipo_espacio = tipo_espacio.id_tipo_espacio))) JOIN sede_info ON ((edificio_info.sede = sede_info.id_sede)));


--
-- TOC entry 2674 (class 1259 OID 17969)
-- Dependencies: 3023 3024 1202 6
-- Name: edificio; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE edificio (
    gid integer NOT NULL,
    the_geom geometry,
    id_edifici integer,
    CONSTRAINT enforce_dims_the_geom CHECK ((ndims(the_geom) = 2)),
    CONSTRAINT enforce_srid_the_geom CHECK ((srid(the_geom) = 3116))
);


--
-- TOC entry 2675 (class 1259 OID 17977)
-- Dependencies: 2791 1202 6
-- Name: edf_cent; Type: VIEW; Schema: public; Owner: -
--

CREATE VIEW edf_cent AS
    SELECT e.id_edifici, ei.nom_edificio, centroid(e.the_geom) AS centroid FROM edificio e, edificio_info ei WHERE (e.id_edifici = ei.id_edificio);


--
-- TOC entry 2676 (class 1259 OID 17981)
-- Dependencies: 6
-- Name: edf_equivalente; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE edf_equivalente (
    id_edificio_miu integer NOT NULL,
    id_edf_universitas character varying(8) NOT NULL
);


--
-- TOC entry 2677 (class 1259 OID 17984)
-- Dependencies: 2792 6
-- Name: edf_localiza; Type: VIEW; Schema: public; Owner: -
--

CREATE VIEW edf_localiza AS
    SELECT edf_cent.id_edifici, edf_cent.nom_edificio, x(transform(edf_cent.centroid, 4326)) AS x, y(transform(edf_cent.centroid, 4326)) AS y FROM edf_cent;


--
-- TOC entry 2678 (class 1259 OID 17988)
-- Dependencies: 2793 1202 6
-- Name: edf_nom; Type: VIEW; Schema: public; Owner: -
--

CREATE VIEW edf_nom AS
    SELECT e.gid, e.the_geom, ei.id_edificio, ei.nom_edificio, ei.uso FROM edificio e, edificio_info ei WHERE (e.id_edifici = ei.id_edificio);


--
-- TOC entry 2679 (class 1259 OID 17992)
-- Dependencies: 6 2674
-- Name: edificio1_gid_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE edificio1_gid_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- TOC entry 3385 (class 0 OID 0)
-- Dependencies: 2679
-- Name: edificio1_gid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE edificio1_gid_seq OWNED BY edificio.gid;


--
-- TOC entry 2680 (class 1259 OID 17994)
-- Dependencies: 2665 6
-- Name: edificio_espacio_id_edf_espacio_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE edificio_espacio_id_edf_espacio_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- TOC entry 3386 (class 0 OID 0)
-- Dependencies: 2680
-- Name: edificio_espacio_id_edf_espacio_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE edificio_espacio_id_edf_espacio_seq OWNED BY edificio_espacio.tipo_espacio;


--
-- TOC entry 2681 (class 1259 OID 17996)
-- Dependencies: 6 2674
-- Name: edificio_gid1_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE edificio_gid1_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- TOC entry 3387 (class 0 OID 0)
-- Dependencies: 2681
-- Name: edificio_gid1_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE edificio_gid1_seq OWNED BY edificio.gid;


--
-- TOC entry 2682 (class 1259 OID 17998)
-- Dependencies: 6
-- Name: edificio_info_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE edificio_info_seq
    INCREMENT BY 1
    MAXVALUE 199999
    MINVALUE 100100
    CACHE 1;


--
-- TOC entry 2683 (class 1259 OID 18000)
-- Dependencies: 6
-- Name: edificio_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE edificio_seq
    INCREMENT BY 1
    MAXVALUE 199999
    MINVALUE 100100
    CACHE 1;


--
-- TOC entry 2684 (class 1259 OID 18002)
-- Dependencies: 6
-- Name: edificiouso_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE edificiouso_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- TOC entry 2685 (class 1259 OID 18004)
-- Dependencies: 2794 6
-- Name: espacios; Type: VIEW; Schema: public; Owner: -
--

CREATE VIEW espacios AS
    SELECT edificio_info.id_edificio, edificio_info.nom_edificio, edificio_piso.id_edf_piso, edificio_piso.nom_piso, edificio_espacio.id_edf_espacio, edificio_espacio.nom_espacio, sede_info.id_sede, sede_info.nom_sede, tipo_espacio.nom_tipo_espacio FROM ((((edificio_info JOIN edificio_piso ON ((edificio_info.id_edificio = edificio_piso.id_edificio))) JOIN edificio_espacio ON ((edificio_piso.id_edf_piso = edificio_espacio.id_piso))) JOIN sede_info ON ((edificio_info.sede = sede_info.id_sede))) JOIN tipo_espacio ON ((edificio_espacio.tipo_espacio = tipo_espacio.id_tipo_espacio)));


--
-- TOC entry 2686 (class 1259 OID 18009)
-- Dependencies: 6 2669
-- Name: funcionario_id_funcionario_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE funcionario_id_funcionario_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- TOC entry 3388 (class 0 OID 0)
-- Dependencies: 2686
-- Name: funcionario_id_funcionario_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE funcionario_id_funcionario_seq OWNED BY funcionario.id_funcionario;


SET default_with_oids = true;

--
-- TOC entry 2654 (class 1259 OID 17394)
-- Dependencies: 6
-- Name: geometry_columns; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE geometry_columns (
    f_table_catalog character varying(256) NOT NULL,
    f_table_schema character varying(256) NOT NULL,
    f_table_name character varying(256) NOT NULL,
    f_geometry_column character varying(256) NOT NULL,
    coord_dimension integer NOT NULL,
    srid integer NOT NULL,
    type character varying(30) NOT NULL
);


SET default_with_oids = false;

--
-- TOC entry 2687 (class 1259 OID 18011)
-- Dependencies: 6
-- Name: horario; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE horario (
    id_docente numeric NOT NULL,
    id_edificio integer NOT NULL,
    salon text NOT NULL,
    dia integer NOT NULL,
    hora_ini time without time zone NOT NULL,
    hora_fin time without time zone NOT NULL,
    id_horario integer NOT NULL
);


--
-- TOC entry 2688 (class 1259 OID 18017)
-- Dependencies: 6 2687
-- Name: horario_id_horario_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE horario_id_horario_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- TOC entry 3389 (class 0 OID 0)
-- Dependencies: 2688
-- Name: horario_id_horario_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE horario_id_horario_seq OWNED BY horario.id_horario;


--
-- TOC entry 2689 (class 1259 OID 18019)
-- Dependencies: 2795 6
-- Name: listnom; Type: VIEW; Schema: public; Owner: -
--

CREATE VIEW listnom AS
    (SELECT ei.id_edificio AS ide, ei.nom_edificio AS nombre, 0 AS tipo FROM edificio_info ei UNION SELECT ee.id_edf_espacio AS ide, ee.nom_espacio AS nombre, 1 AS tipo FROM edificio_espacio ee) UNION SELECT ep.id_edf_piso AS ide, ep.nom_piso AS nombre, 2 AS tipo FROM edificio_piso ep ORDER BY 2;


--
-- TOC entry 2690 (class 1259 OID 18023)
-- Dependencies: 3027 3028 3029 6 1202
-- Name: sede; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE sede (
    gid integer NOT NULL,
    id_sede integer,
    the_geom geometry,
    CONSTRAINT enforce_dims_the_geom CHECK ((ndims(the_geom) = 2)),
    CONSTRAINT enforce_geotype_the_geom CHECK (((geometrytype(the_geom) = 'POINT'::text) OR (the_geom IS NULL))),
    CONSTRAINT enforce_srid_the_geom CHECK ((srid(the_geom) = 3116))
);


--
-- TOC entry 2691 (class 1259 OID 18032)
-- Dependencies: 6 2690
-- Name: sede_gid_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE sede_gid_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- TOC entry 3390 (class 0 OID 0)
-- Dependencies: 2691
-- Name: sede_gid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE sede_gid_seq OWNED BY sede.gid;


--
-- TOC entry 2692 (class 1259 OID 18034)
-- Dependencies: 2796 6
-- Name: sede_localiza; Type: VIEW; Schema: public; Owner: -
--

CREATE VIEW sede_localiza AS
    SELECT s.id_sede, si.nom_sede, x(transform(s.the_geom, 4326)) AS x, y(transform(s.the_geom, 4326)) AS y FROM sede s, sede_info si WHERE (s.id_sede = si.id_sede);


--
-- TOC entry 2693 (class 1259 OID 18038)
-- Dependencies: 2797 1202 6
-- Name: sede_nom; Type: VIEW; Schema: public; Owner: -
--

CREATE VIEW sede_nom AS
    SELECT s.id_sede, si.nom_sede, s.the_geom FROM sede s, sede_info si WHERE (s.id_sede = si.id_sede);


--
-- TOC entry 2694 (class 1259 OID 18042)
-- Dependencies: 6
-- Name: sede_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE sede_seq
    INCREMENT BY 20
    MAXVALUE 200900
    MINVALUE 200100
    CACHE 20;


--
-- TOC entry 2695 (class 1259 OID 18044)
-- Dependencies: 3031 3032 3033 1202 6
-- Name: sitio; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE sitio (
    gid integer NOT NULL,
    tipo_sitio integer,
    the_geom geometry,
    CONSTRAINT enforce_dims_the_geom CHECK ((ndims(the_geom) = 2)),
    CONSTRAINT enforce_geotype_the_geom CHECK (((geometrytype(the_geom) = 'POINT'::text) OR (the_geom IS NULL))),
    CONSTRAINT enforce_srid_the_geom CHECK ((srid(the_geom) = 3116))
);


--
-- TOC entry 2696 (class 1259 OID 18053)
-- Dependencies: 6 2695
-- Name: sitio_gid_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE sitio_gid_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- TOC entry 3391 (class 0 OID 0)
-- Dependencies: 2696
-- Name: sitio_gid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE sitio_gid_seq OWNED BY sitio.gid;


--
-- TOC entry 2653 (class 1259 OID 17386)
-- Dependencies: 6
-- Name: spatial_ref_sys; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE spatial_ref_sys (
    srid integer NOT NULL,
    auth_name character varying(256),
    auth_srid integer,
    srtext character varying(2048),
    proj4text character varying(2048)
);


--
-- TOC entry 2697 (class 1259 OID 18055)
-- Dependencies: 2671 6
-- Name: tipo_cargo_id_tipocargo_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE tipo_cargo_id_tipocargo_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- TOC entry 3392 (class 0 OID 0)
-- Dependencies: 2697
-- Name: tipo_cargo_id_tipocargo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE tipo_cargo_id_tipocargo_seq OWNED BY tipo_cargo.id_tipocargo;


--
-- TOC entry 2698 (class 1259 OID 18057)
-- Dependencies: 6
-- Name: tipoelemento_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE tipoelemento_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- TOC entry 2699 (class 1259 OID 18059)
-- Dependencies: 3034 6
-- Name: tipo_elemento; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE tipo_elemento (
    id_tipo_elemento integer DEFAULT nextval('tipoelemento_seq'::regclass) NOT NULL,
    nom_tipo_elemento text NOT NULL
);


--
-- TOC entry 2700 (class 1259 OID 18066)
-- Dependencies: 2672 6
-- Name: tipo_espacio_id_tipo_espacio_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE tipo_espacio_id_tipo_espacio_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- TOC entry 3393 (class 0 OID 0)
-- Dependencies: 2700
-- Name: tipo_espacio_id_tipo_espacio_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE tipo_espacio_id_tipo_espacio_seq OWNED BY tipo_espacio.id_tipo_espacio;


--
-- TOC entry 2701 (class 1259 OID 18068)
-- Dependencies: 6
-- Name: tipo_sitio; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE tipo_sitio (
    id_tipo_sitio integer NOT NULL,
    nom_tipo_sitio text NOT NULL
);


--
-- TOC entry 2702 (class 1259 OID 18074)
-- Dependencies: 6 2701
-- Name: tipo_sitio_id_tipo_sitio_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE tipo_sitio_id_tipo_sitio_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- TOC entry 3394 (class 0 OID 0)
-- Dependencies: 2702
-- Name: tipo_sitio_id_tipo_sitio_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE tipo_sitio_id_tipo_sitio_seq OWNED BY tipo_sitio.id_tipo_sitio;


--
-- TOC entry 2703 (class 1259 OID 18076)
-- Dependencies: 6
-- Name: tipo_uso; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE tipo_uso (
    nom_tipo_uso text NOT NULL,
    id_tipo_uso integer NOT NULL
);


--
-- TOC entry 2704 (class 1259 OID 18082)
-- Dependencies: 6 2703
-- Name: tipo_uso_id_tipo_uso_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE tipo_uso_id_tipo_uso_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- TOC entry 3395 (class 0 OID 0)
-- Dependencies: 2704
-- Name: tipo_uso_id_tipo_uso_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE tipo_uso_id_tipo_uso_seq OWNED BY tipo_uso.id_tipo_uso;


--
-- TOC entry 2705 (class 1259 OID 18084)
-- Dependencies: 6
-- Name: tipozona_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE tipozona_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- TOC entry 2706 (class 1259 OID 18086)
-- Dependencies: 3037 6
-- Name: tipo_zona; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE tipo_zona (
    id_tipo_zona integer DEFAULT nextval('tipozona_seq'::regclass) NOT NULL,
    nom_tipo_zona text NOT NULL
);


--
-- TOC entry 2707 (class 1259 OID 18093)
-- Dependencies: 6
-- Name: tipoespacio_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE tipoespacio_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- TOC entry 2708 (class 1259 OID 18095)
-- Dependencies: 6
-- Name: tipouso_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE tipouso_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- TOC entry 2709 (class 1259 OID 18097)
-- Dependencies: 3039 3040 3041 6 1202
-- Name: zona; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE zona (
    gid integer NOT NULL,
    id_zona integer,
    the_geom geometry,
    CONSTRAINT enforce_dims_the_geom CHECK ((ndims(the_geom) = 2)),
    CONSTRAINT enforce_geotype_the_geom CHECK (((geometrytype(the_geom) = 'MULTIPOLYGON'::text) OR (the_geom IS NULL))),
    CONSTRAINT enforce_srid_the_geom CHECK ((srid(the_geom) = 3116))
);


--
-- TOC entry 2710 (class 1259 OID 18106)
-- Dependencies: 6
-- Name: zona_info; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE zona_info (
    id_zona integer NOT NULL,
    nom_zona character varying(255),
    sede_zona integer,
    tipo integer
);


--
-- TOC entry 2711 (class 1259 OID 18109)
-- Dependencies: 2798 1202 6
-- Name: zona_cent; Type: VIEW; Schema: public; Owner: -
--

CREATE VIEW zona_cent AS
    SELECT z.id_zona, zi.nom_zona, centroid(z.the_geom) AS centroid FROM zona z, zona_info zi WHERE (z.id_zona = zi.id_zona);


--
-- TOC entry 2712 (class 1259 OID 18113)
-- Dependencies: 2709 6
-- Name: zona_gid_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE zona_gid_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- TOC entry 3396 (class 0 OID 0)
-- Dependencies: 2712
-- Name: zona_gid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE zona_gid_seq OWNED BY zona.gid;


--
-- TOC entry 2713 (class 1259 OID 18115)
-- Dependencies: 2799 6
-- Name: zona_localiza; Type: VIEW; Schema: public; Owner: -
--

CREATE VIEW zona_localiza AS
    SELECT zc.id_zona, zc.nom_zona, x(transform(zc.centroid, 4326)) AS x, y(transform(zc.centroid, 4326)) AS y FROM zona_cent zc;


--
-- TOC entry 2714 (class 1259 OID 18119)
-- Dependencies: 2800 6 1202
-- Name: zona_nom; Type: VIEW; Schema: public; Owner: -
--

CREATE VIEW zona_nom AS
    SELECT z.id_zona, zi.nom_zona, zi.tipo, z.the_geom FROM zona z, zona_info zi WHERE (z.id_zona = zi.id_zona);


--
-- TOC entry 3008 (class 2604 OID 18124)
-- Dependencies: 2656 2655
-- Name: ID; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE "Log" ALTER COLUMN "ID" SET DEFAULT nextval('"Log_ID_seq"'::regclass);


--
-- TOC entry 3009 (class 2604 OID 18125)
-- Dependencies: 2658 2657
-- Name: id_cargo; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE cargo_funcionario ALTER COLUMN id_cargo SET DEFAULT nextval('cargo_funcionario_id_cargo_seq'::regclass);


--
-- TOC entry 3011 (class 2604 OID 18126)
-- Dependencies: 2662 2661
-- Name: gid; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE corredores ALTER COLUMN gid SET DEFAULT nextval('corredores_gid_seq'::regclass);


--
-- TOC entry 3022 (class 2604 OID 18127)
-- Dependencies: 2681 2674
-- Name: gid; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE edificio ALTER COLUMN gid SET DEFAULT nextval('edificio_gid1_seq'::regclass);


--
-- TOC entry 3016 (class 2604 OID 18128)
-- Dependencies: 2680 2665
-- Name: id_edf_espacio; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE edificio_espacio ALTER COLUMN id_edf_espacio SET DEFAULT nextval('edificio_espacio_id_edf_espacio_seq'::regclass);


--
-- TOC entry 3019 (class 2604 OID 18129)
-- Dependencies: 2686 2669
-- Name: id_funcionario; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE funcionario ALTER COLUMN id_funcionario SET DEFAULT nextval('funcionario_id_funcionario_seq'::regclass);


--
-- TOC entry 3025 (class 2604 OID 18130)
-- Dependencies: 2688 2687
-- Name: id_horario; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE horario ALTER COLUMN id_horario SET DEFAULT nextval('horario_id_horario_seq'::regclass);


--
-- TOC entry 3026 (class 2604 OID 18131)
-- Dependencies: 2691 2690
-- Name: gid; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE sede ALTER COLUMN gid SET DEFAULT nextval('sede_gid_seq'::regclass);


--
-- TOC entry 3030 (class 2604 OID 18132)
-- Dependencies: 2696 2695
-- Name: gid; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE sitio ALTER COLUMN gid SET DEFAULT nextval('sitio_gid_seq'::regclass);


--
-- TOC entry 3020 (class 2604 OID 18133)
-- Dependencies: 2697 2671
-- Name: id_tipocargo; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE tipo_cargo ALTER COLUMN id_tipocargo SET DEFAULT nextval('tipo_cargo_id_tipocargo_seq'::regclass);


--
-- TOC entry 3021 (class 2604 OID 18134)
-- Dependencies: 2700 2672
-- Name: id_tipo_espacio; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE tipo_espacio ALTER COLUMN id_tipo_espacio SET DEFAULT nextval('tipo_espacio_id_tipo_espacio_seq'::regclass);


--
-- TOC entry 3035 (class 2604 OID 18135)
-- Dependencies: 2702 2701
-- Name: id_tipo_sitio; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE tipo_sitio ALTER COLUMN id_tipo_sitio SET DEFAULT nextval('tipo_sitio_id_tipo_sitio_seq'::regclass);


--
-- TOC entry 3036 (class 2604 OID 18136)
-- Dependencies: 2704 2703
-- Name: id_tipo_uso; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE tipo_uso ALTER COLUMN id_tipo_uso SET DEFAULT nextval('tipo_uso_id_tipo_uso_seq'::regclass);


--
-- TOC entry 3038 (class 2604 OID 18137)
-- Dependencies: 2712 2709
-- Name: gid; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE zona ALTER COLUMN gid SET DEFAULT nextval('zona_gid_seq'::regclass);


--
-- TOC entry 3047 (class 2606 OID 18189)
-- Dependencies: 2655 2655
-- Name: Log_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY "Log"
    ADD CONSTRAINT "Log_pkey" PRIMARY KEY ("ID");


--
-- TOC entry 3051 (class 2606 OID 18191)
-- Dependencies: 2660 2660
-- Name: ciudad_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY ciudad
    ADD CONSTRAINT ciudad_pkey PRIMARY KEY (id_ciudad);


--
-- TOC entry 3053 (class 2606 OID 18193)
-- Dependencies: 2661 2661
-- Name: corredores_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY corredores
    ADD CONSTRAINT corredores_pkey PRIMARY KEY (gid);


--
-- TOC entry 3055 (class 2606 OID 18195)
-- Dependencies: 2664 2664
-- Name: departamento_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY departamento
    ADD CONSTRAINT departamento_pkey PRIMARY KEY (id_dept);


--
-- TOC entry 3076 (class 2606 OID 18197)
-- Dependencies: 2674 2674
-- Name: edificio1_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY edificio
    ADD CONSTRAINT edificio1_pkey PRIMARY KEY (gid);


--
-- TOC entry 3062 (class 2606 OID 18199)
-- Dependencies: 2668 2668
-- Name: edificio_piso_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY edificio_piso
    ADD CONSTRAINT edificio_piso_pkey PRIMARY KEY (id_edf_piso);


--
-- TOC entry 3066 (class 2606 OID 18201)
-- Dependencies: 2669 2669
-- Name: funcionario_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY funcionario
    ADD CONSTRAINT funcionario_pkey PRIMARY KEY (id_funcionario);


--
-- TOC entry 3045 (class 2606 OID 17401)
-- Dependencies: 2654 2654 2654 2654 2654
-- Name: geometry_columns_pk; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY geometry_columns
    ADD CONSTRAINT geometry_columns_pk PRIMARY KEY (f_table_catalog, f_table_schema, f_table_name, f_geometry_column);


--
-- TOC entry 3058 (class 2606 OID 18203)
-- Dependencies: 2665 2665
-- Name: pk_edf_espacio; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY edificio_espacio
    ADD CONSTRAINT pk_edf_espacio PRIMARY KEY (id_edf_espacio);


--
-- TOC entry 3060 (class 2606 OID 18205)
-- Dependencies: 2666 2666
-- Name: pk_edificio_info; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY edificio_info
    ADD CONSTRAINT pk_edificio_info PRIMARY KEY (id_edificio);


--
-- TOC entry 3080 (class 2606 OID 18207)
-- Dependencies: 2676 2676
-- Name: pk_equi; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY edf_equivalente
    ADD CONSTRAINT pk_equi PRIMARY KEY (id_edificio_miu);


--
-- TOC entry 3082 (class 2606 OID 18209)
-- Dependencies: 2687 2687
-- Name: pk_horario; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY horario
    ADD CONSTRAINT pk_horario PRIMARY KEY (id_horario);


--
-- TOC entry 3092 (class 2606 OID 18211)
-- Dependencies: 2701 2701
-- Name: pk_id_tipositio; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY tipo_sitio
    ADD CONSTRAINT pk_id_tipositio PRIMARY KEY (id_tipo_sitio);


--
-- TOC entry 3049 (class 2606 OID 18213)
-- Dependencies: 2657 2657
-- Name: pk_idcargo; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY cargo_funcionario
    ADD CONSTRAINT pk_idcargo PRIMARY KEY (id_cargo);


--
-- TOC entry 3070 (class 2606 OID 18215)
-- Dependencies: 2670 2670
-- Name: pk_idsede; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY sede_info
    ADD CONSTRAINT pk_idsede PRIMARY KEY (id_sede);


--
-- TOC entry 3090 (class 2606 OID 18217)
-- Dependencies: 2699 2699
-- Name: pk_tipo_elemento; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY tipo_elemento
    ADD CONSTRAINT pk_tipo_elemento PRIMARY KEY (id_tipo_elemento);


--
-- TOC entry 3094 (class 2606 OID 18219)
-- Dependencies: 2703 2703
-- Name: pk_tipo_uso; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY tipo_uso
    ADD CONSTRAINT pk_tipo_uso PRIMARY KEY (id_tipo_uso);


--
-- TOC entry 3096 (class 2606 OID 18221)
-- Dependencies: 2706 2706
-- Name: pk_tipo_zona; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY tipo_zona
    ADD CONSTRAINT pk_tipo_zona PRIMARY KEY (id_tipo_zona);


--
-- TOC entry 3084 (class 2606 OID 18223)
-- Dependencies: 2690 2690
-- Name: sede_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY sede
    ADD CONSTRAINT sede_pkey PRIMARY KEY (gid);


--
-- TOC entry 3088 (class 2606 OID 18225)
-- Dependencies: 2695 2695
-- Name: sitio_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY sitio
    ADD CONSTRAINT sitio_pkey PRIMARY KEY (gid);


--
-- TOC entry 3043 (class 2606 OID 17393)
-- Dependencies: 2653 2653
-- Name: spatial_ref_sys_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY spatial_ref_sys
    ADD CONSTRAINT spatial_ref_sys_pkey PRIMARY KEY (srid);


--
-- TOC entry 3072 (class 2606 OID 18227)
-- Dependencies: 2671 2671
-- Name: tipo_cargo_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY tipo_cargo
    ADD CONSTRAINT tipo_cargo_pkey PRIMARY KEY (id_tipocargo);


--
-- TOC entry 3074 (class 2606 OID 18229)
-- Dependencies: 2672 2672
-- Name: tipo_espacio_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY tipo_espacio
    ADD CONSTRAINT tipo_espacio_pkey PRIMARY KEY (id_tipo_espacio);


--
-- TOC entry 3068 (class 2606 OID 18231)
-- Dependencies: 2669 2669
-- Name: uk_cargo; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY funcionario
    ADD CONSTRAINT uk_cargo UNIQUE (cargo);


--
-- TOC entry 3078 (class 2606 OID 18233)
-- Dependencies: 2674 2674
-- Name: uk_idedf; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY edificio
    ADD CONSTRAINT uk_idedf UNIQUE (id_edifici);


--
-- TOC entry 3086 (class 2606 OID 18235)
-- Dependencies: 2690 2690
-- Name: uk_idsede; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY sede
    ADD CONSTRAINT uk_idsede UNIQUE (id_sede);


--
-- TOC entry 3098 (class 2606 OID 18237)
-- Dependencies: 2709 2709
-- Name: uk_idzona; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY zona
    ADD CONSTRAINT uk_idzona UNIQUE (id_zona);


--
-- TOC entry 3102 (class 2606 OID 18239)
-- Dependencies: 2710 2710
-- Name: zona_info_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY zona_info
    ADD CONSTRAINT zona_info_pkey PRIMARY KEY (id_zona);


--
-- TOC entry 3100 (class 2606 OID 18241)
-- Dependencies: 2709 2709
-- Name: zona_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY zona
    ADD CONSTRAINT zona_pkey PRIMARY KEY (gid);


--
-- TOC entry 3056 (class 1259 OID 18242)
-- Dependencies: 2665
-- Name: fki_edificio_espacio_id_piso; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX fki_edificio_espacio_id_piso ON edificio_espacio USING btree (id_piso);


--
-- TOC entry 3064 (class 1259 OID 18243)
-- Dependencies: 2669
-- Name: fki_funcionario_edf_espacio; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX fki_funcionario_edf_espacio ON funcionario USING btree (edf_espacio);


--
-- TOC entry 3063 (class 1259 OID 18244)
-- Dependencies: 2668
-- Name: fki_piso_edf; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX fki_piso_edf ON edificio_piso USING btree (id_edificio);


--
-- TOC entry 3104 (class 2606 OID 18245)
-- Dependencies: 2664 3054 2660
-- Name: fk_ciudad_id_dept; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ciudad
    ADD CONSTRAINT fk_ciudad_id_dept FOREIGN KEY (id_dept) REFERENCES departamento(id_dept);


--
-- TOC entry 3115 (class 2606 OID 18250)
-- Dependencies: 2676 3059 2666
-- Name: fk_edf_info; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY edf_equivalente
    ADD CONSTRAINT fk_edf_info FOREIGN KEY (id_edificio_miu) REFERENCES edificio_info(id_edificio);


--
-- TOC entry 3107 (class 2606 OID 18255)
-- Dependencies: 2666 2703 3093
-- Name: fk_edf_uso; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY edificio_info
    ADD CONSTRAINT fk_edf_uso FOREIGN KEY (uso) REFERENCES tipo_uso(id_tipo_uso) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- TOC entry 3105 (class 2606 OID 18260)
-- Dependencies: 3073 2672 2665
-- Name: fk_edfesp_tipo_esp; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY edificio_espacio
    ADD CONSTRAINT fk_edfesp_tipo_esp FOREIGN KEY (tipo_espacio) REFERENCES tipo_espacio(id_tipo_espacio);


--
-- TOC entry 3108 (class 2606 OID 18265)
-- Dependencies: 3077 2666 2674
-- Name: fk_edfinf_edf; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY edificio_info
    ADD CONSTRAINT fk_edfinf_edf FOREIGN KEY (id_edificio) REFERENCES edificio(id_edifici);


--
-- TOC entry 3109 (class 2606 OID 18270)
-- Dependencies: 3069 2666 2670
-- Name: fk_edfinfo_sede; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY edificio_info
    ADD CONSTRAINT fk_edfinfo_sede FOREIGN KEY (sede) REFERENCES sede_info(id_sede);


--
-- TOC entry 3106 (class 2606 OID 18275)
-- Dependencies: 3061 2665 2668
-- Name: fk_edificio_espacio_id_piso; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY edificio_espacio
    ADD CONSTRAINT fk_edificio_espacio_id_piso FOREIGN KEY (id_piso) REFERENCES edificio_piso(id_edf_piso) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3110 (class 2606 OID 18280)
-- Dependencies: 2666 3050 2660
-- Name: fk_edificio_info_ciudad; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY edificio_info
    ADD CONSTRAINT fk_edificio_info_ciudad FOREIGN KEY (ciudad) REFERENCES ciudad(id_ciudad);


--
-- TOC entry 3112 (class 2606 OID 18285)
-- Dependencies: 2657 3048 2669
-- Name: fk_funcionario_cargo; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funcionario
    ADD CONSTRAINT fk_funcionario_cargo FOREIGN KEY (cargo) REFERENCES cargo_funcionario(id_cargo);


--
-- TOC entry 3113 (class 2606 OID 18290)
-- Dependencies: 2669 3057 2665
-- Name: fk_funcionario_edf_espacio; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funcionario
    ADD CONSTRAINT fk_funcionario_edf_espacio FOREIGN KEY (edf_espacio) REFERENCES edificio_espacio(id_edf_espacio) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3111 (class 2606 OID 18295)
-- Dependencies: 2668 2666 3059
-- Name: fk_piso_edf; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY edificio_piso
    ADD CONSTRAINT fk_piso_edf FOREIGN KEY (id_edificio) REFERENCES edificio_info(id_edificio) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3114 (class 2606 OID 18300)
-- Dependencies: 2670 2690 3085
-- Name: fk_sede_info; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sede_info
    ADD CONSTRAINT fk_sede_info FOREIGN KEY (id_sede) REFERENCES sede(id_sede);


--
-- TOC entry 3103 (class 2606 OID 18305)
-- Dependencies: 3071 2671 2657
-- Name: fk_tipo_cargo; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY cargo_funcionario
    ADD CONSTRAINT fk_tipo_cargo FOREIGN KEY (tipo_cargo) REFERENCES tipo_cargo(id_tipocargo);


--
-- TOC entry 3116 (class 2606 OID 18310)
-- Dependencies: 2701 2695 3091
-- Name: fk_tipositio; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sitio
    ADD CONSTRAINT fk_tipositio FOREIGN KEY (tipo_sitio) REFERENCES tipo_sitio(id_tipo_sitio);


--
-- TOC entry 3117 (class 2606 OID 18315)
-- Dependencies: 2706 3095 2710
-- Name: fk_tipozona; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zona_info
    ADD CONSTRAINT fk_tipozona FOREIGN KEY (tipo) REFERENCES tipo_zona(id_tipo_zona) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- TOC entry 3118 (class 2606 OID 18320)
-- Dependencies: 2709 2710 3097
-- Name: fk_zona; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zona_info
    ADD CONSTRAINT fk_zona FOREIGN KEY (id_zona) REFERENCES zona(id_zona) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3119 (class 2606 OID 18325)
-- Dependencies: 2710 2670 3069
-- Name: fk_zona_info_sede_zona; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zona_info
    ADD CONSTRAINT fk_zona_info_sede_zona FOREIGN KEY (sede_zona) REFERENCES sede_info(id_sede);


--
-- TOC entry 3124 (class 0 OID 0)
-- Dependencies: 6
-- Name: public; Type: ACL; Schema: -; Owner: -
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2010-05-06 18:49:07

--
-- PostgreSQL database dump complete
--

