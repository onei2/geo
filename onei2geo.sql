DELIMITER $$

CREATE FUNCTION EquirectangularApproximation (lat1 DOUBLE, lng1 DOUBLE, lat2 DOUBLE, lng2 DOUBLE) RETURNS DOUBLE
BEGIN
DECLARE x DOUBLE;
DECLARE y DOUBLE;
DECLARE d DOUBLE;
DECLARE lat1rad DOUBLE;
DECLARE lng1rad DOUBLE;
DECLARE lat2rad DOUBLE;
DECLARE lng2rad DOUBLE;
SET lat1rad = RADIANS(lat1);
SET lng1rad = RADIANS(lng1);
SET lat2rad = RADIANS(lat2);
SET lng2rad = RADIANS(lng2);
SET x = (lng2rad - lng1rad) * COS((lat1rad + lat2rad) / 2);
SET y = lat2rad - lat1rad;
SET d = 6378137 * SQRT(x * x + y * y);
RETURN ROUND(d);
END $$

DELIMITER ;
