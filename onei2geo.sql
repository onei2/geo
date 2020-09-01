/*
*   BSD 3-Clause License
*   Copyright (c) 2020, Ivan Ivanovic
*   All rights reserved.
*
*   MySQL stored function implementation.
*/

DELIMITER $$

CREATE FUNCTION EquirectangularApproximation (lat1 DOUBLE, lng1 DOUBLE, lat2 DOUBLE, lng2 DOUBLE) RETURNS DOUBLE
BEGIN
DECLARE lat1rad DOUBLE;
DECLARE lng1rad DOUBLE;
DECLARE lat2rad DOUBLE;
DECLARE lng2rad DOUBLE;
SET lat1rad = RADIANS(lat1);
SET lng1rad = RADIANS(lng1);
SET lat2rad = RADIANS(lat2);
SET lng2rad = RADIANS(lng2);
RETURN ROUND(6378137 * SQRT(POW(lat2rad - lat1rad, 2) + POW((lng2rad - lng1rad) * COS((lat1rad + lat2rad) / 2), 2)));
END $$

CREATE FUNCTION SphericalLawOfCosines (lat1 DOUBLE, lng1 DOUBLE, lat2 DOUBLE, lng2 DOUBLE) RETURNS DOUBLE
BEGIN
DECLARE d DOUBLE;
DECLARE lat1rad DOUBLE;
DECLARE lng1rad DOUBLE;
DECLARE lat2rad DOUBLE;
DECLARE lng2rad DOUBLE;
SET lat1rad = RADIANS(lat1);
SET lng1rad = RADIANS(lng1);
SET lat2rad = RADIANS(lat2);
SET lng2rad = RADIANS(lng2);
SET d = 6378137 * ACOS(SIN(lat1rad) * SIN(lat2rad) + COS(lat1rad) * COS(lat2rad) * COS(lng2rad - lng1rad));
RETURN ROUND(d);
END $$

CREATE FUNCTION Haversine (lat1 DOUBLE, lng1 DOUBLE, lat2 DOUBLE, lng2 DOUBLE) RETURNS DOUBLE
BEGIN
DECLARE x DOUBLE;
DECLARE y DOUBLE;
DECLARE a DOUBLE;
DECLARE c DOUBLE;
DECLARE d DOUBLE;
DECLARE lat1rad DOUBLE;
DECLARE lng1rad DOUBLE;
DECLARE lat2rad DOUBLE;
DECLARE lng2rad DOUBLE;
DECLARE deltaLatRad DOUBLE;
DECLARE deltaLngRad DOUBLE;
SET lat1rad = RADIANS(lat1);
SET lng1rad = RADIANS(lng1);
SET lat2rad = RADIANS(lat2);
SET lng2rad = RADIANS(lng2);
SET deltaLatRad = lat2rad - lat1rad;
SET deltaLngRad = lng2rad - lng1rad;
SET x = SIN(deltaLatRad / 2);
SET y = SIN(deltaLngRad / 2);
SET a = x * x + COS(lat1rad) * COS(lat2rad) * y * y;
SET c = 2 * ATAN2(SQRT(a), SQRT(1 - a));
SET d = 6378137 * c;
RETURN ROUND(d);
END $$

CREATE FUNCTION PolarCoordinateFlatEarthFormula (lat1 DOUBLE, lng1 DOUBLE, lat2 DOUBLE, lng2 DOUBLE) RETURNS DOUBLE
BEGIN
DECLARE colat1rad DOUBLE;
DECLARE colat2rad DOUBLE;
SET colat1rad = RADIANS(90 - lat1);
SET colat2rad = RADIANS(90 - lat2);
RETURN ROUND(6378137 * SQRT(colat1rad * colat1rad + colat2rad * colat2rad - 2 * colat1rad * colat2rad * COS(RADIANS(lng2 - lng1))));
END $$

CREATE FUNCTION EllipsoidalEarthProjectedToPlane (lat1 DOUBLE, lng1 DOUBLE, lat2 DOUBLE, lng2 DOUBLE) RETURNS DOUBLE
BEGIN
DECLARE latAvgRad DOUBLE;
DECLARE K1 DOUBLE;
DECLARE K2 DOUBLE;
SET latAvgRad = RADIANS((lat1 + lat2) / 2);
SET K1 = 111.13209 - 0.56605 * COS(2 * latAvgRad) + 0.00120 * COS(4 * latAvgRad);
SET K2 = 111.41513 * COS(latAvgRad) - 0.09455 * COS(3 * latAvgRad) + 0.00012 * COS(5 * latAvgRad);
RETURN ROUND(SQRT(POW(K1 * (lat2 - lat1), 2) + POW(K2 * (lng2 - lng1), 2)) * 1000);
END $$

DELIMITER ;
