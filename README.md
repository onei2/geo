# onei2geo

## Useful geographical functions

### Functions to calculate geographical distance in meters between two geographical points

- FUNCTION EquirectangularApproximation (lat1 DOUBLE, lng1 DOUBLE, lat2 DOUBLE, lng2 DOUBLE) RETURNS DOUBLE
- FUNCTION SphericalLawOfCosines (lat1 DOUBLE, lng1 DOUBLE, lat2 DOUBLE, lng2 DOUBLE) RETURNS DOUBLE
- FUNCTION Haversine (lat1 DOUBLE, lng1 DOUBLE, lat2 DOUBLE, lng2 DOUBLE) RETURNS DOUBLE
- FUNCTION PolarCoordinateFlatEarthFormula (lat1 DOUBLE, lng1 DOUBLE, lat2 DOUBLE, lng2 DOUBLE) RETURNS DOUBLE
- FUNCTION EllipsoidalEarthProjectedToPlane (lat1 DOUBLE, lng1 DOUBLE, lat2 DOUBLE, lng2 DOUBLE) RETURNS DOUBLE

### References
- https://www.movable-type.co.uk/scripts/latlong.html
- https://en.wikipedia.org/wiki/Geographical_distance
