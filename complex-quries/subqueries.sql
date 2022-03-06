SELECT
	areas.name AS areaname,
	types.name AS typename,
	providers.n_providers,
	providers.n_beds
FROM (
	SELECT
		areacode,
		typecode,
		COUNT(1) AS n_providers,
		SUM(COALESCE(beds,0)) AS n_beds
	FROM providers
	GROUP BY 1,2
) computed_providers -- temporary table name
